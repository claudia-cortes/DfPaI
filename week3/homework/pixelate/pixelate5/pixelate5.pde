// This sketch follows pixelate3. In this sketch in addition you learn how to create an
//arraylist of rectangles that will simulate pixelation. This is done through making a class
// that will be called inside the main drawing in order to draw at once a rectangle in every pixel
// of the original image. See detailed explanation ahead.

// you set up variables that will determine the position of every pixel later on. This will
// be done by using a for loop. You also set a variable to set an specific size of the rectangles
// that will be drawn
PImage hand;
int x;
int y;
int n;
int p;
int pix = 15;
color c;
Pxl myPxl;

// you call an arraylist of all of this Pixels that will be drawn at once over each pixel 
// in the image
ArrayList<Pxl> Friends;

void setup() {
  size(500, 500);
  hand = loadImage("hand.jpg");
  image(hand, 0, 0);
  
  // this is part of the structure of any arrylist to review this see sketch triangles
  Friends = new ArrayList<Pxl>();

// you set up a nested loop to read every pixel of the image you are working with. With this
// you will get the color of every pixel at once and draw a class PxL with it. 
  for (x = 0; x < width; x+=pix) {
    for (y = 0; y < height; y+= pix) {
      c = get(x, y);
      Friends.add(new Pxl(x, y, pix, c));
    }
  }
}


void draw() {
  // with this for loop you set the pixels to be limited by the size of the rectangle. In
  // this way you avoid rectangles to be drwan over each other. Then a Pxl is drawn only after
  // another one has finished
  for (int m = 0; m < Friends.size (); m++) {
    Pxl myPxl = (Pxl) Friends.get(m);
    myPxl.display();
  }
}
