// This skecth follows the sketch BouncingBalls
// In this sketch you learn how to randomly modify the colors of all the balls contained
// in the array and how to follow the mouse by subtituting the position of the balls to the position
// of the mouse and setting a magnitude to slowly move towards it.
// to review the balls following the mouse review sketch Ball_acceleration
//See detailed explanation of each element ahead.

// Here the drawing begins

// This array determines the number of balls to be displayed
Ball[] balls = new Ball[10];

// Inside this function we can found the for loop to draw the balls and keep them inside 
// the canvas including the limits of each ball. 
void setup() {
  size(500, 500);


  for (int i = 0; i < balls.length; i++) {
    float radius = random(10,40);
    float x = random(radius, width - radius);
    float y = random(radius, height - radius);
    balls[i] = new Ball(x, y, radius);
  }
}

// with these two functions (the one above and the one below) we call the class ball
// into the drawing. We call the funtions of the class with a specific structure that is 
// formed by an array, an index that calls new Ball and the functions that the class has
// exmaple:
//Ball[] balls = new Ball[100]; 
//balls[i] = new Ball(x, y, radius);
//b.draw();

void draw() {
  background(0);


  for (Ball b : balls) {
    b.draw();
    b.update();
    b.mousePressed();
  }
}
