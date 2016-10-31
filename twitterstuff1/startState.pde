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
    textAlign(LEFT);
    text("[Application Name] ",69,195,500, 50);
    textSize(20);
    text("- an application by: ",300,200,200,50);
    textAlign(LEFT);
    text("Tex Turner \n Yusuke Kanai \n David Baka Lang \n Jason Fu",500,200, 200, 200);
    startButton.display();
    if (startButton.pressed()) {
      stateDone = true;
    }
  }
}
