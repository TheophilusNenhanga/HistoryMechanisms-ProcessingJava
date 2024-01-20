Model model = new Model();

void setup(){
  size(800, 800);
  frameRate(30);
  windowTitle("Theophilus Nenhanga - CMPT 481 - Assignment 2");
  textAlign(CENTER, CENTER);
}

void draw(){  
  ArrayList<Button> buttons = model.getButtons();
  buttons.forEach((button) -> button.draw());
}
