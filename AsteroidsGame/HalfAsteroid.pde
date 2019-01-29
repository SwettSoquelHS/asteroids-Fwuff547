public class HalfAsteroid extends Asteroid{
  public HalfAsteroid (float x, float y){
    super(x,y);
  }
  public HalfAsteroid(float x, float y, float speed, float direction, float rotation) {
    super(x, y, speed, direction, rotation);
    radius = 18;
  }
  void show() {
    pushMatrix();
    translate((float)x, (float)y);
    rotate(radians(rotation));
    fill(75);
    beginShape();
    vertex(-5+(int)Math.random()*4-2, -5);
    vertex(-10, -5);
    vertex(-10, 0);
    vertex(-10, 0);
    vertex(-10, 5);
    vertex(-5, 10);
    vertex(-5, 15);
    vertex(5, 10+ (int)Math.random()*4-2);
    vertex(10, 10);
    vertex(20+ (int)Math.random()*4-2, 10);
    vertex(20+ (int)Math.random()*4-2, -5);
    vertex(15, -5);
    vertex(15, -15);
    vertex(10, -10);
    vertex(10, -15);
    vertex(5, -15);
    vertex(0, -10);
    vertex(-5+ (int)Math.random()*4-2, -5);
    endShape();
    fill(50);
    ellipse(5, -5, 5, 5);
    ellipse(0, 5, 5, 5);
    ellipse(15, -5, 5, 5);
    popMatrix();
    
  }
  
}
