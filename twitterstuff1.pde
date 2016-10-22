
import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;


Twitter twitter;
String searchString = "trump";
List<Status> tweets;
int currentTweet;
ArrayList<TweetCircle> circles;
int circleDiameter = 25;
int textWidth = 200;
int rectWidth = 215;
int rectHeight = 100;
void setup()
{

  circles = new ArrayList();
    size(800,600);
    background(3);
  
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

    getNewTweets();
    currentTweet = 0;
    PVector randcoords;
    int circleWidth = 25;

   

while(currentTweet < tweets.size())
{
  //generate points that dont collide but are random and different each time

randcoords  = new PVector(random(35,735),random(35,565));
 Status status = tweets.get(currentTweet);
 //
//check
if(checkHIT(randcoords,circleWidth)){
//make circle
TweetCircle twtcrcl = new TweetCircle(status, randcoords,circleWidth);
currentTweet++;
circles.add(twtcrcl);
}  else{
  int c1 = 0;
      while(checkHIT(randcoords,circleWidth) == false){
                randcoords  = new PVector(random(35,735),random(35,565));
               //this is here because processing crashes after a certain number of loops, however im 90% sure i dont need it since i fixed some things but lets just be sure
                if(c1 > 20){break;}else{c1++;}
      }
        TweetCircle twtcrcl = new TweetCircle(status, randcoords,circleWidth);
        currentTweet++;
        circles.add(twtcrcl);
      }
}

for(int i =0; i < circles.size(); i++){
     TweetCircle twtCrcl = circles.get(i);
     twtCrcl.draw();
    
}
}

   //check if any points collide
private boolean checkHIT(PVector me, int givenWidth){
  int w = givenWidth+ 10;
  if(!(circles.isEmpty())){
for(int i =0; i < circles.size(); i++){
      TweetCircle twtCrcl = circles.get(i);
      if(
      
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

        ){

        return false;
        }
}

return true;
} else{ return true;}
}

void draw()
{
  boolean hoverNow= false;
  TweetCircle twtToSend= null; 
  int xOreintation = 0;
  fill(3);
rect(-3, -3, width+4, height+4);
fill(3);
for(int i =0; i < circles.size(); i++){
     TweetCircle twtCrcl = circles.get(i);
     twtCrcl.draw();
     float c1 = twtCrcl.getX();
     float c2 = twtCrcl.getY();
      float circleWidth = twtCrcl.getWIDTH();
      if(
    //mouse X
    mouseX  <= c1 +circleWidth && 
    mouseX  >= c1 -circleWidth && 
      //mouse Y
   mouseY >= c2 -circleWidth &&  
    mouseY  <= c2 +circleWidth 
      
      ){
        if(c1 > width/2){
          hoverNow = true;
          twtToSend = twtCrcl; 
          xOreintation = -rectWidth -5;
          
      }else{
          hoverNow = true;
          twtToSend = twtCrcl; 
          xOreintation = 5;
      }
        fill(3);
   }
}
if(hoverNow){
drawHInfo(twtToSend,xOreintation);
}

}
//the thing that draws the box
void drawHInfo(TweetCircle twtCrcl, int side){
      float c1 = twtCrcl.getX();
      float c2 = twtCrcl.getY();
      float c3 = 5;//Y displacement value 
      int c4 = 5;//text indent to ensure it doesnt sit on the outline
      //checks if the box is out of stage
      if(c2 + rectHeight >= height){
        //moves the box up so that it sits neatly above the stage
      c3 = height -(rectHeight + c2 +3);
      }
     
      stroke(153, 157, 163);
      fill(255,255,255);//rectangle colour
      rect( c1 +side,c2+c3, rectWidth,rectHeight);
      stroke(212,40,40);
      fill(0,0,0);// text colour
      text(twtCrcl.getTweet(),  c1+side+c4,c2+c3, textWidth,rectHeight); 
      


}
void getNewTweets()
{
    try
    {
        Query query = new Query(searchString);

        QueryResult result = twitter.search(query);

        tweets = result.getTweets();
    }
    catch (TwitterException te)
    {
        System.out.println("Failed to search tweets: " + te.getMessage());
        System.exit(-1);
    }
}

