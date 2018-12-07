import oscP5.*;


OscP5 oscP5;

// setup from the centre??
float centerLat=51.5074;
float centerLon=0.1278;

FloatList lats=new FloatList();
FloatList lons=new FloatList();


void setup() {
  size(1000, 1000);
  //frameRate(1);
  oscP5 = new OscP5(this, 12000);
}


void draw() {
  background(0);
  if(lats!=null){
  for (int i=0; i<lats.size(); i++) {
    
    float a=lons.get(i);
    float b=lats.get(i);
    fill(255);
    ellipse(a, b, 10, 10);
  }
  

  }
}

// accept message from python
void oscEvent(OscMessage theOscMessage) {

// divided message into 2 groups
  float lat = theOscMessage.get(0).floatValue();
  float lon = theOscMessage.get(1).floatValue();

// draw in processing
  float x=width/2+(centerLon+lon)*1000;
  float y= height/2+(centerLat-lat)*1000;

  lats.append(y);
  lons.append(x);

  println("   "+lat+"   " + lon);
}
