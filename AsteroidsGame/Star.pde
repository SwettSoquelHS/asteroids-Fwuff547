//note that this class does NOT *NEED* to extend Mover but can if you like
class Star {
  float x, y;
  public Star (float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void show() {
    pushMatrix();
    translate((float)x, (float)y);
    fill(#FCFC29);
    ellipse(x, y, 5, 5);
    popMatrix();
  }
  //your code here
}
