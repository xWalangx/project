class Girl extends Chaser {

  Girl() {
    super();
  }
  
  void display(PImage runPic1, PImage runPic2) {
    super.display(runPic1, runPic2);
    
  }


  void update() {

   
    if (x<1500) {
      x+=2;
      //drop down from the sky
      if (y<280) {
        y+=5;
      }
    } else { 
      runChane=8;
      x+=4;
    }
  }
}