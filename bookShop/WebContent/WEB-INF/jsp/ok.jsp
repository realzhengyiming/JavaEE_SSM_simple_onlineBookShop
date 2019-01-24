<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>HTML5庆祝2018年烟花动画特效</title>

<style>
html, body{
   padding:0px;
   margin:0px;
   background:#222;
   font-family: 'Karla', sans-serif;
   color:#FFF;
   height:100%;
   overflow:hidden;
}
h1{
   z-index: 1000;
   position:fixed;
   top:40%;
   left:50%;
   transform:translateX(-50%) translateY(-100%);
   font-size:58px;
   border:2px solid #FFF;
   padding:7.5px 15px;
   background:rgba(0, 0, 0, 0.5);
   border-radius:3px;
   overflow:hidden;
}
h3{
  z-index: 1000;
   position:fixed;
   top:55%;
   left:50%;
   transform:translateX(-50%) translateY(-100%);
   font-size:25px;
   border:2px solid #FFF;
   padding:7.5px 15px;
   background:rgba(0, 0, 0, 0.5);
   border-radius:3px;
   overflow:hidden;
}
h4{
 z-index: 1000;
   position:fixed;
   top:70%;
   
   left:50%;
   transform:translateX(-50%) translateY(-100%);
   font-size:38px;
   
   padding:7.5px 15px;
   background:rgba(0, 0, 0, 0.5);
   border-radius:3px;
   overflow:hidden;
}
span{ 
   position:relative;
   display:inline-block;
   animation: drop 0.75s;
}
canvas {
    width:100%;
    height:100%;
}

@keyframes drop {
   0% { 
      transform: translateY(-100px);
      opacity: 0;
   }
   
   90% {
      opacity: 1;
      transform:translateY(10px);
   }
   100% {
      transform:translateY(0px;)
   }
}
</style>
</head>
<body>

<canvas></canvas>

<h1>购物车订单提交成功</h1>
<h3>快递小哥正在极速地将书籍送到你的手中，请稍后...........</h3>
<h4><a href="${pageContext.request.contextPath}/" style="color:red" >点击返回主页</a></h4>




<script type="text/javascript">
var ctx = document.querySelector('canvas').getContext('2d')
ctx.canvas.width = window.innerWidth
ctx.canvas.height = window.innerHeight

var sparks = []
var fireworks = []
var i = 20; while(i--) {
   fireworks.push(
      new Firework(Math.random()*window.innerWidth, window.innerHeight*Math.random())
   )
}

render()
function render() {
   setTimeout(render, 1000/60)
   ctx.fillStyle = 'rgba(0, 0, 0, 0.1)';
   ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height)
   for(var firework of fireworks) {
      if(firework.dead) continue
      firework.move()
      firework.draw()
   }
   for(var spark of sparks) {
      if(spark.dead) continue
      spark.move()
      spark.draw()
   }
   
   if(Math.random() < 0.05) {
      fireworks.push(new Firework())
   }
}

function Spark(x, y, color) {
   this.x = x
   this.y = y
   this.dir = Math.random() * (Math.PI*2)
   this.dead = false
   this.color = color
   this.speed = Math.random() * 3 + 3;
   this.walker = new Walker({ radius: 20, speed: 0.25 })
   this.gravity = 0.25
   this.dur = this.speed / 0.1
   this.move = function() {
      this.dur--
      if(this.dur < 0) this.dead = true
      
      if(this.speed < 0) return
      if(this.speed > 0) this.speed -= 0.1
      var walk = this.walker.step()
      this.x += Math.cos(this.dir + walk) * this.speed
      this.y += Math.sin(this.dir + walk) * this.speed
      this.y += this.gravity
      this.gravity += 0.05
      
   }
   this.draw = function() {
      drawCircle(this.x, this.y, 3, this.color)
   }
}

function Firework(x, y) {
   this.xmove = new Walker({radius: 10, speed: 0.5})
   this.x = x || Math.random() * ctx.canvas.width
   this.y = y || ctx.canvas.height
   this.height = Math.random()*ctx.canvas.height/2
   this.dead = false
   this.color = randomColor()
   
   this.move = function() {
      this.x += this.xmove.step()
      if(this.y > this.height) this.y -= 1; 
      else this.burst()
      
   }
   this.draw = function() {
      drawCircle(this.x, this.y, 1, this.color)
   }
   this.burst = function() {
      this.dead = true
      var i = 100; while(i--) sparks.push(new Spark(this.x, this.y, this.color))
   }
}

function drawCircle(x, y, radius, color) {
   color = color || '#FFF'
   ctx.fillStyle = color
   ctx.fillRect(x-radius/2, y-radius/2, radius, radius)
}

function randomColor(){
   return ['#6ae5ab','#88e3b2','#36b89b','#7bd7ec','#66cbe1'][Math.floor(Math.random() * 5)];
}

function Walker(options){
   this.step = function(){
      this.direction = Math.sign(this.target) * this.speed
      this.value += this.direction
      this.target
         ? this.target -= this.direction
         : (this.value)
            ? (this.wander) 
               ? this.target = this.newTarget() 
               : this.target = -this.value
            : this.target = this.newTarget()  
      return this.direction
   }
      
   this.newTarget = function() {
      return Math.round(Math.random()*(this.radius*2)-this.radius)
   }
   
   this.start = 0
   this.value = 0
   this.radius = options.radius
   this.target = this.newTarget()
   this.direction = Math.sign(this.target)
   this.wander = options.wander
   this.speed = options.speed || 1
}
</script>
</body>
</html>