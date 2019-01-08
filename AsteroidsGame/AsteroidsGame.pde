/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
Spaceship player1;
//Asteroid[] asteroids;
//Star[] starField;


/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  
boolean ROTATE_RIGHT; 
boolean MOVE_FORWARD; 
boolean MOVE_BACKWARD;
boolean SPACE_BAR;    //User is pressing space bar

  
/* * * * * * * * * * * * * * * * * * * * * * *
  Initialize all of your variables and game state here
 */
public void setup() {
  size(800, 600);
  ROTATE_LEFT = false;  
  ROTATE_RIGHT = false; 
  MOVE_FORWARD = false; 
  MOVE_BACKWARD = false;
  
  //initialize your asteroid array and fill it
  
  player1 = new Spaceship((float)width/2, (float)height/2, 1, 0.0);
  
  //initialize starfield
}


/* * * * * * * * * * * * * * * * * * * * * * *
  Drawing work here
 */
public void draw() {
  //your code here
  background(#2C3190);
  
  //Draw Starfield first 
  //TODO: Part I
  fill(#2C3190, 80);
  rect(0,0,width, height);
  
  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals

  //Check for asteroid collisions against other asteroids and alter course
  //TODO: Part III, for now keep this comment in place

  //Draw asteroids
  //TODO: Part II

  //Update spaceship
  //TODO: Part I
  if(ROTATE_LEFT) {
      player1.direction -= 3.0;
    }
    if(ROTATE_RIGHT) {
      player1.direction += 3.0;
    }
    if(MOVE_FORWARD) {
      if(player1.speed<3){
        player1.speed+=.1;
      }
    }
    if(MOVE_BACKWARD) {
      if(player1.speed>-3){
        player1.speed-=.1;
      }
    }
   if (!MOVE_FORWARD && !MOVE_BACKWARD) {
    if(player1.speed < 0){
      player1.speed+=.05;
    }
    if(player1.speed > 0){
      player1.speed-=.05;
    }
    if(player1.speed == 0){
      player1.speed = 0;
    }
  }
  player1.update();
  if(player1.x >800){
     player1.x = 0;
   }
   if(player1.x <0){
     player1.x = 800;

   }
   if(player1.y>600){
     player1.y = 0;
   }
   if(player1.y <0){
     player1.y = 600;
   }
  
  //Check for ship collision agaist asteroids
  //TODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part I, for now just render ship
  player1.show();
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
}
