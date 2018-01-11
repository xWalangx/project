class Gas {
  boolean isAlive;
  boolean gasDirection;
  float x, y;
  float w=30, h=15;
  float shootX;
  float x2 = 0, y2=0;
  float originX, originY;
  float speed = 5;



  Gas() {
    isAlive = true;
    gasDirection=true;
  }
  
  void reset(){
    isAlive = true;
    gasDirection=true;
    dad.gasTime = dad.GAS_COOLDOWN;
  }


  void display() {
    if (isAlive == true) {  
      x2=0;
      y2=0;
    }
  }



  void shoot(float a, float b) {
    if (isAlive == false) {  

      if (y2<=-60) {
        gasDirection=false;
      }
      if (y2>=50) {
        gasDirection=true;
      }
      if (gasDirection) {
        y2-=3;
      } else {
        y2+=3;
      }

      if (dad.x<1030) {
        x2+=speed;
      } else {
        x2+=speed-2;
      }
      image(gas, a, b);
    }
  }

  void checkCollision(Loser loser) {

    if (isAlive==false && isHit(x2+dad.x+60, dad.y+63, w, h, loser.x, loser.y, loser.w, loser.h)) {
      loser.hurt();
      isAlive = true;
      dad.gasTime = dad.GAS_COOLDOWN;
      //sound
      sound_hurt.trigger();
    }
  }
}