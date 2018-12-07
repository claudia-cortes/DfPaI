// In this sketch you learn how to get the color of an inserted image in a random position
// and draw a rectangle of the color that that position has
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

  float x = random(width);
  float y = random (height);
  // with get in an image we select the specific color in a x and y position
  color c = hand.get (int (x), int (y));
  // this in order to draw a rectangle of that color in the same position each frame
  fill (c);
  noStroke();
  rect(x, y, 20, 20);
}
