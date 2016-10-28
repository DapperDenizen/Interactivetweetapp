/*
display dynamic search
*/

class SearchState extends State {
   
   Button trump = new Button(50, 100, "trump");
   Button clinton = new Button(250, 100, "clinton");
  
   void drawState(){
      trump.display();
      clinton.display();
      line(width/2, 0, width/2, height);
   }
   
   State decideState(){
       if(getNum() == 0){
          return new MainState(0); //update screen and pass 0 to class MainState
       }
       if(getNum() == 1){
          return new MainState(1); //update screen and pass 1 to class MainState
       }
       return this;
   }
   
   int getNum(){
      if(button1.pressed()){
         return 0;  //return 0 when trump is pressed
      }
      if(button2.pressed()){
         return 1;   //return 1 when clinton is pressed
      }
      return 300;
   }
}