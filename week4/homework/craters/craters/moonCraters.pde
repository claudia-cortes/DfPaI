// you create a class named Crater in order for you to call it into the main sketch and
// draw them in reference to their latitude, longitude and diameter (csv file)

class MoonCraters {

  float lat, lon, dia;  
  float radius;
  float x, y, z; 

  // you set up variables to read the latitude, longitude and diameter of each crater
  // remember this information is read as polar coordinates therefore it need to be 
  // caclculated through radians. To review this see https://en.wikipedia.org/wiki/Polar_coordinate_system
  MoonCraters(float _lat, float _lon, float _dia,float _radius) {
    lat=radians(_lat);
    lon=radians(_lon);
    dia=_dia;
    radius=_radius;
    x=radius*cos(lat)*sin(lon);
    y=radius*cos(lat)*cos(lon);
    z=radius*sin(lat);
  }

  void draw() {
    
    pushMatrix();
    translate(x,y,z);
    rotateZ(HALF_PI-lon);
    rotateY(HALF_PI-lat);
    // you tell the drawing to draw those craters as circles taking as reference their position
    // x,y, their rotation towards the origin (polar coordinates) and their diameters
    ellipse(0,0,dia,dia);
    popMatrix();
    
  }
}
