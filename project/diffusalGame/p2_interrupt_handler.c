#include <msp430.h>
#include "switches.h"

//switches on P2
void __interrupt_vec(PORT2_VECTOR) Port_2() {
  if(P2IFG & SWITCHES){
    P2IFG &= ~SWITCHES;
    switch1_interrupt_handler();
    switch2_interrupt_handler();
    switch3_interrupt_handler();
    switch4_interrupt_handler();
  }
}
