class Beer {
  boolean isAlive;
  float x=random(600, 1540), y=370;
  float xSpeed;
  float w = 20;
  float h = 30;
  float bloodTime = 100;

  Beer(float x, float y, float xSpeed) {
    this.x = x;
    this.y = y;
    this.xSpeed = xSpeed;
    isAlive = true;
  }

  void display() {
    if (isAlive == true) {  
      x-=xSpeed;
      image(beerImg, x, y);
    }
    bloodTime --;
    if (isAlive == false && bloodTime <=0) {
      isAlive = true;
      x = 2000;
    }
  }


  void checkCollision(Loser loser) {
    if (loser.health<loser.LOSER_MAX_HEALTH) {
      if (isAlive==true && isHit(x, y, w, h, loser.x, loser.y, loser.w, loser.h)) {
        loser.health++;
        isAlive = false;
        bloodTime = 100;
      }
    }
  }
  void reset() {
    x=2000;
    y=370;
    isAlive = true;
  }
}