const int POT_PIN = A0;
const int LED_PIN = 7;

char val; // Data received from the serial port
boolean ledState = LOW;


void setup() {

  Serial.begin(9600);
  pinMode(LED_PIN, OUTPUT);
  establishContact();

}

void loop() {

  // stores values 0 - 1023 from potentiometer
  // int potValue = analogRead(POT_PIN);

  if(Serial.available() > 0)
  { // If data is available to read,
    val = Serial.read();
  
    if (val == '1') //if we get a 1
    { 
      ledState = !ledState;
      digitalWrite(LED_PIN, ledState); // Turn the LED on
    }
    delay(100);
  } else {
  
    //Serial.println(potValue);
    Serial.println("Hello, world!"); //send back a hello world
    delay(50);
  }
}


void establishContact() {
  while (Serial.available() <= 0 ) {
    Serial.println("A");  // send a capital A
    delay(300);
  }
}

