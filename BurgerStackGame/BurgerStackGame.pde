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
  if(gameState){
    background(255);
    drawBounds();
    timer++;
    maxTime = 50 - score*10;
    if(timer >= maxTime){
      timer = 0;
      spawner.spawnBurger(1 + score);
    }
    menu.drawMenu(menuStr);
    spawner.updatePieces();
    plate.updatePlate();
    plate.pos = new PVector(mouseX, 390);
    plate.drawPlate();
    updatePieces();
    checkMenu();
    fill(0);
    textSize(20);
    text("MENU", 335, 150);
    textSize(50);
    text(score, 200, 50);
    if(plate.platePiece.size() > 0){
      if((plate.platePiece.get(plate.platePiece.size()-1).pos.y <= 20 + plate.plateSize.get(plate.platePiece.size()-1)/2)){
        gameState = false;
      }
    }
  }else{
    playScreen();
  }
}
boolean isCollide(PVector pos1, PVector pos2, float h1, float h2){
  if(abs(pos1.y - pos2.y) <= (h2/2 + h1/2) && abs(pos1.x - pos2.x) <= 20) {
    return true;
  }else{
    return false;
  }
}

boolean checkMenu(){
  if (plate.platePiece.size() >= menuStr.size()){
    for(int i = 1; i <= menuStr.size(); i++){
      if(plate.plateStr.get(plate.plateStr.size()-i) != menuStr.get(i-1)){
        return false;
      }
    }
    for(int i = 1; i <= menuStr.size(); i++){
      plate.platePiece.remove(plate.plateStr.size()-1);
      plate.plateSize.remove(plate.plateStr.size()-1);
      plate.plateStr.remove(plate.plateStr.size()-1);
      plate.updatePlate();
    }
    menuStr = menu.generateMenu();
    menu.drawMenu(menuStr);
    score++;
    return true;
  }else{
    return false;
  }
  
}

void updatePieces(){
  for(int i = 0; i < spawner.fallPiece.size(); i++){
    if(spawner.fallPiece.get(i).pos.y >= 450){
      spawner.fallPiece.remove(i);
      spawner.fallSize.remove(i);
      spawner.fallStr.remove(i);
    }else if(plate.platePiece.size() > 0){
      if(isCollide(plate.platePiece.get(plate.platePiece.size()-1).pos, spawner.fallPiece.get(i).pos, plate.plateSize.get(plate.platePiece.size()-1), spawner.fallPiece.get(i).size)){
        plate.platePiece.add(new BurgerPiece(new PVector(0, 0), new PVector(0, 0), 1));
        plate.plateSize.add(spawner.fallSize.get(i));
        plate.plateStr.add(spawner.fallStr.get(i));
        plate.updatePlate();
     
        spawner.fallPiece.remove(i);
        spawner.fallSize.remove(i);
        spawner.fallStr.remove(i);
      }
    }else if(isCollide(plate.pos, spawner.fallPiece.get(i).pos, 10, spawner.fallPiece.get(i).size)){
        plate.platePiece.add(new BurgerPiece(new PVector(0, 0), new PVector(0, 0), 1));
        plate.plateSize.add(spawner.fallSize.get(i));
        plate.plateStr.add(spawner.fallStr.get(i));
        plate.updatePlate();
     
        spawner.fallPiece.remove(i);
        spawner.fallSize.remove(i);
        spawner.fallStr.remove(i);
    }
    

  }
}

void drawBounds(){
  fill(255, 0, 0);
  rect(0, 20, 400, 5);
}

void playScreen(){
  println("Your Score is: " + score);
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
  fill(0, 255, 0);
  ellipse(200, 200, 100, 100);
  fill(255);
  triangle(190, 180, 190, 220, 220, 200);
  if(mousePressed && mouseX >= 150 && mouseX <= 250 && mouseY >= 150 && mouseY <= 250){
    gameState = true;
  }
}
