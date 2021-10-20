class Jerry {
//button's data types
PVector mousePos, buttonPos;

boolean buttonPressed = false; //checks if mouse is on button
boolean isSeen = false; //checks if mouse is hiding
boolean giveFood;

// creature's data types
PVector target, jerryPos;
PImage jerryNow, jerrySleep, jerryRun, jerryFriend, bkgStars, bowl, mouse, mouseH;

int startDead = 0;
int endDead = 3000;

//x coordinate range for hiding spot
int hideX = 100;
int hideX2 = 220; //add width of square
//y coordinate range for hiding spot
int hideY = 500;
int hideY2 = 620; //add height of square

//constructor part
Jerry(){

  jerryPos = new PVector(width/2, height/2); //jerry starts center screen
  
//randomizes button coordinates every time window opens
  buttonPos = new PVector(1100, 100);
  
  bkgStars = loadImage("stars.jpeg");
  bkgStars.resize(width, height);
  
  mouse = loadImage("mouse.png");
  mouse.resize(mouse.width/6, mouse.height/6);
  mouseH = loadImage("mousehurt.png");
  mouseH.resize(mouseH.width/6, mouseH.height/6);
    
  bowl = loadImage("bowl.png");
  bowl.resize(bowl.width/3, bowl.height/3);
  
  jerrySleep = loadImage("jerry_sleep.png");
  jerrySleep.resize(jerrySleep.width/2, jerrySleep.height/2);  
  jerryRun = loadImage("jerry_run.png");
  jerryRun.resize(jerryRun.width/2, jerryRun.height/2);
  jerryFriend = loadImage("jerry_friend.png");
  jerryFriend.resize(jerryFriend.width/2, jerryFriend.height/2);
  
  jerryNow = jerrySleep;
 
}

void drawFood() {
  //draw food
  ellipseMode(CENTER);
  noStroke();
  fill(0, 255, 255);
  ellipse(width/2, height/2, 20, 20);
}

void draw() {
  imageMode(CENTER);//draws all images from the center of screen
  target = new PVector(mouseX, mouseY); //target needs to be defined here for .lerp to work
  
  giveFood = false;
  
  isSeen = ((mouseX < hideX||mouseX > hideX2)||(mouseY < hideY||mouseY > hideY2)); //define boolean "isSeen"
  
  //all button features
  PVector mousePos = new PVector(mouseX, mouseY);
  PVector buttonPos = new PVector(1100, 100);
  buttonPressed = mousePos.dist(buttonPos) < 100; //define boolean "buttonPressed"
    
    //button visuals
    ellipseMode(CENTER);
    fill(0, 255, 255);
    noStroke();
    ellipse(buttonPos.x, buttonPos.y, 100, 100);
    //text stuff
    fill(0);
    textAlign(CENTER);
    textSize(12);
    text("FEED", buttonPos.x, buttonPos.y);
  
//Seen = (jerryPos.dist(target) < 750);
//^^I had to get rid of the "Seen" boolean entirely because there were too many exceptions
// so instead, I just made a bunch of if statements and the delay finally worked!

//CODE FOR WHEN MOUSE IS NOT IN HIDING
 if (isSeen || jerryPos.dist(target) < 100){ 
    
    //WHEN BUTTON IS NOT REACHED
    if (buttonPressed == false){
      jerryNow = jerryRun; //jerry awakens
      target = mousePos;
      jerryPos = jerryPos.lerp(target, 0.04);//jerry attacks you
      
    //CODE FOR WHEN JERRY REACHES YOU
    if (jerryPos.dist(target) < 30){ //if you get too close or if it's been < 3 sec...
      cursor(mouseH); //you're hurt
      startDead = millis();
    }  
     if (millis() > startDead + endDead){ //otherwise, if it's been > 3 seconds
      jerryPos = jerryPos.lerp(target, 0.01);
      cursor(mouse); //you are healed
    }
  }
    
   //JERRY BEHAVIOUR WHEN BUTTON IS PRESSED
   
   //PROBLEM: i want the program to keep this effect even after the mousetton is released
   else if (buttonPressed) { //when mouse is on button...
      giveFood = true;
      if (giveFood){
        drawFood();
      }
      //make jerry chase food instead
      target = new PVector(width/2, height/2);
      jerryPos = jerryPos.lerp(target, 0.02);//jerry goes to food instead of you
   
      
      //AFTER JERRY EATS
      if (jerryPos.dist(target)<5 && buttonPressed){ //when jerry reaches food...
        giveFood = false;
        jerryNow = jerryFriend;//change to friendly jerry
        isSeen = false; //PROGRAM KEEPS IGNORING THIS
      }
    }
 }
 
//CODE FOR WHEN MOUSE IS IN HIDING
  else{ 
     image(bkgStars, width/2, height/2);//changes background to original stars
     jerryNow = jerrySleep; //jerry turns back to normal state
     cursor(mouse);
     jerryPos = jerryPos.lerp(target, 0);//redundant
   }


//misc. drawings
  image(bowl, 600, 500);  
  
//hiding spot visuals
  noFill();
  stroke(255);
  strokeWeight(2);
  rect(100, 500, 120, 120);
  //text stuff
  fill(255);
  textAlign(CENTER);
  textSize(12);
  text("HIDE", 160, 560);
  
  image(jerryNow, jerryPos.x, jerryPos.y); //jerry appears over all other images at "jerryPos" coordinates
}

}
