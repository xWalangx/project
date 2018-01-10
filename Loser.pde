class Loser {
   float x, y;
  float loserSpeed=3, loserJumpSpeed=9, loserDownSpeed=8;
  float w = 60, h = 120;
  int health = 0;
  float LOSER_INIT_X=0, LOSER_INIT_Y=280;
  float jumpCount, runCount; //runCount change picture when loser is moving
  
  final int PLAYER_MAX_HEALTH = 5, JUMP_TIME=22; //jumptime will effect x&y distance While jumpSpeed only effect y distance
  final int loserWidth = 60;
  final int LOSER_RUN_CHANGE=10;

  int moveDirection = 0;
  int hurtTime=120;
  int peopleX=0;
  
  int bloodDisplayTime=60;
  
  //int currentstate;

  Loser() {
    health = 5;
    x = LOSER_INIT_X;
    y = LOSER_INIT_Y;
    jumpCount=JUMP_TIME;

  }
  void reset() {
    //set all to init number
    //use when changing game states
      x = LOSER_INIT_X;
      y = LOSER_INIT_Y;
      jumpCount=JUMP_TIME;
      upState=false;
      moveDirection=0;
      runCount=0;
      //health=5;
  }

  void update() {
    //blood display
    if(loserHurt){
      loser.bloodDisplayTime--;
      if(loser.x >= bloodDisplayBoundary){
         image(blood,bloodDisplayBoundary-370,0) ;
      }else if(loser.x>370){
         image(blood,loser.x-370,0);
      }
    } 
    if(bloodDisplayTime<0){
      loserHurt = false;
      bloodDisplayTime=60;
    }
    //hurtTime--;
    PImage loserDisplay=loserRightStanding;
    switch(moveDirection) {
    case LEFT: 
      if (runCount<=LOSER_RUN_CHANGE) {
        loserDisplay = loserLeft1;
      } else {
        loserDisplay = loserLeft2;
        if (runCount>=2*LOSER_RUN_CHANGE) {
          runCount=0;
        }
      }

      break;
    case RIGHT:   
      if (runCount<=LOSER_RUN_CHANGE) {
        loserDisplay = loserRight1;
      } else {
        loserDisplay = loserRight2;
        if (runCount>=2*LOSER_RUN_CHANGE) {
          runCount=0;
        }
      }
      break;
    }
    //leftmove
    if (leftState) {
      runCount++;
      moveDirection = LEFT;
      x-=loserSpeed;
    } else {
      if (!rightState&&(loserDisplay==loserLeft1||loserDisplay == loserLeft2)) {
        loserDisplay = loserLeftStanding;
      }
    }

    //rightmove
    if (rightState) {    
      runCount++;
      moveDirection = RIGHT;
      x+=loserSpeed;
    } else {
      if (!leftState&&(loserDisplay==loserRight1||loserDisplay == loserRight2)) {
        loserDisplay = loserRightStanding;
      }
    }

    //jump
    if (upState) {
      if (loserDisplay == loserRight1 || loserDisplay == loserRight2 || loserDisplay == loserRightStanding) { 
        loserDisplay = loserRightJump;
      } else {      
        loserDisplay = loserLeftJump;
      }

      jumpCount--;
      if (jumpCount>0) {
        y-=loserJumpSpeed;
      } else {
        if (y >=LOSER_INIT_Y) {
          y+=0;
          upState=false;
          jumpCount=JUMP_TIME;
        } else {
          y+=loserDownSpeed;
        }
      }
    }
    //boundary
    if (x<0) {
      x=0;
    }
    //println(x,y);

    //show image
    image(loserDisplay, x, y);
  }

  int hurt() {
    health --;
    currentState = gameState;
    //blood background display
    loserHurt = true;
    if (health == 0) {
      gameState = GAME_OVER;
    }
    return currentState;
  }
  
  //use it at the start scene
  //loser keep runnung to the right
  void run(){
     PImage Display;
     peopleX +=2;
     peopleX %= width+300;
     if (runCount<=LOSER_RUN_CHANGE) {
      Display = loserRight1;
     } else {
      Display = loserRight2;
      if (runCount>2*LOSER_RUN_CHANGE) {
        runCount=0;
      } 
     }
     runCount++;
     image(Display,peopleX-w,height-h-100);
  }
}