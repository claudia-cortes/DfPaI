// Here the class starts
class Triangle {
  PVector pos;
  float rotation;

  Triangle(float x, float y) {
    pos = new PVector(x, y);
  }

  // in this function you draw the triangle with a pink stroke; you modify the origin
  // of the triangles to be rotated towards the mouse after the class is called in 
  // the main drawing; you setup the size of the triangle and scale it by twice
  // its original size

  void draw() {
    stroke(255, 0, 120);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rotation);
    scale(2, 2);
    triangle(-5, 2, 5, 2, 0, -10);
    popMatrix();
  }

// this function calculates the angle of each triangle in order to rotate them from 
// their origin towards the mouse. Float x, Float y is replaced by mouse X, mouse Y
// in the main drawing. (remember that this particular refrenece calls the y first than the x)

  void look(float x, float y) {
    rotation = atan2 (y - pos.y, x - pos.x) + HALF_PI;
  }
}
