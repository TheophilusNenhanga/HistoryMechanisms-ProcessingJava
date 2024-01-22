Model model = new Model();
Button fileButton = model.getFileButton();

boolean childrenShown = false;

void setup(){
  size(800, 800);
  frameRate(30);
  windowTitle("Theophilus Nenhanga - CMPT 481 - Assignment 2");
  textAlign(CENTER, CENTER);
}

void draw(){  
  background(51); // color the background grey each draw loop
  fileButton.setVisible(true);
  fileButton.draw();
}

void mouseClicked(){
   model.getButtons().forEach((button) -> {
     button.onPressExit();
     if (button.contains(mouseX, mouseY)){
       button.onClickEnter();
     }else{
       button.onClickExit();
     }
   });
} 

void mousePressed(){
    model.getButtons().forEach((button) -> {
    if (button.contains(mouseX, mouseY)){
    button.onPressEnter();
    }
  });
}

void mouseMoved(){
  model.getButtons().forEach((button) -> {
    if (button.contains(mouseX, mouseY)){
    button.onHoverEnter();
  }else{
    button.onHoverExit();
  }
  });
}
