void game() {    
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
  if(blueY - redY == blueH/2 + redH/2 && redX - blueX < 100 && blueX - redX < 100){
   top = true; 
  }
  if(redY - blueY == blueH/2 + redH/2 && redX - blueX < 100 && blueX - redX < 100) {
   bottom = true; 
  }
  if(blueX - redX == blueW/2 + redW/2 && blueY - redY < 50 && redY - blueY < 50) {
   right = true; 
  }
  if(redX - blueX == blueW/2 + redW/2 && blueY - redY < 50 && redY - blueY < 50) {
   left = true; 
  }
  
  if(top == true) counterTop ++;
  if(bottom == true) counterBottom ++;
  if(right == true) counterRight ++;
  if(left == true) counterLeft ++;
  
  if(counterTop > 0 && counterTop <= 50){
   blueY += 2;
   redY -= 2;
  } else if (counterTop > 50){
   counterTop = 0; 
   top = false;
  }
  if(counterBottom > 0 && counterBottom <= 50){
   blueY -= 2;
   redY += 2;
  } else if (counterBottom > 50){
   counterBottom = 0; 
   bottom = false;
  }
  if(counterLeft > 0 && counterLeft <= 50){
   blueX -= 2;
   redX += 2;
  } else if (counterLeft > 50){
   counterLeft = 0; 
   left = false;
  }
  if(counterRight > 0 && counterRight <= 50){
   blueX += 2;
   redX -= 2;
  } else if (counterRight > 50){
   counterRight = 0; 
   right = false;
  }
}

void gameClicks() {
  mode = PAUSE;
}
