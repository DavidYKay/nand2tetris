// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

// Put your code here.


// value   = R0
// counter = R1
// output  = R2


// let's not modify the original counter
@1
D = M
@500 // Our own counter position
M = D


// load counter into our A register
// if counter == 0:
//   done!

// @RAM[1]
// @1 // -> no longer. now using our own counter
(Loop)
@500   // our counter
D = M[1]
@Done
D;JEQ

// else:
//   add value to accumulator

// @RAM[0]
(Add)
@0
D = M     // Load multiplicand to D register

// @RAM[2]
@2
M = M + D // Add the multiplicand to the outpu

//   decrement counter
// @RAM[1]
// @1
@500   // our counter
M = M - 1

//   repeat loop
// JMP to begin
@Loop
0;JMP

(Done)
@Done
0;JMP   // Infinite loop
