
void setup() {
  size(800, 800);
  }

void draw() {
  background(50);
  

  loadPixels();
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
    pixels[x+y*width] = color (x/2,y/2,y/2);
    
    }
  }
  updatePixels();
}
