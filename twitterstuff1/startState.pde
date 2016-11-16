public class StartState extends State {
  State nextState = new SearchState();
  String type = "start";
  boolean stateDone = false;
  Button startButton = new Button(width/2, height/2, 100, 45, "Start");
  int textX1 = width/2 - 390;
  int textS1 = 390;
  int textX2 = textX1 + textS1 +5;
  int textS2 = 400;
  int textX3 = textX2 + round(textS2* 0.75) + 15;
  int textY1 =  height/2 - 150;
  int textY2 = textY1 +5;
  int textY3 = textY2 + 50;
    public State newState() { 
    return nextState;
  }

  boolean getDone() {
    return stateDone;
  }
  String getType() {
    return type;
  }
  String[] getStrings() {
    return null;
  }
  void displayState() {
    fill(backgroundColour);
    stroke(backgroundColour);
    rect(0, 0, width, height);
    fill(255, 255, 255);
    textSize(25);
    textAlign(RIGHT);
    text("Tweets Around: The Election", textX1, textY1, textS1, 50);
    textSize(20);
    textAlign(LEFT);
    text("- an interactive application by: ", textX2, textY2, textS2, 50);
    text("Tex Turner \n Yusuke Kanai \n David Baka Lang \n Jason Fu", textX3, textY3, 200, 200);
    startButton.display();
    if (startButton.pressed()) {
      stateDone = true;
    }
  }
}