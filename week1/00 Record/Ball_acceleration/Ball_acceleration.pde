// In this sketch you learn how to create a new PVector for the balls to follow when the mouse is Pressed
//See detailes explanation of each element ahead.
PVector pos;
PVector velocity;
PVector acceleration;

// In this function we determin the drawing to begin in the middel of the canvas
// we determine an initiona velocity asn acceleration of 0,0 that will later be augmented
// by a conditional statement.
void setup() {
  size(500, 500);
  pos = new PVector(width/2, height/2);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
}

void draw() {
  // you set the background of the canvas to be black here it is allocated in draw
  // because you want the backgorund to be drawn all over again each time the ball moves.
  // by doing this you avoid leaving a trail of the ball moving
  background(0);

  // You draw a new Pvector of that allocates the position of the mouse in the canvas
  // you substract the original position of the ball with the position of the mouse and create
  // a new PVector that will follow the mouse with a magnitude of 1 and a speed not bigger than 2.

  PVector mouse = new PVector(mouseX, mouseY);
  mouse.sub(pos);
  mouse.setMag(1);
  acceleration = mouse;

  // you tell the position to move by adding velocity to it. 
  pos.add(velocity);
  velocity.add(acceleration);
  velocity.limit(2);

  // you keep the ball inside the canvas by limiting it with a conditional statement
  // that will reduce the velocity of the ball by one each time its edge touches the limits
  // canvas. 
  if (pos.x>width || pos.x<0) {
    velocity.x = velocity.x *-1;
  }//if x

  if (pos.y>height || pos.y<0) {
    velocity.y = velocity.y *-1;
  }

  // you draw the ball as a circle with gray color, without line, with a position that will 
  // determined by its added velocity and with a diameter of 30 pixels.
  fill(100); 
  noStroke();
  ellipse(pos.x, pos.y, 30, 30);
}
