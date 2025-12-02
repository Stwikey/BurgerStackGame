class Plate{
  //uses ArrayLists to keep track of the pieces on the plate
  ArrayList<BurgerPiece> platePiece = new ArrayList<BurgerPiece>();
  ArrayList<String> plateStr = new ArrayList<String>();
  ArrayList<Integer> plateSize = new ArrayList<Integer>();
  PVector pos = new PVector(0, 0);
  Plate(PVector location){
    pos = location;
  }
  
  void drawPlate(){
    //uses a light gray colour for the plate
    fill(220, 220, 220);
    
    //draws the plate based on an x position
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
  //updates how the burger pieces look like on the plate
  void updatePlate(){
    
    //checks if the amount of pieces on the plate is greater than 0
    if(platePiece.size() > 0){
      
      //draws the first burger piece on the plate
      platePiece.get(0).pos = new PVector(pos.x, pos.y - 10 - plateSize.get(0)/2);
      platePiece.get(0).drawPiece(plateStr.get(0));
      
      //draws the rest of the pieces on top of eachother based on their own thickness and changes their position according tot he plate position
      for(int i = 1; i < platePiece.size(); i++){
        platePiece.get(i).pos = new PVector(pos.x, platePiece.get(i-1).pos.y - plateSize.get(i-1)/2 - plateSize.get(i)/2);
        platePiece.get(i).drawPiece(plateStr.get(i));
      }
    }
     
  }
}
