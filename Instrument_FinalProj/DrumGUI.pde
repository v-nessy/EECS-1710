//declare drum buttons
boolean[] hatRow = new boolean[16];
boolean[] snrRow = new boolean[16];
boolean[] kikRow = new boolean[16];

ArrayList<DrumRect> dbuttons = new ArrayList<DrumRect>();


// simple class for drawing the gui
class DrumRect {
  int x, y, w, h;
  boolean[] steps;
  int stepId;
  
  public DrumRect(int _x, int _y, boolean[] _steps, int _id){
    x = _x;
    y = _y;
    w = 14;
    h = 30;
    steps = _steps;
    stepId = _id;
  }
  

  
  public void draw(){
    
    if ( steps[stepId] )
    {
      fill(0,255,255);
    }
    else
    {
      fill(80,0,60);
    }
    
    rect(x,y,w,h);
  }
  
  public void mousePressed(){
    
    if ( mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h )
    {
      steps[stepId] = !steps[stepId];
    }
  }
}
