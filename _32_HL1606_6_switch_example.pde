/* HL1606 LED Strip control of individual LEDs
*
* B10000001 = Bright Blue
* B10000100 = Bright Red
* B10010000 = Bright Green
* B10010001 = Bright Cyan
* B10000101 = Bright Magenta
* B10010100 = Bright Yellow
* B10010101 = Bright White

* B10000010 = Dim Blue
* B10001000 = Dim Red
* B10100000 = Dim Green
* B10100010 = Dim Cyan
* B10001010 = Dim Magenta
* B10101000 = Dim Yellow
* B10101010 = Dim White

* B10000000 = Black / Off
*/

#include <LEDStrip.h>

int swPin = 5;
int sw = 0; // 6-step resistance value
int stage = 1; // 6-step stage (i.e. 1 - 6)


#define SIPIN 9
#define DIPIN 10
#define CLKPIN 5
#define LATCHPIN 3

LEDStrip mystrip(DIPIN,SIPIN,LATCHPIN,CLKPIN);

#define SPULSES 5000
byte BB = B10000001; // Bright Blue
byte BR = B10000100; // Bright Red
byte BG = B10010000; // Bright Green
byte BC = B10010001; // Bright Cyan
byte BM = B10000101; // Bright Magenta
byte BY = B10010100; // Bright Yellow
byte BW = B10010101; // Bright White
byte DB = B10000010; // Dim Blue
byte DR = B10001000; // Dim Red
byte DG = B10100000; // Dim Green
byte DC = B10100010; // Dim Cyan
byte DM = B10001010; // Dim Magenta
byte DY = B10101000; // Dim Yellow
byte DW = B10101010; // Dim White
byte FDBB = B10000011; // Bright Blue
byte FDBR = B10001100; // Bright Red
byte FDBG = B10110000; // Bright Green
byte FDBC = B10110011; // Bright Cyan
byte FDBM = B10001111; // Bright Magenta
byte FDBY = B10111100; // Bright Yellow
byte FDBW = B10111111; // Bright White
byte FUDB = B10000010; // Dim Blue
byte FUDR = B10001000; // Dim Red
byte FUDG = B10100000; // Dim Green
byte FUDC = B10100010; // Dim Cyan
byte FUDM = B10001010; // Dim Magenta
byte FUDY = B10101000; // Dim Yellow
byte FUDW = B10101010; // Dim White
byte BL = B10000000; // Black / Off

void setup()
{
pinMode(swPin, OUTPUT);
ClearStrip(100);
}

void loop()
{
readSwitch();
//ClearStrip(500);

}


void readSwitch(){
// read the value from the sensor
sw = analogRead(swPin);

if(sw>=0 && sw< 100) {
stage = 1;
Pattern1(50);
}
if(sw>=100 && sw< 300) {
stage = 2;
Pattern2(50);
}
if(sw>=300 && sw< 500) {
stage = 3;
Pattern3(50);
}
if(sw>=500 && sw< 700) {
stage = 4;
Pattern4(50);
}
if(sw>=700 && sw< 900) {
stage = 5;
Pattern5(50);
}
if(sw>=900 && sw< 1100) {
stage = 6;
Pattern6(50);
}
}


void ClearStrip(int duration)
{
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.pushCmd(BL);
mystrip.latch();
delay(duration);
}


void Pattern1(int duration)
{
mystrip.pushCmd(FDBB);
mystrip.latch();
delay(duration);
}


void Pattern2(int duration)
{
mystrip.pushCmd(FDBR);
mystrip.latch();
delay(duration);
}


void Pattern3(int duration)
{
mystrip.pushCmd(FDBG);
mystrip.latch();
delay(duration);
}


void Pattern4(int duration)
{
mystrip.pushCmd(FDBC);
mystrip.latch();
delay(duration);
}


void Pattern5(int duration)
{
mystrip.pushCmd(FDBM);
mystrip.latch();
delay(duration);
}


void Pattern6(int duration)
{
mystrip.pushCmd(FDBY);
mystrip.latch();
delay(duration);
}
