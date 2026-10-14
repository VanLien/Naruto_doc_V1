<?php
if (!function_exists('sql_inject_chec')) {
    function sql_inject_chec(){
        $badwords = array("'");
        foreach($_REQUEST as $value)  {
            foreach($badwords as $word)
			if(!is_array($value))
			{
				$value = strtolower($value);
				$word = strtolower($word);
				if(substr_count($value, $word) > 0) {
					include_once $_SERVER['DOCUMENT_ROOT'].'/error405.php';
					exit();
                }
			}
                
        }
    }
}
sql_inject_chec();
?>