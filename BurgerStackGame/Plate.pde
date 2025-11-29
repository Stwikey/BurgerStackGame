class Plate{
  PVector location = new PVector(0, 0);
  Plate(PVector pos){
    location = pos;
  }
  
  void drawPlate(){
    //uses a light gray colour for the plate
    fill(220, 220, 220);
    
    //draws the plate
    beginShape();
    vertex(200, 397);
    vertex(180, 395);
    vertex(160, 390);
    vertex(140, 380);
    vertex(280, 380);
    vertex(260, 390);
    vertex(240, 395);
    vertex(220, 397);
    endShape(CLOSE);
  }
}
