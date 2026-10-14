<?php
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/'.$_GET['page']);
include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeHeader.php';
?>
            	

            <div class="container pt-3">
   
            <div class="content">
              
                <div class="row">

                    
                   
                    <div class="col-lg-3 order-lg-first">
                       <!-- left bar -->
                       <?php include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeLeftbar.php' ?>
                    </div>
                    <div class="col mb-2">
                        <div>

                            <ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link active" role="tab" data-toggle="tab" href="#tab-1">Minigame Sệch xy 20.000/1 lượt</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active border border-top-0 p-3" style="float: left;width: 100%;" role="tabpanel" id="tab-1">
<style>
#mayxeng{
	display: block;
    left: 0;
    top: 0;
    width: 531px;
    height: 531px;
	background: url(http://ninjahokage.com/images/xeng.png) no-repeat center center;
    background-size: contain;
}
#resultitem {
    background-color: #ffffff;
    color: #0000FF;
    height: 105px;
    position: absolute;
    width: 105px;
    text-align: center;
    font-size: 11px;
    z-index: 1;
    left: 255px;
    top: 405px;
    border-radius: 10px;
}
#play
{
	display: none;
}
#play .imgitem
{
	width:0;
}
#resultitem img
{
	width: 80px;
    float: left;
    margin-left: 10px;
}
.itemname{
	float: left;
    color: red;
    background: aqua;
    width: 100%;
    border-radius: 0 0 10px 10px;
}
@media only screen and (max-width: 600px) {
	#mayxeng{
		left: 0;
		top: 0;
		width: 100%;
	}
	#resultitem {
    height: 90px;
    width: 90px;
	left: 39%;
    top: 380px;
	}
}
.play {
    width: 100%;
    height: 37px;
    bottom: 15px;
}
.play {
    cursor: pointer;
    display: block;
    width: 100%;
    height: 74px;
    right: 0;
    display: flex;
    justify-content: center;
    z-index: 10;
}
</style>
<ul style="float: left;
    width: 100%;
    display: block;
    padding: 0;" class="list1">
		<div class="form-group ">
                                <select id="inputGameServer" class="form-control">
								<option value="">- Vui lòng chọn máy chủ-</option>
                                  </select>
								  </div>
		<div id="play"></div>
		<div class="wallet-card" style="margin-top: 15px;padding: 8px 12px;">
			<div id="mayxeng">
			<div class="play" id="quay"><img src="/images/quay.png" onclick="Xeng();"></div>
			<div id="resultitem"></div>
			
			</div>
		</div>
