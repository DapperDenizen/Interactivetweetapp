public class HoverInfo {
  TweetCircle twtCrcl;
   //temp variables
    float tempX;
    float tempY;                                                             
    float orientationIndent = 0;
    float borderWidth = 3;
    float tempIconX;
    float tempGenericY = borderWidth;
    float tempOutOfFrameY = 0;
    float tempTextX;
    PImage displayIcon;
    String circleText;
  
HoverInfo(float tempX, float tempY, String circleText ,PImage displayIcon){
this.tempX = tempX;
this.tempY = tempY;
this.displayIcon = displayIcon;
this.circleText = circleText;
}
void display(){
if (tempX > width/2) {
      //right side of screen
      orientationIndent = -rectWidth;
      tempIconX =  orientationIndent + borderWidth;
      tempTextX =  orientationIndent + borderWidth*2 + displayIconSize;
    } else {
      //left side of screen
      orientationIndent = 0;
      tempIconX =   borderWidth;
      tempTextX =  borderWidth*2 + displayIconSize;
    }
    //checks if the box is out of stage
    if (tempY + rectHeight+tempGenericY >= height) {
      //moves the box up so that it sits neatly above the stage
      tempGenericY = height -(rectHeight + tempY +tempGenericY);
    }
    textSize(12);
    textAlign(LEFT, TOP);
    stroke(153, 157, 163);
    fill(255, 255, 255);//rectangle colour
    rect( tempX + orientationIndent, tempY+tempGenericY, rectWidth, rectHeight);
    stroke(212, 40, 40);
    fill(0, 0, 0);// text colour
    text(circleText, tempX+tempTextX, tempY+tempGenericY, textWidth, rectHeight); 
    if (displayIcon != null) {
      image(displayIcon, tempX+tempIconX, tempY+tempGenericY+3, displayIconSize, displayIconSize);
    }
  }
}

