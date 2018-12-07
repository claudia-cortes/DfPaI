// In this sketch you learn how to call a class inside a class. You use the difference between the 
// Array and Arralist. You learn the function lerp in order to avoid an object to jump instantly
// form one point to another. You understand how to form the geometry of a 3d shape by drawing its edges
// You learn how to call this shapes inside a canvas depending on the counting of frames in which
// the program works. See deteailed explanation ahead.


// you call the class box inside an array beacuse the number in boxes will stay fix in each line
Dbox [] dboxes = new Dbox [50];

// you set an Arraylist to call a line class beacuse the number of lines will vary depending
// the shape they are drawing. This is the arraylist of the lines inside an Icosahedron.
// You set a variable geometry based on the golden ratio and another in the dimension of a triangle.
// This is the way in which the geaometry of a Icosahedron is calculated
// see https://en.wikipedia.org/wiki/Regular_icosahedron
ArrayList<Line> linesIcosahedron = new ArrayList<Line>();
final float gr = (1.0 + sqrt(5))/2;  
float triangle = 200;  

// you set an Arraylist to call a line class beacuse the number of lines will vary depending
// the shape they are drawing. This is the arraylist of the lines inside a Cube.
ArrayList<Line> linesCube = new ArrayList<Line>();
float cubeSideLength = 500;


void setup() {
  // Remember when drawing on 3d it is always necessary state it in setup
  size(500, 500, P3D);
  noStroke();
  fill(250, 50);
  blendMode(ADD);

  // You draw the cube line by line. We create a PVector to form each of the edges of the cube
  // this PVectors will set a initial position for the arraylist of lines to be positioned 
  // and move them towards another position. This is how the edges are drawn
  PVector p1 = new PVector(-cubeSideLength/2, -cubeSideLength/2, cubeSideLength/2);
  PVector p2 = new PVector(cubeSideLength/2, -cubeSideLength/2, cubeSideLength/2);
  PVector p3 = new PVector(cubeSideLength/2, -cubeSideLength/2, -cubeSideLength/2);
  PVector p4 = new PVector(-cubeSideLength/2, -cubeSideLength/2, -cubeSideLength/2);
  PVector p5 = new PVector(-cubeSideLength/2, cubeSideLength/2, cubeSideLength/2);
  PVector p6 = new PVector(cubeSideLength/2, cubeSideLength/2, cubeSideLength/2);
  PVector p7 = new PVector(cubeSideLength/2, cubeSideLength/2, -cubeSideLength/2);
  PVector p8 = new PVector(-cubeSideLength/2, cubeSideLength/2, -cubeSideLength/2);
  linesCube.add(new Line(p1, p2));
  linesCube.add(new Line(p2, p3));
  linesCube.add(new Line(p3, p4));
  linesCube.add(new Line(p4, p1));
  linesCube.add(new Line(p1, p5));
  linesCube.add(new Line(p2, p6));
  linesCube.add(new Line(p3, p7));
  linesCube.add(new Line(p4, p8));
  linesCube.add(new Line(p5, p6));
  linesCube.add(new Line(p6, p7));
  linesCube.add(new Line(p7, p8));
  linesCube.add(new Line(p8, p5));

  // You draw the Icosahedron triangle by triangle. We create a PVector to form each of the edges of the triangle
  // By drawing first the triangles and joining them together we will form the edges of the Icosahedron
  PVector[] vertexIndices = {
    new PVector(triangle*gr, 0, triangle), new PVector(triangle*gr, 0, -triangle), new PVector(-triangle*gr, 0, -triangle), new PVector(-triangle*gr, 0, triangle), // X dimention
    new PVector(triangle, triangle*gr, 0), new PVector(-triangle, triangle*gr, 0), new PVector(-triangle, -triangle*gr, 0), new PVector(triangle, -triangle*gr, 0), // Y dimention
    new PVector(0, triangle, triangle*gr), new PVector(0, -triangle, triangle*gr), new PVector(0, -triangle, -triangle*gr), new PVector(0, triangle, -triangle*gr)  // Z dimention
  };


  for (int a=0; a<vertexIndices.length; a++) {
    PVector target = vertexIndices[a];

    // draw the lines of the indexes you have created in Icosahedron
    for (int b=a+1; b<vertexIndices.length; b++) {
      PVector cmp = vertexIndices[b];
      float dist = PVector.dist(target, cmp);
      if (int(dist) == int(triangle*2)) {
        linesIcosahedron.add(new Line(target, cmp));
      }
    }
  }
}



// This function calls each shape in a specific frame. You create a conditional statement 
// to call in the shape of the Icosahedron and the shape of the cube deoending on the frame
// This function was explained and designed by KeiseiXie.
void draw() {
  background(30);

  translate(width / 2, height / 2, -500);
  rotateX(frameCount*0.003);
  rotateY(frameCount*0.003);
  scale(sin(frameCount*0.01));  

  if (sin(frameCount*0.01) > sin(PI)) {
    for (Line l : linesIcosahedron) {
      l.draw();
    }
  } else {
    for (Line l : linesCube) {
      l.draw();
    }
  }
}
