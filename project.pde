//change in 2018/01/11
PImage background1, background2, background3, background4;
PImage startScene, loseScene1, loseScene2, loseScene3;
PImage startButton1, startButton2, returnButton;
PImage loserLeft, loserRight, loserRightJump, loserLeftJump, loserRight1, loserRight2, loserLeft1, loserLeft2, loserRightStanding, loserLeftStanding;
PImage dadImg, momImg, girlImg;
PImage knife, knifeShoot, gas, card;
PImage ghost, head;
PImage noodleImg, beerImg, photoImg;
PImage bloodBar1, bloodBar2, bloodBar3, bloodBar4, bloodBar5;
PImage mom1, mom2, dad1, dad2, girl1, girl2;
PImage information1, information2;
PImage eyeball, hand;
PImage blood;
PImage explain,stage1,stage2,stage3;
PImage soundiconOFF,soundiconON,stopicon;

final int GAME_START = 0, GAME_RUN1 = 1, GAME_RUN2 = 2, GAME_RUN3 = 3, GAME_OVER = 4, GAME_WIN = 5, GAME_INFO = 6;
int gameState = 0;
int currentState;
final int GO_UP =0, GO_RIGHT =1, GO_DOWN =2, GO_LEFT =3;

final int stageShowTime = 300;
int stageTime,explainTime;

boolean leftState = false;
boolean rightState = false;
boolean upState = false;
boolean startChase = false;
boolean loserHurt = false;
boolean disPlayExplain = true;
boolean disPlayStage =true;

final float BACKGROUND1_WIDTH=1600;
final float BACKGROUND2_WIDTH=2000;
final float BACKGROUND3_WIDTH=2400;

float backGroundMoveX = 0;

int bloodDisplayBoundary;

//sound
import ddf.minim.*;
Minim minim;
AudioPlayer sound_clock, sound_end, song;
AudioSample sound_ghost, sound_hurt;

Loser loser=new Loser();
Mom mom = new Mom();
Dad dad = new Dad();
Girl girl = new Girl();

Ghost ghost1 = new Ghost(550, 360, GO_UP);
Ghost ghost2 = new Ghost(1000, 100, GO_DOWN);

Eyeball eyeball1 = new Eyeball(1500, 330);
Eyeball eyeball2 = new Eyeball(900, 330);
Eyeball eyeball3 = new Eyeball(2000, 330);

Hand[] hands = new Hand[10];
Card[] cards = new Card[9];

Beer [] beers = new Beer[3];
Noodle[] noodles = new Noodle[2];
Photo photo = new Photo();

