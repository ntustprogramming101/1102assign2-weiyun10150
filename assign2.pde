//preload image from files

PImage bg;
PImage cabbage;
PImage gameover;
PImage groundhogDown;
PImage groundhogldle;
PImage groundhogLeft;
PImage groundhogRight;
PImage life;
PImage restartHovered;
PImage restartNormal;
PImage soil;
PImage soldier;
PImage startHovered;
PImage startNormal;
PImage title;

//some variables

int lifebar = 2;




void setup() {
  frameRate(15);
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
  cabbage = loadImage("img/cabbage.png");
  gameover = loadImage("img/gameover.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogldle = loadImage("img/groundhogldle.png");
  groundhogLeft = loadImage("img/gorundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  life = loadImage("img/life.png");
  restartHovered = loadImage("img/restartHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  startHovered = loadImage("img/soldier.png");
  startNormal = loadImage("img/startNormal.png");
  title = loadImage("img/title.jpg");
  
}

void draw() {
  /////////////////static graphic//////////
	image(bg, 0, 0);
  image(soil, 0, 160);
  //sun
  strokeWeight(5);
  stroke(255, 255, 0);
  fill(253, 184, 19);
  ellipse(590, 50, 125,125);
  //grass 
  noStroke();
  fill(124,204,25);
  rect(0, 145, 640, 15);
  ////////////////dynamic grahphic////////
  
  
}

void keyPressed(){
}

void keyReleased(){
}
