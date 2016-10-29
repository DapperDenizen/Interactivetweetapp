public class TweetCircle {
  Status status;
  float coordX;
  float coordY;
  float circleWidth;
  color ringColour;
  

 TweetCircle( Status twt, PVector coords, int circleWidth, int maxRetweets, color ringColour){
    this.ringColour = ringColour;
    this.status = twt;
    this.coordX = coords.x;
    this.coordY = coords.y;
    this.circleWidth = map(status.getRetweetCount(),0,maxRetweets,circleWidth,55);
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

  void draw() {
     strokeWeight(3);
     stroke(ringColour);
     fill(0);
     ellipse(coordX,coordY, circleWidth, circleWidth);
  }
}