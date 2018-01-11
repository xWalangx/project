class Knife {
  boolean isAlive;
  float x, y;
  float w=30, h=15;
  float shootX;
  float x2 = 0;
  float originX, originY;
  float speed = 5;


  Knife() {
    isAlive = true;
  }


  void display() {
    if (isAlive == true) {  
      x2 = 0;
      image(knife, mom.x+60, mom.y+40);
    }
  }



  void shoot(float a, float b) {
    if (isAlive == false) {  
      if (mom.x<830) {
        x2+=speed;
      } else {
        x2+=speed-2;
      }
      image(knifeShoot, a, b);
    }
  }
  
  void reset(){
    isAlive = true;
  }

  void checkCollision(Loser loser) {

    if (isAlive==false && isHit(x2+mom.x+60, mom.y+63, w, h, loser.x, loser.y, loser.w, loser.h)) {
      loser.hurt();
      isAlive = true;
      mom.knifeTime = mom.KNIFE_COOLDOWN;
      //sound
      sound_hurt.trigger();
    }
  }
}