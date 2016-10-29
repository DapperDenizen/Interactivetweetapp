public class StartState extends State {
  State nextState = new SearchState();

  boolean stateDone = false;
  //  size= 800  600


  Button startButton = new Button(800/2, 600/2, "start");

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
    startButton.display();
    if (startButton.pressed()) {
      println(" start pressed");
      stateDone = true;
    }
  }
}

