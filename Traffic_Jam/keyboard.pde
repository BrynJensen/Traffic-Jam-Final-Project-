void keyPressed() {
  if (key == 'w' || key == 'W' && mode == GAME) wkey = true;
  if (key == 'a' || key == 'A' && mode == GAME) akey = true;
  if (key == 's' || key == 'S' && mode == GAME) skey = true;
  if (key == 'd' || key == 'D' && mode == GAME) dkey = true;

  if(keyCode == UP && mode == GAME) upkey = true;
  if(keyCode == LEFT && mode == GAME) leftkey = true;
  if(keyCode == DOWN && mode == GAME) downkey = true;
  if(keyCode == RIGHT && mode == GAME) rightkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W' && mode == GAME) wkey = false;
  if (key == 'a' || key == 'A' && mode == GAME) akey = false;
  if (key == 's' || key == 'S' && mode == GAME) akey = false;
  if (key == 'd' || key == 'D' && mode == GAME) dkey = false;
  
  if(keyCode == UP && mode == GAME) upkey = false;
  if(keyCode == LEFT && mode == GAME) leftkey = false;
  if(keyCode == DOWN && mode == GAME) downkey = false;
  if(keyCode == RIGHT && mode == GAME) rightkey = false;
}
