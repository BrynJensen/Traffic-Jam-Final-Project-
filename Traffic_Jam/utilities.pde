void reset() {
  wkey = akey = skey = dkey = upkey = leftkey = downkey = rightkey = false;
  bottom = top = right = left = false;
  collisionTopTR = collisionBottomTR = collisionRightTR = collisionLeftTR = false;

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

  truckX1 = -200;

  dashS = 3;
  dashX = - 80;
  TS = 60;

  counterBottom = 0;
  counterTop = 0;
  counterRight = 0;
  counterLeft = 0;
}

void collisionTR(float L1, float R1, float T1, float B1, float L2, float R2, float T2, float B2) {
  if (R1 >= L2 && L1 <= R2 && B1 >= T2 && T1 <= B2) {
    collisionTR = true;
  } else {
    collisionTR = false;
  }

  overlapRTR = R1 - L2;
  overlapLTR = R2 - L1;
  overlapBTR = B1 - T2;
  overlapTTR = B2 - T1;

  if (collisionTR == true) {
    minOverlapTR = min(min(overlapLTR, overlapRTR), min(overlapTTR, overlapBTR));

    if (minOverlapTR == overlapLTR) {
      collisionLeftTR = true;
    } else if (minOverlapTR == overlapRTR) {
      collisionRightTR = true;
    } else if (minOverlapTR == overlapTTR) {
      collisionTopTR = true;
    } else if (minOverlapTR == overlapBTR) {
      collisionBottomTR = true;
    }
  } else {
   minOverlapTR = 100; 
  }


  if (minOverlapTR != overlapLTR) {
    collisionLeftTR = false;
  }
  if (minOverlapTR != overlapRTR) {
    collisionRightTR = false;
  }
  if (minOverlapTR != overlapTTR) {
    collisionTopTR = false;
  }
  if (minOverlapTR != overlapBTR) {
    collisionBottomTR = false;
  }
}
