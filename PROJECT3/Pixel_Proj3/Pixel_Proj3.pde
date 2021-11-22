//GOAL: make an x-ray by replacing the pixels of an image with the pixels of another image
PImage img, imgorig, ximg;

void setup() {
  size(600, 600, P2D);
  
  imgorig = loadImage("horse.png");
  imgorig.loadPixels();
  ximg = loadImage("x-horse.png");
  ximg.loadPixels();
  
  img = imgorig;

}

void draw() {
  
  image(img, 0, 0);
  
 //from this chunk, you can refer to specific coordinates within an image:
 //original image pixels
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      // this translates x and y coordinates into a location in the pixels array
      int loc = x + y * img.width;
      
  // Calculate each pixel's proximity to the mouse
      float maxdist = 50;//dist(0,0,width,height);
      float d = dist(x, y, mouseX, mouseY);     
  //change image pixels based on proximity
    if (d <= maxdist){
      img.pixels[loc] = ximg.pixels[loc];
    } else{
      img.pixels[loc] = imgorig.pixels[loc];
    
  }

 }
  
  img.updatePixels();
 }
}
