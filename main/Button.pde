public class Button{
  String action;
  int width; 
  int height;
  int x;
  int y;
  
  public Button(String action, int x, int y){
    this.action = action;
    this.width = 140;
    this.height = 30;
    this.x = x;
    this.y = y;
  }
  
  public void draw(){
    fill(255, 255, 255);
    rect(this.x, this.y, this.width, this.height);
    textSize(18);
    fill(0, 0, 0);
    text(this.action, this.x,this.y, this.width, this.height);
  }
}
