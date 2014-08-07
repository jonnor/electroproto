// http://42bots.com/tutorials/28byj-48-stepper-motor-with-uln2003-driver-and-arduino-uno/

#include <AccelStepper.h>

// Motor pin definitions
const int motorPin1 = 3;     // IN1
const int motorPin2 = 4;     // IN2
const int motorPin3 = 5;     // IN3
const int motorPin4 = 6;     // IN4
const int HALFSTEP = 4;

AccelStepper stepper1(HALFSTEP, motorPin1, motorPin3, motorPin2, motorPin4);

void setup() {
  stepper1.setMaxSpeed(1000.0);
  stepper1.setAcceleration(100.0);
  stepper1.setSpeed(200);
  stepper1.moveTo(20000);
}

void loop() {
  if (stepper1.distanceToGo() == 0) {
    stepper1.moveTo(-stepper1.currentPosition());
  }
  stepper1.run();
}
