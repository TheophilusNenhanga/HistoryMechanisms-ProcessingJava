public class Button{
  String action;
  int width; 
  int height;
  int x;
  int y;
  ArrayList<Button> children;
  boolean visible;
  
  public Button(String action, int x, int y){
    this.action = action;
    this.width = 140;
    this.height = 30;
    this.x = x;
    this.y = y;
    this.children = new ArrayList<Button>();
    this.visible = false;
  }
  
  public void draw(){
    if (this.visible){
      fill(255, 255, 255);
      rect(this.x, this.y, this.width, this.height);
      textSize(18);
      fill(0, 0, 0);
      text(this.action, this.x,this.y, this.width, this.height);
      
      this.children.forEach(child -> child.draw());
    }
  }
  
  public ArrayList<Button> getChildren(){
    return this.children;
  }
  
  public void addChild(Button child){
    this.children.add(child);
  }
  
  public void setVisible(boolean visible){
    this.visible = visible;
  }
  
  public boolean isVisible(){
    return this.visible;
  }
  
  public void showChildren(){
    this.children.forEach((child) -> {
      child.setVisible(true);
    });
  }

  public void hideChildren(){
    this.children.forEach((child) -> {
      child.setVisible(false);
    });
  }
  
  public boolean contains(int x, int y){
    if (x >= this.x && y >= this.y && x <= this.x + this.width && y <= this.y + this.height){
      return true;
    }
    return false;
  }
}
