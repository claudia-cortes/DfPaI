// In this sketch you learn how to modify each of the pixels that are within the canvas
// at once. In this specific case how to moidfy their color
// See detailed explanation of each element ahead.

// you establish the size of the canvas
void setup() {
  size(800, 800);
}

// set the background initial color

void draw() {
  background(50);

  // everytime you are going to modify the pixels you need to start 
  // with this function 
  loadPixels();

  // tha nested loop allows you to make something happen
  // (in this case to modify their color) to all the pixels 
  // along the "y"axis and along the "x" axis

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      pixels[x+y*width] = color (x/2, y/2, y/2);
      // the formula "x + y = width" allows you to go along all the pixels 
      // because of the poxels array and modify their color at once by
      // modifying the RGB parameters
    }
  }

  // evertime you finish to modify the pixels you need to end 
  // with this function 
  updatePixels();
}
