// In this sketch you learn how to replace the background of a video of an specific image
// See detailes explanation ahead.

// You need to download the library to read video inside processing. 
// You will find this in sketch.
import processing.video.*;

// You generate the variables to read the video and to subsitute the backgroudn for an image
// call back depending on the threshold
PImage background;
PImage replace;
// you use this object to start the library
Capture capture;
float threshold=10;

void setup() {
  size(640, 480);
  // you use this sintax to connect with a live camera. with this you can modify things like
  // frame rate (to see whhich frames does your camera has available see https://www.youtube.com/watch?v=WH31daSj4nc )
  // you need to put the word "this" to make the images readable in this sketch
  capture = new Capture(this, width, height);
  capture.start();
  // you use this syntax to call your external image into your sketch 
  replace=loadImage("bck.jpeg");
}

void draw() {
  // the sketch starts reading when a camera is available
  if (capture.available()) {
    capture.read();

    if (background != null) {

      loadPixels();

     
      capture.loadPixels();
      background.loadPixels();
      
      // you begin a loop to go through every pixel in the canvas
      for (int x = 0; x < capture.width; x ++ ) {
        for (int y = 0; y < capture.height; y ++ ) {
          int loc = x + y*capture.width; 
          
          
          // you read the current color of the video that is capture by the camera
          color currentColor = capture.pixels[loc]; 
          color bckgrdColor = background.pixels[loc];
          color replaceColor = replace.pixels[loc];
          
          // you set this variables to understand the difference in color that exists 
          // between the background and the object in front of the camera ( in this case a person).
          // with the variable diff (difference), the sketch is able to undestand the distance 
          // between two colors. It will give us a numeric value to see how similar this colors are.
          // to review this watch https://www.youtube.com/watch?v=h8tk0hmWB44
          float r1 = red(currentColor);
          float g1 = green(currentColor);
          float b1 = blue(currentColor);
          float r2 = red(bckgrdColor);
          float g2 = green(bckgrdColor);
          float b2 = blue(bckgrdColor);
          float diff = dist(r1, g1, b1, r2, g2, b2);

          // After understanding this difference you are able to tell the sketch a conditional
          // statement in which if the difference between this color is bigger than the threshold
          // (which is a fix number) then keep the current color. if it is not, then replace the 
          // background for the new colors that will be the image you imported in the sketch.
          if (diff > threshold) {
            pixels[loc] = currentColor;
          } else {
            pixels[loc] = replaceColor;
          }
        }
      }
      updatePixels();
    } else {
      image(capture, 0, 0);
    }
  }
}

// with this statement you tell the skecth to do this only once the a key is pressed
void keyPressed() {
  background = capture.copy();
}