void setup() {
  size(800, 480);
  startScene = loadImage("img/startScene/startScene.png");
  startButton1 = loadImage("img/startScene/startButton1.png");
  startButton2 = loadImage("img/startScene/startButton2.png");
  background1 = loadImage("img/background/background1.jpg");
  background2 = loadImage("img/background2.jpg");
  background3 = loadImage("img/background3.jpg");
  loseScene1 = loadImage("img/loseScene/gameLose1.png");
  loseScene2 = loadImage("img/loseScene/gameLose2.png");
  loseScene3 = loadImage("img/loseScene/gameLose3.png");
  returnButton = loadImage("img/loseScene/returnButton.png");
  dadImg = loadImage("img/dad.png");
  momImg = loadImage("img/mom.png");
  girlImg = loadImage("img/dad.png");
  loserRightJump = loadImage("img/loser/loserRightJump.png");
  loserLeftJump = loadImage("img/loser/loserLeftJump.png");
  loserRight1 = loadImage("img/loser/loserRight1.png");
  loserRight2 = loadImage("img/loser/loserRight2.png");
  loserLeft1 = loadImage("img/loser/loserLeft1.png");
  loserLeft2 = loadImage("img/loser/loserLeft2.png");
  loserRightStanding = loadImage("img/loser/loserRightStanding.png");
  loserLeftStanding = loadImage("img/loser/loserLeftStanding.png");
  ghost = loadImage("img/horribleItem/ghost.png");
  knife = loadImage("img/weaponItem/knife.png");
  knifeShoot = loadImage("img/weaponItem/knifeShoot.png");
  gas = loadImage("img/weaponItem/smellBad.png");
  card =loadImage("img/weaponItem/goodMan.png");
  bloodBar1 = loadImage("img/bloodBar/bloodBar1.png");
  bloodBar2 = loadImage("img/bloodBar/bloodBar2.png");
  bloodBar3 = loadImage("img/bloodBar/bloodBar3.png");
  bloodBar4 = loadImage("img/bloodBar/bloodBar4.png");
  bloodBar5 = loadImage("img/bloodBar/bloodBar5.png");
  mom1 = loadImage("img/people/mom1.png");
  mom2 = loadImage("img/people/mom2.png");
  dad1 = loadImage("img/people/dad1.png");
  dad2 = loadImage("img/people/dad2.png");
  girl1 = loadImage("img/people/girl1.png");
  girl2 = loadImage("img/people/girl2.png");
  information1 = loadImage("img/startScene/information1.png");
  information2 = loadImage("img/startScene/information2.png");
  explain = loadImage("img/startScene/explain.png");
  stage1 = loadImage("img/startScene/stage1.png");
  stage2 = loadImage("img/startScene/stage2.png");
  stage3 = loadImage("img/startScene/stage3.png");
  eyeball = loadImage("img/horribleItem/eyeBall.png");
  hand = loadImage("img/horribleItem/handlong.png");

  //bloodItem
  beerImg = loadImage("img/bloodItem/beerTaiwan.png");
  noodleImg = loadImage("img/bloodItem/instantNoodles.png");
  photoImg = loadImage("img/bloodItem/photo.png");

  //sound
  minim = new Minim(this);
  sound_clock = minim.loadFile("sound/terror_clock.mp3");
  sound_end = minim.loadFile("sound/horror_piano chord.mp3");
  song = minim.loadFile("sound/THE OMEN.mp3");
  sound_hurt = minim.loadSample("sound/hurt.mp3", 128);
  sound_ghost = minim.loadSample("sound/ghost_attack.mp3", 128);
  //blood
  blood = loadImage("img/blood.png");
  //icons
  soundiconOFF = loadImage("img/icons/soundiconOFF.png");
  soundiconON = loadImage("img/icons/soundiconON.png");
  stopicon = loadImage("img/icons/stopicon.png");
  


  //start scene initX
  mom.peopleX=300;
  dad.peopleX=200;
  girl.peopleX=100;
  loser.peopleX=600;

  // Initialize hands
  for (int i = 1; i < hands.length; i++) {
    float newX = i*250;
    float newY = floor(random(362, 440));
    hands[i]= new Hand(newX, newY);
  }

  // Initialize cards
  for (int i = 1; i < cards.length; i++) {
    float newX = i*250+150;
    float newY = floor(random(-90, -60));
    float newYSpeed=int (random(2, 5));
    float newXSpeed=int(random(-2, 2));
    while (newXSpeed==0) {
      newXSpeed=int(random(-2, 2));
    }
    cards[i]= new Card(newX, newY, newYSpeed, newXSpeed);
  }
  //Initialize bloodItems
  //noodles
  for (int i = 1; i < noodles.length; i++) {    
    float newX = random(400, 800);
    float newY = 370; 
    noodles[i]= new Noodle(newX, newY);
  }
  //beers
  for (int i = 1; i < beers.length; i++) {    
    float newX = 2000;
    float newY = 370; 
    float newXSpeed=random(0.5, 3);
    beers[i]= new Beer(newX, newY, newXSpeed);
  }
  //Display time
  stageTime = 420;
  explainTime = 300;
}

