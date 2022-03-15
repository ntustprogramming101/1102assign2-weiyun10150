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
int frameT = 1;

boolean isMoving = false;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;



void setup() {
  
	size(640, 480, P2D);


	bg = loadImage("img/bg.jpg");
  cabbage = loadImage("img/cabbage.png");
  gameover = loadImage("img/gameover.jpg");
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
  frameRate(60);
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
  
  //character sprite 
  
  if(!isMoving){
    image(groundhogIdle, hogX, hogY);
  }
  else{
    if(upPressed){
      image(groundhogUp, hogX, hogY);
    }
    else if(downPressed){
    image(groundhogDown, hogX, hogY);
    }
    else if(leftPressed){
    switch(frameT){
        case 1:
          image(groundhogLeft, hogX + speed, hogY);
          frameT ++;
          break;
        case 2:
          image(groundhogLeft, hogX + speed/ 2, hogY);
          frameT ++;
          break;
        case 3:
          image(groundhogLeft, hogX + (int)speed/ 3, hogY);
          frameT ++;
          break;  
        case 4:
          image(groundhogLeft, hogX + speed/ 4, hogY);
          frameT = 1;
          break;
        default:
          break;
      }
    }
    else if(rightPressed){
      switch(frameT){
        case 1:
          image(groundhogRight, hogX - speed, hogY);
          frameT ++;
          break;
        case 2:
          image(groundhogRight, hogX - speed/ 2, hogY);
          frameT ++;
          break;
        case 3:
          image(groundhogRight, hogX - (int)speed/ 3, hogY);
          frameT ++;
          break;  
        case 4:
          image(groundhogRight, hogX - speed/ 4, hogY);
          frameT = 1;
          break;
        default:
          break;
      }
    }
  }
}



void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        isMoving = true;
        hogY -= speed;
        break;
      case DOWN:
        downPressed = true;
        isMoving = true;
        hogY += speed;
        break;
      case LEFT:
        leftPressed = true;
        isMoving = true;
        hogX -= speed;
        break;
      case RIGHT:
        rightPressed = true;
        isMoving = true;
        hogX += speed;
        break;
    }
  }

}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        isMoving = false;
        upPressed = false;
        break;
      case DOWN:
        isMoving = false;
        downPressed = false;
        break;
      case LEFT:
        isMoving = false;
        leftPressed = false;
        break;
      case RIGHT:
        isMoving = false;
        rightPressed = false;
        break;
    }
  }
}
