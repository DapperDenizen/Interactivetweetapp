public class StartState extends State {
  State nextState = new SearchState();
  String type = "start";
  boolean stateDone = false;
  //  size= 800  600


  Button startButton = new Button(800/2, 600/2, 100,45,"Start");
//Button(int rectX, int rectY, int rectW, int rectH, String label) 
  public State newState() {
    return nextState;
  }
  boolean getDone() {
    return stateDone;
  }
  String getType(){
   return type;
  }
  void displayState() {
    fill(backgroundColour);
    stroke(backgroundColour);
    rect(0, 0, width, height);
    startButton.display();
    if (startButton.pressed()) {
      stateDone = true;
    }
  }
}

