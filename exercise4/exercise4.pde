int numBees = 15; //number of bees
Bees[] bees = new Bees[numBees];

void setup() {
  size(800, 600, P2D);
  shapeMode(CENTER);
  
  //spawn bees
   for (int i=0; i<bees.length; i++) {
   bees[i] = new Bees(random(width), random(height));
 }
}

void draw() {
  background(90, 155, 205);
  
 //bezier letter 'B'
  fill(-16777216);
  noStroke();
  bezier(213.58861, 469.97, 324.69968, 468.4685, 443.31836, 282.28232, 213.58861, 309.30933);
  
  fill(-16777216);
  noStroke();
  bezier(213.58861, 346.84686, 320.19522, 312.31232, 450.82626, 148.64865, 215.0901, 160.66066);
  
  fill(-179);
  noStroke();
  bezier(251.12614, 276.2763, 350.22525, 217.71776, 285.66058, 192.19221, 249.62465, 202.70271);
  
  fill(-179);
  noStroke();
  bezier(245.12013, 421.92197, 344.2193, 358.8589, 264.63968, 336.33636, 243.61864, 339.33936);
  
 //the animal 'bees'
    for (int i=0; i<bees.length; i++) {
    bees[i].run();
  }
}
