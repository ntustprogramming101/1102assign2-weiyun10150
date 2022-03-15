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
final int GameStart = 0;
final int GameRun = 1;
final int GameOver = 2;
int gameState = GameStart;


int lifebar = 2;
int hogX = 320, hogY = 80;
int speed = 80;
int frameT = 1;
int soldierY, soldierX;
int cabbageX, cabbageY;



boolean isMoving = false;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;



void setup() {
  
	size(640, 480, P2D);
  frameRate(60);

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
  startHovered = loadImage("img/startHovered.png");
  startNormal = loadImage("img/startNormal.png");
  title = loadImage("img/title.jpg");
  
  //seeds
  int[] soldierYseeds = {160, 240, 320, 400, 480};   //add some random position seeds
  soldierY = soldierYseeds[floor(random(0, 4))];
  int[] cabbageYseeds = {240, 320, 400, 480};
  int[] cabbageXseeds = {80, 160, 240, 320, 400, 480};
  cabbageY = cabbageYseeds[floor(random(0, 3))];
  cabbageX = cabbageXseeds[floor(random(0, 5))];
  //Hit boxes
  rect(hogX, hogY, 80, 80);
  rect(cabbageX, cabbageY, 80, 80);
  rect(soldierX, soldierY, 80, 80);
  
  ////
  
  
}

void draw() {
  switch(gameState){
    case GameStart:
      image(title, 0, 0);
      image(startNormal, 248, 360);
      if(mouseX >= 248 && 
         mouseX <= 392 &&
         mouseY >= 360 &&
         mouseY <= 420){
         image(startHovered, 248, 360);
         if(mousePressed){
           gameState = GameRun;
           }
         }
         
      break;
    case GameRun:
          /////////////////collision detectoin///////////
      //cabbage
      if (hogX + 80  > cabbageX && 
          hogX  < cabbageX + 80 && 
          hogY + 80 > cabbageY && 
          hogY < cabbageY + 80) {
        if(lifebar < 3) lifebar += 1;
        cabbageY = 1000;
        cabbageX = 1000;
      }
      //soldier
      if (hogX + 80  > soldierX && 
          hogX  < soldierX + 80 && 
          hogY + 80 > soldierY && 
          hogY < soldierY + 80) {
        if(lifebar > 0){
          lifebar -= 1;
        }
        
        hogX = 400;
        hogY = 80;
      }
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
      if(lifebar == 0){
       gameState = GameOver;
      }
      while(loop < lifebar && lifebar <= 3){
        image(life, lifeX, 10);
        lifeX += 70;
        loop++;
      }
      //cabbage
      image(cabbage, cabbageX, cabbageY);
      
      
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
          switch(frameT){
            case 1:
              image(groundhogUp, hogX , (hogY + speed / 4) + 80);
              frameT ++;
              break;
            case 2:
              image(groundhogUp, hogX , hogY + ((int)speed / 3) + 80);
              frameT ++;
              break;
            case 3:
              image(groundhogUp, hogX , hogY + (speed / 2) + 80);
              frameT ++;
              break;  
            case 4:
              image(groundhogUp, hogX , hogY);
              frameT = 1;
              break;
            default:
              break;
          }
        }
        else if(downPressed){
        switch(frameT){
            case 1:
              image(groundhogDown, hogX , (hogY + speed / 4) - 80);
              frameT ++;
              break;
            case 2:
              image(groundhogDown, hogX , hogY + ((int)speed / 3) - 80);
              frameT ++;
              break;
            case 3:
              image(groundhogDown, hogX , hogY + (speed / 2) - 80);
              frameT ++;
              break;  
            case 4:
              image(groundhogDown, hogX , hogY);
              frameT = 1;
              break;
            default:
              break;
          }
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
      /////soldier part////
      if(soldierX > 640){  //drag the solder outside off the border
        soldierX = 0;
      }
      else{
        soldierX = soldierX + 16;
      }
      image(soldier, soldierX, soldierY);
      break;
      case GameOver:
        image(gameover, 0, 0);
        image(restartNormal, 248, 360);
      if(mouseX >= 248 && 
         mouseX <= 392 &&
         mouseY >= 360 &&
         mouseY <= 420){
         image(restartHovered, 248, 360);
         if(mousePressed){
           lifebar = 2;
           int[] cabbageYseeds = {240, 320, 400, 480};
           int[] cabbageXseeds = {80, 160, 240, 320, 400, 480};
           cabbageY = cabbageYseeds[floor(random(0, 3))];
           cabbageX = cabbageXseeds[floor(random(0, 5))];
           gameState = GameRun;
          }
         }
      break;
      
  } 
}

///////////////////////////////////////////key detection//////////////////////////////////

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
