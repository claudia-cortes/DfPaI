// Here the Class begins
// A class contains all the variables for an sepcific object
class Ball {
  // to review PVector watch: https://www.youtube.com/watch?v=7nTLzLf7jUg
  PVector pos, vel;
  float radius;
  // the velocity and initial position of the balls in the canvas is determined here.
  // the velocity is random between a range of (-3,3)
  Ball(float x, float y, float radius) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
    this.radius = radius;
  }

  // this function contains the conditional statemente that makes the balls move by
  //  adding velocity to their position. It also keeps them inside the canvas by refereing
  // to their position relative to the width and height of it. 
  void update() {

    pos.add(vel);

    if (pos.x>width || pos.x<0) {
      vel.x = vel.x *-1;
    }//if x

    if (pos.y>height || pos.y<0) {
      vel.y = vel.y *-1;
    }
  }

  // This function draws the balls as circles with a controlled random position and a 
  // controlled random radius determined by the variables above. 
  void draw() {
    ellipse(pos.x, pos.y, radius * 2, radius*2);
  }
}

// Here the class ends
