(START)

@SCREEN
D=A
@R0
M=D //save the placeholder variable of screen

@KBD
D=M		//check keyboard memory value
@BLACK
D;JGT		//jumpt to black intruction memory address if contains 1
@OFF
D;JEQ		//jump to clear screen instruction block if all are zeroes


(BLACK)
@R0
M = -1 		// set the placeholder value to -1 (1111..11)

A = M		//get the address memory placeholder
D = A + 1		//increment it

@R0
M = D		//set placeholder to new incremented value

@KBD
D = M - D	//calculate the remainder

@BLACK
D;JGT		//if the remainder is still greater than 0, continue loop




// white block
(OFF)
@R0
M = 0		// set the placeholder value to 0 (00000...00)

A = M		//get the address memory placeholder
D = A + 1		//increment it

@R0
M = D		//set placeholder to new incremented value

@KBD
D = M - D

@OFF
D;JGT


@START
0;JMP
