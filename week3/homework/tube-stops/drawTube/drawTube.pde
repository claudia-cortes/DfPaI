// This code has been learned from Peng Gao, Cherie Weichen Tang 
// In this code you learn how to translate the extracted data from the Json file into a
// processing sketch. See detailed explanation ahead.

// This is the library that allows you to read the information from a python file
import oscP5.*;


OscP5 oscP5;

// You need to establish and orgin or a center from which the rest of the latitudes and longitudes
// will be drawn. This calculation's authorship belong to Peng Gao
float centerLat=51.5074;
float centerLon=0.1278;

// You set up a variable for a list to be obtained from the python file with all the 
// latitudes and longitudes of the website
FloatList lats=new FloatList();
FloatList lons=new FloatList();


void setup() {
  size(1000, 1000);
  // you call in the class in the library
  oscP5 = new OscP5(this, 12000);
}


void draw() {
  background(0);
  if (lats!=null) {
    for (int i=0; i<lats.size(); i++) {
      // the sketch gets all the latitudes and longitudes of the Json file
      float a=lons.get(i);
      float b=lats.get(i);
      // you draw a circle at those positions
      stroke(255, 0, 0);
      strokeWeight(2); 
      noFill();
      ellipse(a, b, 10, 10);
      rectMode(CENTER);  // Set rectMode to CENTER
      fill(0,0,255);  // Set fill to gray
      noStroke();
      rect(a, b, 15, 4);  // Draw gray rect using CENTER mode
    }
  }
}

// This function is the one that generates the communication with the python file 
void oscEvent(OscMessage theOscMessage) {

  // After obtaining the infromation you classify it in latitudes and longitudes
  float lat = theOscMessage.get(0).floatValue();
  float lon = theOscMessage.get(1).floatValue();

  // You transform that information into a position in the skecth by refereing to the 
  // origin which you established before
  float x=width/2+(centerLon+lon)*1000;
  float y= height/2+(centerLat-lat)*1000;

  lats.append(y);
  lons.append(x);

  // you print the data in the sketch output
  println("   "+lat+"   " + lon);
}
