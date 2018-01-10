class Photo {
  boolean isAlive;
  float x=random(600,1540), y=370;
  float w = 30;
  float h = 30;

  Photo() {
    isAlive = true;
  }

  void display() {
    if (isAlive == true) {  
     
      image(photoImg,x,y);
    }
  }
  void checkCollision(Loser loser) {
    if (isAlive==true && isHit(x, y, w, h, loser.x, loser.y, loser.w, loser.h)) {
      loser.health++;
      isAlive = false;
      
    }
    
  }
  void reset(){
    x=random(600,1600);
    y=370;
    isAlive = true;
  }
}