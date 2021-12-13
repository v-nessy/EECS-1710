//create buttons to play common frequencies in the synthesizer (ex; notes in the C major scale)
//root note frequency chart referenced: https://pages.mtu.edu/~suits/notefreqs.html)

int numNotes = 8;
NoteButton[] noterow = new NoteButton[numNotes];
NoteButton[] noterow2 = new NoteButton[numNotes];
//create an array of c major notes within the 4th octave
  float keyC[] = {261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88, 523.25};


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
   
   //C major chords (1st row) - - - - - - - -
     //keyC button
     if (mouseX >= 30 && mouseX <= 60 && mouseY >= 290 && mouseY <= 320){
        wave.setFrequency(keyC[0]);//root note
        println("Note freq: " + keyC[0]); 
        wave2.setFrequency(keyC[0]*1.25);
        wave3.setFrequency(keyC[0]*1.5);
        }
     //D minor button  
     if (mouseX >= 75 && mouseX <= 105 && mouseY >= 290 && mouseY <= 320){
          wave.setFrequency(keyC[1]);//root note
          println("Note freq: " + keyC[1]); 
          wave2.setFrequency(keyC[1]*1.2);
          wave3.setFrequency(keyC[1]*1.5);
          }
     //E minor button  
     if (mouseX >= 120 && mouseX <= 150 && mouseY >= 290 && mouseY <= 320){
          wave.setFrequency(keyC[2]);//root note
          println("Note freq: " + keyC[2]); 
          wave2.setFrequency(keyC[2]*1.2);
          wave3.setFrequency(keyC[2]*1.5);
          }    
     //Fmaj button  
     if (mouseX >= 165 && mouseX <= 195 && mouseY >= 290 && mouseY <= 320){
          wave.setFrequency(keyC[3]);//root note
          println("Note freq: " + keyC[3]); 
          wave2.setFrequency(keyC[3]*1.25);
          wave3.setFrequency(keyC[3]*1.5);
          } 
    //Gmaj button  
     if (mouseX >= 210 && mouseX <= 240 && mouseY >= 290 && mouseY <= 320){
          wave.setFrequency(keyC[4]);//root note
          println("Note freq: " + keyC[4]); 
          wave2.setFrequency(keyC[4]*1.25);
          wave3.setFrequency(keyC[4]*1.5);
          }          
    //A minor button  
     if (mouseX >= 255 && mouseX <= 285 && mouseY >= 290 && mouseY <= 320){
          wave.setFrequency(keyC[5]);//root note
          println("Note freq: " + keyC[5]); 
          wave2.setFrequency(keyC[5]*1.2);
          wave3.setFrequency(keyC[5]*1.5);
          }
    //B dim button  
     if (mouseX >= 300 && mouseX <= 330 && mouseY >= 290 && mouseY <= 320){
          wave.setFrequency(keyC[6]);//root note
          println("Note freq: " + keyC[6]); 
          wave2.setFrequency(keyC[6]*1.2);
          wave3.setFrequency(keyC[6]*1.40625); //approximate diminished 5th
          }          
     //C5 maj button  
     if (mouseX >= 345 && mouseX <= 375 && mouseY >= 290 && mouseY <= 320){
          wave.setFrequency(keyC[7]);
          println("Note freq: " + keyC[7]); 
          wave2.setFrequency(keyC[7]*1.25);
          wave3.setFrequency(keyC[7]*1.5);
          }
          
          
          
   //C major chords (spicy row) - - - - - - - -
   //CM7
   if (mouseX >= 30 && mouseX <= 60 && mouseY >= 360 && mouseY <= 390){
        wave.setFrequency(keyC[0]);//root note
        println("Note freq: " + keyC[0]); 
        wave2.setFrequency(keyC[0]*1.25);
        wave3.setFrequency(keyC[0]*1.875);
        }
   //Dm7
   if (mouseX >= 75 && mouseX <= 105 && mouseY >= 360 && mouseY <= 390){
          wave.setFrequency(keyC[1]);//root note
          println("Note freq: " + keyC[1]); 
          wave2.setFrequency(keyC[1]*1.2);
          wave3.setFrequency(keyC[1]*1.8);
          }
    //Em7 
     if (mouseX >= 120 && mouseX <= 150 && mouseY >= 360 && mouseY <= 390){
          wave.setFrequency(keyC[2]);//root note
          println("Note freq: " + keyC[2]); 
          wave2.setFrequency(keyC[2]*1.2);
          wave3.setFrequency(keyC[2]*1.8);
          }  
     //FM7
     if (mouseX >= 165 && mouseX <= 195 && mouseY >= 360 && mouseY <= 390){
          wave.setFrequency(keyC[3]);//root note
          println("Note freq: " + keyC[3]); 
          wave2.setFrequency(keyC[3]*1.25);
          wave3.setFrequency(keyC[3]*1.875);
          }          
     //GM7 
     if (mouseX >= 210 && mouseX <= 240 && mouseY >= 360 && mouseY <= 390){
          wave.setFrequency(keyC[4]);//root note
          println("Note freq: " + keyC[4]); 
          wave2.setFrequency(keyC[4]*1.25);
          wave3.setFrequency(keyC[4]*1.75);
          }
     //Am7
     if (mouseX >= 255 && mouseX <= 285 && mouseY >= 360 && mouseY <= 390){
          wave.setFrequency(keyC[5]);//root note
          println("Note freq: " + keyC[5]); 
          wave2.setFrequency(keyC[5]*1.2);
          wave3.setFrequency(keyC[5]*1.8);
          }
     //Bm7b5 
     if (mouseX >= 300 && mouseX <= 330 && mouseY >= 360 && mouseY <= 390){
          wave.setFrequency(keyC[6]);//root note
          println("Note freq: " + keyC[6]); 
          wave2.setFrequency(keyC[6]*1.2);
          wave3.setFrequency(keyC[6]*1.8); //approximate diminished 5th
          }
     //CM7
     if (mouseX >= 345 && mouseX <= 375 && mouseY >= 360 && mouseY <= 390){
          wave.setFrequency(keyC[7]);
          println("Note freq: " + keyC[7]); 
          wave2.setFrequency(keyC[7]*1.25);
          wave3.setFrequency(keyC[7]*1.875);
          }
   }


}
