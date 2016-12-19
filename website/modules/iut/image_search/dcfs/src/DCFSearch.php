<?php


namespace Drupal\dcfs;

use \Drupal\redis\Client;
use Drupal\Core\Cache\Cache;
use function GuzzleHttp\json_decode;

class DCFSearch {
	
	
	static $numberOfSubCodes = 8;
	static $lengthOfSubCodes = 8;
	private $redis = null;
	
	
	function  __construct() {
		
		$redis = new \Drupal\redis\Client\PhpRedis();
		$this->redis = $redis->getClient('127.0.0.1', '6379');
		
	}
	
	
	private function hashFunction($code, $i) {
		return "table-$i-bucket-$code";
	}
		

	public function __get($param) {
		switch ($param) {
			case 'redis':
			 return $this->redis;
			break;
			
			default:
				;
			break;
		};
	}
	
	function index($q, $key) {
		
		$subcodes = $this->generateSubcodes($q);
		foreach ($subcodes as $i => $subcode) {
			$bukcet_number = $this->hashFunction($subcode, $i);
			$this->redis->sAdd($bukcet_number, $key);
		}
	}
	
	
	function search($query, $r) {
		$start = microtime(TRUE);
		
		$subcodes = $this->generateSubcodes($query);
		$pseudo_codes = $this->generatePseudoCodes($subcodes, $r);
		$combinations = $this->generateCombinations($r);
		
		$redis_time = 0;
		$intersect_time = 0;
		$merge_time = 0;
		$skipped_combs = 0;
		$passed_combs = 0;
		$result = [];
		foreach ($combinations as $comb_index => $comb) {
			$comb_result = [];
			foreach ($comb as $key => $num) {
				if(!isset($can_cummulative[$key][$num])) {
					$can_cummulative[$key][$num] = [];
					$code = $subcodes[$key];
					for ($i=0; $i <= $num; $i++) {
						if(!isset($can[$key][$i])) {
							$hashes = [];
							foreach ($pseudo_codes[$code][$i] as $query) {
								$hashes[] = $this->hashFunction($query, $key);
							}
							$redis_start = microtime(TRUE);
							$can[$key][$i] = array_filter(call_user_func_array([$this->redis,'sUnion'], $hashes));
							$redis_time += microtime(TRUE) - $redis_start;
						}
						//This merge can be done by redis if we use sunionStore in previous lines
						$can_cummulative[$key][$num] = array_merge($can_cummulative[$key][$num], $can[$key][$i]);
					}
				}
				
				if (empty($can_cummulative[$key][$num])) {
					$skipped_combs++;
					continue 2;
				}
				
				if (!$key) {
					$comb_result = $can_cummulative[$key][$num];
				}
				else {
					$intersect_start = microtime(TRUE);
				 	$comb_result = array_intersect($comb_result, $can_cummulative[$key][$num]);
				 	$intersect_time += (microtime(TRUE) - $intersect_start);
				 	if(empty($comb_result)) {
				 		$skipped_combs++;
						continue 2;				 		
				 	}
				}
				$passed_combs++;
			}
			$merge_start = microtime(TRUE);
			$result = array_merge($result, $comb_result);
		 	$result = array_unique($result);
			$merge_time += (microtime(TRUE) - $merge_start);
		}
		
		return [
			'result' => $result,
			'info' => [
				'total_time' => microtime(TRUE) - $start,
				'redis_time' => $redis_time,
				'intersect_time' => $intersect_time,
				'merge_time' => $merge_time,
				'skipped_combs' => $skipped_combs,
				'passed_combs' => $passed_combs
			]
		];		
	}
	
	protected function generateSubcodes($q) {
		return str_split($q, $this::$lengthOfSubCodes);
	}
	
	protected function generatePseudoCodes($codes, $r) {
		
		$flipers = $this->getFlipers($r);
		$max_bits_to_flip = min($r, $this::$lengthOfSubCodes);
		$pseudos = [];
		foreach ($codes as $code) {
			if(!empty($pseudos[$code])) continue;
			$pseudos[$code][0][] = $code;
			for ($num=1; $num<=$max_bits_to_flip; $num++) {
				foreach ($flipers[$num] as $fliper) {
					$pseudos[$code][$num][] = str_pad(decbin(bindec($code) ^ bindec($fliper)), 8, '0', STR_PAD_LEFT);
				}				
			}
		}
		return $pseudos;
	}
	
	public function getFlipers($r) {
		
		$cache_name = "flipers-$r-" . $this::$lengthOfSubCodes;
		$cache = \Drupal::cache()->get($cache_name);
		if($cache) {
			return json_decode($cache->data);
		}
		
		$ones = array_pad([], $this::$lengthOfSubCodes, 0);
		
		$output[0][] = implode('', $ones);
		
		for ($i=1; $i <= $this::$lengthOfSubCodes; $i++) {
			$ones[$i-1] = 1;
			$combs = $this->combinations($ones);
			foreach ($combs as $comb) {
				$output[$i][] = implode('', $comb);
			}
		}
		
		\Drupal::cache()->set($cache_name, json_encode($output));
		
		return $output;
	}
	
	public function generateCombinations($r) {
		
		$cache_id = "iut_combs_$r";
		$cache = \Drupal::cache()->get($cache_id);
		if($cache) {
			return json_decode($cache->data);
		}
		
		$list = $this->fractionalize($r);
		$output = [];
		foreach ($list as $key => &$value) {
			$value = array_pad(explode(',', $value), $this::$lengthOfSubCodes, '0');
			$combinations = $this->combinations($value);
			$output = array_merge($output, $combinations);
		}
		
		\Drupal::cache()->set($cache_id, json_encode($output));
		
		return $output;
	}
	
	protected function fractionalize($sum) {
		
        if($sum == 0) return [[0]];
        if ($sum == 1)return [1];
        
        $outputs = ($sum <= $this::$lengthOfSubCodes) ? [$sum] : [];
        
        for ($i = $sum-1; $i > 0; $i--) {
            if ($i > $this::$lengthOfSubCodes) {
            	continue;
            }
            $result_set = $this->fractionalize($sum - $i);
            
            foreach ($result_set as &$result) {
                $result = explode(',', $result);
                if(count($result) >= $this::$lengthOfSubCodes) {
            		$result = '';
                	continue;//Our fraction parts must be at most equal to $this::$lengthOfSubCodes
            	}
            	$result[] = $i;
                sort($result);
                $result = implode(',', $result);
            }
            $result_set = array_filter($result_set);
            $outputs = array_merge($outputs, $result_set);
        }
        return array_unique($outputs);
	}
	
	
	
	private function _combinations(array $list)
	{
		if (count($list) > 2) {
			for ($i = 0; $i < count($list); $i++) {
				$listCopy = $list;
	
				$entry = array_splice($listCopy, $i, 1);
				foreach ($this->_combinations($listCopy) as $combination) {
					yield array_merge($entry, $combination);
				}
			}
		} elseif (count($list) > 0) {
			yield $list;
	
			if (count($list) > 1) {
				yield array_reverse($list);
			}
		}
	}
	
	private function _combinationsArray($list) {
		
		$output = [];
		foreach ($this->_combinations($list) as $comb) {
			$output[] = $comb;
		}
		return $comb;
	}
	
	protected function combinations($list) {
		$output = [];
		foreach ($this->_combinations($list) as $combination) {
			$output[] = implode(',', $combination);
		}
		
		$output = array_unique($output);
		
		foreach ($output as &$comb) {
			$comb = explode(',', $comb);
		}
		
		return $output;
	}
}