public class SearchState extends State {
  boolean stateDone = false;
  State nextState = null;
  boolean repChose = false;
  boolean demChose = false;
  int testifbroke =0;
  int textW = 800;
  int textH  =170; 
  int textX = (width/2) - textW/2;
  int textY = 0 + 20;
  int leftX = width/4;
  int  rightX = width- leftX;
  int buttonBaseY =height/4;
  int chooseButtonY = width - width/4;
  ArrayList<Button> buttons = new ArrayList();
  int midPointno = 0;
  String textWords = "Below are the choices for what you would like to search. \n Each of these choices relates to either the Democratic candidate or the Republican candidate \n choose one of each and then click the \" Choose \" button to continue.";
  String type = "search";
  String[] searchResults = { 
    "Default value", "Default value"
  };// dem = 1, rep = 0
  boolean setButtons = false;
  //? and < buttons
  int backButtonX = width-20;
  int faqButtonX = backButtonX -20;
  Button chooseButton = new Button(width/2, height/2, 100, 45, "Choose");  
  //
  Button choice1Button = new Button(rightX, buttonBaseY, 120, 45, "#Election2016");
  Button choice2Button = new Button(rightX, buttonBaseY +50, 120, 45, "#Trump");
  Button choice3Button = new Button(rightX, buttonBaseY +100, 120, 45, "#MAGA");
  Button choice4Button = new Button(rightX, buttonBaseY +150, 120, 45, "#TrumpProtest");
  Button choice5Button = new Button(rightX, buttonBaseY +200, 120, 45, "#NotMyPresident");
  Button choice6Button = new Button(rightX, buttonBaseY +250, 120, 45, "#TrumpPresident");
  Button choice7Button = new Button(rightX, buttonBaseY +300, 120, 45, "#DumpTrump");
  //
  Button choice8Button = new Button(leftX, buttonBaseY, 120, 45, "#HealAmerica");
  Button choice9Button = new Button(leftX, buttonBaseY +50, 120, 45, "#Clinton");
  Button choice10Button = new Button(leftX, buttonBaseY +100, 120, 45, "#ImWithHer");
  Button choice11Button = new Button(leftX, buttonBaseY +150, 120, 45, "#HillaryRiots");
  Button choice12Button = new Button(leftX, buttonBaseY +200, 120, 45, "#HillaryForPrison");
  Button choice13Button = new Button(leftX, buttonBaseY +250, 120, 45, "#IllAlwaysBeWithHer");
  Button choice14Button = new Button(leftX, buttonBaseY +300, 120, 45, "#MajorityMatters");
  //adds buttons to list




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
    //initialise buttons <- this could be done more elegantly but its 11 and i want to cook my steak dinner 
    if (setButtons == false) {
      // left
      buttons.add(choice1Button);
      buttons.add(choice2Button);
      buttons.add(choice3Button);
      buttons.add(choice4Button);
      buttons.add(choice5Button);
      buttons.add(choice6Button);
      buttons.add(choice7Button);
      midPointno =  buttons.size();
      //right~ democrat
      buttons.add(choice8Button);
      buttons.add(choice9Button);
      buttons.add(choice10Button);
      buttons.add(choice11Button);
      buttons.add(choice12Button);
      buttons.add(choice13Button);
      buttons.add(choice14Button);
      setButtons = true;
    }
    //start of actual draw stuff
    //draw background
    fill(backgroundColour);
    stroke(backgroundColour);
    rect(0, 0, width, height);
    //check if two of the buttons are chosen
    if (repChose && demChose) {
      chooseButton.display();
    }
    //display buttons
    choice1Button.display();
    choice2Button.display();
    choice3Button.display();
    choice4Button.display();
    choice5Button.display();
    choice6Button.display();
    choice7Button.display();
    choice8Button.display();
    choice9Button.display();
    choice10Button.display();
    choice11Button.display();
    choice12Button.display();
    choice13Button.display();
    choice14Button.display();
    //check if they are pressed

    if (mousePressed) {
      if (chooseButton.pressed()) {
        if (repChose && demChose) {

          stateDone = true;
        }
      } else {
      }   
      for (int i = 0; i < buttons.size(); i++) {
        if (buttons.get(i).pressed()) {
          fixButtons(buttons.get(i), i );
        }
      }
    }
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(textWords, textX, textY, textW, textH);
  }

  void fixButtons(Button button, int pos) {
    if ( pos < midPointno) {
      for (int i = 0; i < midPointno; i++) {
        buttons.get(i).returnColour();
        searchResults[0] = button.getText();
        repChose = true;
      }
      button.changeColour();
    } else if (pos>= midPointno) {
      for (int i = midPointno; i < buttons.size(); i++) {
        buttons.get(i).returnColour();
        searchResults[1] = button.getText();
        demChose = true;
      }
      button.changeColour();
    }
  }
}