#include <WiFi.h>
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2); // I2C address 0x27, 16 column and 2 rows

#include <FirebaseESP32.h>
#define FIREBASE_HOST "sepsmm-c6f0e-default-rtdb.firebaseio.com/"
#define FIREBASE_AUTH "gIoVkPh0X977PM4CAca4lgH7neXSPnSIDE7KnHOd"
// #define WIFI_SSID "Redmi 9t"
// #define WIFI_PASSWORD "12345678"

#define WIFI_SSID "A and S Fire and Safety"
#define WIFI_PASSWORD "Arham2014"

//Define FirebaseESP32 data object
FirebaseData firebaseData;

int load_1 = 15;
int load_2 = 2;
int load_3 = 4;
int load_4 = 5;
float voltage_Sensor = 34;

void setup()
{
    Serial.begin(115200);
    lcd.init(); // initialize the lcd
    lcd.backlight();
    
    // PIN Mode Assigned
    pinMode(load_1,OUTPUT);
    pinMode(load_2,OUTPUT);
    pinMode(load_3,OUTPUT);
    pinMode(load_4,OUTPUT);
    pinMode(voltage_Sensor,INPUT);
    // PIN Mode Assigned

    // All Relay OFF Mode
    digitalWrite(load_1,HIGH);
    digitalWrite(load_2,HIGH);
    digitalWrite(load_3,HIGH);
    digitalWrite(load_4,HIGH);
    // All Relay OFF Mode

    lcd.clear();                 // clear display
    lcd.setCursor(5, 0);         // move cursor to   (0, 0)
    lcd.print("SEPSMM");        // print message at (0, 0)
    lcd.setCursor(2, 1);         // move cursor to   (2, 1)
    lcd.print("POWER SAVING"); // print message at (2, 1)
    delay(2000);                 // display the above for two seconds 
    
    lcd.clear();                 // clear display
    lcd.setCursor(3, 0);          // move cursor to   (3, 0)
    lcd.print("Presented");        // print message at (3, 0)
    lcd.setCursor(5, 1);          // move cursor to   (0, 1)
    lcd.print("By"); // print message at (0, 1)
    delay(2000);                  // display the above for two seconds
    lcd.clear();

    lcd.setCursor(0, 0);          // move cursor to   (3, 0)
    lcd.print("Muhammad Ali");        // print message at (3, 0)
    lcd.setCursor(0, 1);          // move cursor to   (0, 1)
    lcd.print("Student ID 29069"); // print message at (0, 1)
    delay(2000);                  // display the above for two seconds
    lcd.clear();

    lcd.setCursor(0, 0);          // move cursor to   (3, 0)
    lcd.print("Muhammad Usman");        // print message at (3, 0)
    lcd.setCursor(0, 1);          // move cursor to   (0, 1)
    lcd.print("Student ID 31470"); // print message at (0, 1)
    delay(2000);                  // display the above for two seconds
    lcd.clear();

    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    Serial.print("Connecting to Wi-Fi");
    lcd.setCursor(5,0);
    lcd.print("LOOKING");
    lcd.setCursor(5,1);
    lcd.print("FOR WIFI");
    delay(2000);
    lcd.clear();
    
    while (WiFi.status() != WL_CONNECTED)
  {
    Serial.println("Searching for Network ");
    delay(500);
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("WIFI : SEARCHING");
    delay(2000);
  }
    Serial.println();
    Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
    Serial.print("Connected with IP: ");
    Serial.println(WiFi.localIP());
    Serial.println();
    Serial.println("------------------------------------");
    Serial.println("Connected...");
    lcd.setCursor(7,0);
    lcd.print("CONNECTED");
    delay(3000);
    lcd.clear();
  }

