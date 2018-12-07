// Here the class line begins. You do this in order to call this several times in the main 
// canvas and drwa each edge of an specific shape
int dboxesPerLine = 30;

// you set two vectors inside which the box will move in order to represent a line

class Line {
  PVector start;
  PVector end;
  Dbox[] boxes= new Dbox[dboxesPerLine];

  Line(PVector start, PVector end) {
    this.start = new PVector(start.x, start.y, start.z);
    this.end = new PVector(end.x, end.y, end.z);

    // you draw the index of boxes inside the canvas
    for (int i=0; i<dboxes.length; i++) {
      dboxes[i] = new Dbox();
    }
  }

  void draw() {
    // you call the functions inside the class Dbox
    for (Dbox b : dboxes) {
      b.update(start, end);
      b.draw();
    }
  }
}
