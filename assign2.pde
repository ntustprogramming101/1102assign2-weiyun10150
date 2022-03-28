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
final int hogIdle = 0, hogDown = 1, hogRight = 2, hogLeft = 3;
int hogDraw = hogIdle;
int gameState = GameStart;
float movementTimer;


int lifebar = 2;
int hogX = 320, hogY = 80;
int speed = 80;
int soldierY, soldierX;
int cabbageX, cabbageY;


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
        
        hogX = 320;
        hogY = 80;
        hogDraw = hogIdle;
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
      //movement timer setting
      if(movementTimer == 15){
        hogDraw = hogIdle;
        if((hogY % speed) < 30){
          hogY = hogY - hogY % speed;
        }else{
          hogY = hogY - hogY % speed + speed;
        }
        if((hogX % speed) < 30){
          hogX = hogX - hogX % speed;
        }else{
          hogX = hogX - hogX % speed + speed;
        }
        
        movementTimer = 0; //reset
      }
      //Hog moveing sprite
      switch(hogDraw){
        case hogIdle:
          image(groundhogIdle, hogX, hogY);
          movementTimer = 0.0;
          break;
   
        case hogDown:
          image(groundhogDown, hogX, hogY);
          hogY += speed / 15.0;
          movementTimer++;
          break;
        case hogRight:
          image(groundhogRight, hogX, hogY);
          hogX += speed / 15.0;
          movementTimer++;
          break;
        case hogLeft:
          image(groundhogLeft, hogX, hogY);
          hogX -= speed / 15.0;
          movementTimer++;
          break;
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
           hogDraw = hogIdle;
          }
         }
      break;
  }
}

///////////////////////////////////////////key detection//////////////////////////////////

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case DOWN:
        if(hogDraw == hogIdle){
          hogDraw = hogDown;
          movementTimer = 0;
        }
        break;
      case LEFT:
        if(hogDraw == hogIdle){
          hogDraw = hogLeft;
          movementTimer = 0;
        }
        break;
      case RIGHT:
        if(hogDraw == hogIdle){
            hogDraw = hogRight;
            movementTimer = 0;
        }
        break;
    }
  }

}

void keyReleased() {
 
}
