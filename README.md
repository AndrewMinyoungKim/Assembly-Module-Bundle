# Assembly Module Bundle
This is a bundle of different modules coded in Assembly language


# Stop/Go LED Binary Counter with Stopwatch
This counter displays its value in binary on the LEDR9-0 lights and increments by 1 every 1/4 second.
If KEY0 is pressed, the counter toggles (run/pause), KEY1 and KEY2 double the speed and halve the speed, respectively.
The stopwatch will appear on the HEX display looping after 59:99 back to 00:00, which you can pause at any time using KEY3 as a toggle

# Pushbutton Activator
Displays a blank HEX display. When pushing any of the KEY3-0 buttons, the corresponding number of the KEY to the HEX will display the number pressed. For example, if KEY2 is pressed, the number 2 will display on HEX2

# Stopwatch
This module is a stopwatch that uses the A9 Private Timer and can stop/ru by pressing any pushbutton KEY. It will loop from 00:00 to 59:99, so it loops after each minute

# User-Friendly-Counter
A counter that can increment, decrement from 0-9, reset, and disappear/reappear
Use the keys on the DE1-SoC board to activate these functions
KEY0 to reset, KEY1 to increment, KEY2 to decrement, KEY3 to disappear, press any key afterwards to reappear


# Finding the Longest String of 1/0's
Finds the longest strings of ones (R5), the longest string of zeroes (R6), and the longest string of alternating zeroes and ones (R7)

# 1/0 String Displayer
This module exercises the capabilities of the FPGA and displays the above module register values in the HEX display
R5 in HEX1-0, R6 in HEX3-2, and R7 in HEX5-4

# Digit Parser
Takes a 4 digit number or less, and stores the number into
a register with zeroes in between each digit, parses the digits

# Largest Number Finder
This program finds the largest number in a list using subroutines in Assembly
