//Bryn Jensen
//2-1
//TRAFFIC JAM
//figure out road line ebbing

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
int dashX = - 80; //ROAD LINES X MOVEMENT
float dashS = 3; //ROAD LINES SPEED


void setup() {
  size(600, 900, FX2D);
  mode = INTRO;
  
  textAlign(CENTER);
  
  //ENTITY INITIALIZATION
  
  //KEYBOARD VARIABLES INITIALIZATION
  wkey = akey = skey = dkey = upkey = leftkey = downkey = rightkey = false;
  
  //FONT LOADING
  PFont font = createFont("Magic Yellow.otf", 200);
  textFont(font);
  
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
