var requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
var transforms = ["transform", "msTransform", "webkitTransform", "mozTransform", "oTransform"];
var transformProperty = getSupportedPropertyName(transforms);

var dusts = [];
var browserWidth;
var browserHeight;
var numberOfDusts = 60;
var resetPosition = false;
var speeddet = 3;
var speeddets = 1;

function setup(){
    window.addEventListener("DOMContentLoaded", generateDusts, false);
    window.addEventListener("resize", setResetFlag, false);
}
setup();
function getSupportedPropertyName(properties){
    for( var i = 0; i < properties.length; i++){
        if(typeof document.body.style[properties[i]] !== "undefined"){
            return properties[i];
        }
    }
    return null;
}

function Dust(element, speed, xPos, yPos){
    this.element = element;
    this.xPos = xPos;
    this.yPos = yPos;
    this.speed = speed;
    this.font = Math.random() * 20;
    
    this.element.style.opacity = 0.2 + Math.random();
    this.element.style.fontSize =  this.font + "px";
}

Dust.prototype.update = function(){
    
    if(this.xPos >browserWidth/2){
        if(this.xPos >3*browserWidth/4){
            this.xPos += speeddet + this.speed;
            this.font += 1;
        }else{
            this.xPos += speeddets + this.speed;
            this.font += 0.3;
        }
    }
    else{
        if(this.xPos <browserWidth/4){
            this.xPos -= speeddet + this.speed;
            this.font += 1;
        }else{
            this.xPos -= speeddets + this.speed;
            this.font += 0.3;
        }
    }
    if(this.yPos >browserHeight/2){
        if(this.yPos >3*browserHeight/4){
            this.yPos += speeddet + this.speed;
        }else{
            this.yPos += speeddets + this.speed;
        }
    }
    else{
        if(this.yPos < browserHeight/4){
            this.yPos -= speeddet + this.speed;
        }else{
            this.yPos -= speeddets + this.speed;
        }
    }
    setTranslate3DTransform(this.element, Math.round(this.xPos), Math.round(this.yPos));
    this.element.style.fontSize =  this.font + "px";
    
    if(this.yPos > browserHeight || this.yPos <0){
        this.yPos = Math.random()*browserHeight;
    }
    if(this.xPos > browserWidth || this.xPos < 0){
        this.xPos = Math.random()*browserWidth;
    }
    if(this.font > 70){
        this.font = Math.random()*20;
    }
};
function setTranslate3DTransform(element, xPosition, yPosition){
    var val = "translate3d(" + xPosition +"px,"+yPosition+"px"+",0)";
    element.style[transformProperty] = val;
}

function generateDusts(){
    var originalDust = document.querySelector(".dust");
    var dustContainer = originalDust.parentNode;
    browserWidth = document.documentElement.clientWidth;
    browserHeight = document.documentElement.clientHeight;
    
    for(var i = 0; i < numberOfDusts; i++){
        var dustClone = originalDust.cloneNode(true);
        dustContainer.appendChild(dustClone);
        var initialXPos = getPosition(50, browserWidth);
        var initialYPos = getPosition(50, browserHeight);
        var speed = Math.random()*3;
        
        var dustObject = new Dust(dustClone, speed, initialXPos, initialYPos);
        dusts.push(dustObject);
    }
    dustContainer.removeChild(originalDust);
    moveDusts();
}

function moveDusts(){
    for(var i = 0; i < dusts.length; i++){
        var dust = dusts[i];
        dust.update();
    }
    if(resetPosition){
        browserWidth = document.documentElement.clientWidth;
        browserHeight = document.documentElement.clientHeight;
        
        for(var i = 0; i < dusts.length; i++){
            var dust = dusts[i];
            dust.xPos = getPosition(50, browserWidth);
            dust.yPos = getPosition(50, browserHeight);
        }
        resetPosition = false;
    }
    requestAnimationFrame(moveDusts);
}

function getPosition(offset, size){
    return Math.round(-1*offset + Math.random()*(size+2*offset));
}
function setResetFlag(e){
    resetPosition = true;
}