void draw() {
  switch(gameState) {
  case GAME_START:
    //backgroundsound
    sound_clock.play();
    //display start image
    image(startScene, 0, 0);
    //start button
    image(startButton1, 0, 0);
    if (mouseX>=345 && mouseX<=470 && mouseY>=200 && mouseY<=235) {
      image(startButton2, 0, 0);
      if (mousePressed) {
        gameState=GAME_RUN1;
      }
    }
    //running people
    //loser
    loser.run();
    mom.run(mom1, mom2);
    dad.run(dad1, dad2);
    girl.run(girl1, girl2);

    break;

  case GAME_RUN1:
    //state
    currentState = GAME_RUN1;
    
    //backgroundsound
    sound_clock.pause();
    sound_end.pause();
    song.play();
    bloodDisplayBoundary=1170;
    //back Ground translate
    if (loser.x >= 1170) {
      //if background move to the end stop translate but loser keep moving
      backGroundMoveX = -1170+370 ;
    } else if (loser.x>370) {
      //if loser move to the middle start translate and roll the background
      backGroundMoveX = -loser.x+370;
    } else {
      //if loser hasn't reach the middle, stop translate and the backGround movement
      backGroundMoveX = 0;
    }

    //translate
    pushMatrix();

    translate(backGroundMoveX, 0);

    //background
    image(background1, 0, 0);
    //image(momImg,momX,260);
    if (loser.x>280) {
      startChase=true;
    }
    if (startChase) {
      mom.display(mom1, mom2);
      mom.update();
      mom.checkCollision(loser);
    }
    //ghost
    ghost1.display();
    ghost1.update();
    ghost1.checkCollision(loser);
    ghost2.display();
    ghost2.update();
    ghost2.checkCollision(loser);

    //player 
    loser.update();

    //bloodItem
    for (Noodle i : noodles) {
      if (i == null) continue;
      i.display();
      i.checkCollision(loser);
    }  

    //check game state
    if (loser.x>=1510) {
      loser.reset();
      gameState = GAME_RUN2;
      startChase=false;
      song.pause();
      disPlayStage = true;
    }
    popMatrix();
    //end of translate



    //bloodBar
    if (loser.health<=1) {
      image(bloodBar1, 0, 0);
    } else if (loser.health<=2) {
      image(bloodBar2, 0, 0);
    } else if (loser.health<=3) {
      image(bloodBar3, 0, 0);
    } else if (loser.health<=4) {
      image(bloodBar4, 0, 0);
    } else {
      image(bloodBar5, 0, 0);
    }
    //info icon
    image(stopicon,760,10);
    if (mouseX>=760 && mouseX<=790 && mouseY>=10 && mouseY<=40) {
      //image(information2, 0, 0);
      if (mousePressed) {
        gameState=GAME_INFO;
      }
    }
    //show explain and stage name
    stageShow(stage1);
    explainShow(explain);
    
    

    break;

  case GAME_RUN2:
    //state
    currentState = GAME_RUN2;
    //background sound
    sound_end.pause();
    song.play();
    bloodDisplayBoundary =1170+400;
    //backGround movement
    //if background move to the end stop translate but loser keep moving
    if (loser.x >= 1170+400) {
      backGroundMoveX = -1170-400+370 ;
    } else if (loser.x>370) {
      //if loser move to the middle start translate and roll the background
      backGroundMoveX = -loser.x+370;
    } else {
      //if loser hasn't reach the middle, stop translate and the backGround movement
      backGroundMoveX = 0;
    }

    //start translate
    pushMatrix();
    translate(backGroundMoveX, 0);
    image(background2, 0, 0);
    if (loser.x>280) {
      startChase=true;
    }
    if (startChase) {
      dad.display(dad1, dad2);
      dad.update();
      dad.checkCollision(loser);
    }
    loser.update();

    //eyeball
    eyeball1.update();
    eyeball1.display();
    eyeball1.checkCollision(loser);
    eyeball2.update();
    eyeball2.display();
    eyeball2.checkCollision(loser);
    eyeball3.update();
    eyeball3.display();
    eyeball3.checkCollision(loser);

    //bloodItem
    for (Beer i : beers) {
      if (i == null) continue;
      i.display();
      i.checkCollision(loser);
    }  


    //check game state
    if (loser.x>=BACKGROUND2_WIDTH-loser.w) {
      //if loser reach the end
      loser.reset();
      gameState=GAME_RUN3;
      startChase = false;
      song.pause();
      disPlayStage = true;
    }

    popMatrix();
    //end of translate

    //bloodBar
    if (loser.health<=1) {
      image(bloodBar1, 0, 0);
    } else if (loser.health<=2) {
      image(bloodBar2, 0, 0);
    } else if (loser.health<=3) {
      image(bloodBar3, 0, 0);
    } else if (loser.health<=4) {
      image(bloodBar4, 0, 0);
    } else {
      image(bloodBar5, 0, 0);
    }
    //info icon
    image(stopicon,760,10);
    if (mouseX>=760 && mouseX<=790 && mouseY>=10 && mouseY<=40) {
      //image(information2, 0, 0);
      if (mousePressed) {
        gameState=GAME_INFO;
      }
    }
    //show stage
    stageShow(stage2);



    break;

  case GAME_RUN3:
    //state
    currentState = GAME_RUN3;
    //background sound
    sound_end.pause();
    song.play();
    bloodDisplayBoundary=2400-430;
    //back Ground translate
    if (loser.x >= BACKGROUND3_WIDTH-430) {
      //if background move to the end stop translate but loser keep moving
      backGroundMoveX = -(BACKGROUND3_WIDTH-430)+370 ;
    } else if (loser.x>370) {
      //if loser move to the middle start translate and roll the background
      backGroundMoveX = -loser.x+370;
    } else {
      //if loser hasn't reach the middle, stop translate and the backGround movement
      backGroundMoveX = 0;
    }
    //translate
    pushMatrix();
    translate(backGroundMoveX, 0);
    image(background3, 0, 0);
    if (loser.x>280) {
      startChase=true;
    }
    if (startChase) {
      girl.display(girl1, girl2);
      girl.update();
      girl.checkCollision(loser);
    }
    //player 
    loser.update();

    //hands
    for (Hand i : hands) {
      if (i == null) continue;
      i.show();
      i.checkCollision(loser);
    }
    //cards
    for (Card i : cards) {
      if (i == null) continue;
      if (girl.y==280) {
        i.show();
        i.checkCollision(loser);
      }
    }

    //bloodItem
    photo.display();
    photo.checkCollision(loser);

    popMatrix();
    //end of translate

    //bloodBar
    if (loser.health<=1) {
      image(bloodBar1, 0, 0);
    } else if (loser.health<=2) {
      image(bloodBar2, 0, 0);
    } else if (loser.health<=3) {
      image(bloodBar3, 0, 0);
    } else if (loser.health<=4) {
      image(bloodBar4, 0, 0);
    } else {
      image(bloodBar5, 0, 0);
    }
    //check game state
    if (loser.x>=BACKGROUND3_WIDTH-loser.w) {
      loser.reset();
      gameState = GAME_WIN;
    }
    //info icon
    image(stopicon,760,10);
    if (mouseX>=760 && mouseX<=790 && mouseY>=10 && mouseY<=40) {
      //image(information2, 0, 0);
      if (mousePressed) {
        gameState=GAME_INFO;
      }
    }
    //show stage
    stageShow(stage3);


    break;

  case GAME_OVER:
    //background music
    song.pause();
    sound_end.play();

    //detect current State and show gameover scene individually
    //println(currentState);
    if (currentState==GAME_RUN1) {
      image(loseScene1, 0, 0);
    } else if (currentState==GAME_RUN2) {
      image(loseScene2, 0, 0);
    } else if (currentState==GAME_RUN3) {
      image(loseScene3, 0, 0);
    }

    //image(returnButton, 0, 0);
    if (mouseX>=345 && mouseX<=460 && mouseY>=405 && mouseY<=445) {
      image(returnButton, 0, 0);
      if (mousePressed) {
        //changee state
        gameState=currentState;
        //reset
        loser.reset();
        loser.health=5;
        backGroundMoveX=0;
        mom.reset();
        dad.reset();
        girl.reset();
        startChase=false;
        eyeball1.reset();
        eyeball2.reset();
        eyeball3.reset();
        for (Card i : cards) {
          if (i == null) continue;
          i.reset();
        }
        for (Noodle i : noodles) {
          if (i == null) continue;
          i.reset();
        }
        for (Beer i : beers) {
          if (i == null) continue;
          i.reset();
        }
        photo.reset();
      }
    }


    break;

  case GAME_WIN:

    break;

  case GAME_INFO:
    //display info image
    //image(information1, 0, 0);
    image(explain,0,0);
    image(stopicon,720,10);
    if (mouseX>=720 && mouseX<=750 && mouseY>=10 && mouseY<=40) {
      //image(information2, 0, 0);
      if (mousePressed) {
        gameState=currentState;
      }
    }

    break;
    
  }
}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return  ax + aw > bx &&  ax < bx + bw &&   
    ay + ah > by &&  ay < by + bh;
}
boolean beChased(float ax, float aw, float bx) {
  return ax+aw>bx;
}

void keyPressed() {
  if (key==CODED) {
    switch(keyCode) {
    case LEFT:
      leftState = true;
      break;
    case RIGHT:
      rightState = true;
      break;
    case UP:
      upState = true;
      break;
    }
  }
}
void keyReleased() {
  if (key==CODED) {
    switch(keyCode) {
    case LEFT:
      leftState = false;
      break;
    case RIGHT:
      rightState = false;
      break;
    }
  }
}

void stageShow(PImage img1){
  if(disPlayStage){
      stageTime--;
      image(img1,0,0) ;
    } 
    if(stageTime<0){
      disPlayStage = false;
      stageTime=120;
    }
}
void explainShow(PImage img2){
  if(disPlayExplain){
      explainTime--;
      image(img2,0,0) ;
    } 
    if(explainTime<0){
      disPlayExplain = false;
      explainTime=300;
    }
}