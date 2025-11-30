class BurgerSpawner{
  ArrayList<BurgerPiece> fallPiece = new ArrayList<BurgerPiece>();
  ArrayList<String> fallStr = new ArrayList<String>();
  String[] pieces = {"Lettuce", "Patty", "Tomato", "Cheese", "Bun"};
  
  BurgerSpawner(){
    
  }
  void spawnBurger(int score){
    int rand = int(random(0, 5));
    PVector position = new PVector(random(100, 301), 0);
    PVector acceleration = new PVector(0, score*0.01);
    fallPiece.add(new BurgerPiece(position, acceleration, 1));
    fallStr.add(pieces[rand]);
  }
  
  void updatePieces(){
    for(int i = 0; i < fallPiece.size(); i++){
      fallPiece.get(i).drawPiece(fallStr.get(i));
      fallPiece.get(i).updatePiece();
    }
  }
}
