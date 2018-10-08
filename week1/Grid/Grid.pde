void xSmile(int a, int b) {

  fill(255, 0, 0);
  ellipse(a, b, 20, 20);
  fill(0);
  ellipse(a-5, b-3, 5, 5);
  fill(0);
  ellipse(a+5, b-3, 5, 5);
  fill(0);
  arc(a, b+3, 10, 8, 0, 3.14);
}


void setup() {
  size(500, 500);
}

void draw() {
  for(int x=0; x<width;x=x+20){
    for(int y=0; y<height; y=y+20){
      xSmile(x*2+20,y*2+20);
    }
}
}
