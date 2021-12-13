//create buttons to play common frequencies in the synthesizer (ex; notes in the C major scale)
//root note frequency chart referenced: https://pages.mtu.edu/~suits/notefreqs.html)

String note;

int numNotes = 8;
NoteButton[] notebutton = new NoteButton[numNotes];
//create an array of c major notes within the 4th octave
  float Cmaj[] = {261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88, 523.25};


class NoteButton{
  PVector Pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  color Colour;
  Boolean pressed = false;
  Boolean clicked = false;
  
  
  NoteButton(int x, int y, int w, int h){
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Colour = color(150);
  }
  
  void update(){ //must be placed in void draw() to work
    if (mousePressed == true && mouseButton == LEFT && pressed == false)
   {
    pressed = true;
    
     //check if pressed within the rectangle:
     if(mouseX >= Pos.x && mouseX <= Pos.x+Width && mouseY >= Pos.y && mouseY <= Pos.y+Height)
     {
       clicked = true;
      } else {
        clicked = false;
        pressed = false;
      }
    }
  
  }
  
  void render(){ //must be placed in void draw() to render button to the screen
    fill(Colour);
    rect(Pos.x,Pos.y, Width, Height);
    
    fill(0);
    textAlign(CENTER, CENTER);
  }
 

//Had to connect each frequency to its corresponding button using a more tedious method, but it still works
  void mousePressed(){
  //** must check if it's within rectangle again, otherwise the click can register anywhere on screen vv
   //Cmaj button
   if (mouseX >= 10 && mouseX <= 40 && mouseY >= 280 && mouseY <= 310){
      wave.setFrequency(Cmaj[0]);//root note
      println("Note freq: " + Cmaj[0]); 
      wave2.setFrequency(Cmaj[0]*1.25);
      wave3.setFrequency(Cmaj[0]*1.5);
      }
   //D minor button  
   if (mouseX >= 45 && mouseX <= 75 && mouseY >= 280 && mouseY <= 310){
        wave.setFrequency(Cmaj[1]);//root note
        println("Note freq: " + Cmaj[1]); 
        wave2.setFrequency(Cmaj[1]*1.2);
        wave3.setFrequency(Cmaj[1]*1.5);
        }
   //E minor button  
   if (mouseX >= 80 && mouseX <= 110 && mouseY >= 280 && mouseY <= 310){
        wave.setFrequency(Cmaj[2]);//root note
        println("Note freq: " + Cmaj[2]); 
        wave2.setFrequency(Cmaj[2]*1.2);
        wave3.setFrequency(Cmaj[2]*1.5);
        }
        
   //Fmaj button  
   if (mouseX >= 115 && mouseX <= 145 && mouseY >= 280 && mouseY <= 310){
        wave.setFrequency(Cmaj[3]);//root note
        println("Note freq: " + Cmaj[3]); 
        wave2.setFrequency(Cmaj[3]*1.25);
        wave3.setFrequency(Cmaj[3]*1.5);
        } 
  //Gmaj button  
   if (mouseX >= 150 && mouseX <= 180 && mouseY >= 280 && mouseY <= 310){
        wave.setFrequency(Cmaj[4]);//root note
        println("Note freq: " + Cmaj[4]); 
        wave2.setFrequency(Cmaj[4]*1.25);
        wave3.setFrequency(Cmaj[4]*1.5);
        }
        
  //A minor button  
   if (mouseX >= 185 && mouseX <= 215 && mouseY >= 280 && mouseY <= 310){
        wave.setFrequency(Cmaj[5]);//root note
        println("Note freq: " + Cmaj[5]); 
        wave2.setFrequency(Cmaj[5]*1.2);
        wave3.setFrequency(Cmaj[5]*1.5);
        }
  //B dim button  
   if (mouseX >= 220 && mouseX <= 250 && mouseY >= 280 && mouseY <= 310){
        wave.setFrequency(Cmaj[6]);//root note
        println("Note freq: " + Cmaj[6]); 
        wave2.setFrequency(Cmaj[6]*1.2);
        wave3.setFrequency(Cmaj[6]*1.40625); //approximate diminished 5th
        }
        
   //C5 maj button  
   if (mouseX >= 255 && mouseX <= 285 && mouseY >= 280 && mouseY <= 310){
        wave.setFrequency(Cmaj[7]);
        println("Note freq: " + Cmaj[7]); 
        wave2.setFrequency(Cmaj[7]*1.25);
        wave3.setFrequency(Cmaj[7]*1.5);
        }
  
}


}
