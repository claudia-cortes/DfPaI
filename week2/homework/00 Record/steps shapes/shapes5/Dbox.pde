class Dbox {

  float x;
  float target;

  Dbox() {
    x = 100;
    target = 450;
  }

  void move() {
    x = lerp(x, target, 0.02);
  }

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

  void end() {
    if (x >= 400) {
      x=100;
    }
  }
}
