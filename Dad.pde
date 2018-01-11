class Dad extends Chaser {
  Gas gas= new Gas();
  final int GAS_COOLDOWN = 30;
  float gasTime;

  Dad() {
    super();
  }

  void display(PImage runPic1, PImage runPic2) {
    super.display(runPic1, runPic2);
    gas.display();
  }
  
  void reset(){
    super.reset();
    gas.reset();
  }

  void update() {

    if (gasTime<=70) {
      gas.isAlive = true;
    } else {
      gas.isAlive = false;     //shoot gas
      gas.shoot(gas.x2+x+60, gas.y2+y+63);
    }
    if (gas.x2+x+60>loser.x+450) {
      gasTime =GAS_COOLDOWN;
    }   
    if (x<1200) {
      gasTime ++;
      x+=2;
      //drop down from the sky
      if (y<280) {
        y+=5;
      }
    } else { 
      gasTime +=0;
      runChane=8;
      x+=4;
    }
    gas.checkCollision(loser);
  }
}