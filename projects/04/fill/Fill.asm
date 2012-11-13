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
//@7
// @11111
// D = A
//@paintColor  // Save the paintColor for later use
//M = D

@SCREEN        // = 16384
D = A

@paintPointer
M = D

// Screen is 512x256
// divide by 16 == 32 x 16
// 131072 pixels or 512 iterations through the loop


// Paint the squares to the screen

//@paintColor 
//D = M

(PaintLoop)
@11111
D = A

@paintPointer
A = M // load the paint location into A register
M = D // paint the pixel to the color

// Increment paintPointer
//@16
//D = A
//@paintPointer
//M = M + D
@paintPointer
M = M + 1

// Compare paintPointer to maxPaintPosition

@paintPointer
D = M
// D = @144756 - D  // Max paint position
// D = @-144756 + D // Max paint position
//@512
@24576              // Debugger-derived last position
//@16896            // Max Paint position
D = D - A           // Max paint position

// Repeat loop
@PaintLoop
// D;JGT
D;JLT

@MainLoop
0;JMP   // Infinite loop
