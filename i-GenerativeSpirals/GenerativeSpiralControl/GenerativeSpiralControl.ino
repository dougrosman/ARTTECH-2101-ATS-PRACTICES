const int POT_PIN = A0;

void setup() {

  Serial.begin(9600);

}

void loop() {

  // stores values 0 - 1023 from potentiometer
  int potValue = analogRead(POT_PIN);

  // prints current potentiometer value to console
  Serial.println(potValue);
}
