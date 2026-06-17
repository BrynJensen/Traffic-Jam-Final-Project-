void gameover() {  
  if (blueLives == 0 || blueW == 0) {
   background(red); 
   
   textSize(100);
   fill(white);
   text("Red Wins!", width/2, height/2);
  } else if (blueLives > 0 && blueW != 0) {
   background(blue); 
   
   textSize(100);
   fill(white);
   text("Blue Wins!", width/2, height/2);
  }
}

void gameoverClicks() {
  reset();
  mode = INTRO;
}
