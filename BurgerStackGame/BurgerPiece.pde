class BurgerPiece{
  BurgerPiece(){
  }
  void drawLettuce(PVector pos){
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
  
  void drawPatty(PVector pos){
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
  
  void drawTomato(PVector pos){
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
    vertex(220, 260);
    vertex(300, 260);
    vertex(300, 265);
    vertex(220, 265);
    endShape(CLOSE);
  }
  
  void drawBun(){
    //beige colour for buns
    fill(203, 189, 148);
    
    //drawing the bun
    beginShape();
    vertex(220, 260);
    vertex(300, 260);
    vertex(300, 280);
    vertex(220, 280);
    endShape(CLOSE);
    
    //lighter colour for seeds
    fill(245, 236, 213);
    
    //drawing the seeds
    ellipse(230, 272, 5, 5);
    ellipse(240, 275, 5, 5);
    ellipse(260, 272, 5, 5);
    ellipse(270, 275, 5, 5);
    ellipse(287, 270, 5, 5);
  }
  
  
}
