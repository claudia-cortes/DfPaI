Dbox d;

void setup() {
  size(500, 500, P3D);
  d = new Dbox();
}

void draw() {
  background(30);
  d.move();
  d.display();
  d.end();
}
