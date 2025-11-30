class BurgerSpawner{
  ArrayList<BurgerPiece> fallPiece = new ArrayList<BurgerPiece>();
  ArrayList<String> fallStr = new ArrayList<String>();
  ArrayList<Integer> fallSize = new ArrayList<Integer>();
  String[] pieces = {"Lettuce", "Patty", "Tomato", "Cheese", "Bun"};
  int[] size = {20, 20, 10, 5, 20};
  
  BurgerSpawner(){
    
  }
  void spawnBurger(int score){
    int rand = int(random(0, 5));
    PVector position = new PVector(random(100, 301), 0);
    PVector acceleration = new PVector(0, score*0.01);
    fallPiece.add(new BurgerPiece(position, acceleration, 1));
    fallStr.add(pieces[rand]);
    fallSize.add(size[rand]);
  }
  
  void updatePieces(){
    for(int i = 0; i < fallPiece.size(); i++){
      fallPiece.get(i).drawPiece(fallStr.get(i));
      fallPiece.get(i).updatePiece();
    }
  }
}
