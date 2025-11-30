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
}

void keyPressed(){
  spawner.spawnBurger(1);
}
