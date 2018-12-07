// This sketch follows pixelate3. In this sketch in addition you learn how to use the mouse
// in order to choose the position from which the sketch will chose the color in an image to
// draw a rectangle ans simulate pixelation. See detiled explanation ahead.

// Insert image in the canvas. You set up variables for a specific position that will later
// be especified by the position of the mouse
PImage hand;
int posx;
int posy;
color c;

// In setup you set the size of the canvas, load the image you have selected into the sketch
// in this case we load the image in a separate image in order to not loose the original image
// this is always better whenever you are going to modify an image.
void setup()

{
  size(450,450);
  hand = loadImage("hand.jpg");
  image(hand, 0, 0);
 
}

void draw()

{
  // as any other arry of pixels we use this to modify the pixels in an image
  hand.loadPixels();
  // this time we get the color of the pixel where the mouse is positioned
  color pixel = get(mouseX,mouseY);
  noStroke();
  fill(pixel);
  
  // we draw a rectangle in this position only when the mouse is pressed. 
  // And we draw this rectangle with the color that we get from that specific pixel
  if(mousePressed == true) {

    posx=mouseX-(mouseX%20);
    posy=mouseY-(mouseY%20);
    rect(posx,posy,20,20);
  }
  // as any time we are going to modify the pixels in a canvas we finish with this statement
  hand.updatePixels();
}
