class FAQ extends State{
    Button back = new Button(700, 500, 100, 45, "Back");
    boolean stateDone = false;
    State nextState = new SearchState();;
    String type = "FAQ";
    
    FAQ(){}
    
    public State newState() {
      return nextState;
    }
    String getType() {
      return type;
    }
    boolean getDone() {
      return stateDone;
    }
    
    void displayState(){
       textAlign(CENTER);
       text("FAQ", width/2, 0);
       text("--------------------------------------------", width/2, 10);
       text("Search page", width/2, 20);
       text("You can choose the words whatever you want.", width/2, 30);
       
      
       if(back.pressed()){
          stateDone = true; 
       }
    }
}