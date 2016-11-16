<?php


namespace Drupal\dcfs;

use \Drupal\redis\Client;

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
		
		$subcodes = $this->generateSubcodes($query);
		$pseudo_codes = $this->generatePseudoCodes($subcodes, $r);
		
		
	}
	
	protected function generateSubcodes($q) {
		return str_split($q, $this::$lengthOfSubCodes);
	}
	
	protected function generatePseudoCodes($codes, $r) {
		
		$combinations = $this->generateCombinations($r);
		$flipers = $this->getFlipers($r);
		
		$pseudos = [];
		foreach ($combinations as $comb) {
			foreach ($comb as $i => $num) {
				$code = $codes[$i];
				if(!empty($pseudos[$code][$num])) continue;
				foreach ($flipers[$num] as $fliper) {
					$pseudos[$code][$num][] = decbin(bindec($code) ^ bindec($fliper));
				}				
			}
		}
		return $pseudos;
	}
	
	public function getFlipers($r) {
		
		$cache_name = 'flipers-' . $r;
		$cache = $this->redis->get($cache_name);
		if($cache) {
			return unserialize($cache);
		}
		
		$ones = array_pad([], $this::$lengthOfSubCodes, 0);
		
		$output[0][] = implode('', $ones);
		
		for ($i=1; $i<=$r; $i++) {
			$ones[$i] = 1;
			$combs = $this->combinations($ones);
			foreach ($combs as $comb) {
				$output[$i][] = implode('', $comb);
			}
		}
		
		$this->redis->set($cache_name, serialize($output));
		
		return $output;
	}
	
	public function generateCombinations($r) {
		
		$list = $this->fractionalize($r);
		$output = [];
		foreach ($list as $key => &$value) {
			$value = array_pad(explode(',', $value), $this::$lengthOfSubCodes, '0');
			$combinations = $this->combinations($value);
			$output = array_merge($output, $combinations);
		}
		
		return $output;
	}
	
	protected function fractionalize($sum) {
		
        if($sum == 0) return [[0]];
        if ($sum == 1)return [1];
        
        $outputs = [$sum];
        for ($i = $sum-1; $i > 0; $i--) {
            $result_set = $this->fractionalize($sum - $i);
            foreach ($result_set as &$result) {
                $result = explode(',', $result);
                $result[] = $i;
                sort($result);
                $result = implode(',', $result);
            }
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