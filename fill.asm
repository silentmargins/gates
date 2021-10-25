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
@R0
A = M		//get the address memory placeholder, 16384
M = -1			//FILL IT, set the placeholder value to -1 (1111..11), M[16384] = -1
D = A + 1		//increment it, D = 16385

@R0
M = D		//set placeholder to new incremented value, M[0] = 16385

@KBD
D = M - D	//calculate the remainder, 24576 - 16385

@BLACK
D;JGT		//if the remainder is still greater than 0, continue loop




// white block
(OFF)
@R0
A = M		//get the address memory placeholder, 16384
M = 0			//FILL IT, set the placeholder value to 0, M[16384] = 0
D = A + 1		//increment it, D = 16385

@R0
M = D		//set placeholder to new incremented value, M[0] = 16385

@KBD
D = M - D	//calculate the remainder, 24576 - 16385

@OFF
D;JGT


@START
0;JMP
