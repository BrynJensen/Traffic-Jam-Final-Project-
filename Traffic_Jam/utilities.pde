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
  truckY1 = 325;
  truckW1 = 200;
  truckH1 = 100;

  truckX2 = -1300;
  truckY2 = 575;
  truckW2 = 200;
  truckH2 = 100;

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

void collisionT2R(float L1, float R1, float T1, float B1, float L2, float R2, float T2, float B2) {
  if (R1 >= L2 && L1 <= R2 && B1 >= T2 && T1 <= B2) {
    collisionT2R = true;
  } else {
    collisionT2R = false;
  }

  overlapRT2R = R1 - L2;
  overlapLT2R = R2 - L1;
  overlapBT2R = B1 - T2;
  overlapTT2R = B2 - T1;

  if (collisionT2R == true) {
    minOverlapT2R = min(min(overlapLT2R, overlapRT2R), min(overlapTT2R, overlapBT2R));

    if (minOverlapT2R == overlapLT2R) {
      collisionLeftT2R = true;
    } else if (minOverlapT2R == overlapRT2R) {
      collisionRightT2R = true;
    } else if (minOverlapT2R == overlapTT2R) {
      collisionTopT2R = true;
    } else if (minOverlapT2R == overlapBT2R) {
      collisionBottomT2R = true;
    }
  } else {
    minOverlapT2R = 100;
  }


  if (minOverlapT2R != overlapLT2R) {
    collisionLeftT2R = false;
  }
  if (minOverlapT2R != overlapRT2R) {
    collisionRightT2R = false;
  }
  if (minOverlapT2R != overlapTT2R) {
    collisionTopT2R = false;
  }
  if (minOverlapT2R != overlapBT2R) {
    collisionBottomT2R = false;
  }
}

void collisionTB(float L1, float R1, float T1, float B1, float L2, float R2, float T2, float B2) {
  if (R1 >= L2 && L1 <= R2 && B1 >= T2 && T1 <= B2) {
    collisionTB = true;
  } else {
    collisionTB = false;
  }

  overlapRTB = R1 - L2;
  overlapLTB = R2 - L1;
  overlapBTB = B1 - T2;
  overlapTTB = B2 - T1;

  if (collisionTB == true) {
    minOverlapTB = min(min(overlapLTB, overlapRTB), min(overlapTTB, overlapBTB));

    if (minOverlapTB == overlapLTB) {
      collisionLeftTB = true;
    } else if (minOverlapTB == overlapRTB) {
      collisionRightTB = true;
    } else if (minOverlapTB == overlapTTB) {
      collisionTopTB = true;
    } else if (minOverlapTB == overlapBTB) {
      collisionBottomTB = true;
    }
  } else {
    minOverlapTB = 100;
  }


  if (minOverlapTB != overlapLTB) {
    collisionLeftTB = false;
  }
  if (minOverlapTB != overlapRTB) {
    collisionRightTB = false;
  }
  if (minOverlapTB != overlapTTB) {
    collisionTopTB = false;
  }
  if (minOverlapTB != overlapBTB) {
    collisionBottomTB = false;
  }
}

void collisionT2B(float L1, float R1, float T1, float B1, float L2, float R2, float T2, float B2) {
  if (R1 >= L2 && L1 <= R2 && B1 >= T2 && T1 <= B2) {
    collisionT2B = true;
  } else {
    collisionT2B = false;
  }

  overlapRT2B = R1 - L2;
  overlapLT2B = R2 - L1;
  overlapBT2B = B1 - T2;
  overlapTT2B = B2 - T1;

  if (collisionT2B == true) {
    minOverlapT2B = min(min(overlapLT2B, overlapRT2B), min(overlapTT2B, overlapBT2B));

    if (minOverlapT2B == overlapLT2B) {
      collisionLeftT2B = true;
    } else if (minOverlapT2B == overlapRT2B) {
      collisionRightT2B = true;
    } else if (minOverlapT2B == overlapTT2B) {
      collisionTopT2B = true;
    } else if (minOverlapT2B == overlapBT2B) {
      collisionBottomT2B = true;
    }
  } else {
    minOverlapT2B = 100;
  }


  if (minOverlapT2B != overlapLT2B) {
    collisionLeftT2B = false;
  }
  if (minOverlapT2B != overlapRT2B) {
    collisionRightT2B = false;
  }
  if (minOverlapT2B != overlapTT2B) {
    collisionTopT2B = false;
  }
  if (minOverlapT2B != overlapBT2B) {
    collisionBottomT2B = false;
  }
}

void redBlueCollision() {
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
}

void playerMovement() {
  if (wkey == true && redY > 125 + redH/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionBottomTR != true && collisionBottomT2R != true) redY -= 5;
  if (akey == true && redX > redW/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionRightTR != true && collisionRightT2R != true) redX -= 5;
  if (skey == true && redY < height - 125 - redH/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionTopTR != true && collisionTopT2R != true) redY += 5;
  if (dkey == true && redX < width - redW/2 && left == false && bottom == false && top == false && right == false && redY >= 150 && redY <= 750 && collisionLeftTR != true && collisionLeftT2R != true) redX += 5;

  if (upkey == true && blueY > 125 + blueH/2 && left == false && bottom == false && top == false && right == false && blueY >= 150 && blueY <= 750 && collisionBottomTB != true && collisionBottomT2B != true) blueY -= 5;
  if (leftkey == true && blueX > blueW/2 && left == false && bottom == false && top == false && right == false && blueY >= 150 && blueY <= 750 && collisionRightTB != true && collisionRightT2B != true) blueX -= 5;
  if (downkey == true && blueY < height - 125 - blueH/2 && left == false && bottom == false && top == false && right == false && blueY >= 150 && blueY <= 750 && collisionTopTB != true && collisionTopT2B != true) blueY += 5;
  if (rightkey == true && blueX < width - blueW/2 && left == false && bottom == false && top == false && right == false && blueY >= 150 && blueY <= 750 && collisionLeftTB != true && collisionLeftT2B != true) blueX += 5;
}
