<?php

include_once $_SERVER['DOCUMENT_ROOT'].'/functions/checkUser.php';
checkUserLogged('/user/'.$_GET['page']);
include_once $_SERVER['DOCUMENT_ROOT'] . '/template/homeHeader.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/functions/dbConnect.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/functions/sessionStart.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$user_id = $_SESSION['niceUsername'];
$stmt = $dbh->prepare("SELECT xu FROM game_account WHERE username = ? LIMIT 1");
$stmt->execute([$user_id]);
$check = $stmt->fetch(PDO::FETCH_ASSOC);

$spin = floor($check['xu'] / 1000000);
$month = '12';
$day = '30';
$year = '2024';
$timeend = "$year-$month-$day 00:00:00";
$remain = ceil((mktime(0,0,0,$month,$day,$year) - time()) / 86400);
?>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  

  <meta name="csrf-token" content="<?= $_SESSION['csrf_token']; ?>">

  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">



  <style>
    *, ::before, ::after {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    
    html, body {
      font-family: Montserrat, sans-serif;
      line-height: 1.5;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
    }
    
    body {
      margin: 0;
    }
    
    .container {
      width: 100%;
      margin: 0 auto;
    }
    
    .hidden {
      display: none;
    }
    
    .block {
      display: block;
    }
    
    .flex {
      display: flex;
    }
    
    .inline-flex {
      display: inline-flex;
    }
    
    .items-center {
      align-items: center;
    }
    
    .justify-center {
      justify-content: center;
    }
    
    .text-center {
      text-align: center;
    }
    
    .m-0 {
      margin: 0;
    }
    
    .p-0 {
      padding: 0;
    }
    
    .text-sm {
      font-size: 0.875rem;
      line-height: 1.25rem;
    }
    
    .text-lg {
      font-size: 1.125rem;
      line-height: 1.75rem;
    }
    
    .text-xl {
      font-size: 1.25rem;
      line-height: 1.75rem;
    }
    
    .font-bold {
      font-weight: 700;
    }
    
    .border {
      border-width: 1px;
    }
    
    .rounded {
      border-radius: 0.25rem;
    }
    
    .rounded-full {
      border-radius: 9999px;
    }
    
    .bg-white {
      background-color: #ffffff;
    }
    
    .bg-gray-100 {
      background-color: #f5f5f5;
    }
    
    @media (min-width: 640px) {
      .sm\:text-lg {
        font-size: 1.125rem;
        line-height: 1.75rem;
      }
    
      .sm\:container {
        max-width: 640px;
      }
    }
    
    @media (min-width: 768px) {
      .md\:container {
        max-width: 768px;
      }
    
      .md\:text-xl {
        font-size: 1.25rem;
        line-height: 1.75rem;
      }
    }
    
    @media (min-width: 1024px) {
      .lg\:container {
        max-width: 1024px;
      }
    }
    
    .BoxNews{overflow:hidden;transition:all .25s ease}
    .BoxNews:hover{transform:translateY(-5px)}
    .BoxNews img{aspect-ratio:16/9}
    
    *, ::before, ::after {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        border: 0;
        font-family: inherit;
        font-size: inherit;
        vertical-align: baseline;
        text-decoration: none;
    }
    
    html {
        line-height: 1.5;
        font-family: 'Montserrat', sans-serif;
        font-feature-settings: normal;
    }
    
    body {
        margin: 0;
        line-height: inherit;
    }
    
    button, input, optgroup, select, textarea {
        margin: 0;
        padding: 0;
        font-family: inherit;
    }
    
    table {
        border-collapse: collapse;
    }
    
    h1, h2, h3, h4, h5, h6 {
        font-size: inherit;
        font-weight: inherit;
    }
    
    a {
        color: inherit;
        text-decoration: none;
    }
    
    strong {
        font-weight: bold;
    }
    
    code, pre {
        font-family: 'Courier New', Courier, monospace;
    }
    
    .flex-row {
        flex-direction: row;
    }
    
    .flex-col {
        flex-direction: column;
    }
    
    .grid {
        display: grid;
    }
    
    .grid-cols-1 {
        grid-template-columns: repeat(1, minmax(0, 1fr));
    }
    
    .grid-cols-12 {
        grid-template-columns: repeat(12, minmax(0, 1fr));
    }
    
    .text-gray-500 {
        color: #6b7280;
    }
    
    .bg-primary {
        background-color: #2563eb;
    }
    
    .border-gray-200 {
        border-color: #e5e7eb;
    }
    
    .hidden {
        display: none;
    }
    
    .inline-block {
        display: inline-block;
    }
    
    .w-full {
        width: 100%;
    }
    
    .h-full {
        height: 100%;
    }
    
    .m-auto {
        margin: auto;
    }
    
    .p-4 {
        padding: 1rem;
    }
    
    .text-center {
        text-align: center;
    }
    
    :root {
        --nav-size: 250px;
        --chat-size: 300px;
        --header-size: 3.5rem;
        --footer-size: 2.5rem;
        --scroll-color: var(--color-gray-200);
        --scroll-color-hover: var(--color-gray-400);
    }

    .dark {
        --scroll-color: var(--color-gray-800);
        --scroll-color-hover: var(--color-gray-700);
    }

    * {
        -webkit-tap-highlight-color: transparent !important;
    }

    html {
        font-size: 16px;
        height: 100%;
        min-height: 100%;
    }

    body, html {
        height: 100%;
        min-height: 100%;
    }

    body {
        background: rgb(var(--color-gray-900));
    }

    #__nuxt {
        height: 100%;
        min-height: 100%;
    }

    @media (hover: hover) {
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background-color: transparent;
        }
        ::-webkit-scrollbar-thumb {
            background-clip: content-box;
            background-color: rgb(var(--scroll-color));
            border: 1px solid transparent;
            border-radius: 20px;
            cursor: pointer;
        }
        ::-webkit-scrollbar-thumb:hover {
            background-color: rgb(var(--scroll-color-hover));
        }
    }

    .page-enter-active,
    .page-leave-active {
        transition: all 0.4s;
    }

    .page-enter-from,
    .page-leave-to {
        filter: blur(1rem);
        opacity: 0;
    }

    @keyframes jump {
        30% {
            transform: scale(1.2);
        }
        40%, 60% {
            transform: rotate(-20deg) scale(1.2);
        }
        50% {
            transform: rotate(20deg) scale(1.2);
        }
        70% {
            transform: rotate(0deg) scale(1.2);
        }
        to {
            transform: scale(1);
        }
    }

    .jump-anim {
        animation: jump 1s ease infinite;
    }

    @keyframes bounce {
        0%, to {
            transform: scale(1);
        }
        25% {
            transform: scale(0.9, 1.1);
        }
        50% {
            transform: scale(1.1, 0.9);
        }
        75% {
            transform: scale(0.95, 1.05);
        }
    }

    .bounce-anim {
        animation: bounce 1s infinite;
    }

    @keyframes beat {
        to {
            transform: scale(1.1);
        }
    }

    .beat-anim {
        animation: beat 1s infinite alternate;
    }

    .Iframe {
        border: none;
        outline: none;
        overflow: hidden;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }

    .Android {
        background: #a4c639 !important;
        color: #fff !important;
    }

    .Android span {
        color: #fff !important;
    }

    .Iphone {
        background: #000 !important;
        color: #fff !important;
    }

    .Iphone span {
        color: #fff !important;
    }

    .Wheel {
        align-items: center;
        display: flex;
        justify-content: center;
        -webkit-mask: linear-gradient(90deg, transparent, #fff 40%, #fff 60%, transparent);
        mask: linear-gradient(90deg, transparent, #fff 40%, #fff 60%, transparent);
        overflow: hidden;
        position: relative;
    }

    @keyframes spinwheel {
        0% {
            transform: perspective(1200px) rotateY(-36deg);
        }
        100% {
            transform: perspective(1200px) rotateY(-396deg);
        }
    }

    .Wheel .WheelArrow {
        bottom: 0;
        height: 35px;
        position: absolute;
        width: 35px;
        z-index: 1;
    }

    .Wheel .WheelArrow .WheelArrowItem {
        clip-path: polygon(50% 0, 20% 100%, 80% 100%);
        height: 100%;
        width: 100%;
    }

    .Wheel .WheelBox {
        height: 120px;
        position: relative;
        transform: perspective(1200px) rotateY(var(--wheel-deg));
        transform-style: preserve-3d;
        transition: transform 1s ease;
        width: 120px;
    }

    .Wheel .WheelBox--NoSpinning {
        animation: spinwheel 30s linear infinite;
    }

    .Wheel .WheelBox .WheelItem {
        align-items: center;
        display: flex;
        height: 100%;
        justify-content: center;
        left: 0;
        position: absolute;
        top: 0;
        transform: rotateY(calc(var(--wheel-item-index) * 36deg)) translateZ(200px);
        transform-origin: center;
        transform-style: preserve-3d;
        width: 100%;
        -webkit-box-reflect: below 5px linear-gradient(transparent, transparent);
        box-reflect: below 5px linear-gradient(transparent, transparent);
        transition: all 0.5s ease;
    }

    .Wheel .WheelBox .WheelItem:hover {
        transform: rotateY(calc(var(--wheel-item-index) * 36deg)) translateZ(200px) scale(1.1);
    }

    .UiImg{overflow:hidden}
    .UiImg img{aspect-ratio:inherit;border-radius:inherit}

    .wheel-section {
            border: 2px solid yellow !important;
            background-color: #454545 !important;
            border-radius: 15px;
        }

    .history-container {
        border: 2px solid yellow !important;
        background-color: #454545 !important;
        border-radius: 15px;
    }
    .count-label {
        font-weight: bold;
        color: #ffeb3b;
    }
    #snowfall-canvas {
      position: fixed;
      top: 0;
      left: 0;
      pointer-events: none;
      z-index: 9999;
      width: 100%;
      height: 100%;
    }
    .spin-buttons {
        margin-top: 20px;
        display: flex;
        justify-content: center;
        gap: 15px;
    }
    .spin-buttons button {
        padding: 10px 20px;
        font-size: 1rem;
        border-radius: 8px;
        transition: transform 0.2s, box-shadow 0.2s;
    }
    .spin-buttons button:hover {
        transform: translateY(-3px);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    #prize-list {
        list-style-type: none;
        padding: 0;
    }
    #prize-list li {
        margin-bottom: 10px;
        display: flex;
        align-items: center;
    }
    #prize-list img {
        width: 50px;
        height: 50px;
        margin-right: 10px;
        border-radius: 8px;
    }

    .list-group-item.bg-secondary.text-white {
        background-color: #6c757d !important;
        color: #fff !important;
    }

