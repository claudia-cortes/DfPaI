// In this skecth you learn how to use the gui library of processing to set up a controller.
// In this specfical example you set three sliders to contro the rgb values of the background
// color. See detailed explanation ahead.

// You import this library to create a gui
import controlP5.*;

// you set up variables to measure the rgb parameters in a 100 scale depending on the
// position of the slider. And you set variable to set up the position of each slider in
// reference to each other. To review gui parameters see: 
// http://www.sojamo.de/libraries/controlP5/#resources
ControlP5 cp5;
int sliderValue1 = 100;
int sliderValue2 = 100;
int sliderValue3 = 100;
int r;
int g;
int b;
float x;
float y;


void setup() {
  size(500, 500);
  noStroke();
  // you set the position to draw each slider in reference to this x and y
  x =  width/3.5;
  y =  height/3;
  cp5 = new ControlP5(this);

  // you create each slider a time by using this command line
  cp5.addSlider("sliderValue1")
    // you set origin of the slider
    .setPosition(x, y)
    //then the size in this case width and height (as any other rect)
    .setSize(200, 20)
    // then the range that will be the 255 range in which a color is measured using RGB
    .setRange(0, 255)
    // and at the end you set the initial value in which the color will start
    .setValue(204);

  cp5.addSlider("sliderValue2")
    .setPosition(x, y+20)
    .setSize(200, 20)
    .setRange(0, 255)
    .setValue(102);

  cp5.addSlider("sliderValue3")
    .setPosition(x, y+40)
    .setSize(200, 20)
    .setRange(0, 255)
    .setValue(153);
}

void draw() {
  // you refer to each variable in order to set the background
  background(r, g, b);
  r = sliderValue1;
  g = sliderValue2;
  b = sliderValue3;
  // you set up the rectangle above the sliders that will be used to drag the sliders 
  // in the screen
  fill(255, 0, 120);
  rect(x, y-10, 200, 10);
}
