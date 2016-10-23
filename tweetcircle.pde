public class TweetCircle {
Status status;
float coordX;
float coordY;
int circleWidth;
 TweetCircle( Status twt, PVector coords, int circleWidth){
   this.circleWidth = circleWidth;
   strokeWeight(3);
   stroke(212,40,40);
   fill(3);
status = twt;
coordX = coords.x;
coordY = coords.y;
ellipse(coordX,coordY, circleWidth, circleWidth);

}
public float getX(){
return coordX;
}
public float getY(){
return coordY;
}
public float getWIDTH(){
return circleWidth;
}
public String getTweet(){
return status.getText();

}
public PImage getImage(){
return loadImage(status.getUser().getMiniProfileImageURL());
}
void setup(){ }
void draw() {
  ellipse(coordX,coordY, circleWidth, circleWidth);
  }
 
}
