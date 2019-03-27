#include <msp430.h>
#include "buzzer.h"

void decisecond() 
{
  static char cnt = 0;		/* # deciseconds/frequecy change */
  if (++cnt > 2) {		
    buzzer_advance_frequency();
    cnt = 0;
  }
}

void
__interrupt_vec(WDT_VECTOR)WDT(){	/* 250 interrupts/sec */
  static char second_count = 0, segment_count = 0, total_seconds = 0;
  
  if(++second_count == 250 && total_seconds < 65) { //every second
    second_count = 0;
    segment_count++;
    total_seconds++;
    buzzer_continue();
  }
  if(second_count == 125 && total_seconds < 60){ //stop to make buzzer beep
    buzzer_stop();
  }
  
  if(segment_count == 15){ //increase frequency every 15 seconds
    buzzer_advance_frequency();
    segment_count = 0;
  }


  if(total_seconds == 65){
    buzzer_stop();
  }
}
