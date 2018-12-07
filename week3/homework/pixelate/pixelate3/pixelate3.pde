// This sketch follows pixelate2. In this sketch in addition you learn how by adding a for loop
// you draw more ellipses in each frame by using the same method of getting the color of a position
// in an image and drawing with it. To review the get adn set ina a PImage watch https://www.youtube.com/watch?v=a562vsSI2Po&vl=es
// See detailed explanation ahead.

// Insert image in the canvas
PImage hand;

// In setup you set the size of the canvas, load the image you have selected into the sketch
// and set up a background color
void setup() {
  size(500, 500);
  hand = loadImage("hand.jpg");
  background(0);
}


// In the function draw you set up variable for the sketch to work in a random position
// each frame to get the color of an specific pixel in an image and draw a rectangle in 
// that position
void draw() {
  // with this forloop we increase the number of ellipses drawn at a time per frame in the canvas
  for (int i = 0; i < 200; i++) {
    float x = random(width);
    float y = random (height);
    color c = hand.get (int (x), int (y));
    fill (c);
    noStroke();
    ellipse(x, y, 20, 20);
  }
}
