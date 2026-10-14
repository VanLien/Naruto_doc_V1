<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'] . '/functions/sessionStart.php';
date_default_timezone_set('Asia/Ho_Chi_Minh');
$user_id = $_SESSION['niceUsername'];

# --------------ตั้งเวลากิจกรรม ---------------
$date_rank = array(
    'start'         => '2024-10-3 00:00:01',
    'end'           => '2024-10-20 23:59:59',
    'reward_start'  => '2024-10-21 00:00:01', // อยู่หลัง end เท่านั้น
    'reward_end'    => '2024-10-22 23:59:59'
);
# -----------------------------------------

# --------------- RANK 1 ------------------
$data_rank_1 = array(
    'item' => array(
        array(
			'id' => '9199218',
			'name' => 'Choose 1 Hero 40 Star lv.1',
			'num' => 1,
		),
        array(
			'id' => '0000',
			'name' => 'Coin',
			'num' => 80000000,
		),
		array(
			'id' => '60164',
			'name' => 'Rank Topup No.1',
			'num' => 1,
		),
		array(
			'id' => '91468',
			'name' => 'Rank Topup No.1',
			'num' => 1,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 1500,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 1500,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 1000000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 1000000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 1000,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 2000,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 1000,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 2000,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 2000,
		),
		array(
			'id' => '1045010',
			'name' => 'Dark +10',
			'num' => 10,
		),
		array(
			'id' => '81010',
			'name' => 'Mecha Naruto Gear+10 Box',
			'num' => 12,
		),
		array(
			'id' => '70023',
			'name' => 'God Gear+13 Box',
			'num' => 12,
		),
		array(
			'id' => '49100',
			'name' => 'Bright Cross Gear Option Chest',
			'num' => 12,
		),
	),
);
# -----------------------------------------

# --------------- RANK 2 ------------------
$data_rank_2 = array(
    'item' => array(
       array(
			'id' => '9199218',
			'name' => 'Choose 1 Hero 35 Star lv.1',
			'num' => 1,
		),
        array(
			'id' => '0000',
			'name' => 'Coin',
			'num' => 60000000,
		),
		array(
			'id' => '60165',
			'name' => 'Rank Topup No.2',
			'num' => 1,
		),
		array(
			'id' => '91469',
			'name' => 'Rank Topup No.2',
			'num' => 1,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 1000,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 1000,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 800000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 800000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 800,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 1800,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 800,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 1800,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 1800,
		),
		array(
			'id' => '1045010',
			'name' => 'Dark +10',
			'num' => 6,
		),
		array(
			'id' => '81010',
			'name' => 'Mecha Naruto Gear+10 Box',
			'num' => 8,
		),
		array(
			'id' => '70023',
			'name' => 'God Gear+13 Box',
			'num' => 8,
		),
		array(
			'id' => '49100',
			'name' => 'Bright Cross Gear Option Chest',
			'num' => 8,
		),
	),
);
# -----------------------------------------

# --------------- RANK 3 ------------------
$data_rank_3 = array(
    'item' => array(
        array(
			'id' => '9199218',
			'name' => 'Choose 1 Hero 30 Star lv.1',
			'num' => 1,
		),
        array(
			'id' => '0000',
			'name' => 'Coin',
			'num' => 40000000,
		),
		array(
			'id' => '60166',
			'name' => 'Rank Topup No.3',
			'num' => 1,
		),
		array(
			'id' => '91470',
			'name' => 'Rank Topup No.3',
			'num' => 1,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 500,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 500,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 600000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 600000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 600,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 1600,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 600,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 1600,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 1600,
		),
		array(
			'id' => '1045010',
			'name' => 'Dark +10',
			'num' => 4,
		),
		array(
			'id' => '81010',
			'name' => 'Mecha Naruto Gear+10 Box',
			'num' => 4,
		),
		array(
			'id' => '70023',
			'name' => 'God Gear+13 Box',
			'num' => 4,
		),
		array(
			'id' => '49100',
			'name' => 'Bright Cross Gear Option Chest',
			'num' => 4,
		),
	),
);
# -----------------------------------------

