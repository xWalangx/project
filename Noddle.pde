class Noodle {
  boolean isAlive;
  float x, y;
  float w = 20;
  float h = 30;
  float bloodTime = 150;

  Noodle(float x, float y) {
    this.x = x;
    this.y = y;
    isAlive = true;
  }

  void display() {
    if (isAlive == true) {  
      image(noodleImg, x, y);
    }
    bloodTime --;
    if (isAlive == false && bloodTime <=0) {
      isAlive = true;
      x = random(800, 1540);
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
    x=random(400, 800);
    y=370;
    isAlive = true;
  }
}