// js/snowfall.js
(function(){
    const canvas = document.getElementById('snowfall-canvas');
    const ctx = canvas.getContext('2d');

    function resizeCanvas(){
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }
    window.addEventListener('resize', resizeCanvas);
    resizeCanvas();

    let currentConfig = '';

    fetch('images/snowflakes.json?v=' + Date.now())
        .then(response => {
            if (!response.ok) {
                throw new Error('Không thể tải tệp cấu hình snowflakes.json');
            }
            return response.json();
        })
        .then(data => {
            if (!data.images || !Array.isArray(data.images)) {
                throw new Error('Tệp cấu hình snowflakes.json không hợp lệ');
            }
            currentConfig = JSON.stringify(data);
            loadImages(data.images);
        })
        .catch(error => {
            console.error('Lỗi:', error);
        });

    const snowflakeImages = [];
    let imagesLoaded = 0;

    function loadImages(imagePaths){
        imagePaths.forEach((src, index) => {
            const img = new Image();
            img.src = src + '?v=' + Date.now();
            img.onload = () => {
                snowflakeImages[index] = img;
                imagesLoaded++;
                if(imagesLoaded === imagePaths.length){
                    initSnowfall();
                }
            };
            img.onerror = () => {
                console.error('Không thể tải hình ảnh:', src);
            };
        });
    }

    class Snowflake {
        constructor(){
            this.reset();
        }

        reset(){
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height - canvas.height;
            this.size = Math.random() * 20 + 10;
            this.speed = Math.random() * 3 + 1;
            this.wind = Math.random() * 1 - 0.5;
            this.image = snowflakeImages[Math.floor(Math.random() * snowflakeImages.length)];
        }

        update(){
            this.y += this.speed;
            this.x += this.wind;

            if(this.y > canvas.height + this.size || this.x < -this.size || this.x > canvas.width + this.size){
                this.reset();
            }
        }

        draw(){
            ctx.drawImage(this.image, this.x, this.y, this.size, this.size);
        }
    }

    let snowflakes = [];
    const maxSnowflakes = 60;

    function initSnowfall(){
        for(let i = 0; i < maxSnowflakes; i++){
            snowflakes.push(new Snowflake());
        }
        requestAnimationFrame(loop);
        setInterval(checkForUpdates, 30000);
    }

    function loop(){
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        snowflakes.forEach(flake => {
            flake.update();
            flake.draw();
        });

        requestAnimationFrame(loop);
    }

    function checkForUpdates(){
        fetch('images/snowflakes.json?v=' + Date.now())
            .then(response => {
                if (!response.ok) {
                    throw new Error('Không thể tải tệp cấu hình snowflakes.json');
                }
                return response.json();
            })
            .then(data => {
                const newConfig = JSON.stringify(data);
                if(newConfig !== currentConfig){
                    location.reload(true);
                }
            })
            .catch(error => {
                console.error('Lỗi:', error);
            });
    }
})();
