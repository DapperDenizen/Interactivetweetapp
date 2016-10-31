class Help extends State{
    Button back = new Button(700, 500, 100, 45, "Back");
    boolean stateDone = false;
    State nextState = null;
    String type = "FAQ";
    
    Help(){}
    
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
      return null;
    }
    
    void displayState(){
       textAlign(CENTER);
       text("Help", width/2, 0);
       text("--------------------------------------------", width/2, 10);
       text("Search page", width/2, 20);
       text("You can choose two words from lists.", width/2, 30);
       text("Left side for Hilary Clinton, right side for Donald Trump", width/2, 40);
       text("After choosing word from both lists, press 'choose' button.", width/2, 50);
       text("--------------------------------------------", width/2, 60);
       text("Main page", width/2, 70);
       text("You can see latest tweets searched by words you have chosen.", width/2, 80);
       text("Tweets with BLUE circles are related to the word you chose from LEFT list.", width/2, 90);
       text("Tweets with RED circles are related to the word you chose from RIGHT list.", width/2, 100);
       text("The textbox, which includes tweets, pops up by mouseover.", width/2, 110);
       text("--------------------------------------------", width/2, 120);
      
       if(back.pressed()){
          stateDone = true; 
       }
    }
}
