class Dbox {

  float x;
  float target;
  float xspeed;

  Dbox() {
    x = 100;
    target = 450;
    xspeed = random(0,0.01);
  }

  void move() {
    x = lerp(x, target, xspeed);
  }

  void display() {
    noFill();
    noStroke();
    rect(target, height/2, 20, 20);

    pushMatrix();
    translate(x, height/2);
    fill(255);
    noStroke();
    box(5);
    popMatrix();
  }

  void end() {
    if (x >= 400) {
      x=100;
    }
  }
}
