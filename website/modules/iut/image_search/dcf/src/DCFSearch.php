<?php




class DCFSearch {
	
	
	static $numberOfSubCodes = 8;
	static $lengthOfSubCodes = 8;
	private $redis = null;
	
	static $combinations = [
	  	'00,0' => '00',
		'00,1' => ['01', '02', '04', '08', '10', '20', ...]	
	];
	
	private function hashFunction($code, $i) {
		return "table-$i-bucket-$code";
	}
		
	private function getRedis() {
		if($this->redis) {
			return $this->redis;
		}
		
		$this->redis = new Redis();
		$this->redis->connect();
		
		return $redis;
	}

	public function __get($param) {
		switch ($param) {
			case 'redis':
			 return $this->getRedis();
			break;
			
			default:
				;
			break;
		};
	}
	
	function index($q, $key) {
		
		$subcodes = str_split($q, $this::$lengthOfSubCodes);
		foreach ($subcodes as $i => $subcode) {
			$bukcet_number = $this->hashFunction($subcode, $i);
			$redis->sAdd($bukcet_number, $key);
		}
	}
	
	
	function search($query, $r) {
		$subcodes = str_split($query, $this::$lengthOfSubCodes);
		
	}
	
	
	protected function generateCombinations($code, $r) {
		
		$code_length = strlen($code);//Assumes code is bianry 
		for ($i = 0; $i < $r; $i++) {
			for
		};
	}
	
	protected function function_name($sum) {
		
        if($sum == 0) return [[0]];
        if ($sum == 1)return [1];
        
        $outputs = [$sum];
        for ($i = $sum-1; $i > 0; $i--) {
            $result_set = function_name($sum - $i);
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
				foreach ($this->combinations($listCopy) as $combination) {
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
	
	protected function combinations($list) {
		$output = [];
		foreach ($this->_combinations($list) as $combination) {
			$output[] = implode(',', $combination);
		}
		
		return array_unique($output);
	}
}