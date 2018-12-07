// Here the Class begins
// A class contains all the variables for an sepcific object
class Ball {
  PVector pos, vel;
  float radius, m;
  PVector acc;


  // the velocity and initial position of the balls in the canvas is determined here.
  // the velocity is random between a range of (-3,3)
  Ball(float x, float y, float radius) {
    pos = new PVector(x, y);
    vel = new PVector( random(1, 5), random(1, 5));
    acc = new PVector(0, 0);
    m = radius*.1;

    this.radius = radius;
  }


  // this function contains the conditional statemente that makes the balls move by
  //  adding velocity to their position. It also keeps them inside the canvas
  void update() {

    pos.add(vel);

    if (pos.x>width || pos.x<0) {
      vel.x = vel.x *-1;
    }//if x

    if (pos.y>height || pos.y<0) {
      vel.y = vel.y *-1;
    }
  }


  // this function directs the ball acceleration towards the position of the mouse when 
  // the mouse is Pressed
  void mousePressed() {
    if (mousePressed) {
      PVector mouse = new PVector(mouseX, mouseY);
      mouse.sub(pos);
      mouse.setMag(1);
      acc = mouse;

      pos.add(vel);
      vel.add(acc);
      vel.limit(2);
    }
  }

  // this function makes the balls repel from each other
  void checkCollision(Ball other) {

    // with this variables we obtain the distance between the balls and the minimum
    // distance between each other right before they touch
    PVector distanceVect = PVector.sub(other.pos, pos);
    float distanceVectMag = distanceVect.mag();
    float minDistance = radius + other.radius;

    // with this conditional statement you change the direction of the trayectory of the
    // balls when the distance between the vectors of the balls is less than the minimum 
    // distance that the balls should have before they collide. Which we determined above.
    if (distanceVectMag < minDistance) {
      float distanceCorrection = (minDistance-distanceVectMag)/2.0;
      PVector d = distanceVect.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      other.pos.add(correctionVector);
      pos.sub(correctionVector);

      // w is the obtained angle of the balls' previous vector 
      float w  = distanceVect.heading();
      float sine = sin(w);
      float cosine = cos(w);

      PVector[] bTemp = {
        new PVector(), new PVector()
      };

      // you obtain the temporary vectors  (angles and magnitude) of the ball 2 realtive to the 
      // ball 1 when they collide
      bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
      bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

      // you rotate the temporary vectors
      PVector[] vTemp = {
        new PVector(), new PVector()
      };

      // this maths are not mine. See Chapter 3, 3.1 Angles, The Nature of Code
      // Daniel Shiffman.
      vTemp[0].x  = cosine * vel.x + sine * vel.y;
      vTemp[0].y  = cosine * vel.y - sine * vel.x;
      vTemp[1].x  = cosine * other.vel.x + sine * other.vel.y;
      vTemp[1].y  = cosine * other.vel.y - sine * other.vel.x;

      // now that the new angle was obtained you  calculate the new vector 
      PVector[] vFinal = {  
        new PVector(), new PVector()
      };

      // final rotated vector of Ball 1
      vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
      vFinal[0].y = vTemp[0].y;

      // final rotated vector of Ball 2
      vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
      vFinal[1].y = vTemp[1].y;

      
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      // You apply velocity to the new angles and update the position of them
      PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      
      other.pos.x = pos.x + bFinal[1].x;
      other.pos.y = pos.y + bFinal[1].y;

      pos.add(bFinal[0]);

     
      vel.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      vel.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.vel.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.vel.y = cosine * vFinal[1].y + sine * vFinal[1].x;
    }
  }

  // This function draws the balls
  void draw() {
    
    // we give random colors to the balls here in a range of greens and blues
    fill(0, random(0, 255), random(0, 255));
    ellipse(pos.x, pos.y, radius * 2, radius*2);
  }
}


// Here the class ends
