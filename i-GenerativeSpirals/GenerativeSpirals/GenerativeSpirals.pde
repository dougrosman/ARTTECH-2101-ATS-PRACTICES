import processing.serial.*;



Serial myPort; // Create object from Serial class
String val; // Data received from the serial port
boolean firstContact = false;


int sideLength;
int radians;
int sideDecValue = 1;
int rotateValue = 1;
int debugMode = 1;

void setup() {
  
  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  frameRate(60);
  size(800, 800);
  background(0);
  noStroke();
  rectMode(CENTER);
  sideLength = 500;
  
}

void draw() {
  
  if (mousePressed == true)
  {
    myPort.write('1');
    println("1");
  } else {
    myPort.write('0');
  }

  
  
  if(debugMode == 1) {
    if(myPort.available() > 0)
    { // If data is available
      val = myPort.readStringUntil('\n'); // read it and store it in val
    }
    println(val); //print it out in the console
  }
  
  else {
  
  fill(random(255), random(255), random(255));
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians);
  radians++;
  rect(0, 0, sideLength, sideLength);
  
  if(sideLength < 0)
  {
    // saveFrame("Screencaps/spiral-#####.png");
    sideLength = 500;
    myPort.write('1');
    println("1");
  }
  else
  {
    sideLength-=sideDecValue;
    myPort.write('0');
  }
  popMatrix();
  
  }
}

void serialEvent(Serial myPort)
{
  //put the incoming data into a String - 
  //the '\n' is our end delimter indicating the end of a complete packet
  val = myPort.readStringUntil('\n');
  //make sure our data isn't empy before continuing
  if (val != null) {
    //trim whitespace and formatting characters (like carriage return)
    val = trim(val);
    println(val);
    
    //look for our 'A' string to start the handshake
    //if it's there, clear the buffer, and send a request for data
    if (firstContact == false) {
      if (val.equals("A")) {
        myPort.clear();
        firstcontact = true;
        myPort.write("A");
        println("contact");
      }
    }
    else
    { //if we've already established contact, keep getting and parsing data
      println(val);
      
      if (mousePressed == true)
      { //if we clicked in the window, send a 1
        myPort.write('1');
        println("1");
      }
      
      // when you've parsed the data you hae, ask for more:
      myPort.write("A");
    }
  }
}