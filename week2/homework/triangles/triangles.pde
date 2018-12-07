// In this sketch you learn how to direct the rotation of the elements in a gird towards the mouse.
// this is done by obtaining the angle between thw mouse and the center of the triangle.
// we use an arraylist of triangles to set an unlimted set of triangles.
// See detailed explanation of each element ahead.


// in this case you can use both an arraylist or an array, cause the triangles at
// the end even if they are unlimited due to the array list they are limited by the 
// spacing between them and the size of the canvas
ArrayList<Triangle> friends = new ArrayList<Triangle>();

//inside this function you set three things: the size of the canvas, the variables
// that will help us draw the grid (determined by the spacing between the objects),
//and the nested loop that will draw the grid of triangles
void setup() {
  size(500, 500);

  int N = 10;
  int spacing = width / (N + 1);
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      friends.add(new Triangle( i * spacing + spacing, j * spacing + spacing ));
    }
  }
}

// in this function you draw the background and call the functions of the class Triangle
void draw() {
  background(0);

  for (Triangle t : friends) {
    t.look(mouseX, mouseY);
    t.draw();
  }
}
