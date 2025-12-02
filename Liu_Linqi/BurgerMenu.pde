class BurgerMenu{
  
  BurgerMenu(){
  }
  
  //returns a string of a randomly generated menu
  ArrayList<String> generateMenu(){
    
    //a random number to decide the size of the burger
    int pieceNum = int(random(1, 5));
    
    //variable for a number that correlates to the piece
    int randPiece = 0;
    
    //the menu in the form of a String ArrayList
    ArrayList<String> menu = new ArrayList<String>();
    
    //The burger always starts with a bun
    menu.add("Bun");
    
    //generates many random pieces based on the size of the burger
    for(int i = 0; i < pieceNum; i++){
      randPiece = int(random(1, 5));
      
      //based on the random number, add that burger piece to the list in the form of a String
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
    
    //The burger always ends with a bun
    menu.add("Bun");
    
    //returns the complete menu in a String ArrayList
    return menu;
  }
  
  //draws the menu on the screen
  void drawMenu(ArrayList<String> menu){
    
    //a white background for the menu
    fill(255);
    rect(320, 0, 80, 140);
    
    //goes through every piece on the menu and draws it
    for(int i = 0; i < menu.size(); i++){
      
      //draw the burger piece spaced out from eachother 
      BurgerPiece piece = new BurgerPiece(new PVector(360, i + 20*(i+1)), new PVector(0, 0), 0.55);
      piece.drawPiece(menu.get(i));
    }
  }
}
