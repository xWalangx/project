class Chaser {
  float x, y;
  float w = 60;
  float h = 120;
  float runCount;
  int runChane=15;
  final int CHASER_INIT_X=0, CHASER_INIT_Y=-100;

  int peopleX;
  int count=0;
  Chaser() {
    x=CHASER_INIT_X;
    y=CHASER_INIT_Y;
  }

  int checkCollision(Loser loser) {
    if (beChased(x, w, loser.x)) {
      currentState = gameState; 
      gameState=GAME_OVER;
    }
    return currentState;
  }

  void display(PImage runPic1, PImage runPic2) {
    PImage Display;
    runCount++;
    if (runCount<=runChane) {
      Display =runPic1;
    } else {
      Display = runPic2;
      if (runCount>=2*runChane) {
        runCount=0;
      }
    }  
    image(Display, x, y);
  }


  void update() {
  }
  
  //use when reset the game
  void reset() {
    //set all to init number
    //use when changing game states
    x=CHASER_INIT_X;
    y=CHASER_INIT_Y;
    runCount=0;
  }


  //use it at the start scene
  //keep runnung to the right
  void run(PImage runPic1, PImage runPic2) {
    PImage Display;
    peopleX +=2;
    peopleX %= width+300;
    if (count<=10) {
      Display = runPic1;
    } else {
      Display = runPic2;
      if (count>20) {
        count=0;
      }
    }
    count++;
    image(Display, peopleX-w, height-h-100);
  }
}