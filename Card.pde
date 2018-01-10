class Card {
  float cardStartX =35;
  float cardEndX =-35;
  float w=20, h=30;
  float xSpeed=1;
  float cardHurtTime=120;

  float x, y,x2,ySpeed;
  Card(float x, float y,float ySpeed) {
    this.x = x;
    this.y = y;
    this.ySpeed = ySpeed;
    x2=0;
  }
  void show() {
    cardHurtTime--;
    image(card, x+x2, y);
    y+=ySpeed;
    x2+=xSpeed;
    if (x2<cardEndX || x2>cardStartX) {
      xSpeed *= -1;
    }
    if(y>480){
     y=-60; 
    }
  }
  void checkCollision(Loser loser) {
    if (cardHurtTime<=0) {
      if (isHit(x+x2, y, w, h, loser.x, loser.y, loser.w, loser.h)) {
        loser.hurt();
        cardHurtTime=120;
        //sound
        sound_hurt.trigger();
      }
    }
  }
    void reset(){
    y=floor(random(-120,-60));
  }
}