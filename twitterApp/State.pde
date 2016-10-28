/*
parent class
*/

abstract class State {
    
    State() {

    }
    
    State doState() {
      drawState();
      return decideState();
    }
    
    abstract void drawState();          //display things corresponding to state
    abstract State decideState();     //return next state
    
}