//MAKE A MINUTE-GLASS
int energy = 400;//sand starts at height of rectangle
float batterylife = 60000; //60 seconds (in milliseconds)
int s;
int lastSecond;
boolean start = true;

//initial colours
int redv = 0;
int bluev = 0;
int greenv = 255;

void setup(){
  size(800, 600, P2D); 
}

//PROBLEM: PROGRAM IGNORES THIS FUNCTION
void update(){
 if(start){ 
  s = second();//start counting seconds since application started
  //PROBLEM: the "second()" function is always fixed to whatever the current second is on the computer's clock,
  //it doesn't actually start counting from when the program is opened

 if (s != lastSecond){//whenever a second has passed
    energy -= 5; //is supposed to change height of sand every second
    lastSecond = s;//always set the new second to lastSecond
    energy = constrain(energy, 0, 400);
    }
  } 
}

void draw(){
  
  background(0);
  
//battery juice
  noStroke();
  fill(redv, greenv, bluev);
  rect(180, 200, energy, 200);
  
  if (energy <= 30){
  redv = 255;
  bluev = 0;
  greenv = 0;
}

if (energy == 0){
  text("!! BATTERY IS DEAD !!", 310, height-100);
}
  
 //battery appearance
  noFill();
  stroke(255);
  strokeWeight(2);
  rect(180, 200, 400, 200);
  fill(255);
  rect(587, 250, 25, 90);
  
 
 
update();
  
text("battery life:", 350, 50);

println(s + " " + energy);


}
