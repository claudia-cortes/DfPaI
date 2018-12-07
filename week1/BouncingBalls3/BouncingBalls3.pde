// This sketch follows sketch BouncingBalls 2
// In this sketch you learn how to create a new PVector for each ball when they collide.
// by using trigonometry. To review the maths see Chapter 3, 3.1 Angles, The Nature of Code
// Daniel Shiffman. See detailes explanation of each element ahead. 

// Here the drawing begins

// This array determines the number of balls to be displayed
Ball[] balls = new Ball[2];

// Here the drawing begins
// Inside this function we can found the for loop to draw the balls and keep them inside 
// the canvas including the limits of each ball. 
void setup() {
  size(500, 500);


  for (int i = 0; i < balls.length; i++) {
    float radius = random(25,50);
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
  
  //with this array we call the function checkCollision in the class Balls to determine
  // the new PVector of the balls when they collide. 
  
  balls[0].checkCollision(balls[1]);
}
