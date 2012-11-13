// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

@LoopCounter

(MainLoop)

// If a key is pressed:
//   D = BLACK
// else:
//   D = WHITE
@KBD
D = M

@WhiteColor
D;JEQ  // white if no key


// Black color here
// -1 means all bits are hot
@1
D = A
D = -D
@paintColor  // Save the paintColor for later use
M = D

@ColorDone
0;JMP   // Jump to after color selection

(WhiteColor)
// White color here

@0
D = A
@paintColor  // Save the paintColor for later use
M = D

(ColorDone)

@SCREEN        // = 16384
D = A

@paintPointer
M = D

// Screen is 512x256
// divide by 16 == 32 x 16
// 131072 pixels or 512 iterations through the loop

// Paint the squares to the screen

(PaintLoop)

@paintColor
D = M

@paintPointer
A = M // load the paint location into A register
M = D // paint the pixel to the color

// Increment paintPointer to next position
@paintPointer
M = M + 1

// Compare paintPointer to maxPaintPosition

@paintPointer
D = M
@24576              // Debugger-derived last position
D = D - A           // Max paint position

// Repeat loop
@PaintLoop
D;JLT

@MainLoop
0;JMP   // Infinite loop
