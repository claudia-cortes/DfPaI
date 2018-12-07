float x = 100;
float target = 450;


void setup() {
  size(500, 500, P3D);
  background(30);
}

void draw() {
  
  background(30);

void display() {
    
    noFill();
    noStroke();
    rect(target, height/2, 20, 20);

    pushMatrix();
    translate(x, height/2);
    fill(255);
    noStroke();
    box(10);
    popMatrix();
  }

void move() {
  x = lerp(x, target, 0.02);
}

void end() {

  if (x >= 400) {
    x=100;
  }
}

}
