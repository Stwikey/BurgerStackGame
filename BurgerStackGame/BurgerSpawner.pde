class BurgerSpawner{
  
  //ArrayLists keeps track of the pieces that are falling on the screen
  ArrayList<BurgerPiece> fallPiece = new ArrayList<BurgerPiece>();
  ArrayList<String> fallStr = new ArrayList<String>();
  ArrayList<Integer> fallSize = new ArrayList<Integer>();
  String[] pieces = {"Lettuce", "Patty", "Tomato", "Cheese", "Bun"};
  int[] size = {20, 20, 10, 5, 20};
  
  BurgerSpawner(){
    
  }
  
  //generates a random burger to fall from the screen
  void spawnBurger(int score){
    
    //uses a random integer to determine the random piece
    int rand = int(random(0, 5));
    
    //generates a random position for the burger piece to spawn at
    PVector position = new PVector(random(100, 301), 0);
    
    //acceleration is determined by the score
    PVector acceleration = new PVector(0, score*0.01);
    
    //adds the falling burger piece to the ArrayLists to keep track of
    fallPiece.add(new BurgerPiece(position, acceleration, 1));
    
    //uses the random integer as a index to determine the name of the burger piece and the height correctly
    fallStr.add(pieces[rand]);
    fallSize.add(size[rand]);
  }
  
  //updates the position of each burger piece and draws it
  void updatePieces(){
    for(int i = 0; i < fallPiece.size(); i++){
      fallPiece.get(i).drawPiece(fallStr.get(i));
      fallPiece.get(i).updatePiece();
    }
  }
}
