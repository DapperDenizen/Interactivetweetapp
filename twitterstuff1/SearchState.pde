public class SearchState extends State {
  boolean stateDone = false;
  State nextState = null;
  boolean allChose = false;
  String type = "search";
  String[] searchResults = { 
    "Default value", "Default value"
  };

  //  size= 800  600
  //button to continue to next state
  Button chooseButton = new Button(800/2, 600/3, 100, 45, "Choose");
  //left~ democrat
  Button choice1Button = new Button(800/4, 300, 100, 45, "One");
  Button choice2Button = new Button(800/4, 350, 100, 45, "Two");
  Button choice3Button = new Button(800/4, 400, 100, 45, "Two");
  //right~ democrat
  Button choice4Button = new Button(600, 300, 100, 45, "One");
  Button choice5Button = new Button(600, 350, 100, 45, "Two");
  Button choice6Button = new Button(600, 400, 100, 45, "Two");

  public State newState() {
    return nextState;
  }
  String getType() {
    return type;
  }
  boolean getDone() {
    return stateDone;
  }
  String[] getStrings() {
    return searchResults;
  }
  void displayState() {
    fill(backgroundColour);
    stroke(backgroundColour);
    rect(0, 0, width, height);
    if (allChose) {
      chooseButton.display();
    }
    choice1Button.display();
    choice2Button.display();
    choice3Button.display();
    choice4Button.display();
    choice5Button.display();
    choice6Button.display();
    if (chooseButton.pressed()) {
      stateDone = true;
    }
  }
}

