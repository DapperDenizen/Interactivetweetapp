/*
display statistics
*/

class StatisticState extends State {
  
   int num;
   int currentTweet = 0;
   
   StatisticState(int _num){
      this.num = _num; 
      getNewTweets(_num);
   }
  
   Button back = new Button(600, 550, "back");
   
   void drawState(){
       if(currentTweet >= tweets.size()){
          currentTweet = 0;
       }
      back.display();
   }
   
   State decideState(){
       if(back.pressed()){ //back to searching screen when button is pressed
          return new SearchState(); 
       }
       return this;
   }
   
}