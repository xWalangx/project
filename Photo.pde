class Photo {
  boolean isAlive;
  float x=random(400, 800), y=-30, x2=0;
  float w = 30;
  float h = 30;
  float xSpeed =1;
  float photoStartX =35;
  float photoEndX =-35;
  float bloodTime = 100;

  Photo() {
    isAlive = true;
    x2=0;
  }

  void display() {
    if (isAlive == true) {  
      y+=3;
      x2+=xSpeed;
      if (x2<photoEndX || x2>photoStartX) {
        xSpeed *= -1;
      }
      if (y>480) {
        y=-60;
        isAlive = false;
        bloodTime = 100;
      }
      image(photoImg, x+x2, y);
    }

    bloodTime --;
    if (isAlive == false && bloodTime <=0) {
      isAlive = true;
      x=random(800, 1600);
      y=-30;
    }
    //println("Time="+bloodTime);
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
    y=-30;
    isAlive = true;
  }
}