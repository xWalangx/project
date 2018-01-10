class Ghost{
  
  float x = 300;
  float y = 400;
  float w=60,h=90;
  float speed;
  final int GHOST_MOVE=180;
  int state;
  float moveDistance;
  float ghostStartedX=300;
  float ghostStartedY=300;
  int ghostMovetime= GHOST_MOVE;
  int ghostHurtTime=120;

  
  Ghost(float inputX,float inputY,int inputState){
    ghostStartedX = inputX ;
    ghostStartedY = inputY;
    this.x = ghostStartedX;
    this.y = ghostStartedY;
    state=inputState;
    speed = 1;
    moveDistance = 120;
  }
  
  void display(){
    image(ghost,x,y);
  }
  
  void update(){
  ghostMovetime--;
  ghostHurtTime--;
  switch(state){
   case GO_UP:
    x-=speed*2/3;
    y-=speed;
     if(ghostMovetime<=0){
       state = GO_RIGHT;
       ghostMovetime= GHOST_MOVE;
     }
    
   break;
   
   case GO_RIGHT:
        x+=speed*2/3;
     y-=speed;

    if(ghostMovetime<=0){
      state = GO_DOWN;
      ghostMovetime= GHOST_MOVE;
    }  
   break;
   
   case GO_DOWN:
       x+=speed*2/3;
    y+=speed;

    if(ghostMovetime<=0){
      state = GO_LEFT;
      ghostMovetime= GHOST_MOVE;
    }
    
   break;
   
   case GO_LEFT:
       x-=speed*2/3;
    y+=speed;

    if(ghostMovetime<=0){
      state = GO_UP;
      ghostMovetime= GHOST_MOVE;
    }
   break;
    }
  }
  
    void checkCollision(Loser loser) {
if (ghostHurtTime<=0) {
    if (isHit(x, y, w, h, loser.x, loser.y, loser.w, loser.h)) {
      
       loser.hurt();
       sound_ghost.trigger();
      ghostHurtTime=120;
      }     
    }
    
  }

  
}