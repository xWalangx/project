class Mom extends Chaser {
  Knife knife = new Knife();
  final int KNIFE_COOLDOWN = 15;
  float knifeTime;

  Mom() {
    super();
  }

  void reset() {
    super.reset();
    knife.reset();
    mom.knifeTime = mom.KNIFE_COOLDOWN;
  }

  void display(PImage runPic1, PImage runPic2) {
    super.display(runPic1, runPic2);
    knife.display();
  }

  void update() {  
    if (knifeTime<=65) {
      knife.isAlive = true;
    } else {
      knife.isAlive = false;     //shoot knife
      knife.shoot(knife.x2+x+60, y+63);
    }
    if (knife.x2+x+60>loser.x+450) {
      knifeTime = KNIFE_COOLDOWN;
    }   
    if (x<830) {
      knifeTime ++;
      x+=2;
      //drop down from the sky
      if (y<280) {
        y+=5;
      }
    } else { 
      knifeTime +=0;
      runChane=8;
      x+=4;
    }
    knife.checkCollision(loser);
  }
}