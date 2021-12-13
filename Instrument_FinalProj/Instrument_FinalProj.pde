//PARTS OF THIS CODE TAKEN DIRECTLY FROM PROCESSING'S MINUM LIBRARY EXAMPLES (specifically "drum kit" and "synthesize sound")
//I used and combined these examples as a base/starting point, and continued to add more features

/*ASSETS USED:
 - Kick, snare, & hat: Processing minum library
 - Kalimba: https://freesound.org/people/dvdfu/sounds/536550/
 - Kirby gif: https://www.google.com/search?q=kirby+dancing+gif&sxsrf=AOaemvJRslgOBetoT2phC2OI9HGOir6Yvw:1639370632423&tbm=isch&source=iu&ictx=1&fir=kKbH3FomBucKuM%252COQfzWcDuhSaOlM%252C_%253BV_CobVZNxDhs6M%252COQfzWcDuhSaOlM%252C_%253B1gCLLEERnPSByM%252COQfzWcDuhSaOlM%252C_%253BTcUebS7SqLPUyM%252CbcKlqjdOWmmkTM%252C_%253BwVFtCFfbOdTDVM%252C0jjPmE1H_WWsgM%252C_%253BI-WaDNKnwEWqCM%252CqGUV2Vb1Hi30ZM%252C_%253BqTKJZxnJnw6nkM%252CQdYBgpgEzzIWYM%252C_%253BBUGeUZOQcU54zM%252Ctd7EIUAu1zPn4M%252C_%253BPfiBuApbadXezM%252CRhF77DEpB48KWM%252C_%253Bcc2GUrBOR8UBFM%252COQfzWcDuhSaOlM%252C_%253BlkcwPlyktgpN1M%252CNQNC87bXgmlCTM%252C_%253BN4Kq-3uBk_d0DM%252COQfzWcDuhSaOlM%252C_%253B8Z5zbckixx-NzM%252CygETqgjIy5kb-M%252C_%253BlKszE_3krQv2VM%252CbUBTVXpDmULcFM%252C_%253BQ4nZ0s9Xy8-fwM%252CwmQKeFQKGRmEDM%252C_&vet=1&usg=AI4_-kQ5pibrzMWWvK8Bk0H655w38NHq3w&sa=X&ved=2ahUKEwiDjM3B-9_0AhXzkokEHdzKBCoQ9QF6BAgDEAE#imgrc=kKbH3FomBucKuM
 - Kirby "poyo!": https://www.youtube.com/watch?v=ObHK_K853k4
*/

import processing.opengl.*;

import ddf.minim.*;
import ddf.minim.ugens.*;


Minim minim;
AudioOutput out;

AudioPlayer poyo;

//Drum kit stuff
Sampler kick;
Sampler snare;
Sampler hat;
Sampler kalimba;

import gifAnimation.*;
Gif kirby;

int bpm = 91;
int beat; // which beat we're on

int slideY = 180; //volume slider

class Tick implements Instrument{
  
  void noteOn( float dur ){
    if ( hatRow[beat] ) hat.trigger();
    if ( snrRow[beat] ) snare.trigger();
    if ( kikRow[beat] ) kick.trigger();
    if ( kalRow[beat] ) kalimba.trigger();
  }
  
  void noteOff(){
    // next beat
    beat = (beat+1)%16;
    // set the new tempo
    out.setTempo( bpm );
    // play this again right now, with a sixteenth note duration
    out.playNote( 0, 0.25f, this );
  }
}

//Synth sound stuff
Oscil wave, wave2, wave3;
String type; //type of sine wave


void setup(){
  
  size(1000, 550, P3D);
  minim = new Minim(this);
  out   = minim.getLineOut();
  
  kirby = new Gif(this, "kirbvibes.gif");
  kirby.loop();
  kirby.play();
  
  poyo = minim.loadFile("poyo.mp3");
  

//FROM DRUM KIT EXAMPLE ------------------------------------------------
  
  // load all of our samples, using 4 voices for each.
  // this will help ensure we have enough voices to handle even
  // very fast tempos.
  kick  = new Sampler( "BD.wav", 4, minim );
  snare = new Sampler( "SD.wav", 4, minim );
  hat   = new Sampler( "CHH.wav", 4, minim );
  kalimba = new Sampler( "kalimba(c4).wav", 4, minim);
  
  // patch samplers to the output
  kick.patch( out );
  snare.patch( out );
  hat.patch( out );
  kalimba.patch( out );
 
  //initialize drum buttons
  for (int i = 0; i < 16; i++){    
    dbuttons.add( new DrumRect(20+i*24, 50, hatRow, i ) );
    dbuttons.add( new DrumRect(20+i*24, 100, snrRow, i ) );
    dbuttons.add( new DrumRect(20+i*24, 150, kikRow, i ) );
    dbuttons.add( new DrumRect(20+i*24, 200, kalRow, i ) );
  }
  
  beat = 0;
  
  // start the sequencer
  out.setTempo( bpm );
  out.playNote( 0, 0.25f, new Tick() );
 
  
//FROM SYNTHESIZE SOUND EXAMPLE -------------------------------------

  // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  //note A
  wave = new Oscil( 440, 0.2f, Waves.TRIANGLE);
  // patch the Oscil to the output
  wave.patch( out );

//modified parts
  //note C
  wave2 = new Oscil(554.37, 0.2f, Waves.TRIANGLE);
  wave2.patch( out );
  
  //note E
  wave3 = new Oscil(659.25, 0.2f, Waves.TRIANGLE);
  wave3.patch( out );
  
  
for (int i=0; i<notebutton.length; i++){
  notebutton[i] = new NoteButton(10+i*35, 280, 30, 30);
}
  
}


