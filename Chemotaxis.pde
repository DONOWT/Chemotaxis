Bacteria[] sue;
//declare bacteria variables here
void setup() {
  size(1000, 1000);
  sue = new Bacteria[100];
  for (int i = 0; i < sue.length; i++) {
    sue[i] = new Bacteria((int)(Math.random()*1000), (int)(Math.random()*1000));
  }
}

void draw() {
  background(0, 0, 0);
  for (int i = 0; i < sue.length; i++) {
    if (sue[i].alive == true) {
      sue[i].move();
      sue[i].show();
      sue[i].click(mouseX,mouseY);
      for (int a = 0; a < sue.length; a++) {
        if ((sue[a].alive == true) && (sue[i].R != sue[a].R)) {
          if (dist(sue[i].myX, sue[i].myY, sue[a].myX, sue[a].myY) <= (sue[i].size)/2) {
            sue[i].size = sue[i].size + (sue[a].size)/2;
            sue[a].alive = false;
          }
        }
      }
    }
  }
  ellipse(mouseX,mouseY,10,10); 
}
class Bacteria {
  int myX, myY, R, G, B;
  int size;
  boolean alive;
  Bacteria(int x, int y) {
    myX = x;
    myY = y;
    size = 50;
    alive = true;
    R = (int)(Math.random()*255);
    G = (int)(Math.random()*255);
    B = (int)(Math.random()*255);
  }
  void move() {
    myX = myX + (int)(Math.random()*5)-2;
    if (myX < 0)
      myX = 0;
    if (myX > 1000)
      myX = 1000;
    myY = myY + (int)(Math.random()*5)-2;
    if (myY < 0)
      myY = 0;
    if (myY > 1000)
      myY = 1000;
  }
  void show() {
    fill(R, G, B);
    ellipse((float)myX, (float)myY, size, size);
  }
  void click(int xx, int yy) {
    if (xx > myX)
      myX = myX + (int)(Math.random()*4) - 2;
    else
      myX = myX + (int)(Math.random()*4) - 1;
    if (yy > myY)
      myY = myY + (int)(Math.random()*4) - 2;
    else
      myY = myY + (int)(Math.random()*4) - 1;
  }
}
