class Plate{
  PVector pos = new PVector(0, 0);
  Plate(PVector location){
    pos = location;
  }
  
  void drawPlate(){
    //uses a light gray colour for the plate
    fill(220, 220, 220);
    
    //draws the plate
    beginShape();
    vertex(pos.x - 10, 397);
    vertex(pos.x - 30, 395);
    vertex(pos.x - 50, 390);
    vertex(pos.x - 70, 380);
    vertex(pos.x + 70, 380);
    vertex(pos.x + 50, 390);
    vertex(pos.x + 30, 395);
    vertex(pos.x + 10, 397);
    endShape(CLOSE);
  }
}
