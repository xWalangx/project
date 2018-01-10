class Hand {
  float handStartY =480-20;
  float handEndY =390;
  float w=60, h=90;
  float speed=1;
  float handHurtTime=120;

  float x, y;
  Hand(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void show() {
    handHurtTime--;
    image(hand, x, y);
    y-=speed;
    if (y<handEndY || y>handStartY) {
      speed *= -1;
    }
  }
  void checkCollision(Loser loser) {
    if (handHurtTime<=0) {
      if (isHit(x, y, w, h, loser.x, loser.y, loser.w, loser.h)) {
        loser.hurt();
        handHurtTime=120;
      }
    }
  }
}