public class TweetCircle {
Status status;
float coordX;
float coordY;
float circleWidth;
 TweetCircle( Status twt, PVector coords, int circleWidth, int maxRetweets){
   strokeWeight(3);
   stroke(212,40,40);
   fill(3);
status = twt;
coordX = coords.x;
coordY = coords.y;
this.circleWidth = map(status.getRetweetCount(),0,maxRetweets,circleWidth,55);
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
