class Parallax {

PImage sky, town, street;
int skyX = 0, skyX2 = 1440; //1440 is the entire width of the backgrounds
int townX = 0, townX2 = 1440;
int streetX = 0, streetX2 = 1440;
  
 Parallax() {
  noSmooth();
  
  sky = loadImage("sky.png");
  sky.resize(sky.width, sky.height);
  town = loadImage("buildings.png");
  town.resize(town.width, town.height);
  street = loadImage("street.png");
  street.resize(1443, street.height);
  //^ had to resize a bit to cover up the image break
  ((PGraphicsOpenGL)g).textureSampling(3); // disables smoothing
  }


  void draw() {
    image(sky, skyX, 0); image(sky, skyX2, 0);
    image(town, townX, 0); image(town, townX2, 0);
    image(street, streetX, 0); image(street, streetX2, 0);
    
    skyX --; skyX2--;
    townX-=2; townX2-=2;
    streetX-=3; streetX2-=3;
  
    //MAKES BACKGROUND ASSETS REPEAT
    if (skyX <-1440){
      skyX = 1440;}
    if (skyX2 <-1440){
      skyX2 = 1440;
    }
    
    if (townX <-1440){
      townX = 1440;}
    if (townX2 <-1440){
      townX2 = 1440;
    }
    
    if (streetX <-1440){
      streetX = 1440;}
    if (streetX2 <-1440){
      streetX2 = 1440;
    }
  
  }

}

//CODE REFERENCED: https://www.youtube.com/watch?v=eQzHHa1-I_A
