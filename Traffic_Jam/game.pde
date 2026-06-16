void game() {
  T1T = truckY1 - truckH1/2;
  T1B = truckY1 + truckH1/2;
  T1L = truckX1 - truckW1/2;
  T1R = truckX1 + truckW1/2;

  T2T = truckY2 - truckH2/2;
  T2B = truckY2 + truckH2/2;
  T2L = truckX2 - truckW2/2;
  T2R = truckX2 + truckW2/2;

  RT = redY - redH/2;
  RB = redY + redH/2;
  RR = redX + redW/2;
  RL = redX - redW/2;

  BT = blueY - blueH/2;
  BB = blueY + blueH/2;
  BR = blueX + blueW/2;
  BL = blueX - blueW/2;

  collisionTR(T1L, T1R, T1T, T1B, RL, RR, RT, RB); //COLLISION BETWEEN TOP TRUCK AND RED
  collisionT2R(T2L, T2R, T2T, T2B, RL, RR, RT, RB); //COLLISION BETWEEN BOTTOM TRUCK AND RED
  collisionTB(T1L, T1R, T1T, T1B, BL, BR, BT, BB); //COLLISION BETWEEN TOP TRUCK AND BLUE
  collisionT2B(T2L, T2R, T2T, T2B, BL, BR, BT, BB); //COLLISION BETWEEN BOTTOM TRUCK AND RED
  redBlueCollision(); //CAR COLLISIONS

  //DRAW BACKGROUND
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

  //DRAW ROADLINES
  fill(white);
  rect(dashX, height/2, 80, 25);
  rect(dashX + 160, height/2, 80, 25);
  rect(dashX + 320, height/2, 80, 25);
  rect(dashX + 480, height/2, 80, 25);
  rect(dashX + 640, height/2, 80, 25);

  //ROADLINE MOVEMENT
  dashX += dashS;
  if (dashX > 80) {
    dashX = -80;
  }

  if (dashS < 12) dashS += 0.003;

  //DRAW CARS
  fill(redCar);
  rect(redX, redY, redW, redH, 15, 5, 5, 15);

  fill(blueCar);
  rect(blueX, blueY, blueW, blueH, 15, 5, 5, 15);

  //DRAW TRUCKS
  fill(truck);
  rect(truckX1, truckY1, truckW1, truckH1, 15, 5, 5, 15);
  rect(truckX2, truckY2, truckW2, truckH2, 15, 5, 5, 15);

  //MOVE TRUCKS
  truckX1 += dashS/2;
  truckX2 += dashS/2;

  //RESET TRUCK POSITIONS
  if (truckX1 >= width + 800) {
    truckX1 = -200 + random(-100, 100);
  }
  if (truckX2 >= width + 100) {
   truckX2 = -1000 + random(-250, 250); 
  }

  //IF COLLIDE WITH RIGHT SIDE OF CAR MOVE CAR TO RIGHT
  if (collisionRightTR == true) redX += dashS/2;
  if (collisionRightT2R == true) redX += dashS/2;

  if (collisionRightTB == true) blueX += dashS/2;
  if (collisionRightT2B == true) blueX += dashS/2;

  //CAR MOVEMENT
  playerMovement();

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

  //RESTRICT MOVEMENT OF CARS
  if (redX >= width - redW/2) redX = width - redW/2;
  if (blueX >= width - blueW/2) blueX = width - redW/2;

  if (redX < redW/2) redX = redW/2;
  if (blueX < blueW/2) redX = redW/2;

  //LIVES/SCORING
  lives();
}

void gameClicks() {
  mode = PAUSE;
}
