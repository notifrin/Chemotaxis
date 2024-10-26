
ball bunch[] = new ball[100];
Fire firey = new Fire(250,250,50);
boolean light;


void setup(){
size(750,750);
background(98, 150, 224);
for(int x = 0; x < bunch.length; x++)
  bunch[x] = new ball((int)(Math.random()*750),(int)(Math.random()*750), (int)(Math.random()*255));
}


void draw(){
  background(0,0,0);
  for (int x = 0; x < bunch.length; x++){
     
    bunch[x].show();
    bunch[x].walk();
    bunch[x].infection();
   //loop to loop object functions
  }
  
  firey.show();
  firey.move();
  firey.fire();
}

class ball{
int myX, myY, mySize, myColor;
ball(int x, int y, int z){
  myX = x;
  myY = y;
 
  mySize = 20;
}
 void show(){
   //wings
   fill(150,125,150);
   ellipse(myX + 25, myY - 15, mySize - 50, mySize - 40);
  //body of fly
   fill(128,128,128);
   rect(myX, myY - 5, mySize + 25, mySize - 10);
 //head
   fill(128,128,128);
  ellipse(myX, myY, mySize, mySize);


 }
  void walk(){
    if(mouseX > myX)
      myX += (int)(Math.random()*12-5);
    if(mouseX < myX)
      myX -= (int)(Math.random()*12-5);
   
      
    if(mouseY > myY)
      myY += (int)(Math.random()*12-5);
    if(mouseY < myY)
      myY -= (int)(Math.random()*12-5);
 
    
    
    //balls/bacterium will move towards the mouse (only for x axis)
    
    if(myX > 750)
    myX = 0;
    if(myX < 0)
    myX = 750;
    if(myY > 750)
    myY = 0;
    if(myY < 0)
    myY = 750;
    //makes sure that the balls stay on the sscreen and doesn't move into the empty space forever
  }
     void infection(){
         if (dist(mouseX,mouseY,myX,myY)<100){
      light = true;}
       else{
       light = false;}
     }
    //  If the bacter is close enough to the mouse, the green cell turns black
      
  
//make sure to include an extra parameter to the constructor, which stores the color variable
}

class Fire{
  int myX,myY,mySize,myColor;
  
 
  Fire(int x, int y, int z){
    myX = x;
    myY = y;
    mySize = z;
    myColor = color(20,255,30);
  }
  
  void show(){
       fill(54, 34, 34);
   rect(myX, myY, mySize - 40, mySize + 30);
    fill(myColor);
   ellipse(myX, myY, mySize, mySize+50);
       fill(myColor);
   ellipse(myX, myY, mySize+50, mySize);
       fill(myColor);
   ellipse(myX, myY, mySize - 50, mySize);
       fill(myColor);
   ellipse(myX, myY, mySize, mySize-50);
   
  }
  
  void move(){
   myX = mouseX;
   myY = mouseY;

  }
  void fire(){
    if (light == true)
    myColor = 0;
    else
    myColor = color(138, 60, 15);
  }
}
