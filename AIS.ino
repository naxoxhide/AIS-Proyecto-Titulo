#include <dht.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

//definir pins.
#define dht_apin A0
int moistureSensor1Pin = 1;
int moistureSensor2Pin = 2;
int photoresistorSensorPin = 3;
int pumpPin = 7;
int valvule1Pin = 8;
int valvule2Pin = 9;
int valvule3Pin = 10;

// variables
int moistureSensor1Value;
int moistureSensor2Value;
int photoresistorSensorValue;
dht DHT; 


// Mensajes de sistemas
const char *string_table[] =
{   
  "Bienvenido! =)",
  "h1 seco",
  "h1 humedo",
  "h1 regado",
  "h2 seco",
  "h2 humedo",
  "h2 regado",
  "A.I.S"
};

LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);
  
  void setup() {
  Serial.begin(9600);


  // LCD
  lcd.begin(16,2); 
  lcd.backlight();    
  lcd.clear();         
  
  // Wire
  Wire.begin();

//pins
  pinMode(moistureSensor1Pin,OUTPUT);
  pinMode(moistureSensor2Pin,OUTPUT);
  pinMode(photoresistorSensorPin,OUTPUT);
  pinMode(valvule1Pin,OUTPUT);
  pinMode(valvule2Pin,OUTPUT);
  pinMode(pumpPin,OUTPUT);
  
// LCD Mensajes de Inicio
  lcd.clear();
  lcd.setCursor(0,1);
  lcd.print(string_table[7]); 
  lcd.setCursor(0,3);
  lcd.print(string_table[0]); 
  delay(5000); 
}

void loop() {

  //Datos de los sensores y activar bomba con valvulas
  moistureSensor1Value = analogRead(moistureSensor1Pin);
  moistureSensor2Value = analogRead(moistureSensor2Pin);
  photoresistorSensorValue = analogRead(A3);
  DHT.read11(dht_apin);

if((moistureSensor1Value > 650) || (moistureSensor2Value > 650)) {
    digitalWrite(pumpPin,LOW);
    Serial.println("Pump On ");
  }
  
if((moistureSensor1Value < 650) && (moistureSensor2Value < 650)) {
    digitalWrite(pumpPin,HIGH);
    Serial.println("Pump Off ");
  }


 //sensor 1 perfil 1 
 if((moistureSensor1Value > 650)){
    // Suelo seco:
    lcd.clear();
    lcd.setCursor(0,3);
    lcd.print(string_table[1]);
    delay(1000);
    Serial.println("Suelo Seco 1"); 
    Serial.println(moistureSensor1Value);
    Serial.println("Nivel de luminosidad = ");
    Serial.println(photoresistorSensorValue);
    Serial.println("temperatura = ");
    Serial.println(DHT.temperature); 
    digitalWrite(valvule1Pin,LOW);
    Serial.println("Valvule On ");
    
  }
   
  if((moistureSensor1Value < 650) && (moistureSensor1Value >= 300)){
    // Suelo empapado:
    lcd.clear();
    lcd.setCursor(0,3);
    lcd.print(string_table[2]);
    delay(1000);
    Serial.println("Suelo empapado 1");
    Serial.println(moistureSensor1Value);
    Serial.println("Nivel de luminosidad = ");
    Serial.println(photoresistorSensorValue);
    Serial.println("temperatura = ");
    Serial.println(DHT.temperature); 
    digitalWrite(valvule1Pin,HIGH);
    Serial.println("Valvule Off "); 
  }

if(moistureSensor1Value < 300){
    // Suelo humedo
    lcd.clear();
    lcd.setCursor(0,3);
    lcd.print(string_table[3]);
    delay(1000);
    Serial.println("Suelo Humedo 1");
    Serial.println(moistureSensor1Value);
    Serial.println("Nivel de luminosidad = ");
    Serial.println(photoresistorSensorValue);
    Serial.print("temperatura = ");
    Serial.println(DHT.temperature); 
    digitalWrite(valvule1Pin,HIGH);
    Serial.println("Valvule Off ");
  }

//sensor 2 perfil 2
   if((moistureSensor2Value > 650)){
    // Suelo seco:
    lcd.clear();
    lcd.setCursor(0,3);
    lcd.print(string_table[4]);
    delay(1000);
    Serial.println("Suelo Seco 2"); 
    Serial.println(moistureSensor2Value);
    Serial.println("Nivel de luminosidad = ");
    Serial.println(photoresistorSensorValue);
    Serial.println("temperatura = ");
    Serial.println(DHT.temperature); 
    digitalWrite(valvule2Pin,LOW);
    Serial.println("Valvule On ");
    
  }
   
  if((moistureSensor2Value < 650) && (moistureSensor2Value >= 300)){
    // Suelo empapado:
    lcd.clear();
    lcd.setCursor(0,3);
    lcd.print(string_table[5]);
    delay(1000);
    Serial.println("Suelo empapado 2");
    Serial.println(moistureSensor2Value);
    Serial.println("Nivel de luminosidad = ");
    Serial.println(photoresistorSensorValue);
    Serial.println("temperatura = ");
    Serial.println(DHT.temperature); 
    digitalWrite(valvule2Pin,HIGH);
    Serial.println("Valvule Off ");
  }

if(moistureSensor2Value < 300){
    // Suelo humedo
    lcd.clear();
    lcd.setCursor(0,3);
    lcd.print(string_table[6]);
    delay(1000);
    Serial.println("Suelo humedo 2");
    Serial.println(moistureSensor2Value);
    Serial.println("Nivel de luminosidad = ");
    Serial.println(photoresistorSensorValue);
    Serial.print("temperatura = ");
    Serial.println(DHT.temperature); 
    digitalWrite(valvule2Pin,HIGH);
    Serial.println("Valvule Off ");
  }
}
