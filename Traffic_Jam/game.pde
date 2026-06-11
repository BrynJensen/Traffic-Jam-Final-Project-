void game() {  
  T1T = truckY1 - truckH1/2;
  T1B = truckY1 + truckH1/2;
  T1L = truckX1 - truckW1/2;
  T1R = truckX1 + truckW1/2;
  
  RT = redY - redH/2;
  RB = redY + redH/2;
  RR = redX + redW/2;
  RL = redX - redW/2;
  
  BT = blueY - blueH/2;
  BB = blueY + blueH/2;
  BR = blueX + blueW/2;
  BL = blueX - blueW/2;
  
  collisionTR(T1L, T1R, T1T, T1B, RL, RR, RT, RB); //COLLISION BETWEEN TOP TRUCK AND RED
    
    
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
  rect(dashX, height/2, 80, 25);
  rect(dashX + 160, height/2, 80, 25);
  rect(dashX + 320, height/2, 80, 25);
  rect(dashX + 480, height/2, 80, 25);
  rect(dashX + 640, height/2, 80, 25);

  dashX += dashS;
  if (dashX > 80) {
    dashX = -80;
  }

  if (dashS < 12) dashS += 0.003;

  //DRAW CARS
  fill(red);
  rect(redX, redY, redW, redH, 15, 5, 5, 15);

  fill(blue);
  rect(blueX, blueY, blueW, blueH, 15, 5, 5, 15);

  //DRAW TRUCKS
  fill(truck);
  rect(truckX1, truckY1, truckW1, truckH1, 15, 5, 5, 15);
  rect(truckX1 - 1100, 575, 200, 100, 15, 5, 5, 15);

  truckX1 += dashS/2;

  if (truckX1 >= width + 1400) {
    truckX1 = -200;
  }

  //TRUCK COLLISIONS
  

  if (collisionRightTR == true) redX += dashS/2;

  //CAR MOVEMENT
  if (wkey == true && redY > 125 + redH/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionBottomTR != true) redY -= 5;
  if (akey == true && redX > redW/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionRightTR != true) redX -= 5;
  if (skey == true && redY < height - 125 - redH/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionTopTR != true) redY += 5;
  if (dkey == true && redX < width - redW/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionLeftTR != true) redX += 5;

  if (upkey == true && blueY > 125 + blueH/2 && left == false && bottom == false && top == false && right == false && blueY >= 150 && blueY <= 750) blueY -= 5;
  if (leftkey == true && blueX > blueW/2 && left == false && bottom == false && top == false && right == false && blueY >= 150 && blueY <= 750) blueX -= 5;
  if (downkey == true && blueY < height - 125 - blueH/2 && left == false && bottom == false && top == false && right == false && blueY >= 150 && blueY <= 750) blueY += 5;
  if (rightkey == true && blueX < width - blueW/2 && left == false && bottom == false && top == false && right == false && blueY >= 150 && blueY <= 750) blueX += 5;

  //CAR COLLISIONS
  if (blueY - redY <= blueH/2 + redH/2 && redX - blueX < 100 && blueX - redX < 100 && blueY - redY >= 0) {
    bottom = true;
  }
  if (redY - blueY <= blueH/2 + redH/2 && redX - blueX < 100 && blueX - redX < 100 && redY - blueY >= 0) {
    top = true;
  }
  if (blueX - redX <= blueW/2 + redW/2 && blueY - redY < 50 && redY - blueY < 50 && blueX - redX >= 0) {
    right = true;
  }
  if (redX - blueX <= blueW/2 + redW/2 && blueY - redY < 50 && redY - blueY < 50 && redX - blueX >= 0) {
    left = true;
  }

  if (bottom == true) counterBottom ++;
  if (top == true) counterTop ++;
  if (right == true) counterRight ++;
  if (left == true) counterLeft ++;

  if (counterBottom > 0 && counterBottom <= 15) {
    blueY += 8;
    redY -= 8;
  } else if (counterBottom > 15) {
    counterBottom = 0;
    bottom = false;
  }
  if (counterTop > 0 && counterTop <= 15) {
    blueY -= 8;
    redY += 8;
  } else if (counterTop > 15) {
    counterTop = 0;
    top = false;
  }
  if (counterLeft > 0 && counterLeft <= 15) {
    blueX -= 8;
    redX += 8;
  } else if (counterLeft > 15) {
    counterLeft = 0;
    left = false;
  }
  if (counterRight > 0 && counterRight <= 15) {
    blueX += 8;
    redX -= 8;
  } else if (counterRight > 15) {
    counterRight = 0;
    right = false;
  }

  //DYING
  if (redY <= 150) {
    redW -= 2;
    redH -= 1;
  }
  if (redY >= 750) {
    redW -= 2;
    redH -= 1;
  }

  if (blueY <= 150) {
    blueW -= 2;
    blueH -= 1;
  }
  if (blueY >= 750) {
    blueW -= 2;
    blueH -= 1;
  }

  if (blueW <= 0) mode = GAMEOVER;
  if (redW <= 0) mode = GAMEOVER;
}

void gameClicks() {
  mode = PAUSE;
}
