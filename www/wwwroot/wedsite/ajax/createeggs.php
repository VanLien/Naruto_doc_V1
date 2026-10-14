<?php
for($i=1;$i<7;$i++)
{
	$ran = array('');
	$randomElement = $ran[array_Rand($ran, 1)];
	$randomtrung = rand(1,94);
	echo('
		<div class="articleAccess" id="open" vt="'.$randomtrung.'" style="width: 237px;height: 160px;">
		<div id="dapdap'.$randomtrung.'" style="display:none;position: absolute;margin-left: 80px;margin-top: -15px;"></div>
		<div id="trung'.$randomtrung.'" style="height: 100px;">
		<img class="shake-image" name="image'.$randomtrung.'" data-toggle="tooltip" data-original-title="'.$randomElement.'" src="/images/dap-trung/in/'.$randomtrung.'.png" height="100px" width="80px">
		</div>
		<img src="/images/dap-trung/bg.png" alt="anh gunny lau" height="40px" width="160px">
		</div>
	');
}
?>