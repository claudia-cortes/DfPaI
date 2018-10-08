Ball[] balls = new Ball[5];

class Ball {
  PVector pos, vel;
  float radius;

  Ball(float x, float y, float radius) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
    this.radius = radius;
    
  }

  void update() {

    pos.add(vel);

    if ( mousePressed ) {
      pos = new PVector (mouseX, mouseY);
    } 


    if ((pos.x < radius) || (pos.x > width - radius)) {
      vel.x *= -1;
    }
    if ((pos.y < radius) || (pos.y < height - radius)) {
      vel.y *= -1;
    }
  }

  void draw() {
    ellipse(pos.x, pos.y, radius * 2, radius*2);
  }
}



void setup() {
  size(500, 500);


  for (int i = 0; i < balls.length; i++) {
    float radius = random(40, 20);
    float x = random(radius, width - radius);
    float y = random(radius, height - radius);
    balls[i] = new Ball(x, y, radius);
  }
}

void draw() {
  background(0);


  for (Ball b : balls) {
    fill(random(0, 255), random(0, 255), random(0, 255));
    b.draw();
    b.update();
  }
}