void draw(){
  
  background(0);
  fill(255);

  fill(0);
  rect(0, 310, width, height);//synth area
  fill(150);
  
  rect(490, 50, 20, 240);//volume slider
  fill(0,255,255);
  rect(490, slideY, 20, 10);
  
  image(kirby, 900, 210, 80, 80);

//UI descriptions
  fill(255);
  
  textAlign(CENTER);
  text("Volume", width/2, 30);
  
  textAlign(RIGHT);
  text("Drag to transpose chord.", 990, 330);
  text("Select wave options using keys 1, 2, 3, 4, or 5.", 990, 345);
  text("Click to poyo!", 980, 210);
  
  textAlign(CORNER);
  text("Drum kit", 20, 30);
  text("Chord Presets (C major)", 10, 275);

//FROM DRUM KIT EXAMPLE ------------------------------------------------
  for(int i = 0; i < dbuttons.size(); ++i)
  {
    dbuttons.get(i).draw();
  }
  
  stroke(110);
  if ( beat % 4 == 0 )
  {
    fill(80, 0, 60);
  }
  else
  {
    fill(0, 200, 200);
  }
    
  // beat marker    
  rect(20+beat*24, 35, 14, 9);

 
//FROM SYNTHESIZE SOUND EXAMPLE -------------------------------------

  stroke(0,255,0);
  strokeWeight(1);
  
  // draw the waveform of the output
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    line( i, 380  - out.left.get(i)*50,  i+1, 380  - out.left.get(i+1)*50 );
    line( i, 480 - out.right.get(i)*50, i+1, 480 - out.right.get(i+1)*50 );
  }
  
  stroke(255);


//draw note button
for (int i=0; i<notebutton.length; i++){
  notebutton[i].update();
  notebutton[i].render();
}
}


void mousePressed(){
//FROM DRUM KIT EXAMPLE ------------------------------------------------  
  for(int i = 0; i < dbuttons.size(); ++i)
  {
    dbuttons.get(i).mousePressed();
  }
 
  for(int i=0; i < notebutton.length; ++i)
  notebutton[i].mousePressed(); //call notebutton's mousePressed() function in other tab


  //kirby sound button
  if (mousePressed && mouseX>=910 && mouseX<=970 && mouseY>=220 && mouseY<=280){
    poyo.play();    
    if (poyo.position() == poyo.length()){ //must rewind file before it can be played again
      poyo.rewind();
      poyo.play();
    }
   } 
}

void mouseDragged(){
//FROM SYNTHESIZE SOUND EXAMPLE -------------------------------------  

  PVector mousePos = new PVector(mouseX, mouseY);
  if (mousePos.y >= 310){ //can only affect the sine wave when within this y-range
  
 //the range of possible mouseX values corresponds to numbers between 110 and 880: 
  float freq = map( mouseX, 0, width, 40, 880 );
  wave.setFrequency( freq ); //control the frequency (pitch)
  println("Note freq: " + freq); 

//added more waves to create simple chord
  wave2.setFrequency(freq*1.25); //multiply the root note by 5/4 to get an ~approximate~ major 3rd
  
  wave3.setFrequency(freq*1.5); //multiply the root note by 3/2 to get an ~approximate~ major 5th
  }
  
  if (mousePos.x>=490 && mousePos.x<=510 && mousePos.y>=50 && mousePos.y<=290){
    //the range of possible mouseY values corresponds to numbers between 0 and 1:
    float synthY = constrain(mouseY, 50, 290);
    float amp = map(synthY, 50, 290, .5, 0 ); 
    wave.setAmplitude(amp); //control the amplitude (volume)  
    wave2.setAmplitude(amp);
    wave3.setAmplitude(amp);
 
    slideY = constrain(mouseY, 50, 280); 

 
  }

}

void keyPressed(){ 
  
  switch( key )
  {
    case '1': 
      wave.setWaveform( Waves.SINE );
      wave2.setWaveform( Waves.SINE );
      wave3.setWaveform( Waves.SINE );
      type = "Sine";
      break;
     
    case '2':
      wave.setWaveform( Waves.TRIANGLE );
      wave2.setWaveform( Waves.TRIANGLE );
      wave3.setWaveform( Waves.TRIANGLE );
      type = "Triangle";
      break;
     
    case '3':
      wave.setWaveform( Waves.SAW );
      wave2.setWaveform( Waves.SAW );
      wave3.setWaveform( Waves.SAW );
      type = "Sawtooth";
      break;
    
    case '4':
      wave.setWaveform( Waves.SQUARE );
      wave2.setWaveform( Waves.SQUARE );
      wave3.setWaveform( Waves.SQUARE );
      type = "Square";
      break;
      
    case '5':
      wave.setWaveform( Waves.QUARTERPULSE );
      wave2.setWaveform( Waves.QUARTERPULSE );
      wave3.setWaveform( Waves.QUARTERPULSE );
      type = "Quarterpulse";
      break;
     
    default: break; 
  }
  
  println("Wave type: " + type);  
}
