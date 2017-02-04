// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite WORKER that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

    @status
    M=-1 // 0xFFFF
    D=0

    @DRAW
    0;JMP

(WORKER)
    @KBD
    D=M

    @DRAW
    D;JEQ
    D=-1

(DRAW)
    @ARG
    M=D

    @status
    D=D-M

    @WORKER
    D;JEQ

    @ARG
    D=M

    @status
    M=D

    @SCREEN
    D=A

    @8192
    D=D+A

    @i
    M=D

(LOOP)
    @i
    D=M-1
    M=D

    @WORKER
    D;JLT

    @status
    D=M

    @i
    A=M
    M=D

    @LOOP
    0;JMP
