Rectangle[] rectangles = {new Rectangle("File", 50, 50), new Rectangle("Open", 50, 80), new Rectangle("Favourites", 50, 110), new Rectangle("Sketchbook", 50, 140), new Rectangle("Examples", 50, 170), new Rectangle("Close", 50, 200), new Rectangle("Save", 50, 230), new Rectangle("Save As", 50, 260), new Rectangle("Export", 50, 290), new Rectangle("Page Setup", 50, 320), new Rectangle("Print", 50, 350), new Rectangle("Preferences", 50, 380)};

void setup(){
  size(800, 800);
  frameRate(30);
  windowTitle("Theophilus Nenhanga - CMPT 481 - Assignment 2");
  textAlign(CENTER, CENTER);
}

void draw(){  
  for (Rectangle rect : rectangles){
    rect.draw();
  }
}
