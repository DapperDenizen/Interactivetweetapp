public class SearchState extends State {
  boolean stateDone = false;
  State nextState = null;
  boolean allChose = false;
  boolean repChose = false;
  boolean demChose = false;
  String type = "search";
  String[] searchResults = { 
    "Default value", "Default value"
  };

  //  size= 800  600
  //button to continue to next state
  Button chooseButton = new Button(800/2, 600/3, 100, 45, "Choose");
  //left~ democrat
  Button choice1Button = new Button(800/4, 300, 100, 45, "Trump");
  Button choice2Button = new Button(800/4, 350, 100, 45, "#MAGA");
  Button choice3Button = new Button(800/4, 400, 100, 45, "Dumpf");
  //right~ democrat
  Button choice4Button = new Button(600, 300, 100, 45, "Clinton");
  Button choice5Button = new Button(600, 350, 100, 45, "#ImWithHer");
  Button choice6Button = new Button(600, 400, 100, 45, "#CrookedHilary");

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
    if(repChose && demChose){allChose = true;}
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
    //left buttons
    if (choice1Button.pressed()) {
       searchResults[0] = "Trump";
       repChose = true;
    } else if (choice2Button.pressed()) {
       searchResults[0] = "MAGA";
       repChose = true;
    } else if (choice3Button.pressed()) {
       searchResults[0] = "Dumpf";
       repChose = true;
    }
    // right button
    if (choice4Button.pressed()) {
       searchResults[1] = "Clinton";
       demChose = true;
    } else if (choice5Button.pressed()) {
      searchResults[1] = "imwithher";
       demChose = true;
    } else if (choice6Button.pressed()) {
      searchResults[1] = "#Crookedhilary";
       demChose = true;
    }
  }
}

