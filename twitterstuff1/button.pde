/*
to display buttons on any screen
 */
//  size= 800  600

class Button {
  int rectX;
  int rectY;
  int rectW;
  int rectH;
  color rectColour;
  color rectHighlight;
  color textColour;
  color textHighlight;
  String label;
  int textSize;

  Button(int rectX, int rectY, int rectW, int rectH, String label) {
    this.rectX = rectX- (rectW/2);
    this.rectY = rectY - (rectH/2);
    this.rectW = rectW;
    this.rectH = rectH;
    this.label = label;
    rectColour = color(255, 255, 255);
    rectHighlight = color(196, 196, 196);
    textColour = color(0, 0, 0);
    textHighlight = color(255, 255, 255);
    if(label.length() > 10){textSize = 11;}else{
    textSize = 16;
    }
  }
  void display() {
    stroke(255);
    textSize(textSize);
    textAlign(CENTER,CENTER);
    if (rectOver()) {
      fill(rectHighlight);
      rect(rectX, rectY, rectW, rectH);
      //ellipse(rectX, rectY, rectH, rectH);
      fill(textHighlight);
      text(label, rectX, rectY,rectW,rectH);
      //text(str, x1, y1, x2, y2)
    } else {
      fill(rectColour);
      rect(rectX, rectY, rectW, rectH);
      fill(textColour);
      text(label, rectX, rectY,rectW,rectH);
    }
  }
  private boolean rectOver() {
    if (mouseX >= rectX && mouseX <= rectX+rectW &&
      mouseY >=  rectY && mouseY <=  rectY+rectH) {
      return true;
    } else {
      return false;
    }
  }


  
  public boolean pressed() {
    if (mousePressed && rectOver()) {
      return true;
    }else { return false;}
  }
}

