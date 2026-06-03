void game() {
  println(dashS);
  
  background(water);
  noStroke();
  
  fill(waterShadow);
  rect(0, height/2 - 315, width, 50);
  
  fill(black);
  rect(0, height/2 - 265, width, 580);
  
  fill(roadEdge);
  rect(0, height/2 - 250, width, 550);
  
  fill(road);
  rect(0, height/2 - 225, width, 500);
  
  fill(white);
  rect(dashX, height/2 + 25, 80, 20);
  rect(dashX + 160, height/2 + 25, 80, 20);
  rect(dashX + 320, height/2 + 25, 80, 20);
  rect(dashX + 480, height/2 + 25, 80, 20);
  rect(dashX + 640, height/2 + 25, 80, 20);
  
  dashX += dashS;
  if (dashX > 80) {
   dashX = -80; 
  }
  
  if (dashS < 12) dashS += 0.003;
}

void gameClicks() {
  mode = PAUSE;
}