.challenge-section .challenges {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    
    .challenge-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: #343a40;
        padding: 15px;
        border-radius: 8px;
        color: #fff;
    }
    
    .challenge-info {
        display: flex;
        align-items: center;
        gap: 20px;
        flex: 1;
    }
    
    .challenge-info img {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 8px;
    }
    
    .challenge-details {
        flex: 1;
    }
    
    .challenge-progress {
        width: 200px;
    }
    
    .claim-btn {
        margin-left: 20px;
    }
    
    /* Modal Styles */
    .modal-content.bg-dark {
        background-color: #343a40;
        color: #fff;
    }
	.challenge-card {
    background-color: #343a40; /* Dark background */
    border-radius: 15px; /* Rounded corners */
    padding: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.challenge-card h5.text-yellow-400 {
    color: #ffeb3b; /* Yellow color for the header */
}

.challenge-card img {
    max-width: 100px; /* Adjust as needed */
    height: auto;
}

.challenge-card .progress {
    height: 20px;
}

.challenge-card .progress-bar {
    background-color: #28a745; /* Bootstrap's success color */
}

.challenge-card p.text-white {
    color: #fff; /* White text for prize name and quantity */
}

.challenge-card button {
    /* Optional: Add any additional styling to buttons if needed */
}

  </style>


  




</head>
<body>

  <div class="container">
  
    <div class="row">
      <div class="col-lg-3 order-lg-first">
        <?php include_once $_SERVER['DOCUMENT_ROOT'] . '/template/homeLeftbar.php'; ?>
      </div>
      <div class="col-lg-9">
        <canvas id="snowfall-canvas"></canvas>
<div class="section wheel-section">

  <div class="event-description mb-4 p-4 bg-gray-800 rounded-lg">
    <h2 class="text-center text-white mb-3">🎄 SỰ KIỆN BỐC QUÀ NOEL 🎁</h2>
    <p class="text-center text-white">Chào mừng bạn đến với <strong>Sự Kiện Bốc Quà Noel</strong> của chúng tôi! Đây là cơ hội tuyệt vời để bạn trải nghiệm niềm vui bốc quà may mắn và nhận những phần thưởng giá trị.</p>
  </div>

  <div class="spin-info">
    <p class="text-white">Số Lượt Có Thể Bốc: <strong><?= number_format($spin); ?></strong></p>
  </div>
  <div class="server-selection mb-4">
    <div class="form-group">
      <label for="inputGameServerMain" class="text-white">Chọn Máy Chủ:</label>
      <select id="inputGameServerMain" class="form-control" onchange="getCharname(this.value)">
        <option value="">- Chọn máy chủ -</option>
      </select>
    </div>
    <div class="form-group">
      <label for="actorname" class="text-white">Chọn Nhân Vật:</label>
      <input type="text" id="actorname" class="form-control" readonly>
    </div>
  </div>
  
  <div class="relative overflow-visible rounded-lg divide-y dark:divide-gray-800 divide-gray-100 ring-1 dark:ring-gray-800 ring-gray-100 shadow bg-outer space dark:bg-gray-900 p-4">
    <div class="Wheel border-b-4 border-primary px-4 py-8 mb-6">
        <div class="WheelBox--NoSpinning WheelBox" style="--wheel-deg:-36deg;">
        </div>
    </div>
    <div class="spin-buttons">
      <button id="spin-button" class="btn btn-primary">Bốc Quà</button>
      <button id="spin-5-button" class="btn btn-success">Bốc X5</button>
      <button id="spin-10-button" class="btn btn-danger">Bốc X10</button>
    </div>
    

    <div class="challenge-section mt-4">
      <h3 class="text-center text-white mb-3">Thử Thách</h3>
      <div class="challenges">

      </div>
    </div>
  </div>
</div>
      
        <div class="section history-container p-4 mt-4">
          <h2 class="text-center text-white mb-4">Lịch Sử Bốc Quà</h2>
          <ul id="history-list" class="list-group">
          </ul>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="resultModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content bg-dark text-white">
        <div class="modal-header border-bottom-0">
          <h5 class="modal-title" id="resultModalLabel">Chúc mừng bạn đã bốc được:</h5>
          <button type="button" class="close text-white" data-dismiss="modal" aria-label="Đóng">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body text-center">
          <ul id="prize-list" class="list-group">
          </ul>
        </div>
        <div class="modal-footer border-top-0">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content bg-dark text-white">
        <div class="modal-header">
          <h5 class="modal-title" id="notificationModalLabel">Thông Báo</h5>
          <button type="button" class="close text-white" data-dismiss="modal" aria-label="Đóng">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="notificationContent">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        </div>
      </div>
    </div>
  </div>
  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="images/snowfall.js"></script>  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <script>
    (function(){
      var lastTime = 0;
      var vendors = ['webkit', 'moz'];
      for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x){
        window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
        window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame'] || window[vendors[x]+'CancelRequestAnimationFrame'];
      }
      if(!window.requestAnimationFrame)
        window.requestAnimationFrame = function(callback, element){
          var currTime = new Date().getTime();
          var timeToCall = Math.max(0, 16 - (currTime - lastTime));
          var id = window.setTimeout(function(){
            callback(currTime + timeToCall);
          }, timeToCall);
          lastTime = currTime + timeToCall;
          return id;
        };
      if(!window.cancelAnimationFrame)
        window.cancelAnimationFrame = function(id){
          clearTimeout(id);
        };
    }());

    (function($){
      $.snowfall = function(element, options){
      };

      $.fn.snowfall = function(options){
        if(typeof(options) == "object" || options == undefined){
          return this.each(function(i){
            (new $.snowfall(this, options));
          });
        } else if(typeof(options) == "string"){
          return this.each(function(i){
            var snow = $(this).data('snowfall');
            if(snow){
              snow.clear();
            }
          });
        }
      };
    })(jQuery);

    document.addEventListener('DOMContentLoaded', () => {
          const spinButton = document.getElementById('spin-button');
          const spin5Button = document.getElementById('spin-5-button');
          const spin10Button = document.getElementById('spin-10-button');
          const wheelBox = document.querySelector('.WheelBox');
          const resultModal = $('#resultModal');
          const prizeList = document.getElementById('prize-list');
          const historyList = document.getElementById('history-list');
          const challengesContainer = document.querySelector('.challenges');
          const notificationModal = $('#notificationModal');
          const notificationContent = document.getElementById('notificationContent');
          let items = [];
          let probabilities = [];
          let isSpinning = false;
          let currentRotation = 0;
          const spinSound = new Audio('https://freesound.org/data/previews/320/320655_5260870-lq.mp3');

          const fixedSpinDuration = 3;
          let userSpins = <?= $spin; ?>;

          const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

          function createWheelItems(items) {
              const wheelBox = document.querySelector('.WheelBox');
              wheelBox.innerHTML = '';

              items.forEach((item, index) => {
                  const wheelItem = document.createElement('div');
                  wheelItem.classList.add('WheelItem', 'shadow-md', 'bg-gray-100', 'dark:bg-gray-800', 'rounded-lg');
                  wheelItem.style.setProperty('--wheel-item-index', index + 1);

                  wheelItem.innerHTML = `
                      <div class="relative inline-block hover:ring-primary-500 dark:hover:ring-primary-400 cursor-pointer rounded-lg mx-auto">
                          <div class="relative select-none UiImg transition-all rounded-lg p-1" style="aspect-ratio:1 / 1; min-width:80px; min-height:80px; width:80px; height:80px; max-width:80px; max-height:80px;">
                              <img alt="${item.name}" class="object-cover w-full h-full select-none" src="/shop/${item.icon}.png" loading="lazy" onerror="this.src='/shop/default.png';" />
                              <div class="animate-pulse bg-gray-100 dark:bg-gray-800 absolute top-0 left-0 w-full h-full"></div>
                          </div>
                      </div>
                  `;

                  wheelBox.appendChild(wheelItem);
              });
          }

          function formatLogItem(log) {
              const regex = /^(\w+)\s+\(Lv:\s*(\d+)\s*\+\s*Power:\s*(\d+)\s*\+\s*Coin Game:\s*(\d+)\s*\)\s+(Đã bốc được)\s+(.+?)\s+Time:\s+(.+)$/;
              const match = log.match(regex);
              if(match){
                  const username = match[1];
                  const level = match[2];
                  const power = match[3];
                  const coin = match[4];
                  const action = match[5];
                  const prize = match[6];
                  const time = match[7];
                  return `<strong class="text-primary">${username}</strong> (Lv: ${level} + Power: ${power} + Coin Game: ${coin}) <span class="text-success">${action}</span> ${prize} <span class="text-warning">Time: ${time}</span>`;
              }
              else{
                  return log;
              }
          }

          function loadHistory() {
              fetch('/ajax/lognoel.php')
                .then(response => response.json())
                .then(data => {
                  if(data.error){
                    console.error(data.error);
                    return;
                  }
                  historyList.innerHTML = '';
                  data.lichsu.forEach(item => {
                    const formattedItem = formatLogItem(item);
                    historyList.innerHTML += `<li class="list-group-item bg-secondary text-white">${formattedItem}</li>`;
                  });
                })
                .catch(error => {
                  console.error('Lỗi khi tải lịch sử:', error);
                });
          }

          function loadChallenges() {
    fetch('/ajax/get_thuthach.php')
        .then(response => response.json())
        .then(data => {
            if(data.error){
                console.error(data.error);
                showNotification(data.error);
                return;
            }
            challengesContainer.innerHTML = '';
            data.challenges.forEach(challenge => {
                const spinsCompleted = parseInt(challenge.spins_completed, 10);
                const milestone = parseInt(challenge.milestone, 10);
                const rewardClaimed = parseInt(challenge.reward_claimed, 10);

                let buttonClass = 'btn btn-secondary claim-btn disabled';
                let buttonText = 'Chưa Đạt';
                if(spinsCompleted >= milestone && rewardClaimed === 0){
                    buttonClass = 'btn btn-success claim-btn';
                    buttonText = 'Nhận Thưởng';
                } else if(spinsCompleted >= milestone && rewardClaimed === 1){
                    buttonClass = 'btn btn-secondary claim-btn disabled';
                    buttonText = 'Đã Nhận';
                }

                challengesContainer.innerHTML += `
                  <div class="challenge-card mb-4 p-4 bg-gray-800 rounded-lg">
                    <div class="text-center mb-3">
                      <h5 class="text-yellow-400">Bốc ${milestone} lượt</h5>
                    </div>
                    <div class="row mb-3 align-items-center">
                      <div class="col-md-4 text-center">
                        <img src="/shop/${challenge.reward_icon}" alt="${challenge.reward_name}" class="img-fluid rounded">
                      </div>
                      <div class="col-md-8">
                        
                        <div class="progress">
                          <div class="progress-bar" role="progressbar" style="width: ${Math.min((spinsCompleted / milestone) * 100, 100)}%;" aria-valuenow="${spinsCompleted}" aria-valuemin="0" aria-valuemax="${milestone}">${spinsCompleted}/${milestone}</div>
                        </div>
                      </div>
                    </div>
                    <div class="row align-items-center">
                      <div class="col-md-8">
                        <p class="mb-0 text-white">${challenge.reward_name} x${challenge.reward_count}</p>
                      </div>
                      <div class="col-md-4 text-right">
                        <button class="${buttonClass}" data-challenge-id="${challenge.id}" ${buttonClass.includes('disabled') ? 'disabled' : ''}>${buttonText}</button>
                      </div>
                    </div>
                  </div>
                `;
            });
        })
        .catch(error => {
            console.error('Lỗi khi tải thử thách:', error);
            showNotification('Có lỗi xảy ra khi tải thử thách.');
        });
}

          function claimChallenge(challengeId) {
              const selectedServer = $('#inputGameServerMain').val();
              if (!selectedServer) {
                  showNotification('Vui lòng chọn máy chủ trước khi nhận thưởng thử thách.');
                  return;
              }

              $('#confirmClaimModal').data('challenge-id', challengeId).modal('show');
          }

          function showNotification(message) {
              notificationContent.innerHTML = `<p>${message}</p>`;
              notificationModal.modal('show');
          }

          challengesContainer.addEventListener('click', (e) => {
              if (e.target && e.target.matches('button.claim-btn') && !e.target.classList.contains('disabled')) {
                const challengeId = e.target.getAttribute('data-challenge-id');
                claimChallenge(challengeId);
              }
          });

          $('#confirmClaimModal').on('click', '#confirmClaimButton', function(){
              const challengeId = $('#confirmClaimModal').data('challenge-id');

              fetch('/ajax/claim_thuthach.php', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `challenge_id=${challengeId}&server=${$('#inputGameServerMain').val()}&csrf_token=${csrfToken}`
              })
              .then(response => response.json())
              .then(data => {
                if(data.error){
                  showNotification(data.error);
                  return;
                }
                showNotification(data.success);
                loadChallenges();
                loadHistory();
              })
              .catch(error => {
                console.error('Lỗi khi nhận thưởng thử thách:', error);
                showNotification('Có lỗi xảy ra khi nhận thưởng thử thách. Vui lòng thử lại.');
              });

              $('#confirmClaimModal').modal('hide');
          });

          loadChallenges();

          function spinWheel(times = 1) {
              if (isSpinning) return;
              if (items.length === 0) {
                  showNotification('Chưa tải danh sách quà tặng.');
                  return;
              }
              const selectedServer = $('#inputGameServerMain').val();
              if (!selectedServer) {
                  showNotification("Vui lòng chọn máy chủ trước");
                  $('#inputGameServerMain').focus();
                  return;
              }
              const actorname = $('#actorname').val();
              if (!actorname) {
                  showNotification("Vui lòng chọn nhân vật trước");
                  $('#actorname').focus();
                  return;
              }

              isSpinning = true;
              spinButton.disabled = true;
              spin5Button.disabled = true;
              spin10Button.disabled = true;
              spinSound.currentTime = 0;
              spinSound.play();

              const formData = new FormData();
              formData.append('actorname', actorname);
              formData.append('server', selectedServer);
              formData.append('times', times);
              formData.append('csrf_token', csrfToken); 

              fetch('/ajax/spinnoel.php', {
                  method: 'POST',
                  body: formData
              })
              .then(response => response.json())
              .then(data => {
                  if (data.error) {
                      showNotification(data.error);
                      isSpinning = false;
                      spinButton.disabled = false;
                      spin5Button.disabled = false;
                      spin10Button.disabled = false;
                      spinSound.pause();
                      return;
                  }

                  const prizes = data.prizes;
                  prizeList.innerHTML = '';

                  let totalRotation = 0;
                  const numberOfSegments = items.length;
                  const anglePerSegment = 360 / numberOfSegments;

                  prizes.forEach((prizeData, spinIndex) => {
                      const { prize, item_id } = prizeData;
                      const index = items.findIndex(item => item.id == item_id);
                      if (index === -1) return;

                      const name = items[index].name;
                      const icon = items[index].icon;

                      prizeList.innerHTML += `
                          <li class="list-group-item bg-secondary text-white d-flex align-items-center">
                              <img src="/shop/${icon}.png" alt="${name}" class="mr-3 rounded" style="width: 50px; height: 50px;">
                              <span>${name}</span>
                          </li>
                      `;

                      const adjustedAngle = anglePerSegment * index;
                      totalRotation += adjustedAngle + (anglePerSegment / 2);
                  });

                  currentRotation += totalRotation;
                  wheelBox.style.transition = `transform ${fixedSpinDuration}s ease-out`;
                  wheelBox.style.transform = `rotate(${currentRotation}deg)`;

                  resultModal.find('#prize-list').html(prizeList.innerHTML);
                  resultModal.modal('show');

                  setTimeout(() => {
                      spinSound.pause();
                  }, fixedSpinDuration * 1000);

                  setTimeout(() => {
                      isSpinning = false;
                      spinButton.disabled = false;
                      spin5Button.disabled = false;
                      spin10Button.disabled = false;
                      loadHistory();
                      loadChallenges(); 
                  }, fixedSpinDuration * 1000);
              })
              .catch(error => {
                  console.error('Lỗi khi bốc:', error);
                  showNotification('Có lỗi xảy ra khi bốc. Vui lòng thử lại.');
                  isSpinning = false;
                  spinButton.disabled = false;
                  spin5Button.disabled = false;
                  spin10Button.disabled = false;
                  spinSound.pause();
              });
          }

          window.getCharname = function(sid){
              $.getJSON("/api/getCharname.php?sid=" + sid, function(result) {
                if(result.error){
                  showNotification(result.error);
                  return;
                }
                $("#actorname").val(result.msg);
              });
          }

          function loadServerList() {
              $.getJSON("/api/listServer.php?type=select_list", function(result) {
                const $dropdown = $("#inputGameServerMain");
                $dropdown.find('option:not(:first)').remove();
                $.each(result, function() {
                  $dropdown.append($("<option />").val(this.sid).text(this.name));
                });
              }).fail(function(jqXHR, textStatus, errorThrown) {
                console.error('Lỗi khi tải danh sách máy chủ:', textStatus, errorThrown);
                showNotification('Có lỗi xảy ra khi tải danh sách máy chủ.');
              });
          }

          function loadItems() {
              fetch('/ajax/load_noel.php')
                  .then(response => response.json())
                  .then(data => {
                      if(data.error){
                          showNotification(data.error);
                          return;
                      }
                      items = data.items;
                      probabilities = items.map(item => parseInt(item.probability, 10));
                      createWheelItems(items);
                  })
                  .catch(error => {
                      console.error('Lỗi khi lấy danh sách quà tặng:', error);
                      showNotification('Có lỗi xảy ra khi tải danh sách quà tặng.');
                  });
          }

          loadHistory();
          loadServerList();
          loadItems();
          loadChallenges();

          spinButton.addEventListener('click', () => spinWheel(1));
          spin5Button.addEventListener('click', () => spinWheel(5));
          spin10Button.addEventListener('click', () => spinWheel(10));

    });

  </script>

  <div class="modal fade" id="confirmClaimModal" tabindex="-1" aria-labelledby="confirmClaimModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content bg-dark text-white">
        <div class="modal-header">
          <h5 class="modal-title" id="confirmClaimModalLabel">Xác Nhận Nhận Thưởng</h5>
          <button type="button" class="close text-white" data-dismiss="modal" aria-label="Đóng">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          Bạn có chắc chắn muốn nhận thưởng thử thách này không?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
          <button type="button" class="btn btn-success" id="confirmClaimButton">Đồng Ý</button>
        </div>
      </div>
    </div>
  </div>
  
</body>
</html>