</ul>
<div class="result_log_top"><h3 style="font-family: 'Pattaya', sans-serif;
    background: linear-gradient(to right,#ff8a00,#da1b60);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;">Lịch sử Ấy Ò </h3>
	<ul id="result_log_top" style="float: left;
    width: 100%;
    display: block;
    padding: 0;"></ul>
</div></div></div></div></div>
<script>
$( document ).ready(function() {
			$.getJSON("/api/listServer.php?type=select_list", function(result) {
				var $dropdown = $("#");
				$.each(result, function() {
					$dropdown.append($("<option />").val(this.sid).text(this.name));
				});
			});
		});
var _0xd3ef=["\x3C\x69\x6D\x67\x20\x73\x72\x63\x3D\x22\x68\x74\x74\x70\x3A\x2F\x2F\x64\x61\x6F\x74\x68\x61\x6E\x74\x68\x75\x2E\x63\x6F\x6D\x2F\x69\x6D\x61\x67\x65\x73\x2F\x71\x75\x61\x79\x2E\x70\x6E\x67\x22\x3E","\x68\x74\x6D\x6C","\x23\x71\x75\x61\x79","\x2F\x61\x6A\x61\x78\x2F\x78\x65\x6E\x67\x2E\x70\x68\x70","\x70\x6F\x73\x74","\x74\x65\x78\x74","\x76\x61\x6C","\x23\x69\x6E\x70\x75\x74\x47\x61\x6D\x65\x53\x65\x72\x76\x65\x72","\x70\x61\x72\x73\x65\x4A\x53\x4F\x4E","\x72\x61\x6E\x64","\x69\x74\x65\x6D","\x3C\x69\x6D\x67\x20\x73\x72\x63\x3D\x22\x68\x74\x74\x70\x3A\x2F\x2F\x64\x61\x6F\x74\x68\x61\x6E\x74\x68\x75\x2E\x63\x6F\x6D\x2F\x69\x6D\x61\x67\x65\x73\x2F\x71\x75\x61\x79\x2E\x70\x6E\x67\x22\x20\x6F\x6E\x63\x6C\x69\x63\x6B\x3D\x22\x58\x65\x6E\x67\x28\x29\x3B\x22\x3E","\x23\x70\x6C\x61\x79","\x76","\x6C\x65\x6E\x67\x74\x68","\x63\x68\x69\x6C\x64\x72\x65\x6E","\x61\x63\x74\x69\x76\x65","\x72\x65\x6D\x6F\x76\x65\x43\x6C\x61\x73\x73","\x73\x69\x62\x6C\x69\x6E\x67\x73","\x61\x64\x64\x43\x6C\x61\x73\x73","\x23\x70\x6C\x61\x79\x20\x73\x70\x61\x6E\x3A\x65\x71\x28","\x29","\x23\x70\x6C\x61\x79\x20\x2E\x61\x63\x74\x69\x76\x65","\x23\x72\x65\x73\x75\x6C\x74\x69\x74\x65\x6D","\x61\x6A\x61\x78","\x6F\x70\x74\x69\x6F\x6E\x3A\x73\x65\x6C\x65\x63\x74\x65\x64","\x2F\x61\x6A\x61\x78\x2F\x67\x65\x74\x6C\x6F\x67\x78\x65\x6E\x67\x2E\x70\x68\x70","\x73\x76\x3D","\x73\x74\x61\x74\x75\x73","\x6C\x69\x63\x68\x73\x75","\x23\x72\x65\x73\x75\x6C\x74\x5F\x6C\x6F\x67\x5F\x74\x6F\x70","\x6D\x73\x67","\x74\x65\x78\x74\x2D\x64\x61\x6E\x67\x65\x72","\x23\x6D\x73\x67\x32","\x4A\x53\x4F\x4E"];function Xeng(){$(_0xd3ef[2])[_0xd3ef[1]](_0xd3ef[0]);$[_0xd3ef[24]]({url:_0xd3ef[3],type:_0xd3ef[4],dateType:_0xd3ef[5],data:{server:$(_0xd3ef[7])[_0xd3ef[6]]()},success:function(_0xa99ax2){var _0xa99ax3=$[_0xd3ef[8]](_0xa99ax2);if(_0xa99ax3[_0xd3ef[9]]== 0){alert(_0xa99ax3[_0xd3ef[10]]);$(_0xd3ef[2])[_0xd3ef[1]](_0xd3ef[11]);return false};$(_0xd3ef[12])[_0xd3ef[1]](_0xa99ax3[_0xd3ef[10]]);var _0xa99ax4=0;var _0xa99ax5=0;var _0xa99ax6=10;var _0xa99ax7=_0xa99ax3[_0xd3ef[13]];function _0xa99ax8(_0xa99ax9,_0xa99axa){var _0xa99axb=$(_0xd3ef[12])[_0xd3ef[15]]()[_0xd3ef[14]];var _0xa99axc=_0xa99ax6* 2+ _0xa99axa;setTimeout(function(){$(_0xd3ef[20]+ _0xa99ax4+ _0xd3ef[21])[_0xd3ef[19]](_0xd3ef[16])[_0xd3ef[18]]()[_0xd3ef[17]](_0xd3ef[16]);$(_0xd3ef[23])[_0xd3ef[1]]($(_0xd3ef[22])[_0xd3ef[1]]());_0xa99ax4++;_0xa99ax5++;if(_0xa99ax4== _0xa99axb){_0xa99ax4= 0};if(_0xa99ax5< _0xa99axc){_0xa99ax8(_0xa99ax9,_0xa99axa)}else {$(_0xd3ef[2])[_0xd3ef[1]](_0xd3ef[11]);GetLog()}},_0xa99ax9)}_0xa99ax8(_0xa99ax7,_0xa99ax3[_0xd3ef[9]])}})}function GetLog(){var _0xa99axe=$(_0xd3ef[7])[_0xd3ef[15]](_0xd3ef[25])[_0xd3ef[6]]();$[_0xd3ef[4]](_0xd3ef[26],_0xd3ef[27]+ _0xa99axe,function(_0xa99ax2){if(_0xa99ax2[_0xd3ef[28]]){$(_0xd3ef[30])[_0xd3ef[1]](_0xa99ax2[_0xd3ef[29]])}else {$(_0xd3ef[33])[_0xd3ef[19]](_0xd3ef[32])[_0xd3ef[1]](_0xa99ax2[_0xd3ef[31]])}},_0xd3ef[34])}GetLog()	</script>
                </div>

            </div>

        </div>
      <?php
      include_once $_SERVER['DOCUMENT_ROOT'].'/template/homeFooter.php';
      ?>
 <script>
        document.addEventListener('contextmenu', function(event) {
            event.preventDefault();
        });

        document.addEventListener('keydown', function(event) {
            if (event.key === 'F12' || 
                (event.ctrlKey && event.shiftKey && event.key === 'I') || 
                (event.ctrlKey && event.shiftKey && event.key === 'J') || 
                (event.ctrlKey && event.key === 'U')) {
                event.preventDefault();
            }
        });

        // Liên tục kiểm tra Developer Tools
        setInterval(function() {
            if (window.console && (window.console.firebug || (window.console.profile && window.console.profile.length > 0))) {
                alert('Developer tools are open, close them!');
                window.close();
            }
        }, 1000);
    </script>