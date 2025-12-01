class BurgerPiece{
  
  //Pvectors for the positions
  PVector accel = new PVector(0, 0);
  PVector pos = new PVector(0, 0);
  PVector speed = new PVector(0, 0);
  float size;
  
  //BurgerPiece constructor
  BurgerPiece(PVector initialPos, PVector acceleration, float pieceSize){
    pos = initialPos;
    accel = acceleration;
    size = pieceSize;
  }
  
  //draws a lettuce piece based on the position and size
  void drawLettuce(){
    //green colour for lettuce
    fill(144, 227, 119);
    //draw the lettuce
    beginShape();
    vertex(pos.x - (35*size), pos.y - (10*size));
    vertex(pos.x + (35*size), pos.y - (10*size));
    for(float i = pos.x + (40*size); i >= pos.x - (40*size); i-= (10*size)){
      vertex(i, pos.y + (7*size));
      if(i > (pos.x-(40*size))){
        vertex(i - (5*size), pos.y + (5*size));
      }
    }
    endShape(CLOSE);
  }
  
  //draws a piece based on a string
  void drawPiece(String piece){
    
    //if the string is the burger piece name, draws that piece
    if (piece == "Patty"){
      drawPatty();
    }else if (piece == "Tomato"){
      drawTomato();
    }else if (piece == "Cheese"){
      drawCheese();
    }else if (piece == "Bun"){
      drawBun();
    }else if (piece == "Lettuce"){
      drawLettuce();
    }
  }
  
  //draws a patty
  void drawPatty(){
    //brown colour for patty
    fill(108, 99, 93);
    
    //drawing the patty based on position and size
    beginShape();
    vertex(pos.x - (40*size), pos.y - (10*size));
    vertex(pos.x + (40*size), pos.y - (10*size));
    vertex(pos.x + (40*size), pos.y + (10*size));
    vertex(pos.x - (40*size), pos.y + (10*size));
    endShape(CLOSE);
  }
  
  //draws a tomato
  void drawTomato(){
    //red colour for tomato
    fill(250, 70, 38);
    
    //drawing the tomato based on position and size
    beginShape();
    vertex(pos.x - (40*size), pos.y - (5*size));
    vertex(pos.x + (40*size), pos.y - (5*size));
    vertex(pos.x + (40*size), pos.y + (5*size));
    vertex(pos.x - (40*size), pos.y + (5*size));
    endShape(CLOSE);
  }
  
  //draws a cheese slice
  void drawCheese(){
    //yellow colour for cheese
    fill(245, 240, 82);
    
    //drawing the cheese based on position and size
    beginShape();
    vertex(pos.x - (40*size), pos.y - (2.5*size));
    vertex(pos.x + (40*size), pos.y - (2.5*size));
    vertex(pos.x + (40*size), pos.y + (2.5*size));
    vertex(pos.x -(40*size), pos.y + (2.5*size));
    endShape(CLOSE);
  }
  
  //draws a burger bun
  void drawBun(){
    //beige colour for buns
    fill(203, 189, 148);
    //drawing the bun based on position and size
    beginShape();
    vertex(pos.x - (40*size), pos.y - (10*size));
    vertex(pos.x +(40*size), pos.y - (10*size));
    vertex(pos.x + (40*size), pos.y + (10*size));
    vertex(pos.x - (40*size), pos.y + (10*size));
    endShape(CLOSE);
    
    //lighter colour for seeds
    fill(245, 236, 213);

    //drawing the seeds based on position and size
    ellipse(pos.x - (30*size), pos.y + (2*size), 5*size, 5*size);
    ellipse(pos.x - (20*size), pos.y + (5*size), 5*size, 5*size);
    ellipse(pos.x, pos.y + 2*size, 5*size, 5*size);
    ellipse(pos.x + 10*size, pos.y + 5*size, 5*size, 5*size);
    ellipse(pos.x + 17*size, pos.y, 5*size, 5*size);
  }
  
  //updates the location of the burger piece
  void updatePiece(){
    speed.add(accel);
    pos.add(speed);
  }
  
  
}
