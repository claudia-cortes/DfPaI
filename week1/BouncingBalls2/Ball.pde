// Here the Class begins
// A class contains all the variables for an sepcific object
class Ball {
  PVector pos, vel;
  float radius;
  PVector acc;

  // the velocity and initial position of the balls in the canvas is determined here.
  // the velocity is random between a range of (-3,3)
  Ball(float x, float y, float radius) {
    pos = new PVector(x, y);
    vel = new PVector( 2 , random(-2,2));
    acc = new PVector(0, 0);

    this.radius = radius;
  }


  // this function contains the conditional statemente that makes the balls move by
  //  adding velocity to their position. It also keeps them inside the canvas by refereing
  // to their position relative to the width and height of it.
  void update() {

    pos.add(vel);

    if(pos.x>width || pos.x<0){
    vel.x = vel.x *-1;
    }//if x
    
    if(pos.y>height || pos.y<0){
    vel.y = vel.y *-1;
    }
  }
  
  
// this function directs the ball acceleration towards the position of the mouse when 
// the mouse is Pressed. The Substraction between the position of the ball and the position
// of the mouse generates a new PVector for the follow with a magnitude of 3 in this scenario. 
  void mousePressed() {
    if (mousePressed) {
      PVector mouse = new PVector(mouseX, mouseY);
      mouse.sub(pos);
      mouse.setMag(3);
      acc = mouse;

      pos.add(vel);
      vel.add(acc);
      vel.limit(5);
    }
  }

  // This function draws the balls
  void draw() {
    // we give random colors to the balls here in a range of greens and blues
    fill(0, random(0, 255), random(0, 255));
    ellipse(pos.x, pos.y, radius * 2, radius*2);
  }
}


// Here the class ends
