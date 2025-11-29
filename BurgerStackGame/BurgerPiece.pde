class BurgerPiece{
  BurgerPiece(){
  }
  void drawLettuce(){
    //green colour for lettuce
    fill(144, 227, 119);
    //draw the lettuce
    beginShape();
    vertex(120, 200);
    vertex(190, 200);
    for(int i = 200; i >= 110; i-= 5){
      if(i%10 == 0){
        vertex(i, 217);
      }else{
        vertex(i, 215);
      }
    }
    endShape(CLOSE);
  }
  
  void drawPatty(){
    //brown colour for patty
    fill(108, 99, 93);
    
    //drawing the patty
    beginShape();
    vertex(220, 260);
    vertex(300, 260);
    vertex(300, 280);
    vertex(220, 280);
    endShape(CLOSE);
  }
  
  void drawTomato(){
    //red colour for tomato
    fill(250, 70, 38);
    
    //drawing the tomato
    beginShape();
    vertex(220, 260);
    vertex(300, 260);
    vertex(300, 270);
    vertex(220, 270);
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
