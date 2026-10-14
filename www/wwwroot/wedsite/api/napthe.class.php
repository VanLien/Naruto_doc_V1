<?php

date_default_timezone_set('Asia/Ho_Chi_Minh');

class napthe {
	private $DEBUG_FILE_LOG = true; // True nếu cần ghi log, false nếu ko cần.
	private $FILE_LOG_SUCCESS = 'napthe_success.txt'; //Tên file logs thành công.
	private $FILE_LOG_ERROR = 'napthe_error.txt'; //Tên file logs thất bại.

	private $API_KEY = '9244dc67-8fd4-4f14-b641-f2d4b1594f15';
	private $URL_CHARGE_API = 'http://muabanthe.vn/API/NapThe';  //đổi sao cho giống
	private $URL_CALLBACK = 'http://ninjahokage.com/api/callback.php'; //Mở cái file này lên mà @@
	
	public function ValidateCallback() { //Hàm kiểm tra callback từ napthe.com
		if(isset(
			$_GET['Code'],
			$_GET['Mess'],
			$_GET['Reason'],
			$_GET['CardValue'],
			$_GET['TrxID']
		)) {
			return $_GET; 
		}
		
		return false; //Xác thực callback thất bại.
	}
	
	public function ChargeCard($telco, $serial, $pin, $amount, $note) { //Hàm gửi dữ liệu thẻ lên hệ thống napthe.com
		/*
			$telco: nhà mạng. Vd: VTT, VMS, VNP.
			$serial: số seri của thẻ.
			$pin: mã thẻ.
			$amount: mệnh giá thẻ.
			$note: ghi chú. Quý khách có thể thêm giá trị để xác thực giao dịch cho khách hàng của quý khách. Ví dụ: User ID khách hàng của quý khách, Mã GD, ...
		*/
		$validate = $this->ValidateCard($telco, $serial, $pin); //Xác thực định dạng thẻ.
		if($validate != true) {
			if($this->DEBUG_FILE_LOG == true) //Kiểm tra nếu Debug ghi file log = true thì thực hiện ghi dữ liệu đẩy thẻ vào file log.
				$this->WriteLog($this->FILE_LOG_ERROR, $validate);
				
			return $validate;
		}
		$code = uniqid();
		$TrxID= $this->createTrxID();
		$dataPost = array( //Mảng chứa dữ liệu đẩy thẻ lên server napthe.Com
			'APIKey'=>$this->API_KEY,
			'Network'=>$telco,
			'CardCode'=>$pin,
			'CardSeri' => $serial,
			'CardValue' => $amount,
			'TrxID'=>$TrxID,
			'URLCallback'=>$this->URL_CALLBACK
		);
		
		
		$charge_response = $this->CurlGet($this->URL_CHARGE_API, $dataPost); //Thực hiện POST cURL dữ liệu lên Server.
		$response_object = json_decode($charge_response, true); //Parse kết quả đẩy thẻ về dạng đối tượng Object.
		if(empty($response_object["Code"])) { //Kiểm tra nếu không tồn tại Response Status, thì là kết quả đẩy thẻ lên Server napthe bị lỗi. Thực hiện ghi vào file logs, theo dõi file để kiểm tra lỗi.
			if($this->DEBUG_FILE_LOG == true)
				$this->WriteLog($this->FILE_LOG_ERROR, $charge_response);
			return false;
		}
		
		if($response_object["Code"] != 1) { //Kiểm tra nếu Response Status khác 1, tức là thẻ đẩy lên bị sai hoặc cấu hình dữ liệu sai, theo dõi mô tả lỗi hoặc so sánh Status Code trong bảng mã lỗi ở file Document hướng dẫn.
			if($this->DEBUG_FILE_LOG == true) //Kiểm tra nếu Debug ghi file log = true thì thực hiện ghi dữ liệu đẩy thẻ vào file log.
				$this->WriteLog($this->FILE_LOG_ERROR, $charge_response);
			
			return false;
		}
		
		if($this->DEBUG_FILE_LOG == true) //Kiểm tra nếu Debug ghi file log = true thì thực hiện ghi dữ liệu đẩy thẻ vào file log.
			$this->WriteLog($this->FILE_LOG_SUCCESS, $charge_response); //Ghi kết quả đẩy thẻ thành công vào file log thành công.

		$response_object["trxid"]= $TrxID;
		return $response_object; //Trả về kết đối tượng Object.
	}
	
	private function ValidateCard($telco, $serial, $pin) { //Hàm kiểm tra định dạng thẻ.
		$s_length = strlen($serial);
		$p_length = strlen($pin);
		
		if($telco == 'VTT' || $telco == 'VTT2') {
			if($s_length != 11 && $s_length != 14)
				return 'Số serial thẻ không đúng.';
			
			if($p_length != 13 && $p_length != 15)
				return 'Mã thẻ không đúng.';
		}
		
		if($telco == 'VMS' || $telco == 'VMS2') {
			if($s_length != 15)
				return 'Số serial thẻ không đúng.';
			
			if($p_length != 12)
				return 'Mã thẻ không đúng.';
		}
		
		if($telco == 'VNP' || $telco == 'VNP2') {
			if($s_length != 14)
				return 'Số serial thẻ không đúng.';
			
			if($p_length != 14)
				return 'Mã thẻ không đúng.';
		}
		
		return true;
	}
	
	private function CurlPost($url, $dataPost) { //Hàm cURL POST dữ liệu.
		if(!is_array($dataPost))
			return false;
		
		$dataPost = http_build_query($dataPost);
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $dataPost);
		$ref = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; //Nếu kết quả cURL bị lỗi xác thực tên miền, thử thay thế $ref = tên miền của bạn. Ví dụ: $ref = 'https://napthe.com';
		curl_setopt($ch, CURLOPT_REFERER, $ref);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		
		$result = curl_exec($ch);
		
		if(curl_error($ch))
			$error_msg = curl_error($ch);
		
		curl_close($ch);
		
		if(isset($error_msg))
			return $error_msg;
		
		return $result;
	}
	
	private function CurlGet($url, $dataPost) { //Hàm cURL GET dữ liệu.
		if(!is_array($dataPost))
			return false;
		
		$dataPost = http_build_query($dataPost);
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");
		curl_setopt($ch, CURLOPT_POSTFIELDS, $dataPost);
		$ref = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; //Nếu kết quả cURL bị lỗi xác thực tên miền, thử thay thế $ref = tên miền của bạn. Ví dụ: $ref = 'https://napthe.com';
		curl_setopt($ch, CURLOPT_REFERER, $ref);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		
		$result = curl_exec($ch);
		
		if(curl_error($ch))
			$error_msg = curl_error($ch);
		
		curl_close($ch);
		
		if(isset($error_msg))
			return $error_msg;
		
		return $result;
	}
	
	private function createTrxID(){
		if (function_exists('com_create_guid') === true)
		{
			return trim(com_create_guid(), '{}');
		}
		return sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
	}
	
	
	public function WriteLog($file_name, $content) { //Hàm xử lý việc ghi file log.
		if(empty($file_name))
			return false;
		
		$fp = fopen($file_name, 'a');
		if(fwrite($fp, date('H:i:s d/m/Y', time()).' - '.$content.PHP_EOL) == false)
			return false;
		fclose($fp);
		
		return true;
	}
}

?>