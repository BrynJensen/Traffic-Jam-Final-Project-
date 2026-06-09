//Bryn Jensen
//2-1
//TRAFFIC JAM
//FIX bump off screen
//COLLISIONLEFT Y OFF

//IMPORT LIBRARIES
  //JAVA FX
  import processing.javafx.*;
  
  //MINIM
  import ddf.minim.*;
  import ddf.minim.analysis.*;
  import ddf.minim.effects.*;
  import ddf.minim.signals.*;
  import ddf.minim.spi.*;
  import ddf.minim.ugens.*;

//MODE FRAMEWORK
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//COLOUR PALLETTE
color red = #d85048;
color blue = #014967;
color water = #03b0da;
color waterShadow = #018dad;
color roadEdge = #575757;
color road = #2b2b2b;
color black = #000000;
color white = #FFFFFF;
color truck = #949376;

//KEYBOARD VARIABLES
boolean wkey, akey, skey, dkey, upkey, leftkey, downkey, rightkey;

//GAME VARIABLES
int TS = 60; //INTRO TEXT SIZE
boolean textS = false; //INTRO TEXT SIZE SWITCH
float dashX = - 80; //ROAD LINES X MOVEMENT
float dashS = 3; //ROAD LINES SPEED

//CAR VARIABLES
float redX, redY, redW, redH;

float blueX, blueY, blueW, blueH;

float redLives, blueLives;

float truckX;

boolean collisionTop, collisionBottom, collisionRight, collisionLeft;

//COLLISION VARIABLES
float counterBottom, counterTop, counterRight, counterLeft = 0;
boolean bottom, top, right, left; //RELATIVE TO RED SQUARE


void setup() {
  size(600, 900, FX2D);
  mode = INTRO;
  smooth();
  
  textAlign(CENTER);
  rectMode(CENTER);
  
  //ENTITY INITIALIZATION
  
  //KEYBOARD VARIABLES INITIALIZATION
  wkey = akey = skey = dkey = upkey = leftkey = downkey = rightkey = false;
  
  //COLLISION VARIABLES INITIALIZATION
  bottom = top = right = left = false;
  collisionTop = collisionBottom = collisionRight = collisionLeft = false;
  
  //FONT LOADING
  PFont font = createFont("Magic Yellow.otf", 200);
  textFont(font);
  
  //CAR INITIALIZATION
  redX = width/2;
  redY = height/2 - 75;
  redW = 100;
  redH = 50;
  
  
  blueX = width/2;
  blueY = height/2 + 75;
  blueW = 100;
  blueH = 50;
  
  redLives = 3;
  blueLives = 3;
  
  truckX = -200;
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
