// In this sketch you learn how to translate the information from a csv file into processing
// In this particular sketch you use the information in the csv file to draw the craters in the moon
// See detailed explantion ahead. 

// You use this library to read a csv file into the sketch
import peasy.*;

Table table;
PeasyCam cam;
// you set the radius of the moon in kilometers
float moonRadius = 1737.31; 

// you use an arraylist as the number of craters will be undetermined
ArrayList<MoonCraters> moonCraters=new ArrayList<MoonCraters>();

float lat, lon, dia;

void setup() {
  size(1000, 1000, P3D);
  stroke(255);
  noFill();

  cam = new PeasyCam(this, 6000);
  // you tell the sketch to read the file and that the file has a header for it to follow
  // and classify the information
  table = loadTable("moon_crater_coords.csv", "header");
  // with this loop thw sketch read all the information throughout the csv file
  for (int i = 0; i < table.getRowCount(); i++) {

    lat = table.getFloat(i, "lat");
    lon = table.getFloat(i, "lon");
    dia = table.getFloat(i, "dia");
    moonCraters.add(new MoonCraters(lat, lon, dia, moonRadius));
  }
  
}

void draw() {
  background(0);
  
  for (MoonCraters c : moonCraters) {
    c.draw();
  }
}
