/*
display statistics
*/

class StatisticState extends State {
  
   Button back = new Button(300, 300, "back");
  
   void drawState(){
      text("statistic", 10, 10); 
      back.display();
   }
   
   State decideState(){
       if(back.pressed()){ //back to searching screen when button is pressed
          return new SearchState(); 
       }
       return this;
   }
}