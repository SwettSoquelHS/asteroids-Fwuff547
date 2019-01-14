/*
  Asteroid class
    Should extend Mover class and implement show.
    
    Initially, your asteroid may just be a simple circle or square
    but the final program should use "beginShap(), vertex(), and endShape()"
    to render the asteroid.
*/
class Asteroid extends Mover{ 
  float rotation;
  
  public Asteroid (float x, float y){
    super(x,y);
  }
  
  public Asteroid(float x, float y, float speed, float direction, float rotation) {
    super(x, y, speed, direction);
    this.rotation = rotation;
  }

  void show() {
    pushMatrix();
    translate((float)x, (float)y);
    rotate(radians(rotation));
    scale(1.5);
    fill(75);
    beginShape();
    vertex(-5+(int)Math.random()*4-2, -5);
    vertex(-15, -5);
    vertex(-15, 0);
    vertex(-10, 0);
    vertex(-10, 5);
    vertex(-5, 5);
    vertex(-5, 10);
    vertex(5, 10+ (int)Math.random()*4-2);
    vertex(10, 10);
    vertex(20+ (int)Math.random()*4-2, 10);
    vertex(20+ (int)Math.random()*4-2, -5);
    vertex(15, -5);
    vertex(15, -10);
    vertex(10, -10);
    vertex(10, -15);
    vertex(5, -15);
    vertex(-5, -10);
    vertex(-5+ (int)Math.random()*4-2, -5);
    endShape();
    fill(50);
    ellipse(5, -5, 5, 5);
    ellipse(0, 5, 5, 5);
    ellipse(15, -5, 5, 5);
    popMatrix();
    
  }

  void update() {
    x = (x + (float)Math.cos(direction)*speed);
    y = (y + (float)Math.sin(direction)*speed);
    rotation+=2;

  }
  //your code here
}
