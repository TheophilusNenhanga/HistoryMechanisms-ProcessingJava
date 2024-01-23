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
      model.getRecentButtons().forEach((button) -> {
      ProxyButton proxy = new ProxyButton(button, fileButton.getX(), fileButton.getY()); // TODO check positions of buttons. Why are they not appearing?
      model.addProxy(proxy);
      });
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
  model.getProxies().forEach(b -> b.draw());
}

void mouseClicked(){
   model.getButtons().forEach((button) -> {
     button.onPressExit();
     if (button.contains(mouseX, mouseY)){
       button.onClickEnter();
       model.addRecentButton(button);
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
      println(model.getFrequentButtons());
      println(model.getRecentButtons());
    }
    
    case '1':{
      if (mode != Mode.RECENCY_HOTLIST){
    mode = Mode.RECENCY_HOTLIST;
    model.getButtons().forEach(button -> {
      if (button != fileButton){
        button.setY(button.getY() + 100);
      }
    });
      }
    // Create recency List
    // TODO: Add proxy buttons. When they are clicked they update the button that they stand for.
    break;
    }
    
    case '2':{
      if (mode != Mode.RECENCY_HIGHLIGHTING){
    mode = Mode.RECENCY_HIGHLIGHTING;
      }
    break;
    }
    
    case '3':{
      if (mode != Mode.FREQUENCY_HIGHLIGHTING){
    mode = Mode.FREQUENCY_HIGHLIGHTING;
      }
    break;
    }
    
    case '4':{
      if (mode != Mode.FREQUENCY_RESIZING){
    mode = Mode.FREQUENCY_RESIZING;
      }
    break;
    }
  }
}
