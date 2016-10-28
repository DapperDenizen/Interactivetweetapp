/*
to display buttons on any screen
*/

class Button{
   int rectX, rectY;
   int rectW = 100;
   int rectH = 45;
   color rectColor, rectHighlight;
   String label;
   boolean rectOver = false;
   
   Button(int _rectX, int _rectY, String _label){
       rectX = _rectX;
       rectY = _rectY;
       label = _label;
       rectColor = color(200, 0, 0);
       rectHighlight = color(255, 0, 0);
   }
   
   void display(){
       update(mouseX, mouseY);
       if(rectOver) {
          fill(rectHighlight); 
       } else {
          fill(rectColor); 
       }
       stroke(255);
       text(label, rectX, rectY);
       rect(rectX, rectY, rectW, rectH);
   }
   
   void update(int x, int y){
      if(overRect(rectX, rectY, rectW, rectH)){
         rectOver = true;
      } else {
         rectOver = false; 
      }
   }
   
   boolean overRect(int x, int y, int w, int h){
      if(mouseX >= x && mouseX <= x+w &&
          mouseY >= y && mouseY <= y+h){
              return true;
          } else {
             return false; 
          }
   }
   
   boolean pressed(){
      if (mousePressed && rectOver){
         return true; 
      } else {
         return false; 
      }
   }
}