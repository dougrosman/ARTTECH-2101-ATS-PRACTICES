//import processing.serial.*;

//int end = 10;
//String serial;
//Serial port;

int sideLength;
int radians;

void setup() {
  //port = new Serial(this, Serial.list()[0], 9600);
  //port.clear();
  //serial = port.readStringUntil(end);
  //serial = null;
  
  size(400, 400);
  background(255);
  noStroke();
  rectMode(CENTER);
  
}

void draw() {
  
  fill(random(255), random(255), random(255));
  
  pushMatrix();
  translate(200, 200);
  rotate(radians);
  
  radians++;
  rect(200, 200, 200, 200);
  popMatrix();
  
  
}