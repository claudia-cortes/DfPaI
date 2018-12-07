// In this sketch you learn how to draw an element repeatedly within a grid. You do this
// by establishing the parameters of this element in a function that will be called later
// in a nested loop.
// See detailed explanation of each element ahead.

// This is the function that will contain the figures that form the element. In this case
// a smiley face is drawn by 4 circles and one arc. The postion of these shapes are 
// relative to where the elemen will be displayed inside the grid. 

// we create this relationship by expecting parameters inside the function that will
// then be determined in the loop

// This is the function of the element smiley face
void xSmile(int a, int b) {

  // This are the shepes that will draw the smiley face
  fill(255, 0, 0);
  ellipse(a, b, 20, 20);
  fill(0);
  ellipse(a-5, b-3, 5, 5);
  fill(0);
  ellipse(a+5, b-3, 5, 5);
  fill(0);
  arc(a, b+3, 10, 8, 0, 3.14);
}


// Here you determine the size of the canvas
void setup() {
  size(500, 500);
}

// with this nested loop we draw the smiley face funtion every 20 pixels inside the canvas. 
// the multiplication determines the spacing between the faces. 
void draw() {
  for(int x=0; x<width;x=x+20){
    for(int y=0; y<height; y=y+20){
      xSmile(x*2+10,y*2+10);
    }
}
}
