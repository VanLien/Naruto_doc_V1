<?php
// sleep(1);
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
if(!isset($_GET['type'])){
	$condition = "WHERE `game` = 'mtd'";
}
else
{
	$type = $_GET['type'];
	if($type== "sukien")
		$condition = "WHERE `type` = 'sukien' AND status = 1 AND `game` = 'mtd'";
	elseif ($type == "tintuc") {
		$condition = "WHERE `type` = 'tintuc' AND status = 1 AND `game` = 'mtd'";
	}
	elseif ($type == "huongdan") {
		$condition = "WHERE `type` = 'huongdan' AND status = 1 AND `game` = 'mtd'";
	}
	else{
		$condition = "WHERE status = 1 AND `game` = 'mtd'";
	}
	
}
$latest = $dbh->query("SELECT `type`, `slug`, `title`, `created` FROM `news` $condition ORDER BY `id` DESC LIMIT 5")->fetchAll();
?>
<ul class="list-group list-group-flush ">
<?php foreach ($latest as $item): 
		$date = date_create($item['created']);
		$date_f = date_format($date, 'd-m');
		if ($item['type'] == 'sukien') {
                $prefix = 'su-kien';
                $title = "[Sự kiện]";
            } 
            else if ($item['type'] == 'tintuc') {
                $prefix = 'tin-tuc';
                $title = "[Tin tức]";
            }
            else {
                $prefix = 'huong-dan';
                $title = "[Hướng dẫn]";
            }
	?>

	
  <li class="list-group-item"><a class="text-decoration-none" href="/<?=$prefix?>/<?=$item['slug'] ?>"><span class="text-muted"><?=$title?></span> <?=$item['title'] ?>
  <span class="badge badge-light"><?=$date_f?></span>
</li></a>

<?php endforeach; ?>
<li class="list-group-item text-muted text-center"> <a href="/category/<?=$type?>/">Xem thêm...</a></li> 
</ul>