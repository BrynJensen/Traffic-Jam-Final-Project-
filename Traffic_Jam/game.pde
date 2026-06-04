void game() {  
  println(top);
  
  background(water);
  noStroke();
  
  fill(waterShadow);
  rect(width/2, height/2 - 300, width, 50);
  
  fill(black);
  rect(width/2, height/2, width, 580);
  
  fill(roadEdge);
  rect(width/2, height/2, width, 550);
  
  fill(road);
  rect(width/2, height/2, width, 500);
  
  //ROAD LINES
  fill(white);
  rect(dashX, height/2 + 25, 80, 25);
  rect(dashX + 160, height/2 + 25, 80, 25);
  rect(dashX + 320, height/2 + 25, 80, 25);
  rect(dashX + 480, height/2 + 25, 80, 25);
  rect(dashX + 640, height/2 + 25, 80, 25);
  
  ////TEST
  //rect(dashX + 250, height/2 - 100, 50, 50);
  
  dashX += dashS;
  if (dashX > 80) {
   dashX = -80; 
  }
  
  if (dashS < 12) dashS += 0.003;
  
  //DRAW CARS
  fill(red);
  rect(redX, redY, 100, 50);
  
  fill(blue);
  rect(blueX, blueY, 100, 50);
  
  //CAR MOVEMENT
  if(wkey == true && redY > 125 + redH/2) redY -= 5;
  if(akey == true && redX > redW/2) redX -= 5;
  if(skey == true && redY < height - 125 - redH/2) redY += 5;
  if(dkey == true && redX < width - redW/2) redX += 5;
  
  if(upkey == true && blueY > 125 + blueH/2) blueY -= 5;
  if(leftkey == true && blueX > blueW/2) blueX -= 5;
  if(downkey == true && blueY < height - 125 - blueH/2) blueY += 5;
  if(rightkey == true && blueX < width - blueW/2) blueX += 5;
  
  //CAR COLLISIONS
  if(blueY - redY == blueH/2 + redH/2){
   top = true; 
  }
  
  if(top == true){
   counterTop ++; 
  }
  
  if(counterTop > 0 && counterTop < 50){
   blueY += 2;
   redY -= 2;
  } else if (counterTop >= 50){
   counterTop = 0; 
   top = false;
  }
}

void gameClicks() {
  mode = PAUSE;
}
