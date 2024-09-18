
class RedBallon{
  public float x,y;
  boolean normalBalloon=true;
  RedBallon(float x,float y){
    this.x=x;
    this.y=y;
  }
  void display(){
    if(normalBalloon){
      image(redBallon,x,y,50,60);
      y--;
      if(y<=40)
        y=height;
    }
    else{
      image(redBallon2,x,y,50,60);
      y++;
    }
     
  } 
   

};
