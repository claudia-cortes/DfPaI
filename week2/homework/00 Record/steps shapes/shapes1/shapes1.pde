float yRot;

void setup() {
  size(500, 500, P3D);
  
 
  
}

void draw() {
  background(30);
  pushMatrix();
  translate(width/2, height/2);
  rotateY(yRot);
  yRot += 0.01;
  stroke(255,0,0);
  box(50);
  popMatrix();
  
  
  
  
 
}
