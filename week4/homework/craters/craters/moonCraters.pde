class MoonCraters {

  float lat, lon, dia;  
  float radius;
  float x, y, z; 

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

    ellipse(0,0,dia,dia);
    popMatrix();
    
  }
}
