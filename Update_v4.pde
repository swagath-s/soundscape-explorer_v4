 import processing.serial.*;

Serial uno;

void setup() {  
  anpPinSetup();                                      //anpPinSetup sets pins of anp (button-sonsing arduino) up
  uno = new Serial(this, "COM4", 9600);
  println("SetupCall!");
  uno.bufferUntil('\n');
  println("buffered until");
  audioSetup();                                        //audioSetup sets up routing for multiple streams of audio

}


void draw() { 
  readButton();                                  //reads button state and triggers grid updation

}


String dirn = "toot";
char current = 'a';

void serialEvent(Serial uno){                      //gets called when the buffer encounters '\n'  
  char in = uno.readString().toCharArray()[0];        //storing first char of buffer in 'in'
  
  

  if (in != current){                            //if value of in has changed, do one of these things
    switch (in) {
      case '1': 
        dirn = "front";
        play("front", messMin, mess);
        //play("facing", frontMin);
        break;
      case '2': 
        dirn = "right";
        play("right", messMin,  mess);
        //play("facing", rightMin);
        break;
      case '3': 
        dirn = "back"; 
        play("back", messMin, mess);
        //play("facing", backMin);
        break;
      case '4': 
        dirn = "left";
        play("left", messMin, mess);
        //play("facing", leftMin);
        break;
    }
    current = in;                                               //updating current variable
  }
  
}