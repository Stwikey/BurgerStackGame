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
}
