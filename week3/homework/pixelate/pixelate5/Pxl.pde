// This is the calss that will draw the recatgles that will simulate pixelation
// You set up variables that will defined in the main drawing later by the position
// of every pixel in the image. The color variable will also be defined there
class Pxl {
  float x;
  float y;
  float l;
  color clr;

  
  Pxl(float _x, float _y, float _l, color _clr) {
    x = _x;
    y = _y;
    l = _l;
    clr = _clr;
  }

  
 void display() {
    noStroke();
    fill(clr);   
    rect(x, y, l, l);
  }
}
