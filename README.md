# Signals_HiddenAudioMessageDecoder
In this MATLAB project, I decoded a message hidden in an audio signal. Project specifications are as follows: 

The hidden signal contains a series of tones, each of duration 50ms, and each representing one ASCII character. Each 50ms tone will contain one or more cosines at eight different frequencies:  400, 450, 500, 550, 600, 650, 700, and 750Hz. The presence or absence of each frequency can be thought of as a bit. Since there are eight frequencies, the tone therefore represents an 8-bit number; the value of that number will map to an ASCII character. In order to decode the message, follow these steps:

1)  Isolate the first 50ms of the signal 
2)  Use the myFFT function to determine and plot the frequency content of the tone 
3)  Determine the presence or absence of each of the eight target frequencies 
4)  Look up the corresponding 8-bit number on an ASCII table to determine the character. 
5)  Repeat for the remaining characters
