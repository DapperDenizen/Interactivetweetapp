public class TweetCircle {
  Status status;
  float coordX;
  float coordY;
  float circleWidth;
  color ringColour;
  color backgroundColour;
  TweetCircle( Status twt, PVector coords, int circleWidth, int maxRetweets, color ringColour, color backgroundColour) {
    this.ringColour = ringColour;
    this.backgroundColour =backgroundColour;
    strokeWeight(3);
    stroke(ringColour);
    fill(backgroundColour);
    status = twt;
    coordX = coords.x;
    coordY = coords.y;
    this.circleWidth = map(status.getRetweetCount(), 0, maxRetweets, circleWidth, 55);
    ellipse(coordX, coordY, circleWidth, circleWidth);
  }
  public float getX() {
    return coordX;
  }
  public float getY() {
    return coordY;
  }
  public float getWIDTH() {
    return circleWidth;
  }
  public String getTweet() {
    return status.getText();
  }
  public PImage getImage() {
    return loadImage(status.getUser().getMiniProfileImageURL());
  }
  void dislpay() {
    strokeWeight(3);
    stroke(ringColour);
    fill(backgroundColour);
    ellipse(coordX, coordY, circleWidth, circleWidth);
  }
}

