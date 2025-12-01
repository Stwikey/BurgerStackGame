//defining global variables
int score = 0;
BurgerMenu menu = new BurgerMenu();
BurgerSpawner spawner = new BurgerSpawner();
Plate plate = new Plate(new PVector(0, 0));
int maxTime = 10;
int timer = 0;
boolean gameState = false;
ArrayList<String> menuStr = new ArrayList<String>();

void setup(){
  size(400, 400);
  noStroke();
  menuStr = menu.generateMenu();
}

void draw(){
  //checking the game state to decide if it is on the game screen or the play screen
  if(gameState){
    //draws basic items on screen
    background(255);
    drawBounds();
    timer++;//tracks the timer
    maxTime = 50 - score*5;
    //resets timer if the time has reached it
    if(timer >= maxTime){
      timer = 0;
      //spawns a burger if the time has been reached
      spawner.spawnBurger(1 + score);
    }
    //draws the menu on the screen
    menu.drawMenu(menuStr);
    
    //updates the position of items falling and on the plate
    spawner.updatePieces();
    plate.updatePlate();
    
    //updates the position of the plate based on mouseX and draws it on the screen
    plate.pos = new PVector(mouseX, 390);
    plate.drawPlate();
    
    //updates the burger pieces if they have been collected (collided with the plate)
    updatePieces();
    
    //checks if the menu item has been made
    checkMenu();
    
    //writes text on the screen ("MENU" and the score)
    fill(0);
    textSize(20);
    text("MENU", 335, 150);
    textSize(50);
    text(score, 200, 50);
    
    //checks if the burger pieces on the plate went past the game boundary
    if(plate.platePiece.size() > 0){
      
      //if the burger pieces went past the game boundary then the player loses and the game state changes
      if((plate.platePiece.get(plate.platePiece.size()-1).pos.y <= 20 + plate.plateSize.get(plate.platePiece.size()-1)/2)){
        gameState = false;
        
        //prints the ending score
        println("Score: " + score);
      }
    }
  }else if (gameState == false){
    
    //changes the screen if the game state is false
    playScreen();
  }
}

//function to check if a burger piece collided with the plate
boolean isCollide(PVector pos1, PVector pos2, float h1, float h2){
  //checks how far the y position distance is based on the heights and how far the x position distance is
  if(abs(pos1.y - pos2.y) <= (h2/2 + h1/2) && abs(pos1.x - pos2.x) <= 20) {
    
    //returns true if they are close enough
    return true;
  }else{
    
    //returns false if they are not close enough
    return false;
  }
}

//function to update the menu and score if the burger order on the plate matches the menu
boolean checkMenu(){
  
  //checks if there are enough pieces on the plate to match the menu
  if (plate.platePiece.size() >= menuStr.size()){
    
    //goes through the menu and checks if each piece matches up
    for(int i = 1; i <= menuStr.size(); i++){
      if(plate.plateStr.get(plate.plateStr.size()-i) != menuStr.get(i-1)){
        
        //if the pieces don't match, returns false
        return false;
      }
    }
    
    //if the pieces do match, removes the matching pieces from the plate and updates the visuals
    for(int i = 1; i <= menuStr.size(); i++){
      plate.platePiece.remove(plate.plateStr.size()-1);
      plate.plateSize.remove(plate.plateStr.size()-1);
      plate.plateStr.remove(plate.plateStr.size()-1);
      plate.updatePlate();
    }
    
    //generates a new menu and draws it
    menuStr = menu.generateMenu();
    menu.drawMenu(menuStr);
    
    //updates the score and returns true
    score++;
    return true;
  }else{
    
    //if the amount of pieces on the plate is too little, returns false
    return false;
  }
  
}

//function to manage falling pieces and the pieces on the plate
void updatePieces(){
  
  //goes through every falling piece on the screen
  for(int i = 0; i < spawner.fallPiece.size(); i++){
    
    //if the piece falls past the screen then deletes it from the ArrayList
    if(spawner.fallPiece.get(i).pos.y >= 450){
      spawner.fallPiece.remove(i);
      spawner.fallSize.remove(i);
      spawner.fallStr.remove(i);
     
     //if it did not fall past the screen, check if there are pieces on the plate
    }else if(plate.platePiece.size() > 0){
      
      //checks if there are pieces on the plate, if the highest piece on the plate collides with a falling piece, delete the falling piece and add it to the plate
      if(isCollide(plate.platePiece.get(plate.platePiece.size()-1).pos, spawner.fallPiece.get(i).pos, plate.plateSize.get(plate.platePiece.size()-1), spawner.fallPiece.get(i).size)){
        
        //add the falling piece to the plate
        plate.platePiece.add(new BurgerPiece(new PVector(0, 0), new PVector(0, 0), 1));
        plate.plateSize.add(spawner.fallSize.get(i));
        plate.plateStr.add(spawner.fallStr.get(i));
        plate.updatePlate();
     
        //delete the falling piece from the list of pieces that are falling
        spawner.fallPiece.remove(i);
        spawner.fallSize.remove(i);
        spawner.fallStr.remove(i);
      }
     //if there are currently no pieces on the plate, check if a falling piece collides with the plate
    }else if(isCollide(plate.pos, spawner.fallPiece.get(i).pos, 10, spawner.fallPiece.get(i).size)){
        
        //adds the piece to the plate
        plate.platePiece.add(new BurgerPiece(new PVector(0, 0), new PVector(0, 0), 1));
        plate.plateSize.add(spawner.fallSize.get(i));
        plate.plateStr.add(spawner.fallStr.get(i));
        plate.updatePlate();
     
        //deletes the falling piece from the list of falling pieces
        spawner.fallPiece.remove(i);
        spawner.fallSize.remove(i);
        spawner.fallStr.remove(i);
    }
    

  }
}

//draws the boundary for the game
void drawBounds(){
  
  //uses a red colour for the boundary
  fill(255, 0, 0);
  
  //draws the boundary
  rect(0, 20, 400, 5);
}

//the play screen for the game when it changes game states
void playScreen(){
  
  //resets all the basic variables and objects for the game to start 
  timer = 0;
  score = 0;
  menuStr = menu.generateMenu();
  plate.platePiece = new ArrayList<BurgerPiece>();
  plate.plateSize = new ArrayList<Integer>();
  plate.plateStr = new ArrayList<String>();
  spawner.fallPiece = new ArrayList<BurgerPiece>();
  spawner.fallSize =  new ArrayList<Integer>();
  spawner.fallStr= new ArrayList<String>();
  background(255);
  
  //draws the play button for the screen
  fill(0, 255, 0);
  ellipse(200, 200, 100, 100);
  fill(255);
  triangle(190, 180, 190, 220, 220, 200);
  
  //if the mouse clicks the play button, start the game
  if(mousePressed && mouseX >= 150 && mouseX <= 250 && mouseY >= 150 && mouseY <= 250){
    gameState = true;
  }
}
