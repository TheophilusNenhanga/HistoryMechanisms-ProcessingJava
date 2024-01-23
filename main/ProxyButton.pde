class ProxyButton{
  
  private int width; 
  private int height;
  private int x;
  private int y;
  Button button;
  private boolean visible;
  private int[] fill;
  
  public ProxyButton(Button button, int x, int y){
    this.button = button;
    this.fill = new int[]{210, 200, 200};
    this.visible = button.getVisible();
    this.width = button.getWidth();
    this.height = button.getHeight();
    this.x = x;
    this.y = y;
  }
  
    public void draw(){
    if (this.visible){
      fill(this.fill[0], this.fill[1], this.fill[2]);
      rect(this.x, this.y, this.width, this.height);
      textSize(18);
      fill(0, 0, 0);
      text(this.button.getAction(), this.x,this.y, this.width, this.height);
    }
  }

    public boolean contains(int x, int y){
    if (x >= this.x && y >= this.y && x <= this.x + this.width && y <= this.y + this.height){
      return true;
    }
    return false;
  }
  
    public void onHoverEnter(){
    if (this.visible){
    this.fill[0] = 255;
    this.fill[1] = 255;
    this.fill[2] = 255;
  }
  }
  
  public void onHoverExit(){
    if (this.visible){
      this.fill[0] = 200;
      this.fill[1] = 200;
      this.fill[2] = 200;
    }
  }
}