# --------------- RANK 4 ------------------
$data_rank_4 = array(
    'item' => array(
		array(
			'id' => '70020',
			'name' => 'God Gear+10 Box',
			'num' => 12,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 400,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 400,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 400000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 400000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 400,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 1400,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 400,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 1400,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 1400,
		),
		array(
			'id' => '10040',
			'name' => 'Psychic Jade',
			'num' => 5000,
		),
	),
);
# -----------------------------------------

# --------------- RANK 5 ------------------
$data_rank_5 = array(
    'item' => array(
		array(
			'id' => '70019',
			'name' => 'God Gear+9 Box',
			'num' => 12,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 300,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 300,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 200000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 200000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 200,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 1200,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 200,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 1200,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 1200,
		),
		array(
			'id' => '10040',
			'name' => 'Psychic Jade',
			'num' => 4000,
		),
	),
);
# -----------------------------------------

# --------------- RANK 6 ------------------
$data_rank_6 = array(
    'item' => array(
		array(
			'id' => '70018',
			'name' => 'God Gear+8 Box',
			'num' => 12,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 200,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 200,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 100000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 100000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 100,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 1000,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 100,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 1000,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 1000,
		),
		array(
			'id' => '10040',
			'name' => 'Psychic Jade',
			'num' => 3000,
		),
	),
);
# -----------------------------------------

# --------------- RANK 7 ------------------
$data_rank_7 = array(
    'item' => array(
		array(
			'id' => '70017',
			'name' => 'God Gear+7 Box',
			'num' => 12,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 100,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 100,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 80000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 80000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 80,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 800,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 80,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 800,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 800,
		),
		array(
			'id' => '10040',
			'name' => 'Psychic Jade',
			'num' => 2500,
		),
	),
);
# -----------------------------------------

# --------------- RANK 8 ------------------
$data_rank_8 = array(
    'item' => array(
		array(
			'id' => '70016',
			'name' => 'God Gear+6 Box',
			'num' => 12,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 100,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 80,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 60000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 60000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 60,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 600,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 60,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 600,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 600,
		),
		array(
			'id' => '10040',
			'name' => 'Psychic Jade',
			'num' => 2000,
		),
	),
);
# -----------------------------------------

# --------------- RANK 9 ------------------
$data_rank_9 = array(
    'item' => array(
		array(
			'id' => '70016',
			'name' => 'God Gear+6 Box',
			'num' => 8,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 100,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 60,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 40000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 40000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 40,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 400,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 40,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 400,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 400,
		),
		array(
			'id' => '10040',
			'name' => 'Psychic Jade',
			'num' => 1500,
		),
	),
);
# -----------------------------------------

# --------------- RANK 10 ------------------
$data_rank_10 = array(
    'item' => array(
		array(
			'id' => '70016',
			'name' => 'God Gear+6 Box',
			'num' => 4,
		),
        array(
			'id' => '390391',
			'name' => 'Golden Snake Box',
			'num' => 100,
		),
        array(
			'id' => '390388',
			'name' => '40-45 UPGRADE Option Chest',
			'num' => 40,
		),
        array(
			'id' => '10097',
			'name' => 'Silver Bag',
			'num' => 20000,
		),
		array(
			'id' => '10098',
			'name' => 'EXP Scroll',
			'num' => 20000,
		),
		array(
			'id' => '38244',
			'name' => 'Black Hole',
			'num' => 20,
		),
		array(
			'id' => '70008',
			'name' => 'Box SP+',
			'num' => 200,
		),
		array(
			'id' => '22001',
			'name' => 'Card Upgrade SP+',
			'num' => 20,
		),
		array(
			'id' => '909991',
			'name' => 'Card Copper Box',
			'num' => 200,
		),
		array(
			'id' => '909981',
			'name' => 'Card Exp Box',
			'num' => 200,
		),
		array(
			'id' => '10040',
			'name' => 'Psychic Jade',
			'num' => 1000,
		),
	),
);
# -----------------------------------------

# --------------- RANK NULL ------------------
$data_rank_NULL = array(
    'item' => array(
        
	),
);
# -----------------------------------------


function checkSumPay($user_id, $dbh, $start_day, $end_day)
{
    $payment = $dbh->query("SELECT sum(amount) AS sum  FROM payment WHERE `user_id` = '$user_id' AND `status` = '1' AND `created` >= '$start_day' AND `created` <= '$end_day'")->fetch();
    return $payment['sum'];
}