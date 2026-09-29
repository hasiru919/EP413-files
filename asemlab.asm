;Name: HASIRU WIJESURIYA, NSID: hyw285, STUDENT ID: 11272376
locat  EQU 8000h               ;Location for this program
ORG    locat

DB     0A5h,0E5h,0E0h,0A5h     ;signiture bytes
DB     35,255,0,0              ;id (35=prog)
DB     0,0,0,0                 ;prompt code vector
DB     0,0,0,0                 ;reserved
DB     0,0,0,0                 ;reserved
DB     0,0,0,0                 ;reserved
DB     0,0,0,0                 ;user defined
DB     255,255,255,255         ;length and checksum (255=unused)
DB     "Asem",0	               ;max 31 characters, plus the zero

ORG    locat+64                ;executable code begins here
VARNAME EQU 2                  ;Variable VARNAME is made equal to 2
HALFPERIOD EQU 12       ;HALF_PERIOD is made eqaul to 183
LOOP:   CPL P1.7               ;The port, P1.7, gets toggled
        MOV R1,#VARNAME        ;Value in variable VARNAME is given to register R1
DELAY:  MOV R2,#HALFPERIOD     ;Value in HALFPERIOD gets moved to register R2
HERE:   DJNZ R2,HERE           ;The line decrements the value stored in R2 and jumps back to start of "HERE" label. This occur until R2 value is zero.
        DJNZ R1,DELAY          ;The line decrements the value stored in R2 and jumps back to start of "DELAY label. This occurs until R1 value is zero.
        SJMP LOOP              ;The line causes the program to jump back to start of LOOP label and runs through all the opcode. This helps generate the continous sqaure wave.
END                            ;

