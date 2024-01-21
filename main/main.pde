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
  // ArrayList<Button> buttons = model.getButtons();
  background(51); // color the background grey each draw loop
  fileButton.setVisible(true);
 
  fileButton.draw();
}

void mouseClicked(){
   if (fileButton.contains(mouseX, mouseY)){
    if (childrenShown == false){
      fileButton.showChildren();
     childrenShown = true;
    }else{
      fileButton.hideChildren();
     childrenShown = false;
    }
   }
} 
