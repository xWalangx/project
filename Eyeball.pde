class Eyeball{
  float speed=3;
  float eyeballX;
  float eyeballY;
  int t;
  float angle;
  float initX,initY;
  float w=30,h=30;
  int HurtTime = 120;
  int currentstate;
  
  Eyeball(){
    eyeballX=0;
    eyeballY=300;
    angle = 0;
  }
  
  Eyeball(float inputX,float inputY){
    eyeballX=inputX;
    eyeballY=inputY;
    initX = inputX;
    initY = inputY;
    angle = 0;
  }
  
  void display(){
    pushMatrix();
    translate(eyeballX+30,eyeballY+30);
    rotate(-angle);
    image(eyeball,-30 ,-30);
    popMatrix();
    angle += 0.1;
    
  }
  
  void update(){
    eyeballX -= speed;
    if(eyeballX<=-w){
      eyeballX=BACKGROUND2_WIDTH+w;
    }
    
    HurtTime--;
    
  }
  
  void reset(){
    eyeballX=initX;
    eyeballY=initY;
  }
  
  void checkCollision(Loser loser) {
    if (isHit(eyeballX, eyeballY, w, h, loser.x, loser.y, loser.w, loser.h)) {
      if (HurtTime<=0) {
       loser.hurt();
       HurtTime=120;
       //sound
        sound_hurt.trigger();
      }
    }
  }
}