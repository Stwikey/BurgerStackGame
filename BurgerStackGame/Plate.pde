class Plate{
  PVector location = new PVector(0, 0);
  Plate(PVector pos){
    location = pos;
  }
  
  void drawPlate(int x){
    //uses a light gray colour for the plate
    fill(220, 220, 220);
    
    //draws the plate
    beginShape();
    vertex(x - 10, 397);
    vertex(x - 30, 395);
    vertex(x - 50, 390);
    vertex(x - 70, 380);
    vertex(x + 70, 380);
    vertex(x + 50, 390);
    vertex(x + 30, 395);
    vertex(x + 10, 397);
    endShape(CLOSE);
  }
}
