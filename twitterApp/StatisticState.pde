/*
display statistics
*/

class StatisticState extends State {
  
   int num; 
  
   Button back = new Button(600, 600, "back");
   
   
   void drawState(){
      text("statistics", 10, 10); 
      back.display();
   }
   
   State decideState(){
       if(back.pressed()){ //back to searching screen when button is pressed
          return new SearchState(); 
       }
       return this;
   }
   
   void getTweets(int num){
       tweets.getNewTweets(num);
   }
   
}