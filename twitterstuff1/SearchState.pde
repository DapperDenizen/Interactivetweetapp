public class SearchState extends State {
  boolean stateDone = false;
  State nextState = null;
  
  //  size= 800  600
  Button chooseButton = new Button(800/4, 600/2,100,45, "Choose");
 
  public State newState() {
    return nextState;
  }
  boolean getDone() {
    return stateDone;
  }
  void displayState() {
    fill(backgroundColour);
    stroke(backgroundColour);
    rect(0, 0, width, height);
    chooseButton.display();
    if (chooseButton.pressed()) {
      println("choose pressed");
      stateDone = true;
    }
  }
}

