/*
to display buttons on any screen
 */
//  size= 800  600

class Button {
  int rectX;
  int rectY;
  int rectW = 100;
  int rectH = 45;
  color rectColor, rectHighlight;
  String label;

  Button(int rectX, int rectY, String label) {
    this.rectX = rectX;
    this.rectY = rectY;
    this.label = label;
    rectColor = color(200, 0, 0);
    rectHighlight = color(255, 0, 0);
  }
  void display() {
    if (rectOver()) {
      fill(rectHighlight);
    } else {
      fill(rectColor);
    }
    stroke(255);
    text(label, rectX, rectY);
    rect(rectX, rectY, rectW, rectH);
   // mousePressed();
    //pressed();
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
      //println("pressed");
      return true;
    }else { return false;}
  }
}

