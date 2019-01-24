import java.util.ArrayList;
/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
Spaceship player1;
ArrayList lotsOfAsteroid = new ArrayList();
Star[] starFeild = new Star[150];



//Star[] starField;


/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  
boolean ROTATE_RIGHT; 
boolean MOVE_FORWARD; 
boolean MOVE_BACKWARD;
boolean SPACE_BAR;    //User is pressing space bar
boolean JUMP;

  
/* * * * * * * * * * * * * * * * * * * * * * *
  Initialize all of your variables and game state here
 */
public void setup() {
  size(800, 600);
  ROTATE_LEFT = false;  
  ROTATE_RIGHT = false; 
  MOVE_FORWARD = false; 
  MOVE_BACKWARD = false;
  SPACE_BAR = false;
  JUMP = false;
  
  //initialize your asteroid array and fill it
  
  player1 = new Spaceship((float)width/2, (float)height/2, 1, 0.0);
  for(int i = 0; i<8; i++) {
    if(i%2 == 0)
      lotsOfAsteroid.add(new Asteroidv2((float)(Math.random()*800), (float)(Math.random()*600), (float)(Math.random()+1.5), (float)(Math.random()*360), (float)(Math.random()*360)));
    else
      lotsOfAsteroid.add(new Asteroid((float)(Math.random()*800), (float)(Math.random()*600), (float)(Math.random()+1.5), (float)(Math.random()*360), (float)(Math.random()*360)));
  }
  for(int i = 0; i<150; i++) {
    starFeild[i] = new Star((float)(Math.random()*800), (float)(Math.random()*600));
  }
  //initialize starfield
}


/* * * * * * * * * * * * * * * * * * * * * * *
  Drawing work here
 */
public void draw() {
  //your code here
  //Draw Starfield first 
  //TODO: Part I
  fill(0, 80);
  rect(0,0,width, height);
  for(int i = 0; i<150; i++) {
    starFeild[i].show();
  }
  
  
  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals
  checkOnasteroids();
  checkOnBullets();

  //Check for asteroid collisions against other asteroids and alter course
  //TODO: Part III, for now keep this comment in place

  //Draw asteroids
  //TODO: Part II

  //Update spaceship
  //TODO: Part I
  if(JUMP) {
    player1.hyperSpace(player1);
  }
  if(ROTATE_LEFT) {
      player1.direction -= 4.0;
    }
    if(ROTATE_RIGHT) {
      player1.direction += 4.0;
    }
    if(MOVE_FORWARD) {
      if(player1.getSpeed()<4){
        player1.speed+=.2;
      }
    }
    if(MOVE_BACKWARD) {
      if(player1.getSpeed()>-4){
        player1.speed-=.2;
      }
    }
   if (!MOVE_FORWARD && !MOVE_BACKWARD) {
    if(player1.getSpeed() < 0){
      player1.speed+=.05;
    }
    else if(player1.getSpeed() > 0){
      player1.speed-=.05;
    }
    else{
      player1.speed = 0;
    }
  }
  
  player1.update();
  if(player1.getX() >800){
     player1.x = 0;
   }
   if(player1.getX() <0){
     player1.x = 800;

   }
   if(player1.getY()>600){
     player1.y = 0;
   }
   if(player1.getY() <0){
     player1.y = 600;
   }
   

    for(int i = 0; i<8; i++) {
      Asteroid ass = (Asteroid)lotsOfAsteroid.get(i);
      ass.update();
      ass.show();
      if(ass.getX() >800)
       ass.x = 0;
     if(ass.getX() <0)
       ass.x = 800;
     if(ass.getY()>600)
       ass.y = 0;
     if(ass.getY() <0)
       ass.y = 600;
    }
  
  //Check for ship collision agaist asteroids
  //TODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part I, for now just render ship
 
  player1.show();
  
  if(SPACE_BAR) {
    player1.fired(); 
    
  }
  for(int i = 0; i<player1.clip.size(); i++) {
    if(i<player1.round) {  
      Bullet asg = (Bullet)player1.clip.get(i);
      asg.show();
      asg.update();
      if(asg.getX() >800){
        player1.spent(i);
      }
      if(asg.getX() <0){
        player1.spent(i);
      }
      if(asg.getY() >600){
        player1.spent(i);
      }
      if(asg.getY() <0){
        player1.spent(i);
      }
        
    }
  }
  //TODO: Part IV - we will use a new feature in Java called an ArrayList, 
  //so for now we'll just leave this comment and come back to it in a bit. 
  
  //Update score
  //TODO: Keep track of a score and output the score at the top right
}



/* * * * * * * * * * * * * * * * * * * * * * *
  Record relevent key presses for our game
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      ROTATE_LEFT = true;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = true;
    }else if(keyCode == DOWN ) {
      MOVE_BACKWARD = true;
    }
    else if (keyCode == UP) {
      MOVE_FORWARD = true;
    }
  }
  if(keyCode == 72) {
    JUMP = true;
    
  }

  //32 is spacebar
  if (keyCode == 32) {  
    SPACE_BAR = true;
  }
}



/* * * * * * * * * * * * * * * * * * * * * * *
  Record relevant key releases for our game.
 */
void keyReleased() {  
  if (key == CODED) { 
    if (keyCode == LEFT) {
      ROTATE_LEFT = false;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = false;
    } 
    else if(keyCode == DOWN ) {
      MOVE_BACKWARD = false;
    }else if (keyCode == UP) {
      MOVE_FORWARD = false;
    }
  }
  if (keyCode == 32) {
    SPACE_BAR = false;
  }
  if (keyCode == 72) {  
    JUMP = false;
  }
}

void checkOnasteroids(){
  for(int i = 0; i < lotsOfAsteroid.size(); i++) {
    Asteroid a = (Asteroid)lotsOfAsteroid.get(i);
    for(int j = 0; j < lotsOfAsteroid.size(); j++) {
      Asteroid b = (Asteroid)lotsOfAsteroid.get(j);;
      if( i != j && a.collidingWith(b)){
        a.direction = a.direction-150;
        b.direction = b.direction +160;
      }
    } 
  }
  
}

void checkOnBullets() {
  for(int i = 0; i < lotsOfAsteroid.size(); i++) {
    Asteroid ass = (Asteroid)lotsOfAsteroid.get(i);
    for(int j = 0; j<player1.clip.size(); j++) {
      if(j<player1.round) {  
        Bullet asg = (Bullet)player1.clip.get(j);
        if(asg.collidingWith(ass)){
          player1.spent(j); 
          
        }
      }
    }
  }
          
}
