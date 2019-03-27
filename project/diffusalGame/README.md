##Description

In this lab, I decided to create a small bomb diffusal game with the
msp430. The objective is to properly guess the 4-button combination before a
minute passes by. There will be a beeper that will increase in pitch as the
timer gets closer to one minute. Once it reaches the minute mark, the buzzer
will continuously beep - indicating that the game has been lost.

##Complete Files

*switches.c/h: These file reads the P2 input from the buttons on the board and
 lights up the LEDs when they are pressed
*leds.c/h: These file uses the switches functions in order to turn on the LEDs
 when the P2 switches are enabled
*buzzer.c/h : These files enable the buzzer on the speaker on P2 and allow for
 the higher pitched beeps as the timer approahces 1 minute
*p2 and wd _interrupt_handler.c: These files serve as the interrupt handlers
 for p2 and the watch dog timer

##Incomplete Files

*state_machines.c/h: The state machine file to puts the program all together
 is incomplete. As a result, it is not implemented. The program only has a
 functioning timer, switches, and LEDs - just not the states that allow for
 one to play the bomb diffusal game.

##Assembly
For this lab, I converted my switches.c program into assembly
