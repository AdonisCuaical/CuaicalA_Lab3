void setup() {
  Serial.begin(9600);
  pinMode(4, INPUT);
  pinMode(3, INPUT);

}

void loop() {
  if (digitalRead(4) == HIGH) {
    delay(200);
    Serial.println("I");
  }
  if (digitalRead(3) == HIGH) {
    delay(200);
    Serial.println("D");
  }

}
