class Bees{

PVector beePos, target, mousePos; 
int triggerDist = 300;
boolean isClose;
  
Bees(float x, float y){
//^note: these floats in the constructor will be defined in the main tab
  beePos = new PVector (x, y);
}

void update(){
  mousePos = new PVector(mouseX, mouseY);
  isClose = beePos.dist(mousePos) < triggerDist;
  target = mousePos;
  
  if(isClose) {
    beePos = beePos.lerp(target, 0.01);
  } else if (!isClose){
    //they go to a random place if left alone
    target = new PVector(random(width), random(height));
    beePos = beePos.lerp(target, 0.02);
  }
  
  //makes them jitter
  beePos.x = beePos.x + random(-3,3);
  beePos.y = beePos.y + random(-3,3);
  
}

  void draw(){
    //body
    fill(240, 240, 0);
    stroke(0);
    strokeWeight(1);
    ellipse(beePos.x, beePos.y, 18, 18);
    //wings
    fill(255);
    stroke(255);
    ellipse(beePos.x - 12, beePos.y-5, 8, 6);
    ellipse(beePos.x + 12, beePos.y-5, 8, 6);
    //eyes
    fill(0);
    noStroke();
    ellipse(beePos.x - 5, beePos.y, 3, 3);
    ellipse(beePos.x + 5, beePos.y, 3, 3);
  }
  
  void run(){
    update();
    draw();
  }
  
}