void loop()
{
    lcd.clear();                 // clear display
    lcd.setCursor(5, 0);         // move cursor to   (0, 0)
    lcd.print("SEPSMM");        // print message at (0, 0)
    lcd.setCursor(2, 1);         // move cursor to   (2, 1)
    lcd.print("POWER SAVING"); // print message at (2, 1)
    delay(2000);

    lcd.clear();                 // clear display
    lcd.setCursor(0, 0);         // move cursor to   (0, 0)
    lcd.print(" Real Time Volt:");        // print message at (0, 0)
    lcd.setCursor(6, 1);         // move cursor to   (2, 1)
    lcd.print("220 Volt"); // print message at (2, 1)
    delay(2000);
    
//    Serial.println(analogRead(34));
//    delay(100);

     if (Firebase.get(firebaseData,"/All_Load/Load_1"))
 {
    if (firebaseData.dataType() == "bool") 
    {
      bool Load_1 = firebaseData.boolData();
      
          if (Load_1=='1')
          {
            Serial.println("Load # 1 IS ON");
            Serial.println("");
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("LOAD # 1");
            lcd.setCursor(0, 1);
            lcd.print("LIGHT IS ON");
            delay(1000);
            digitalWrite(load_1,LOW); //Device1 is ON 
          }
          else if (Load_1=='0')
          {
            Serial.println("Load # 1 IS OFF");
            Serial.println("");
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("LOAD # 1");
            lcd.setCursor(0, 1);
            lcd.print("LIGHT IS OFF");
            delay(1000);
            digitalWrite(load_1,HIGH);//Device1 if OFF
            }
     }
}

if (Firebase.get(firebaseData,"/All_Load/Load_2"))
 {
    if (firebaseData.dataType() == "bool") 
    {
      bool Load_2 = firebaseData.boolData();
      
          if (Load_2=='1')
          {
            Serial.println("Load # 2 IS ON");
            Serial.println("");
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("LOAD # 2");
            lcd.setCursor(0, 1);
            lcd.print("Load 2 IS ON");
            delay(1000);
            digitalWrite(load_2,LOW); //Device1 is ON 
          }
          else if (Load_2=='0')
          {
            Serial.println("Load # 2 IS OFF");
            Serial.println("");
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("LOAD # 2");
            lcd.setCursor(0, 1);
            lcd.print("Load 2 IS OFF");
            delay(1000);
            digitalWrite(load_2,HIGH);//Device1 if OFF
            }
     }
}

if (Firebase.get(firebaseData,"/All_Load/Load_3"))
 {
    if (firebaseData.dataType() == "bool") 
    {
      bool Load_3 = firebaseData.boolData();
      
          if (Load_3=='1')
          {
            Serial.println("Load # 3 IS ON");
            Serial.println("");
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("LOAD # 3");
            lcd.setCursor(0, 1);
            lcd.print("Load 3 IS ON");
            delay(1000);
            digitalWrite(load_3,LOW); //Device1 is ON 
          }
          else if (Load_3=='0')
          {
            Serial.println("Load # 3 IS OFF");
            Serial.println("");
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("LOAD # 3");
            lcd.setCursor(0, 1);
            lcd.print("Load 3 IS OFF");
            delay(1000);
            digitalWrite(load_3,HIGH);//Device1 if OFF
            }
     }
}

if (Firebase.get(firebaseData,"/All_Load/Load_4"))
 {
    if (firebaseData.dataType() == "bool") 
    {
      bool Load_4 = firebaseData.boolData();
      
          if (Load_4=='1')
          {
            Serial.println("Load # 4 IS ON");
            Serial.println("");
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("LOAD # 4");
            lcd.setCursor(0, 1);
            lcd.print("Load 4 IS ON");
            delay(1000);
            digitalWrite(load_4,LOW); //Device1 is ON 
          }
          else if (Load_4=='0')
          {
            Serial.println("Load # 4 IS OFF");
            Serial.println("");
            lcd.clear();
            lcd.setCursor(0, 0);
            lcd.print("LOAD # 4");
            lcd.setCursor(0, 1);
            lcd.print("Load 4 IS OFF");
            delay(1000);
            digitalWrite(load_4,HIGH);//Device1 if OFF
            }
     }
}
}