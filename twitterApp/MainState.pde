/*
display tweets with circles
*/

class MainState extends State{
  
  PVector randcoords;
  String searchString[] = {"trump", "clinton"};
  int num;
  int currentTweet;
  
  //for circles
  ArrayList<TweetCircle> circles;
  PImage displayIcon;
  int circleDiameter = 25;
  int displayIconSize = 40;// used as both icon size and extra text indent
  int textWidth = 200;
  int rectWidth = 260;
  int rectHeight = 100;
  int maxRetweets; //this represents the maximum retweets present in
  color democratBlue = color(24, 81, 173);
  color rebulicanRed = color(214, 19, 19);
  color backgroundColour = color(0, 0, 0);
  
  Query query;
  QueryResult result;
  List<Status> tweets;
  Status status;
  Button back = new Button(300, 300, "back"); //button to go back to search screen
  Button stats = new Button(100, 300, "stats"); //button to go to stats screen
  
  MainState(int _num){
      num = _num;
      currentTweet = 0;
      getNewTweets(num);
  }
  
  void drawState(){
     displayTweets();
     back.display();
     stats.display();
  }
  
  State decideState(){
      if(back.pressed()){ // back to search screen
         return new SearchState(); 
      }
      if(stats.pressed()){ //go to statistics screen
         return new StatisticState(); 
      }
      return this;
  }//method end
  
  void setCircles(){
     circles = new ArrayList();
    //call 1
    generateCircles(searchString[0], 35, width/2-35, democratBlue);
    //call 2
    generateCircles(searchString[1], width/2+35, width-35, rebulicanRed); 
  }
  
  //to get tweets related to searchString
   void getNewTweets(int num){
      try{
         query = new Query(searchString[num]);
         result = twitter.search(query);
         tweets = result.getTweets();
      } catch (TwitterException te) {
         System.out.println("[ERROR] :" + te.getMessage());
         System.exit(-1);
      }
   }//method end

   void displayTweets(){
      setCircles();
      boolean hoverNow= false;
      TweetCircle twtToSend= null; 
      int xOreintation = 0;
      fill(backgroundColour);
      stroke(backgroundColour);
      rect(0, 0, width, height);
      stroke(255, 255, 255);
      line(width/2, 0, width/2, height);
      stroke(backgroundColour);
    
      //check for hover
      for (int i =0; i < circles.size (); i++) {
        TweetCircle twtCrcl = circles.get(i);
        twtCrcl.draw();
        float tempX = twtCrcl.getX();
        float tempY = twtCrcl.getY();
        float circleWidth = twtCrcl.getWIDTH();
        if ( dist(mouseX, mouseY, tempX, tempY) <= circleWidth) {
          hoverNow = true;
          twtToSend = twtCrcl;
        }
      }
    
      if (hoverNow) {
        drawHInfo(twtToSend);
      }
}

    void generateCircles(String searchString, int min, int max, color colour) {

  //getNewTweets(searchString);
  currentTweet = 0;
  PVector randcoords;
  int circleWidth = 25;
  int largestNumber= 0;
  // find highest no of retweets
  while (currentTweet < tweets.size ())
  {
    Status status = tweets.get(currentTweet);
    if ( status.getRetweetCount() > largestNumber) {
      largestNumber = status.getRetweetCount();
    }
    currentTweet++;
  }
  currentTweet = 0; 
  while (currentTweet < tweets.size ())
  {
    //generate points that dont collide but are random and different each time

      randcoords  = new PVector(random(min, max), random(35, height-35));
    Status status = tweets.get(currentTweet);

    //check
    if (checkHIT(randcoords, circleWidth)) {
      //make circle
      TweetCircle twtcrcl = new TweetCircle(status, randcoords, circleWidth, largestNumber, colour, backgroundColour);
      currentTweet++;
      circles.add(twtcrcl);
    } else {
      int c1 = 0;
      while (checkHIT (randcoords, circleWidth) == false) {
        randcoords  = new PVector(random(min, max), random(35, height-35));

        //this is here because processing crashes after a certain number of loops, however im 90% sure i dont need it since i fixed some things 
        //if(c1 > 20){println("over20");break;}else{c1++;}
      }
      TweetCircle twtcrcl = new TweetCircle(status, randcoords, circleWidth, largestNumber, colour, backgroundColour);
      currentTweet++;
      circles.add(twtcrcl);
    }
  }

  for (int i =0; i < circles.size (); i++) {
    TweetCircle twtCrcl = circles.get(i);
    twtCrcl.draw();
  }
}

//the thing that draws the box
void drawHInfo(TweetCircle twtCrcl) {
  //temp variables
  float tempX = twtCrcl.getX();
  float tempY = twtCrcl.getY();
  float orientationIndent = 0;
  float borderWidth = 3;
  //displayIconSize is icon width
  float tempIconX;
  float tempGenericY = borderWidth;
  float tempOutOfFrameY = 0;
  float tempTextX;
  displayIcon = twtCrcl.getImage();
  //check if the box is right or left facing
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

  stroke(153, 157, 163);
  fill(255, 255, 255);//rectangle colour
  rect( tempX + orientationIndent, tempY+tempGenericY, rectWidth, rectHeight);
  stroke(212, 40, 40);
  fill(0, 0, 0);// text colour
  text(twtCrcl.getTweet(), tempX+tempTextX, tempY+tempGenericY, textWidth, rectHeight); 
  if (displayIcon != null) {
    image(displayIcon, tempX+tempIconX, tempY+tempGenericY+3, displayIconSize, displayIconSize);
  }
}
//check if any points collide
private boolean checkHIT(PVector me, int givenWidth) {
  int w = givenWidth+ 10;
  if (circles != null) {
    for (int i =0; i < circles.size (); i++) {
      TweetCircle twtCrcl = circles.get(i);
      if (

      //TR
      //width
      me.x -w >= twtCrcl.getX() -w && 
        me.x -w <= twtCrcl.getX() +w && 
        //height
      me.y +w >= twtCrcl.getY() -w &&  
        me.y +w <= twtCrcl.getY() +w ||
        //TL
      //width
      me.x +w >= twtCrcl.getX() -w && 
        me.x +w <= twtCrcl.getX() +w && 
        //height
      me.y +w >= twtCrcl.getY() -w &&  
        me.y +w <= twtCrcl.getY() +w ||

        //BR
      //width
      me.x -w >= twtCrcl.getX() -w && 
        me.x -w <= twtCrcl.getX() +w && 
        //height
      me.y -w >= twtCrcl.getY() -w &&  
        me.y -w <= twtCrcl.getY() +w ||

        //BL
      //width
      me.x +w >= twtCrcl.getX() -w && 
        me.x +w <= twtCrcl.getX() +w && 
        //height
      me.y -w >= twtCrcl.getY() -w &&  
        me.y -w <= twtCrcl.getY() +w 

        ) {

        return false;
      }
    }

    return true;
  } else { 
    return true;
  }
}

    
}//class end