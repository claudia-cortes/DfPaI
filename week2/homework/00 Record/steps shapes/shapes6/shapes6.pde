Dbox [] dboxes = new Dbox [40];

void setup() {
  size(500, 500, P3D);
  for(int i = 0; i < 40; i++){
  dboxes[i] = new Dbox();
  }
}

void draw() {
  background(30);
  for(int i = 0; i < 40; i++){
  dboxes[i].move();
  dboxes[i].display();
  dboxes[i].end();
  }
}
