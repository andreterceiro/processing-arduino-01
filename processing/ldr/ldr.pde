import processing.serial.*;

PImage img;
Serial port;
float serialValue;

void setup() {
  size(1064, 768);  
  img = loadImage("/home/andre/Downloads/paisagem.jpg");
  port = new Serial(this, "/dev/ttyUSB0", 9600);
}

void draw() {
  image(img, 0, 0);
  fill(255,255,255, serialValue);
  print(serialValue);
  print("\n");
  circle(mouseX, mouseY, 255);
}

/*
void serialEvent(Serial port) {
    circle(mouseX, mouseY, float(port.readStringUntil('*')));
}
*/
void serialEvent(Serial port) {                     // read the serial buffer:
  String myString = port.readStringUntil('\n');
  if ( myString  != null ) {
    myString = trim(myString);
    serialValue = (float(myString) - 925) * 2.6;
    // split and set some globals...
  }
}
