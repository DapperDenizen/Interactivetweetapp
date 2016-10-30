/*
parent class
 */

abstract class State {

  State() {
  }
  abstract void displayState();
  abstract State newState();
  abstract boolean getDone();
  abstract String getType();
}

