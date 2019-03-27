#include <msp430.h>
#include "state_machines.h"
#include "leds.h"
#include "switches.h"
#include "buzzer.h"

static enum {start = 0, c1 = 1, c2 = 3, c4 = 4, w1 = 5, w2 = 6, w3 = 7, w4 = 8, lose = 9} curr_state = start;
//c = correct input, w = wrong input

char[] correct = {1,1,1,1}; //correct sequence for bomb diffusal
  
void state_advance(){
  switch(curr_state){
    
  case start:
    if((switch1_state_down && correct[0] == 1) || (switch2_state_down && correct[0] == 2) || (switch3_state_down && correct[0] == 3) || (swicth4_state_down && correct[0] == 4)){
      curr_state = c1;
    }
    else{
      curr_state = w1;
    }
    break;
    
  case c1:
    if((switch1_state_down && correct[1] == 1) || (switch2_state_down && correct[1] == 2) || (switch3_state_down && correct[1] == 3) || (switch4_state_down && correct[1] == 4)){
      curr_state = c2;
    }
    else{
      curr_state = w2;
    }
    break;
    
  case c2:
    if((switch1_state_down && correct[2] == 1) || (switch2_state_down && correct[2] == 2) || (switch3_state_down && correct[2] == 3) || (switch4_state_down && correct[2] == 4)){
      curr_state = c3;
    }
    else{
      curr_state = w3;
    }
    break;
    
  case c3:
    if((switch1_state_down && correct[3] == 1) || (switch2_state_down && correct[3] == 2) || (switch3_state_down && correct[3] == 3) || (switch4_state_down && correct[3] == 4)){
      curr_state = c4;
    }
    else{
      curr_state = w4;
    }
    break;
    
  case c4:
    break;

  case w1:
    if(switch1_state_down || switch2_state_down || switch3_state_down || switch4_state_down){
      curr_state = w2;
    }
    break;

  case w2:
    if(switch1_state_down || switch2_state_down || switch3_state_down || switch4_state_down){
      curr_state = w3;
    }
    break;

  case w3:
    if(switch1_state_down || switch2_state_down || switch3_state_down || switch4_state_down){
      curr_state = w4;
    }
    break;

  case w4:
    /*
    if(//no time){
      curr_state = lose;
    }
    */
    break;
    
  }
}
