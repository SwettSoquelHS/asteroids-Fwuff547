import java.util.ArrayList;
/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
Spaceship player1;
ArrayList<Asteroid> lotsOfAsteroid = new ArrayList<Asteroid>();
Star[] starFeild = new Star[300];



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
  size(900, 700);
  ROTATE_LEFT = false;  
  ROTATE_RIGHT = false; 
  MOVE_FORWARD = false; 
  MOVE_BACKWARD = false;
  SPACE_BAR = false;
  JUMP = false;

  
  //initialize your asteroid array and fill it
  
  player1 = new Spaceship((float)width/2, (float)height/2, 1, 0.0);
  for(int i = 0; i<9; i++) {
    if(i%2 == 0)
      lotsOfAsteroid.add(new Asteroidv2((float)(Math.random()*width), (float)(Math.random()*height), (float)(Math.random()+2), (float)(Math.random()*360), (float)(Math.random()*360), 0));
    else
      lotsOfAsteroid.add(new Asteroid((float)(Math.random()*width), (float)(Math.random()*height), (float)(Math.random()+2), (float)(Math.random()*360), (float)(Math.random()*360), 0));
  }
  for(int i = 0; i<300; i++) {
    starFeild[i] = new Star((float)(Math.random()*width), (float)(Math.random()*height));
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
  for(int i = 0; i<300; i++) {
    starFeild[i].show();
  }
  textSize(32);
  text("Lives:"+ player1.playerlife, 10, 30);
  text("Score:"+ player1.score, width-120, height-670);
  
  
  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals
  checkOnasteroids();
  checkOnBullets();
  checkOnShip();

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
      player1.direction -= 3.0;
    }
    if(ROTATE_RIGHT) {
      player1.direction += 3.0;
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
  if(player1.getX() >width){
     player1.x = 0;
   }
   if(player1.getX() <0){
     player1.x = width;

   }
   if(player1.getY()>height){
     player1.y = 0;
   }
   if(player1.getY() <0){
     player1.y = height;
   }
   

    for(int i = 0; i<lotsOfAsteroid.size(); i++) {
      Asteroid ass = (Asteroid)lotsOfAsteroid.get(i);
      ass.update();
      ass.show();
      if(ass.getX() >width)
       ass.x = 0;
     if(ass.getX() <0)
       ass.x = width;
     if(ass.getY()>height)
       ass.y = 0;
     if(ass.getY() <0)
       ass.y = height;
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
      if(asg.getX() >width){
        player1.spent(i);
      }
      if(asg.getX() <0){
        player1.spent(i);
      }
      if(asg.getY() >height){
        player1.spent(i);
      }
      if(asg.getY() <0){
        player1.spent(i);
      }
        
   }
  }
  
  if(player1.playerlife<=0) {
     fill(0);
     rect(0,0,width, height);
     fill(#F00C0C);
     text("Game Over", width/2, height/2);
     noLoop();
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
    Asteroid a = lotsOfAsteroid.get(i);
    for(int j = 0; j < lotsOfAsteroid.size(); j++) {
      Asteroid b = lotsOfAsteroid.get(j);
      if( i != j && a.collidingWith(b) && a.collide<0 && b.collide<0){
        a.direction = a.direction-150;
        b.direction = b.direction +160;
        a.collide = 10;
        b.collide = 10;
      }
    } 
  }
  
}

void checkOnBullets() {
  for(int i = 0; i < lotsOfAsteroid.size(); i++) {
    Asteroid ass = lotsOfAsteroid.get(i);
    for(int j = 0; j<player1.clip.size(); j++) {
      if(j<player1.round) {  
        Bullet asg = player1.clip.get(j);
        if(asg.collidingWith(ass)){
          player1.spent(j);
          if(ass.getRadius() != 18) {
            lotsOfAsteroid.add(new HalfAsteroid(ass.getX()+21, ass.getY()+21, (float)(Math.random()+2.5), ass.getDirection()+90, ass.rotation, 0));
            lotsOfAsteroid.add(new HalfAsteroid(ass.getX()-21, ass.getY()-21, (float)(Math.random()+2.5), ass.getDirection()-90, ass.rotation, 0));
          }
          lotsOfAsteroid.remove(i);
          player1.score++;
          
        }
      }
    }
  }
          
}

void checkOnShip(){
  for(int i = 0; i < lotsOfAsteroid.size(); i++) {
    Asteroid a = lotsOfAsteroid.get(i);
    if(a.collidingWith(player1) && player1.collide<0){
      player1.playerlife-=1;
      player1.collide = 14;
      if(a.getRadius() != 18) {
            lotsOfAsteroid.add(new HalfAsteroid(a.getX()+21, a.getY()+21, (float)(Math.random()+2), a.getDirection()+90, a.rotation, 0));
            lotsOfAsteroid.add(new HalfAsteroid(a.getX()-21, a.getY()-21, (float)(Math.random()+2), a.getDirection()-90, a.rotation, 0));
       }
       lotsOfAsteroid.remove(i);
       player1.score++;
    } 
  } 
}
