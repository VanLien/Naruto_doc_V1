<?php
session_name('admin_session');

session_start();

if(!isset($_SESSION['admin'])){
  exit;
}else{
	$username = $_SESSION['admin'];
}
$json = array();
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
$action = (isset($_POST['action'])) ? $_POST['action'] : '';
//xóa bài viết
    if($action == 'delete'){
        $post_id = $_POST['pid'];
        try 
        {
            $dbh->prepare("
            UPDATE `news`
             SET `status` = ?
             WHERE `id` = ?
            ")->execute(array(0, $post_id));
            $json['status'] = true;
            $json['msg'] = "Deleted";
        }
        catch (Exception $e) {
            $json['status'] = false;
            $json['msg'] = 'Delete failed: ' . $e->getMessage();
        }
        echo json_encode($json);
         exit;    
    }
    elseif(isset($_POST['title']) && isset($_POST['type']) && isset($_POST['thumbnail']) && isset($_POST['newscontent']) && isset($_POST['game']))
    {
	//data checker
	$id = ($_POST['newsid'] != '') ? $_POST['newsid'] : '';
	$title = $_POST['title'];
    if($_POST['type'] == 1)
        $type = 'tintuc';
    else if($_POST['type'] == 2)
        $type = 'sukien';
    else
        $type = 'huongdan';
	$thumbnail = $_POST['thumbnail'];
	$content = $_POST['newscontent'];
    $game = $_POST['game'];
	$slug = preg_replace('/[^a-z0-9]+/', '-', vn2latin($title));
	$slug = preg_replace('/^\-*([a-z0-9]+[a-z0-9\-]+[a-z0-9]+)\-*$/', '$1', $slug);

    
	//  thêm hoặc sửa bài viết
    if ($id != '') {
        try{
	        $edit = $dbh->prepare("
	        UPDATE `news`
	         SET `title` = ?, `slug` = ?, `type` = ?, `thumbnail` = ?, `content` = ?, `game` = ?, `modified` = NOW()
	         WHERE `id` = ?
	        ")->execute(array($title, $slug, $type, $thumbnail, $content, $game, $id));
	        if($edit){
	         	$json['status'] = true;
				$json['msg'] = "Edited";
	        }else{
	         	$json['status'] = false;
				$json['msg'] = "Failed";
	        }
		} catch (Exception $e) {
		    $json['status'] = false;
			$json['msg'] = 'Edit failed: ' . $e->getMessage();
		}
    }
    else
    {
    	try{
			$add = $dbh->prepare("INSERT INTO `news` (`title`, `slug`, `type`, `thumbnail`, `content`, `game`, `status`, `created`) VALUES (?, ?, ?, ?, ?, ?, 1, NOW())")
            ->execute(array($title, $slug, $type, $thumbnail, $content, $game));
        } catch (Exception $e) {
		    $json['status'] = false;
			$json['msg'] = 'Add failed: ' . $e->getMessage();
		}
         if($add){
         	$json['status'] = true;
			$json['msg'] = "Posted";
         }else{
         	$json['status'] = false;
			$json['msg'] = "Failed";
         }
        
		
    }

	echo json_encode($json);
	exit;
}
else
{
	$json['status'] = false;
		$json['msg'] = "Failed x0002";
		echo json_encode($json);
		exit;

}
function vn2latin($cs)
{
    $marTViet = array("à", "á", "ạ", "ả", "ã", "â", "ầ", "ấ", "ậ", "ẩ", "ẫ", "ă",
        "ằ", "ắ", "ặ", "ẳ", "ẵ", "è", "é", "ẹ", "ẻ", "ẽ", "ê", "ề",
        "ế", "ệ", "ể", "ễ",
        "ì", "í", "ị", "ỉ", "ĩ",
        "ò", "ó", "ọ", "ỏ", "õ", "ô", "ồ", "ố", "ộ", "ổ", "ỗ", "ơ",
        "ờ", "ớ", "ợ", "ở", "ỡ",
        "ù", "ú", "ụ", "ủ", "ũ", "ư", "ừ", "ứ", "ự", "ử", "ữ",
        "ỳ", "ý", "ỵ", "ỷ", "ỹ",
        "đ",
        "À", "Á", "Ạ", "Ả", "Ã", "Â", "Ầ", "Ấ", "Ậ", "Ẩ", "Ẫ", "Ă",
        "Ằ", "Ắ", "Ặ", "Ẳ", "Ẵ",
        "È", "É", "Ẹ", "Ẻ", "Ẽ", "Ê", "Ề", "Ế", "Ệ", "Ể", "Ễ",
        "Ì", "Í", "Ị", "Ỉ", "Ĩ",
        "Ò", "Ó", "Ọ", "Ỏ", "Õ", "Ô", "Ồ", "Ố", "Ộ", "Ổ", "Ỗ", "Ơ", "Ờ", "Ớ", "Ợ", "Ở", "Ỡ",
        "Ù", "Ú", "Ụ", "Ủ", "Ũ", "Ư", "Ừ", "Ứ", "Ự", "Ử", "Ữ",
        "Ỳ", "Ý", "Ỵ", "Ỷ", "Ỹ",
        "Đ", " ");

    $marKoDau = array("a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a",
        "a", "a", "a", "a", "a", "a",
        "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e",
        "i", "i", "i", "i", "i",
        "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o",
        "o", "o", "o", "o", "o",
        "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u",
        "y", "y", "y", "y", "y",
        "d",
        "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A",
        "A", "A", "A", "A", "A",
        "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
        "I", "I", "I", "I", "I",
        "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O",
        "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U",
        "Y", "Y", "Y", "Y", "Y",
        "D", "-");

    return strtolower(str_replace($marTViet, $marKoDau, $cs));
}