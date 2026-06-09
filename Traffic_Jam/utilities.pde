void reset() {
  wkey = akey = skey = dkey = upkey = leftkey = downkey = rightkey = false;
  bottom = top = right = left = false;
  collisionTop = collisionBottom = collisionRight = collisionLeft = false;
  
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
  
  truckX = -200;
  
  dashS = 3;
  dashX = - 80;
  TS = 60;
  
  counterBottom = 0;
  counterTop = 0;
  counterRight = 0;
  counterLeft = 0;
}
