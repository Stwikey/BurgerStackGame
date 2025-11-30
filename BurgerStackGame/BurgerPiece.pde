class BurgerPiece{
  PVector accel = new PVector(0, 0);
  PVector pos = new PVector(0, 0);
  PVector speed = new PVector(0, 0);
  float size;
  BurgerPiece(PVector initialPos, PVector acceleration, float pieceSize){
    pos = initialPos;
    accel = acceleration;
    size = pieceSize;
  }
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
  void drawPiece(String piece){
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
  
  
  void drawPatty(){
    //brown colour for patty
    fill(108, 99, 93);
    
    //drawing the patty
    //260, 270
    beginShape();
    vertex(pos.x - (40*size), pos.y - (10*size));
    vertex(pos.x + (40*size), pos.y - (10*size));
    vertex(pos.x + (40*size), pos.y + (10*size));
    vertex(pos.x - (40*size), pos.y + (10*size));
    endShape(CLOSE);
  }
  
  void drawTomato(){
    //red colour for tomato
    fill(250, 70, 38);
    
    //drawing the tomato
    beginShape();
    vertex(pos.x - (40*size), pos.y - (5*size));
    vertex(pos.x + (40*size), pos.y - (5*size));
    vertex(pos.x + (40*size), pos.y + (5*size));
    vertex(pos.x - (40*size), pos.y + (5*size));
    endShape(CLOSE);
  }
  
  void drawCheese(){
    //yellow colour for cheese
    fill(245, 240, 82);
    
    //drawing the cheese
    beginShape();
    vertex(pos.x - (40*size), pos.y - (2.5*size));
    vertex(pos.x + (40*size), pos.y - (2.5*size));
    vertex(pos.x + (40*size), pos.y + (2.5*size));
    vertex(pos.x -(40*size), pos.y + (2.5*size));
    endShape(CLOSE);
  }
  
  void drawBun(){
    //beige colour for buns
    fill(203, 189, 148);
    //drawing the bun
    beginShape();
    vertex(pos.x - (40*size), pos.y - (10*size));
    vertex(pos.x +(40*size), pos.y - (10*size));
    vertex(pos.x + (40*size), pos.y + (10*size));
    vertex(pos.x - (40*size), pos.y + (10*size));
    endShape(CLOSE);
    
    //lighter colour for seeds
    fill(245, 236, 213);

    //drawing the seeds
    ellipse(pos.x - (30*size), pos.y + (2*size), 5*size, 5*size);
    ellipse(pos.x - (20*size), pos.y + (5*size), 5*size, 5*size);
    ellipse(pos.x*size, pos.y + 2*size, 5*size, 5*size);
    ellipse(pos.x + 10*size, pos.y + 5*size, 5*size, 5*size);
    ellipse(pos.x + 17*size, pos.y*size, 5*size, 5*size);
  }
  
  void updatePiece(){
    speed.add(accel);
    pos.add(speed);
  }
  
  
}
