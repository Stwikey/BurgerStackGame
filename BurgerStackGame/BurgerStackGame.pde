BurgerMenu menu = new BurgerMenu();
BurgerSpawner spawner = new BurgerSpawner();
Plate plate = new Plate(new PVector(0, 0));
ArrayList<String> menuStr = new ArrayList<String>();
void setup(){
  size(400, 400);
  noStroke();
  
  menuStr = menu.generateMenu();
}

void draw(){
  background(255);
  menu.drawMenu(menuStr);
  spawner.updatePieces();
  plate.pos = new PVector(mouseX, 390);
  plate.drawPlate();
  for(int i = 0; i < spawner.fallPiece.size(); i++){
    isCollide(plate.pos, spawner.fallPiece.get(i).pos, 10, spawner.fallPiece.get(i).size);
  }
}

void keyPressed(){
  spawner.spawnBurger(1);
}

boolean isCollide(PVector pos1, PVector pos2, float h1, float h2){
  if(abs(pos1.y - pos2.y) <= (h2/2 + h1/2) && abs(pos1.x - pos2.x) <= 10) {
    println("hit");
    return true;
  }else{
    return false;
  }
}
