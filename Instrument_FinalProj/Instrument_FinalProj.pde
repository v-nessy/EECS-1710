//PARTS OF THIS CODE TAKEN DIRECTLY FROM PROCESSING'S MINUM LIBRARY EXAMPLES (specifically "drum kit" and "synthesize sound")
//I used and combined these examples as a base/starting point, and went from there by adding more features
import processing.opengl.*;

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

//Drum kit stuff
Sampler kick;
Sampler snare;
Sampler hat;

int bpm = 120;
int beat; // which beat we're on

class Tick implements Instrument{
  
  void noteOn( float dur ){
    if ( hatRow[beat] ) hat.trigger();
    if ( snrRow[beat] ) snare.trigger();
    if ( kikRow[beat] ) kick.trigger();
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
  

//FROM DRUM KIT EXAMPLE ------------------------------------------------
  
  // load all of our samples, using 4 voices for each.
  // this will help ensure we have enough voices to handle even
  // very fast tempos.
  kick  = new Sampler( "BD.wav", 4, minim );
  snare = new Sampler( "SD.wav", 4, minim );
  hat   = new Sampler( "CHH.wav", 4, minim );
  
  // patch samplers to the output
  kick.patch( out );
  snare.patch( out );
  hat.patch( out );
 
  //initialize drum buttons
  for (int i = 0; i < 16; i++){    
    dbuttons.add( new DrumRect(10+i*24, 50, hatRow, i ) );
    dbuttons.add( new DrumRect(10+i*24, 100, snrRow, i ) );
    dbuttons.add( new DrumRect(10+i*24, 150, kikRow, i ) );
  }
  
  beat = 0;
  
  // start the sequencer
  out.setTempo( bpm );
  out.playNote( 0, 0.25f, new Tick() );
 
  
//FROM SYNTHESIZE SOUND EXAMPLE -------------------------------------

  // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  //note A
  wave = new Oscil( 440, 0.3f, Waves.SINE);
  // patch the Oscil to the output
  wave.patch( out );

//modified parts
  //note C
  wave2 = new Oscil(554.37, 0.3f, Waves.SINE);
  wave2.patch( out );
  
  //note E
  wave3 = new Oscil(659.25, 0.3f, Waves.SINE);
  wave3.patch( out );
}

void draw(){
  
  background(0);
  fill(255);

  fill(0);
  rect(0, 310, width, height);
  
  fill(255);
  text("Drag to transpose chord & adjust volume.", 10, 330);
  text("Select wave options using keys 1, 2, 3, 4, or 5", 10, 345);

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
  rect(10+beat*24, 35, 14, 9);

 
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
  
}


void mousePressed(){
//FROM DRUM KIT EXAMPLE ------------------------------------------------  
  for(int i = 0; i < dbuttons.size(); ++i)
  {
    dbuttons.get(i).mousePressed();
  }


}

void mouseDragged(){
//FROM SYNTHESIZE SOUND EXAMPLE -------------------------------------  

  PVector mousePos = new PVector(mouseX, mouseY);
  if (mousePos.y >= 310){ //can only affect the sine wave when within this y-range

  //the range of possible mouseY values corresponds to numbers between 0 and 1:
  float synthY = constrain(mouseY, 300, 550);
  float amp = map(synthY, 300, 550, .4, 0 ); 
  wave.setAmplitude( amp ); //control the amplitude (volume)  

  
 //the range of possible mouseX values corresponds to numbers between 110 and 880: 
  float freq = map( mouseX, 0, width, 40, 880 );
  wave.setFrequency( freq ); //control the frequency (pitch)
  println("Note freq: " + freq); 

//added more waves to create simple chord
  wave2.setAmplitude(amp);
  wave2.setFrequency(freq*1.25); //multiply the root note by 5/4 to get an ~approximate~ major 3rd
  
  wave3.setAmplitude(amp);
  wave3.setFrequency(freq*1.5); //multiply the root note by 3/2 to get an ~approximate~ major 5th
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
