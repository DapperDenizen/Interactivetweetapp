import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;


Twitter twitter;

String democratString = "trump";
String republicanString = "Clinton";
List<Status> tweets;
int currentTweet;
ArrayList<TweetCircle> circles;
int circleDiameter = 25;
int displayIconSize = 40;// used as both icon size and extra text indent
int textWidth = 210;
int rectWidth = 260;
int rectHeight = 100;
int maxRetweets; //this represents the maximum retweets present in
color democratBlue = color(24, 81, 173);
color rebulicanRed = color(214, 19, 19);
color backgroundColour = color(0, 0, 0);
boolean stateOn;
int backButtonX = width-20;
int mainButtonY = 20;
int faqButtonX = backButtonX -20;
int exitButtonX;
int pointOfSplit = 0;
int exitButtonXOne = 100 +width -200 +18;
int exitButtonYOne = 50 + 12;
Button backButton;
Button faqButton;
Button exitButton;
State state;
void setup()
{
  state = new StartState();


  circles = new ArrayList();
  fullScreen();
  //size(800, 600);
  background(backgroundColour);
  setupButtons();
  //config builder
  ConfigurationBuilder cb = new ConfigurationBuilder();
  //keys input
  cb.setOAuthConsumerKey("rgfw0Sov2FWWjwe402hLcvsP9");
  cb.setOAuthConsumerSecret("GEIH2P9Xufwjv7LamxbaGq69czIb7IPSPhgATzon4h2JDOPvry");
  cb.setOAuthAccessToken("765409286323187712-8oHlwE0eOVfS6cFul3hugh2qIivxuPt");
  cb.setOAuthAccessTokenSecret("KijSNrAo2DyRPpRbJl8qiapP7Ilsyy5prMjSep1wk1KLQ");
  //twtr factory
  TwitterFactory tf = new TwitterFactory(cb.build());

  twitter = tf.getInstance();
}
 void setupButtons(){
   backButtonX = width-40;
  faqButtonX = backButtonX -20;
  exitButtonX = backButtonX +20;
backButton = new Button(backButtonX, mainButtonY, 20, 20, "<");
faqButton = new Button(faqButtonX, mainButtonY, 20, 20, "?");
exitButton = new Button(exitButtonX, mainButtonY,20,20,"X");

 }
//check if any points collide
private boolean checkHIT(PVector me, int givenWidth) {
  int w = givenWidth+ 10;
  if (!(circles.isEmpty())) {
    for (int i = pointOfSplit; i < circles.size (); i++) {
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
      }else if( 
me.x + w >= exitButtonXOne - 55 &&
me.x - w <= exitButtonXOne + 55 &&
      me.y -w >= exitButtonYOne -w &&  
        me.y -w <= exitButtonYOne +w 
)
        {
          return false;
        }
      
    }

    return true;
  } else { 
    return true;
  }
}

void draw()
{
  if ( backButton.pressed()) {
    circles = new ArrayList();
    state = new SearchState();
  }
  if(faqButton.pressed()){
    state = new Help(democratString,republicanString);
  }
  if( exitButton.pressed()){
    exit();
  }
  if (state != null) {
    if (state.getDone()) {
      if (state.getType().equals("search")) {
        String[] tempArray = state.getStrings();
   
        // get strings
        democratString = tempArray[1];
        republicanString = tempArray[0];
        //call 1 (dem)
        pointOfSplit = 0;
        generateCircles(democratString, 35, width/2-35, democratBlue);
        //call 2 (republic)
        pointOfSplit = circles.size();// this figures out where dem tweets end and rep tweets start so we can cut down on loading time
        generateCircles(republicanString, width/2+35, width-35, rebulicanRed);
      }
      state = state.newState();
      if (state != null) {
        state.displayState();
      }
    } else {
      state.displayState();
    }
  } else {
    boolean hoverNow= false;
    TweetCircle twtToSend= null; 
    fill(backgroundColour);
    stroke(backgroundColour);
    rect(0, 0, width, height);
    stroke(255, 255, 255);
    line(width/2, 0, width/2, height);
    stroke(backgroundColour);

    //check for hover
    for (int i =0; i < circles.size (); i++) {
      TweetCircle twtCrcl = circles.get(i);
      twtCrcl.dislpay();// draw function
      float tempX = twtCrcl.getX();
      float tempY = twtCrcl.getY();
      float circleWidth = twtCrcl.getWIDTH();
      if ( dist(mouseX, mouseY, tempX, tempY) <= circleWidth) {
        if(mousePressed){
          state = new ViewState(twtCrcl.getStatus());
        }else{
        hoverNow = true;
        twtToSend = twtCrcl;
        }
      }
    }

    if (hoverNow) {
      twtToSend.doHover();
    }
    backButton.display();
    faqButton.display();
    exitButton.display();
  }
}
//Generates the tweet circles
void generateCircles(String searchString, int min, int max, color colour) {

  getNewTweets(searchString);
  currentTweet = 0;
  PVector randcoords;
  int circleWidth = 30;
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
    if(status.isRetweet()){
      status = status.getRetweetedStatus();
    }
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
      }
      TweetCircle twtcrcl = new TweetCircle(status, randcoords, circleWidth, largestNumber, colour, backgroundColour);
      currentTweet++;
      circles.add(twtcrcl);
    }
  }
}
//below code taken from CODASIGNS tutorial link: http://codasign.com/tutorials/processing-and-twitter/
void getNewTweets(String searchString)
{
 // println("getting tweets! tweets = " + searchString);
  try
  {
    Query query = new Query(searchString);
    query.setCount(50);
    QueryResult result = twitter.search(query);

    tweets = result.getTweets();
  }
  catch (TwitterException te)
  {
    System.out.println("Failed to search tweets: " + te.getMessage());
    System.exit(-1);
  }
}