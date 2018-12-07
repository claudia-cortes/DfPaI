PImage hand;


void setup() {
  size(500, 500);
  hand = loadImage("hand.jpg");
}



void draw() {
 
  loadPixels();
  hand.loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x+y*width;
      pixels[loc] = hand.pixels[loc];
      
    }
  }

  // evertime you finish to modify the pixels you need to end 
  // with this function 
  updatePixels();
}
