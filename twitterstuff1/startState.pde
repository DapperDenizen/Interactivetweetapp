public class StartState extends State {
  State nextState = new SearchState();
  String type = "start";
  boolean stateDone = false;
  Button startButton = new Button(800/2, 600/2, 100,45,"Start");
  public State newState() { 
     return nextState;
  }
  boolean getDone() {
    return stateDone;
  }
  String getType(){
   return type;
  }
   String[] getStrings() {
    return null;
  }
  void displayState() {
    fill(backgroundColour);
    stroke(backgroundColour);
    rect(0, 0, width, height);
    fill(255,255,255);
    textSize(25);
    textAlign(RIGHT);
    text("Tweets Around: The Election",8,195,390, 50);
    textSize(20);
    textAlign(LEFT);
    text("- an interactive application by: ",400,200,400,50);
    text("Tex Turner \n Yusuke Kanai \n David Baka Lang \n Jason Fu",500,250, 200, 200);
    startButton.display();
    if (startButton.pressed()) {
      stateDone = true;
    }
  }
}
