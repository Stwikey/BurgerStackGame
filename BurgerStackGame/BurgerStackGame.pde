BurgerMenu menu = new BurgerMenu();
BurgerSpawner spawner = new BurgerSpawner();
void setup(){
  size(400, 400);
  noStroke();
  menu.drawMenu(menu.generateMenu());
}

void draw(){
  background(255);
  spawner.updatePieces();
}

void keyPressed(){
  spawner.spawnBurger(1);
}
