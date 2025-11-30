class BurgerSpawner{
  ArrayList<BurgerPiece> fallPiece = new ArrayList<BurgerPiece>();
  ArrayList<String> fallStr = new ArrayList<String>();
  String[] pieces = {"Lettuce", "Patty", "Tomato", "Cheese"};
  
  BurgerSpawner(){
    
  }
  
  void spawnBurger(int score){
    int rand = int(random(0, 4));
    PVector position = new PVector(random(100, 301), 0);
    PVector acceleration = new PVector(score*0.01, random(-0.01, 0.01));
    fallPiece.add(new BurgerPiece(position, acceleration, 1));
    fallStr.add(pieces[rand]);
  }
}
