class BurgerMenu{
  
  BurgerMenu(){
  }
  
  ArrayList<String> generateMenu(){
    int pieceNum = int(random(1, 5));
    int randPiece = 0;
    ArrayList<String> menu = new ArrayList<String>();
    menu.add("Bun");
    for(int i = 0; i < pieceNum; i++){
      randPiece = int(random(1, 5));
      if(randPiece == 1){
        menu.add("Lettuce");
      }else if(randPiece == 2){
        menu.add("Tomato");
      }else if(randPiece == 3){
        menu.add("Patty");
      }else if(randPiece == 4){
        menu.add("Cheese");
      }
    }
    menu.add("Bun");
    for(int i = 0; i< menu.size(); i++){
      println(menu.get(i));
    }
    return menu;
  }
  
  void drawMenu(ArrayList<String> menu){
    fill(255);
    rect(320, 0, 80, 140);
    for(int i = 0; i < menu.size(); i++){
      BurgerPiece piece = new BurgerPiece(new PVector(360, i + 20*(i+1)), new PVector(0, 0), 0.55);
      piece.drawPiece(menu.get(i));
    }
  }
}
