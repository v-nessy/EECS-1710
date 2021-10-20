//OBJECTIVE: create a creature that terrorizes you 
//...but stops if you hide in a blind spot, or give it enough food 
//when you give him enough food, you can befriend him & he wont eat you

Jerry jerry; //calls class "Jerry," names it "jerry" so it is ready to be referenced

void setup() { 
  size(1200, 700, P2D);
  
  jerry = new Jerry();
}

void draw() {
  background(0);
  jerry.draw(); //displays the jerry class
  
  textAlign(CORNER);
  textSize(18);
  fill(255);
  text("uh oh! looks like jerry ran out of food.", 50, 50); 
  
  
}
/*CITATIONS
general coding:
https://processing.org/reference/
https://github.com/eecs17xx/eecs1710-2021f

photos:
star background: https://media.istockphoto.com/vectors/pixel-art-star-sky-at-night-vector-id1208374725?k=6&m=1208374725&s=612x612&w=0&h=qBbL9vXxURqdzkCz6iT2mQwQfCJ57JSQHnpWFGf612Y=

*/
