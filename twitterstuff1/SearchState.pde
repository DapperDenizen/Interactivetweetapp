public class SearchState extends State {
  boolean stateDone = false;
  State nextState = null;
  String type = "search";
  
  //  size= 800  600
  Button chooseButton = new Button(800/4, 600/2,100,45, "Choose");
 
  public State newState() {
    return nextState;
  }
  String getType(){
   return type;
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
      stateDone = true;
    }
  }
}

