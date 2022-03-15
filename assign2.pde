//preload image from files

PImage bg;
PImage cabbage;
PImage gameover;
PImage groundhogDown;
PImage groundhogUp;
PImage groundhogIdle;
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
int hogX = 320, hogY = 80;
int speed = 80;


boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;



void setup() {
  
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
  cabbage = loadImage("img/cabbage.png");
  gameover = loadImage("img/gameover.png");
  groundhogUp = loadImage("img/groundhogUp .png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
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
  
  //life bar
  int loop = 0;
  int lifeX = 10; // heart of life's X location
  while(loop < lifebar){
    image(life, lifeX, 10);
    lifeX += 70;
    loop++;
  }
       
  //border limitation
  if(hogX >= 560){
    hogX = 560;
  }
  else if(hogX <= 0){
    hogX = 0;
  }
  if(hogY < 80){
    hogY = 80;
  }
  else if(hogY > 400){
    hogY = 400;
  }
  
  
}
