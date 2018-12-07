// Here begins the class Dbox to draw a cube

// The variables inside the class will help you establish: the dimensions of the cube
// (height, width and depth), the the amount to interpolate between two values for the 
// the lerp function (review at https://processing.org/reference/lerp_.html) and the Vector
// in which the cubes will move
  class Dbox {
  float boxSize = 5.0;
  float amt;
  float vel;
  PVector pos;

  Dbox() {
    // you set the velocity in which the cubes will move inside the PVector and the initial
    // the amount in which the cube will lerp towards a target
    vel = random(0.001);
    amt = random(1);  
  }

 // this function make the cubes move at a certain amount from an origin and towards a taget
  void update(PVector initial, PVector target) {
    float x = lerp(initial.x, target.x, amt);
    float y = lerp(initial.y, target.y, amt);
    float z = lerp(initial.z, target.z, amt);

    pos = new PVector(x, y, z);
    amt += vel;
    if (amt > 1) {
      amt = 0;
    }
  }
  
  // with this function you will establish the origin of the box as a variable in order
  // to be used in the beginning of a line that will later on form an edge of a shape
   void draw() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    // you determine the size of the box to be establish by the cycle in which the shapes
    // will appear on the canvas
    scale(1/sin(frameCount*0.01));  
    box(boxSize);
    popMatrix();
  }
  
}


  
