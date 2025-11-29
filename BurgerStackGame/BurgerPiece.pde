class BurgerPiece{
  PVector accel = new PVector(0, 0);
  PVector pos = new PVector(0, 0);
  PVector speed = new PVector(0, 0);
  BurgerPiece(PVector initialPos, PVector acceleration){
    pos = initialPos;
    accel = acceleration;
  }
  void drawLettuce(){
    //green colour for lettuce
    fill(144, 227, 119);
    //draw the lettuce
    beginShape();
    vertex(pos.x - 40, pos.y - 10);
    vertex(pos.x + 30, pos.y - 10);
    for(float i = pos.x + 40; i >= pos.x - 50; i-= 10){
      vertex(i, pos.y + 7);
      if(i > (pos.x-50)){
        vertex(i - 5, pos.y + 5);
      }
    }
    endShape(CLOSE);
  }
  
  void drawPatty(){
    //brown colour for patty
    fill(108, 99, 93);
    
    //drawing the patty
    //260, 270
    beginShape();
    vertex(pos.x - 40, pos.y - 10);
    vertex(pos.x + 40, pos.y - 10);
    vertex(pos.x + 40, pos.y + 10);
    vertex(pos.x - 40, pos.y + 10);
    endShape(CLOSE);
  }
  
  void drawTomato(){
    //red colour for tomato
    fill(250, 70, 38);
    
    //drawing the tomato
    beginShape();
    vertex(pos.x - 40, pos.y - 5);
    vertex(pos.x + 40, pos.y - 5);
    vertex(pos.x + 40, pos.y + 5);
    vertex(pos.x - 40, pos.y + 5);
    endShape(CLOSE);
  }
  
  void drawCheese(){
    //yellow colour for cheese
    fill(245, 240, 82);
    
    //drawing the cheese
    beginShape();
    vertex(pos.x - 40, pos.y - 2.5);
    vertex(pos.x + 40, pos.y - 2.5);
    vertex(pos.x + 40, pos.y + 2.5);
    vertex(pos.x - 40, pos.y + 2.5);
    endShape(CLOSE);
  }
  
  void drawBun(){
    //beige colour for buns
    fill(203, 189, 148);
    //drawing the bun
    beginShape();
    vertex(pos.x - 40, pos.y - 10);
    vertex(pos.x + 40, pos.y - 10);
    vertex(pos.x + 40, pos.y + 10);
    vertex(pos.x - 40, pos.y + 10);
    endShape(CLOSE);
    
    //lighter colour for seeds
    fill(245, 236, 213);

    //drawing the seeds
    ellipse(pos.x - 30, pos.y + 2, 5, 5);
    ellipse(pos.x - 20, pos.y + 5, 5, 5);
    ellipse(pos.x, pos.y + 2, 5, 5);
    ellipse(pos.x + 10, pos.y + 5, 5, 5);
    ellipse(pos.x + 17, pos.y, 5, 5);
  }
  
  void updatePiece(){
    speed.add(accel);
    pos.add(speed);
  }
  
  
}
