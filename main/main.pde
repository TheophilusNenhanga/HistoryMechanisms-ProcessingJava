Model model = new Model();
Button fileButton = model.getFileButton();
enum Mode {RECENCY_HOTLIST, RECENCY_HIGHLIGHTING, FREQUENCY_HIGHLIGHTING, FREQUENCY_RESIZING, NO_MODE};
Mode mode = Mode.NO_MODE;

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
  // do something different for each mode
  switch (mode){
    case RECENCY_HOTLIST:{
    break;
    }
    
    case  RECENCY_HIGHLIGHTING: {
    break;
    }
    
    case FREQUENCY_HIGHLIGHTING: {
      break;
    }
    
    case FREQUENCY_RESIZING:{
    break;
    }
    
    case NO_MODE:{
      break;
    }
    
  }
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

void keyTyped(){
  switch (key){
    case 'q':{
      model.getButtons().forEach((button) -> {
        println(button.getAction() + " clicked: " + button.getClickCount());
      });
    }
    
    case '1':{
    mode = Mode.RECENCY_HOTLIST;
    break;
    }
    
    case '2':{
    mode = Mode.RECENCY_HIGHLIGHTING;
    break;
    }
    
    case '3':{
    mode = Mode.FREQUENCY_HIGHLIGHTING;
    break;
    }
    
    case '4':{
    mode = Mode.FREQUENCY_RESIZING;
    break;
    }
  }
}
