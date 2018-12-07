import peasy.*;

Table table;
PeasyCam cam;
float moonRadius = 1737.31; // in km

ArrayList<MoonCraters> moonCraters=new ArrayList<MoonCraters>();

float lat, lon, dia;

void setup() {
  size(1000, 1000, P3D);
  stroke(255);
  noFill();

  cam = new PeasyCam(this, 6000);
  table = loadTable("moon_crater_coords.csv", "header");

  for (int i = 0; i < table.getRowCount(); i++) {

    lat = table.getFloat(i, "lat");
    lon = table.getFloat(i, "lon");
    dia = table.getFloat(i, "dia");
    moonCraters.add(new MoonCraters(lat, lon, dia, moonRadius));
  }
  //println(moonCraters.size());
}

void draw() {
  background(0);
  
  for (MoonCraters c : moonCraters) {
    c.draw();
  }
}
