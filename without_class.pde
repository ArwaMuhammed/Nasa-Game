PImage archer,arrow,redBallon,yellowBallon,redBallon2,yellowBallon2,backGround,start,win,over;
int numOfBalloons=0,x,y;
boolean startFlag=false,levelFlag=false,flag=false;
ArrayList<Arrow> arrows = new ArrayList<Arrow>();
ArrayList<RedBallon> redBallons = new ArrayList<RedBallon>();
ArrayList<RedBallon> redBallons1 = new ArrayList<RedBallon>();
ArrayList<YellowBallon> yellowBallons = new ArrayList<YellowBallon>();
Bow bow=new Bow();

void setup() {
  size(1000,707);
  //All images
  archer = loadImage("Bow_and_Arrow.png"); 
  arrow = loadImage("Arrow.png"); 
  yellowBallon=loadImage("yellow balloon.png");
  redBallon=loadImage("red balloon (2).png");
  redBallon2=loadImage("ballon_red2.png");
  yellowBallon2 =loadImage("yellow_ballon2.png");
  backGround=loadImage("bg.jpeg");
  start=loadImage("StartGame.png");
  win=loadImage("Win.png");
  over=loadImage("GameOver.png");
  
  for(int i=0;i<15;i++){
   redBallons1.add(new RedBallon((width-15*50)+i*50,height)); 
   if(i%5==0)
   yellowBallons.add(new YellowBallon((width-15*50)+i*50,random(100,height)));
   else
   redBallons.add(new RedBallon((width-15*50)+i*50,random(100,height)));
}}

void draw() {
  background(backGround); 
  noStroke();
  //starting the game
  if(!startFlag){
    image(start,200,150,600,250);
    textAlign(CENTER);
    fill(140,37,157);
    textSize(40);
    text("click ENTER",width/2, height/2 +60);
    counter=0;
  }
  //displaying objects
  if(startFlag){
  //display bow  
  bow.display();
  //display arrows
  for (Arrow arr : arrows) 
    arr.display(); 
  }
 
  //level 1 
  if(startFlag) {
   flag=false;
  //display balloons  
  for (RedBallon arr : redBallons1)
   arr.display(); 
   
  //collision with balloons 
  for (Arrow arr1 : arrows) 
     for (int i=0;i<redBallons1.size();i++){
        if(arr1.x+100>redBallons1.get(i).x&&arr1.x+100<=redBallons1.get(i).x+50&&
        arr1.y+10>redBallons1.get(i).y&&arr1.y+10<=redBallons1.get(i).y+40 &&redBallons1.get(i).normalBalloon){
          numOfBalloons++;
          redBallons1.get(i).normalBalloon= false;
        }   
     }
  }
  
  //end of level 1
  x=0;
  for (RedBallon arr : redBallons1)
    if(arr.y>height)
      x++;
   //go to LV2 after all ballons down
   if(x==15 && !levelFlag && counter!=20 && !flag){
    textAlign(CENTER);
    fill(0,150,0);
    textSize(60);
    text("UP TO LEVEL 2\nclick space to start the level",width/2, height/2); 
   }
  //level 2      
  if(levelFlag)
  {
    flag=false;
  //display balloons   
  for (RedBallon arr : redBallons) 
   arr.display();
  for (YellowBallon arr : yellowBallons)
   arr.display();
   
   //collision with balloons 
   for (Arrow arr1 : arrows) 
     for (int i=0;i<redBallons.size();i++){
        if(arr1.x+100>redBallons.get(i).x&&arr1.x+100<=redBallons.get(i).x+50&&
        arr1.y+10>redBallons.get(i).y&&arr1.y+10<=redBallons.get(i).y+40 &&redBallons.get(i).normalBalloon){
          numOfBalloons++;
          redBallons.get(i).normalBalloon= false;
        }    
     }
   for (Arrow arr1 : arrows) 
     for (int i=0;i<yellowBallons.size();i++){
        if(arr1.x+100>yellowBallons.get(i).x&&arr1.x+100<=yellowBallons.get(i).x+50&&
        arr1.y+10>yellowBallons.get(i).y&&arr1.y+10<=yellowBallons.get(i).y+40 &&yellowBallons.get(i).normalBalloon){
          numOfBalloons++;
          yellowBallons.get(i).normalBalloon= false;
  }
}
  }
  
  //display score && arrows
  fill(255);  
  rect(0,0,width,100);
  fill(49, 232 ,215);
  textAlign(LEFT);
  textSize(40);
  int s=(20-counter+1)*numOfBalloons;
  if(s<0)
  s=0;
  text("score:"+s,20,50);
  text("used arrows:"+counter,725,50);
  
  //game over
  int y=0;
  for (Arrow arr : arrows)
    if(arr.x>width)
      y++;
      
  if(counter==20 && numOfBalloons<30 && y==20){
    image(over,300,150,400,170);
    levelFlag=false;
    flag=true;
    fill(206,83,83);
    text("DO you want to RESET?\nPress 'C' to Restart \nPress 'E' to exit",350,400);
  }
  //winning
   if(counter<=20 && numOfBalloons==30)
 {
   levelFlag=false;
   flag=true;
   image(win,230,150,500,200);
   fill(206,83,83);
   text("DO you want to RESET?\nPress 'C' to Restart \nPress 'E' to exit",350,400);
 }
}
void keyPressed(){
  if(key==ENTER)
    startFlag=true;
  if(key==' ' && x==15 )
    levelFlag=true;
  if((key=='C' || key=='c') && (flag))
{
   redBallons.clear();
   yellowBallons.clear();
   redBallons1.clear();
   arrows.clear();
   for(int i=0;i<15;i++){
     redBallons1.add(new RedBallon((width-15*50)+i*50,height)); 
     if(i%5==0)
      yellowBallons.add(new YellowBallon((width-15*50)+i*50,random(100,height)));
     else
      redBallons.add(new RedBallon((width-15*50)+i*50,random(100,height)));
  
}
  startFlag=false;
  counter=0; numOfBalloons=0; y=0;
}  
//CLOSE PROGRAM
 if(key=='E' || key=='e')
 exit();
}
