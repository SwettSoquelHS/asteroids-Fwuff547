  /*
  Spaceship class
    Should extend Mover class and implement show.
    You may add additional methods to this class, for example "rotate" and "accelerate" 
    might be useful.
*/
class Spaceship  extends Mover  {
  Bullet[] clip;
  int round;
  int wait;
  
  public Spaceship (float x, float y){
    super(x,y);
  }
  public Spaceship(float x, float y, float speed, float direction){
    super(x, y, speed, direction);
    radius = 60;
    clip = new Bullet[8];
    round = 0;
    wait = 0;
    for(int i =0; i<clip.length; i++){
      clip[i] = null;
    }
    
    
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
  }
  Bullet clone(float x, float y, float direction) {
    Bullet newBullet = new Bullet(x, y, 5.75, direction);
    return newBullet;
  
  }
  void fired () {
    if(round<clip.length && wait<0){
      clip[round] = clone(player1.x, player1.y, player1.direction);
      round++;
      wait = 12;
    }
  }
  void hyperSpace(Spaceship hero) {
    hero.x =(float)(Math.random()*800);
    hero.y =(float)(Math.random()*600);
    hero.direction =(float)(Math.random()*360);
  }
  void spent(int bullet) {
    clip = removeBullet(clip, bullet);
    if(round>0)
      round-=1;
    
  }
  public Bullet[] removeBullet(Bullet[] arr, int index){
        Bullet[] result = new Bullet[arr.length];
        for(int i =0; i < index; i++) {
            result[i] = arr[i];
        }
        for(int j = index+1; j < arr.length; j++) {
            result[j-1] = arr[j];
        }
        result[arr.length-1] = new Bullet(900.0,900.0,0.0,0.0);
        return result;
    }
  
}
