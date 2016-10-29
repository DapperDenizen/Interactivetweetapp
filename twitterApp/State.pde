/*
parent class
*/

abstract class State {
    
    int num;
    int currentTweet;
    String searchString[] = {"trump", "clinton"};
    
    Query query;
    QueryResult result;
    List<Status> tweets;
    Status status;
  
    State() {

    }
    
    State doState() {
      drawState();
      return decideState();
    }
    
    abstract void drawState();          //display things corresponding to state
    abstract State decideState();     //return next state
    
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
    
    Status getStatus(int currentTweet){
        status = tweets.get(currentTweet);
        return status;
    }
}