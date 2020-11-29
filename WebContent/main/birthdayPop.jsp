<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>BLUE-B</title>
<style type="text/css">
	.img {position:absolute;left:-10000;}
</style>

<script type="text/javascript">
<!--

window.onerror = new Function("return true");
screen.bufferDepth = 16;
var O  = new Array();
var nx = 0;
var ny = 0;
////////////////////////////
var  N = 6;
var NN = 16;
var  T = 400;
///////////////////////////

function spAn(k,q){
	I = document.getElementById(k?"G1":"DOOT").getElementsByTagName("img");
	c = Math.floor((I.length)*Math.random())
	o = document.createElement("img");
	o.src = I[c].src;
	o.style.zIndex = (k?2:1);
	o.className="img";
	document.body.appendChild(o);
	this.k   = k;
	this.w   = o.width * .5;
	this.h   = o.height * .5;
	this.obj = o.style;
	this.t   = 0;
	this.x   = 0;
	this.y   = 0;
	this.dy  = 0;
	this.dx  = 0;
	this.q   = q;
	this.INI = function() {
		with(this){
			if(k){
				t   = .2;
				x   = nx * .5;
				y   = ny + this.h;
				dy  = -eval("dyy=1;d=0;while(d<(ny-Math.random()*100)){d+=dyy;dyy+=this.t}");
				dx  = -8 * Math.random() + 4;
			} else {
				x	= 0;
				y	= 0;
				a   = 2 * Math.PI * Math.random();
				r   = (q>.3)?5 * Math.random():5;
				dx  = r * Math.sin(a);
				dy  = r * Math.cos(a)-4;
				obj.left = -1000;
			}
		}	
	}
	this.INI();
	this.SCR = function(X,Y){
		with(this){
			x  += dx;
			y  += dy;
			if(k){
				dy += t;
				if(dy>2){
					obj.visibility="hidden";
					obj.left = -1000;
					for(var i=0;i<NN;i++)O[i].SCR(x,y);
				} else {
					obj.left = Math.round(x - w);
					obj.top  = Math.round(y - h);
				}
				if(y>ny*3){
					INI();
					for(var i=0;i<NN;i++)O[i].INI();
					obj.visibility="visible";
				}
			} else {
				if(Y+y<ny+50){
					obj.left = Math.round(X + x - w);
					obj.top  = Math.round(Y + y - h);
				}
			}
		}
	}
	if(k){
		this.O = new Array();
		q = Math.random();
		for(var i=0;i<NN;i++)this.O[i] = new spAn(false,q);
	}
}

function resize(){
	nx = document.body.clientWidth;
	ny = document.body.clientHeight;
}
onresize = resize;

onload = function() {
	resize();
	for(var i=0;i<N;i++){
		O[i] = new spAn(true);
		setTimeout('setInterval("O['+i+'].SCR()",16)',T*i);
	}
}
//-->
</script>
</head>

<body>
시스템 사양에 따라 실행속도가 늦어질 수 있으니 잠시 기다려주세요,..
<div id="G1" style="visibility:hidden">
	<IMG src="http://www.blueb.co.kr/SRC/javascript/image3/wowt.gif">
	<IMG src="http://www.blueb.co.kr/SRC/javascript/image3/shino.gif">
	<IMG src="http://www.blueb.co.kr/SRC/javascript/image3/SMILING.gif">
</div>

<div id="DOOT" style="visibility:hidden">
	<IMG src="http://www.blueb.co.kr/SRC/javascript/image1/star1.gif"> 
	<IMG src="http://www.blueb.co.kr/SRC/javascript/image1/star2.gif"> 
	<IMG src="http://www.blueb.co.kr/SRC/javascript/image1/star3.gif"> 
	<IMG src="http://www.blueb.co.kr/SRC/javascript/image1/star4.gif">
</div>

</body>
</html>