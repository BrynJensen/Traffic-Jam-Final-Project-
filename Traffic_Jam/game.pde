void game() {
  println(collisionLeft, collisionRight, collisionBottom, collisionTop);

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
  rect(truckX, 325, 200, 100, 15, 5, 5, 15);
  rect(truckX - 1100, 575, 200, 100, 15, 5, 5, 15);

  truckX += dashS/2;

  if (truckX >= width + 1400) {
    truckX = -200;
  }

  //TRUCK COLLISIONS
  if (redX - truckX < redW/2 + 100 && redY < 425 - redH/2 && redY > 225 + redH/2 && truckX - redX < 0) {
    collisionRight = true;
  } else { 
   collisionRight = false; 
  }
  
  if (truckX - redX < redW/2 + 100 && redY < 425 + 20 && redY > 225 - 20 && redX - truckX < 0) {
    collisionLeft = true;
  } else {
   collisionLeft = false; 
  }
  
  if (redY < 425 - 20 && redY > 325 && redX - truckX < redW/2 + 100 && truckX - redX < redW/2 + 100) {
    collisionBottom = true;
  } else {
   collisionBottom = false; 
  }
  
  if (redY > 225 + 20 && redY < 325 && redX - truckX < redW/2 + 100 && truckX - redX < redW/2 + 100) {
    collisionTop = true;
  } else {
   collisionTop = false; 
  }  
  
  if (collisionRight == true) redX += dashS/2;

  //CAR MOVEMENT
  if (wkey == true && redY > 125 + redH/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionBottom != true) redY -= 5;
  if (akey == true && redX > redW/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionRight != true) redX -= 5;
  if (skey == true && redY < height - 125 - redH/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionTop != true) redY += 5;
  if (dkey == true && redX < width - redW/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionLeft != true) redX += 5;

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
