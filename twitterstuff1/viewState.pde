class ViewState extends State {
  boolean stateDone = false;
  State nextState = null;
  String type = "View";
  String tweetText;
  Status tweetStatus;
  User tweetUser;
  String userName;
  String userAt;
  int tweetRetweets;
  int tweetFavs;
  //X,Y and size\\
  int genericIndent = 10;
  int nameSizeW = 400;
  int nameSizeH = 40;
  //pop up rectangle
  int rectX = 100;
  int rectY = 50;
  int rectW = 600;
  int rectH = 400;
  //users icon   
  int iconX = 120;
  int iconY = 60;
  int iconSize = 100;
  //user name    
  int nameX = iconX +iconSize + genericIndent/5;
  int nameY =iconY + genericIndent;
  //user @
  int atX = nameX;
  int atY =nameY + nameSizeH + genericIndent/5;
  // retweets + favs                            
  int retwtsX = nameX + genericIndent/2;
  int infoY = iconY + iconSize + genericIndent;
  int infoW = 200;
  int infoH = 20;
  int favsX = retwtsX + infoW + genericIndent/5;
  //tweetText
  int tweetX = nameX + genericIndent;
  int tweetY = infoY+ infoH + genericIndent*5;
  int tweetW = 400;
  int tweetH = 300;
  //line
  int lineX1 = iconX;
  int lineY1 = infoY+ infoH + genericIndent;
  int lineX2 = width - 120;
  int lineY2 =  infoY+ infoH + genericIndent;
  PImage userIcon;
  Button exitButton = new Button(rectX+rectW+18, rectY+12, 25, 25, "X");
  ViewState(Status tweetStatus) {
    this.tweetStatus = tweetStatus;
    tweetUser = tweetStatus.getUser();
    userIcon = loadImage(tweetUser.getBiggerProfileImageURL());
    userName = tweetUser.getName();
    userAt = tweetUser.getScreenName();
    tweetRetweets = tweetStatus.getRetweetCount();
    tweetFavs = tweetStatus.getFavoriteCount();
    tweetText = tweetStatus.getText();
    
  }

  public State newState() {
    return nextState;
  }
  String getType() {
    return type;
  }
  boolean getDone() {
    return stateDone;
  }
  String[] getStrings() {
    return null;
  }
  //size(800, 600);
  void displayState() {
    fill(0, 0, 0);
    stroke(196, 196, 196);
    rect(rectX, rectY, rectW, rectH);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(17);
    image(userIcon, iconX, iconY, iconSize, iconSize);
    text(userName,nameX,nameY,nameSizeW, nameSizeH);
    //println(userName+" , "+nameX+" , "+nameY+" , "+nameSizeW+" , "+ nameSizeH);
    textSize(14);
    text("@"+userAt,atX,atY,nameSizeW, nameSizeH);
    textSize(16);
    text("Retweets: " +tweetRetweets ,retwtsX,infoY,infoW, infoH);
    text("Favourites: " + tweetFavs ,favsX,infoY,infoW, infoH);
    line(lineX1,lineY1,lineX2,lineY2);
    text(tweetText, tweetX,tweetY,tweetW,tweetH);
    exitButton.display();
    if (exitButton.pressed()) {
      stateDone = true;
    }
  }
}

