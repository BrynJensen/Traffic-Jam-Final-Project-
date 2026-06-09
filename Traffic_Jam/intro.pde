void intro() {
  background(truck);
  
  fill(white);
  
  textSize(TS);
  text("Traffic Jam", width/2, height/2 - 100);
  
  if (textS == false) {
   TS ++; 
  } else if (textS == true) {
   TS --; 
  }
  
  if (TS > 85) {
   textS = true; 
  } else if (TS < 30){
   textS = false; 
  }
  
  textSize(30);
  text("<Click to Start>", width/2, height /2 + 100);
  
}

void introClicks() {
  mode = GAME;
}
