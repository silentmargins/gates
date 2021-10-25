// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(START)

@SCREEN 
D=A		//D=16384
@R0
M=D 	//save the placeholder variable of screen, M[0] = 16384

@KBD
D=M		//check keyboard memory value, D=24576
@BLACK
D;JGT		//jumpt to black intruction memory address if contains 1
@OFF
D;JEQ		//jump to clear screen instruction block if all are zeroes


(BLACK)
@R1 //temp value to store color
M = -1		

@FIXCOLOR
0;JMP		//if the remainder is still greater than 0, continue loop


// white block
(OFF)
@R1 //temp value to store color
M = 0		

@FIXCOLOR
0;JMP		//if the remainder is still greater than 0, continue loop


(FIXCOLOR)

@R1
D = M // GET THE VALUE OF COLOR

@R0
A = M
M = D // VALUE OF M[A] = D

@R0
M = M + 1 //INCREMENT VALUE

@KBD
D = M - D	//calculate the remainder, 24576 - 16385

@FIXCOLOR
D;JGT


@START
0;JMP
