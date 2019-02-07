import java.util.ArrayList;
  /*
  Spaceship class
    Should extend Mover class and implement show.
    You may add additional methods to this class, for example "rotate" and "accelerate" 
    might be useful.
*/
class Spaceship  extends Mover  {
  ArrayList<Bullet> clip;
  int round;
  int wait, collide, start;
  int playerlife;
  int score;
  
  public Spaceship (float x, float y){
    super(x,y);
  }
  public Spaceship(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
    radius = 20;
    clip = new ArrayList<Bullet>();
    round = 0;
    wait = 0;
    playerlife = 3;
    collide = 0;
    score = 0;
    start = 14;
    
    
    
  }
  
  void show() {
    pushMatrix();
    translate(x, y);
    rotate(radians(direction+90));
    fill(#7F9395);
    scale(.25);
    beginShape();
    vertex(-60, 60);
    vertex(-60, 90);
    vertex(-10, 50);
    vertex(-20, 70);
    vertex(-20, 90);
    vertex(-10, 110);
    vertex(-10, 120);
    vertex(-20, 120);
    vertex(-20, 130);
    vertex(-30, 130);
    vertex(-30, 150);
    vertex(-20, 150);
    vertex(-20, 140);
    vertex(-10, 140);
    vertex(-10, 130);
    vertex(10, 130);
    vertex(10, 140);
    vertex(20, 140);
    vertex(20, 150);
    vertex(30, 150);
    vertex(30, 130);
    vertex(20, 130);
    vertex(20, 120);
    vertex(10, 120);
    vertex(10, 110);
    vertex(20, 90);
    vertex(20, 70);
    vertex(10, 50);
    vertex(60, 90);
    vertex(60, 60);
    vertex(0, 0);
    vertex(-60, 60);
    endShape();
    fill(#18C7D8);
    ellipse(0, 30, 20, 20);
    beginShape();
    vertex(-5,100);
    vertex(5,100);
    vertex(5,60);
    vertex(-5,60);
    vertex(-5,100);
    endShape();
    fill(#BF0C18);
    beginShape();
    vertex(-30,150);
    vertex(-25,170);
    vertex(-20,150);
    vertex(-30,150);
    endShape();
    beginShape();
    vertex(30,150);
    vertex(25,170);
    vertex(20,150);
    vertex(30,150);
    endShape();
    popMatrix();
  }
  
  void update() {
    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));
    wait--;
    collide--;
    start--;
  }
  void fired () {
    if(round<8 && wait<0 && clip.size()<8){
      Bullet bull = new Bullet(x, y, 7, direction);
      clip.add(bull);
      round++;
      wait = 14;
    }
  }
  void hyperSpace(Spaceship hero) {
    hero.x =(float)(Math.random()*width);
    hero.y =(float)(Math.random()*height);
    hero.direction =(float)(Math.random()*360);
  }
  void spent(int bullet) {
    clip.remove(bullet);
    if(round>0)
      round-=1;
    
  }
  
}
