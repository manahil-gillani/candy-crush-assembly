[org 0x0100]

jmp start
;
symbol1: db '/'
symbol2: db '|'
symbol3: db '\'
symbol4: db '_'
str1: db 'BY: MANAHIL FATIMA' ;LENGTH=18
str2: db 'roll no: 22i-2329' ;length=17
Message1: db 'INSTRUCTIONS' ; 12 chars
Message2: db 'You will get 9 turns to score the maximum score possible' ;56 chars
Message3: db 'Make pattern of three numbers to pop them and gain score' ;56 chars
Message4: db 'Make a pattern of four or more characters to form a bomb X' ;58 chars
Message5: db 'Swap the bomb with a character to delete all instances of that character' ;72 chars
Message6: db 'Eliminate obstacles by making a pattern right next to them' ;58 chars
PressAnyKey: db 'Press any key to continue' ;25 chars
InitialScore: dw "Score: 0  "
ScoreVal: dw 0
TotalMoves: dw "Total Moves: 9"
Moves: db 9
InitialScoreLength: dw 10
InitialCharacters: db 'ABCABC~'
InitialColours: db 0x04,0x0E,0x02,0x04,0x0E,0x02;
randNum: dw 0
c1: db 'A'   ;candy 1 in red color
c2: db 'B'   ;candy 2 in yellow color
c3: db 'C'   ;candy 3 in green color
length: dw 1   ;length of candy string
columns: db 5
rows: db 5
bombflag: db 0
RemainingMoves: dw "Remaining:   "
;
clrscr:     ;from book 7.1
push es
push ax
push cx
push di
mov ax,0xb800
mov es,ax
xor di,di
mov ax,0x0720
mov cx,2000
cld
rep stosw
pop di
pop cx
pop ax
pop es
ret
;
printname:
mov ax,0xb800
mov es,ax
mov ah,0x13
mov al,1
mov bh,0
mov bl,6
mov dx,0x1102
mov cx,18
push cs
pop es
mov bp,str1
int 0x10
;roll no
mov ax,0xb800
mov es,ax
mov ah,0x13
mov al,1
mov bh,0
mov bl,6
mov dx,0x1302
mov cx,17
push cs
pop es
mov bp,str2
int 0x10
ret
;
candy:
;c
mov ax,0xb800
mov es,ax
mov ah,0x13
mov al,1
mov bh,0
mov bl,6
mov dx,0x0503
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,05
mov dx,0x0602
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,04
mov dx,0x0702
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,03
mov dx,0x0802
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0902
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0A03
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10
;a
mov bl,6
mov dx,0x0A05
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,05
mov dx,0x0905
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,04
mov dx,0x0805
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,03
mov dx,0x0705
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,7
mov dx,0x0606
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,7
mov dx,0x0906
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,7
mov dx,0x0607
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,7
mov dx,0x0907
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,7
mov dx,0x0708
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0808
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0908
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0A08
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10
;n
mov bl,6
mov dx,0x0A09
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,05
mov dx,0x0909
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,04
mov dx,0x0809
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,03
mov dx,0x0709
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0609
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x070A
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x080B
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x090C
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0A0D
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x090D
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x080D
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x070D
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x060D
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10
;d
mov bl,6
mov dx,0x050E
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,05
mov dx,0x060E
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,04
mov dx,0x070E
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,03
mov dx,0x080E
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x090E
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0A0E
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0A0F
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,7
mov dx,0x0910
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,7
mov dx,0x0810
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0710
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0610
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x050F
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10
;y
mov bl,6
mov dx,0x0411
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,05
mov dx,0x0511
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,04
mov dx,0x0612
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,03
mov dx,0x0414
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0514
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0614
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,7
mov dx,0x0713
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,7
mov dx,0x0713
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0812
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0912
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0A12
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10
ret
;
crush:
;c
mov ax,0xb800
mov es,ax
mov ah,0x13
mov al,1
mov bh,0
mov bl,6
mov dx,0x051A
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,05
mov dx,0x0619
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,04
mov dx,0x0719
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,03
mov dx,0x0819
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0919
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0A1A
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10
;R
mov bl,05
mov dx,0x061C
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,04
mov dx,0x071C
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,03
mov dx,0x081C
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x091C
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0A1C
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x051D
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,7
mov dx,0x061E
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x071E
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x081D
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,7
mov dx,0x091D
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0A1E
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0B1F
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10
;u
mov bl,6
mov dx,0x051F
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,05
mov dx,0x061F
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,04
mov dx,0x071F
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,03
mov dx,0x081F
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x091F
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0A1F
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0A20
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,7
mov dx,0x0A22
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,7
mov dx,0x0A21
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,7
mov dx,0x0922
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0822
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0722
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0622
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0522
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10
;s
mov bl,04
mov dx,0x0325
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,03
mov dx,0x0424
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,7
mov dx,0x0523
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0623
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0623
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0724
mov cx,1
push cs
pop es
mov bp,symbol3
int 0x10

mov bl,7
mov dx,0x0825
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0925
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0A24
mov cx,1
push cs
pop es
mov bp,symbol1
int 0x10

mov bl,7
mov dx,0x0A23
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10
;h
mov bl,6
mov dx,0x0526
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,05
mov dx,0x0626
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,04
mov dx,0x0726
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,03
mov dx,0x0826
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,04
mov dx,0x0926
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,03
mov dx,0x0A26
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0827
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,7
mov dx,0x0828
mov cx,1
push cs
pop es
mov bp,symbol4
int 0x10

mov bl,7
mov dx,0x0A28
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0928
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0728
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0628
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10

mov bl,7
mov dx,0x0528
mov cx,1
push cs
pop es
mov bp,symbol2
int 0x10
ret
;
frontpage:
call printname
call candy
call crush
ret
;
keyinput:
mov ah, 0x13 ; service 13 - print string
mov al, 1 ; subservice 01 – update cursor
mov bh, 0 ; output on page 0
mov bl, 7 ; normal attrib
mov dx, 0x1801 
mov cx, 25 ; length of string
push cs
pop es ; segment of string
mov bp, PressAnyKey ; offset of string
int 0x10

mov ah,0
int 0x16 ;await input
call clrscr
ret
;
instructions:
mov ah,0x13
mov al,1
mov bh,0
mov bl,7
mov dx,0x050A
mov cx,12
push cs
pop es
mov bp,Message1
int 0x10

mov ah,0x13
mov al,1
mov bh,0
mov bl,7
mov dx,0x0A02
mov cx,56
push cs
pop es
mov bp,Message2
int 0x10

mov ah,0x13
mov al,1
mov bh,0
mov bl,7
mov dx,0x0C02
mov cx,56
push cs
pop es
mov bp,Message3
int 0x10

mov ah,0x13
mov al,1
mov bh,0
mov bl,7
mov dx,0x0E02
mov cx,58
push cs
pop es
mov bp,Message4
int 0x10

mov ah,0x13
mov al,1
mov bh,0
mov bl,7
mov dx,0x1102
mov cx,72
push cs
pop es
mov bp,Message5
int 0x10

mov ah,0x13
mov al,1
mov bh,0
mov bl,7
mov dx,0x1302
mov cx,58
push cs
pop es
mov bp,Message6
int 0x10
ret
;
topstrip:

		push bp
		mov bp, sp
		
		push es
		push ax
		push di

		mov ax, 0xb800
		mov es, ax
		mov di, 160
		
		mov al, 0x20 ; space character
		mov ah, 01000000b ; red color

next_first: ; half red
		
		mov [es:di], ax
		add di, 2
		cmp di, 240
		jne next_first

		mov di, 320
second_row:

		mov [es:di], ax
		add di, 2
		cmp di, 400
		jne second_row

		mov ah, 00100000b ; green color

		mov di, 240

next_second:
		
		mov [es:di], ax
		add di, 2
		cmp di, 320
		jne next_second

		mov di, 400
next_secondrow: ; half green
		
		mov [es:di], ax
		add di, 2
		cmp di, 480
		jne next_secondrow

		pop di
		pop ax
		pop es

		pop bp
		ret		
;
printboard:
		call topstrip ; print top row strip
;
hzl:
		push bp
		mov bp, sp
		
		push es
		push ax
		push di
		push cx
		
		mov ax, 0xb800
		mov es, ax
		mov di, 1188 ; first two row already left empty and two more rows left as each block will be 2 units wide
		
		mov al, '-'
		mov ah, 00000001b ; blue color
		mov dl, 6

hzlloop:		
		mov cx, 0
		
next_hzl: ; print a line of _ character
		
		mov [es:di], ax
		add di, 2
		add cx, 2
		cmp cx, 38
		jne next_hzl
		sub di,38
		add di, 320 ; skip a row to make blocks 2 wide
		dec dl
		cmp dl, 0
		jne hzlloop
		
		pop cx
		pop di
		pop ax
		pop es

		pop bp
		ret
;
vtl:
		push bp
		mov bp, sp
		
		push es
		push ax
		push di
		push cx
		
		mov ax, 0xb800
		mov es, ax
		mov di, 1186 ; first two row already left empty and two more rows left as each block will be 2 units wide
		
		mov al, '|'
		mov ah, 00000001b ; blue color
		mov dl, 11

vtlloop:		
		mov cx, 0
		
next_vtl: ; print a line of _ character
		
		mov [es:di], ax
		add di, 8
		add cx, 2
		cmp cx, 12
		jne next_vtl
		sub di,48
		add di, 160 ; skip a row to make blocks 2 wide
		dec dl
		cmp dl, 0
		jne vtlloop
		
		pop cx
		pop di
		pop ax
		pop es

		pop bp
		ret
;
taskbar:
push bp
		mov bp, sp
		
		push es
		push ax
		push di
        push si
		push cx
mov ax, 0xb800
		mov es, ax
mov cx, [InitialScoreLength]
		mov di, 190
		mov si, InitialScore
		mov ah, 00100000b

prtscore: ; half red
		mov al, [si]
		mov [es:di], ax
		add di, 2
        add si, 1
		loop prtscore

		mov cx, 14
		mov ax, 0xb800
		mov es, ax
		mov di, 252
		mov si, TotalMoves               
		mov ah, 01000000b 

prtMoves: ; half red
		mov al, [si]
		mov [es:di], ax
		add di, 2
        add si, 1
		loop prtMoves
        
		pop cx
        pop si
        pop di
        pop ax
        pop es
        pop bp
        ret
;
candyboard:
mov si,0
mov cx,25    ;set the loop counter
 ; Calculate starting position for centering the 5x5 board
    mov ah, 0x03  ; Get cursor position
    mov bh, 0  ; Page number
    int 0x10  ; BIOS video service
    
fillbyloop:
;mov al,[gameboard+si]   ;load candy value from memory
add al,0x30    ;convert to its character representation/ascii
mov dh, 0x0C  ; Set the row to 12 to print in the middle
mov dl, 0x13  ; Set the column to 19 to print in the middle
;call coloredcandies

mov ah,0x0E
mov bh,0
int 0x10

inc si
loop fillbyloop
ret
;
GenRandNum:
push cx
	push dx
	push ax
	rdtsc ;getting a random number in ax dx
	xor dx,dx ;making dx 0
	mov cx, 9
	div cx ;dividing by 9 to get numbers from 0-8
	mov [randNum], dl ;moving the random number in variable
	pop ax
	pop dx
	pop cx
	ret
;
printcandy:
push bp
mov bp,sp
push es
push ax
push cx
push si
push di
mov ax,0xb800
mov es,ax
mov al,80
mul byte [bp+10]
add ax,[bp+12]
shl ax,1
mov di,ax
mov si, [bp+6]
mov cx, [bp+4]
mov ah, [bp+8]
nextchar:
mov al,[si]
mov [es:di],ax
add di,2
add si,1
loop nextchar
pop di
pop si
pop cx
pop ax
pop es
pop bp
ret 10
;
candies:
ll1:
mov ax,4         ;red on black attribute
push ax
mov ax,c1        ;push candy number
push ax
push word [length]
call printcandy
ll2:
mov ax,14         ;yellow on black attribute
push ax
mov ax,c2        ;push candy number
push ax
push word [length]
call printcandy
ll3:
mov ax,2         ;green on black attribute
push ax
mov ax,c1        ;push candy number
push ax
push word [length]
call printcandy
a11:
mov ax,34        ;x position
push ax
mov ax,8        ;y position
push ax
call GenRandNum
mov ax,randNum
cmp ax,1
jmp ll1
cmp ax,2
jmp ll2
cmp ax,3
jmp ll3
cmp ax,4
jmp ll1
cmp ax,5
jmp ll2
cmp ax,6
jmp ll3
cmp ax,7
jmp ll1
cmp ax,8
jmp ll2
cmp ax,9
jmp ll3
cmp ax,0
jmp ll1

a12:
a13:
a14:
a15:
a21:
a22:
a23:
a24:
a25:
a31:
;a32:
a33:
a34:
a35:
a41:
a42:
a43:
a44:
a45:
a51:
a52:
a53:
a54:
a55:
ret
;
randomNumber:
   push cx
   push dx
	push ax
;using read time stamp counter
	rdtsc ;getting a random number in ax dx
	xor dx,dx ;making dx 0
	mov cx, 8
	div cx ;dividing by 8 to get numbers from 0-7
	mov [randNum], dl ;moving the random number in variable
	pop ax
	pop dx
	pop cx

ret
;
randomcombo:
push bp
mov bp,sp;
push cx
push ax
push dx;

MOV AH, 00h ; interrupts to get system time
INT 1AH ; CX:DX now hold number of clock ticks since midnight
mov ax, dx
xor dx, dx
mov cx, 80;
div cx ; here dx contains the remainder of the division - from 0 to 9

add dl, '0' ; to ascii from '0' to '9'

mov word[randNum],dx;


pop cx;
pop ax;
pop dx;
pop bp;
ret
;
canidy2:
;random number initalisation here
	
	mov al, [columns]
	xor ah, ah
	mov dx, 0x22
	sub dx, 3
	
l2:
call GenRandNum
	push ax
	
	add dx, 0x04
	
	mov cl, [rows]
	xor ch, ch

	
l1:
	call GenRandNum
	push cx
	mov ah, 0x13 ; service 13 - print string
	mov al, 0 ; subservice 01 – update cursor
	mov bh, 0 ; output on page 0
	
	mov si, [randNum]
	call randomNumber
;call GenRandNum
;call randomcombo
	mov bl, [InitialColours + si]
	
	;mov dx, 0x0A03 ; row 10 column 3
	
	mov dh, cl
	add dh, cl
	add dh,6
	
	mov cx, 1 ; length of string
	push cs
	pop es ; segment of string

	mov bp, InitialCharacters ; offset of string
	add bp, si

	int 0x10
	
	pop cx
	dec cx
	cmp cx, 0
	jne l1
	
	pop ax
	dec ax
	cmp ax, 0
	jne l2

	ret
;
mouseclick:
 push bp
	mov bp, sp
	push ax
	push bx
	push cx;
	push di
	push dx

	xor ax, ax;subservice to reset mouse
	int 33h
waitclick:
	mov ax, 0001h ;to show mouse
	int 33h
	mov ax,0003h  ;function to get mouse position
	int 33h
	or bx,bx
	jz short waitclick
	mov ax, 0002h ;hide mouse after clicking
	int 33h
	shr cx, 3       ; Shift right CX register by 3 (divide by 8)
   shr dx, 3       ; Shift right DX register by 3 (divide by 8)
 ;memory loaction calculation from 6.4
	mov ax, 0xb800
	mov es, ax
	mov ax, 80
	mov bx, dx
	mul bl
	add ax, cx
	shl ax, 1
    mov di, ax
	mov ax, [es:di]
	mov [bp+4], di  ;return coordinate of click
	
	pop dx
	pop di
	pop cx
	pop bx
	pop ax
	pop bp
	ret
rg:
	push bp
	mov bp,sp
	push ax
	push es
	push si
	push di
	push dx
	push bx

	jmp startfun

	endfun1:
	pop bx
	pop dx
	pop di
	pop si
	pop es
	pop ax
	pop bp
	ret 2

	startfun:
	
	mov ax, 0xb800
	mov es, ax
	mov di, [bp+4]   ;memory location where the mouse clicked
	jmp mainrg

	looprandom:
	cmp di, 480
	jb endfun1

	sub di, 320
	mov bx, [es:di]

	mov [es:di+320], bx
	cmp di, 480
	ja looprandom

	call randomNumber
	mov si, [randNum]
	mov ah, [InitialColours+si]

	mov al, [InitialCharacters+si]
	mov [es:di], ax
	jmp endfun
mainrg:
	call randomNumber
	mov si, [randNum]
	mov ah, [InitialColours+si]

	mov al, [InitialCharacters+si]
	mov [es:di], ax

	;Obstacles checking and removing
	mov di, [bp+4]
	add di, 320
	mov dx, [es:di]
	cmp dl, '~'
	je looprandom

	mov di, [bp+4]
	sub di, 320
	mov dx, [es:di]
	cmp dl, '~'
	je looprandom

	mov di, [bp+4]
	sub di, 12
	mov dx, [es:di]
	cmp dl, '~'
	je looprandom

	mov di, [bp+4]
	add di, 12
	mov dx, [es:di]
	cmp dl, '~'
	je looprandom

	mov di, [bp+4]
	add di, 320
	sub di, 12
	mov dx, [es:di]
	cmp dl, '~'
	je looprandom

	mov di, [bp+4]
	sub di, 320
	sub di, 12
	mov dx, [es:di]
	cmp dl, '~'
	je looprandom

	mov di, [bp+4]
	sub di, 320
	add di, 12
	mov dx, [es:di]
	cmp dl, '~'
	je looprandom

	mov di, [bp+4]
	add di, 320
	add di, 12
	mov dx, [es:di]
	cmp dl, '~'
	je looprandom

endfun:
	pop bx
	pop dx
	pop di
	pop si
	pop es
	pop ax
	pop bp
	ret 2
;
revertc:

	push bp
	mov bp, sp
	push es
	push di 
	push ax
	
	mov ax, 0xb800
	mov es, ax
	mov di, [bp+4] ;the di location sent from main
	
	mov al, ' '
	mov ah, 00010000b
	;to highlight the selected block
	mov [es:di-4], ax 
	mov [es:di-2], ax
	mov [es:di+2], ax
	mov [es:di+4], ax
	
	pop ax
	pop di
	pop es
	pop bp
	ret 2
;
bombsub:

	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx
	push es
	push si
	push di
	mov si, 0
	
	mov ax, 0xb800
	mov es, ax
	
	mov di, [bp+6]
	mov cx, [es:di]
	
	mov di, [bp+4] ;bomb always here
	mov dx, [es:di]
	
	push di
	call rg
	
	mov di, 320 ; leave first 3 row as already covered by topstrip sub routine

bombnext_:
		
		mov ax, [es:di]
		cmp al, cl
		je remove_
		
continue_next_:		
		
		add di, 2
		cmp di, 4000
		jne bombnext_
		jmp fun_eend
		
remove_:
		inc si
remov_:		
		push di
		call rg
		mov ax, [es:di]
		cmp al, cl
		je remov_
		jmp continue_next_	
	
	fun_eend:
	push si
	call updateScore
	pop di
	pop si
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	
	ret 4
;
swapchars:
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx
	push di
	push si
	mov si, [bp+4]   ;si
	mov ax, [bp+6]   ;di

	add ax, 320     ;as i gave 3 row space between each candy
	cmp ax, si
	je swap
	
	mov ax, [bp+6]   ;di
	sub ax, 320
	cmp ax, si
	je swap
	
	mov ax, [bp+6]
	add ax, 12
	cmp ax, si
	je swap
	
	mov ax, [bp+6]
	sub ax, 12
	cmp ax, si
	je swap
	
	jmp returnfun
;
swap:
	
	mov ax, 0xb800
	mov es, ax
	
	
	mov ax, [bp+6]
	mov di, ax
	
	mov dx, [es:di] ; 1st ; bp+6
	
	mov di, si
	mov si, 0 ; count of pattern

	mov bx, [es:di] ; 2nd ; bp+4
    ;to only check lower byte with character and not the colour 
	cmp dl, '~'
	je returnfun

	cmp bl, '~'
	je returnfun
	
	
	;interchange
	mov di, [bp+6]
	mov [es:di], bx
	
	mov di, [bp+4]
	mov [es:di], dx
		
	;now ;1st ; bp+4 ;2nd; bp+6
	p:
	
	mov di, [bp+6]
	push di
	mov di, [bp+4]
	push di
	call pattern
count:
	;moves count and show
	    mov cx, 13
		mov ax, 0xb800
		mov es, ax
		mov di, 260
		mov si, TotalMoves    ;string        
		mov ah, 00100000b 

prtRemMoves: ; half red
		mov al, [si]
		mov [es:di], ax
		add di, 2
        add si, 1
		loop prtRemMoves

	mov si,Moves
	mov di, 282
	mov cx, 1
	
	prtRemMovesC:
	mov al, [si]
	add al, 0x30
	sub al, 1
	mov [es:di], ax
	add di, 2
	add si, 1
	sub al, 0x30
	mov [Moves], al
	loop prtRemMovesC
returnfun:
	pop si
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 4
;
pattern:
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx
	push es
	push si
	push di
	
	mov ax, 0xb800
	mov es, ax
	
	mov di, [bp+6]
	mov bx, [es:di]
	
	mov di, [bp+4]
	mov dx, [es:di]
	
	cmp dl, 'X'
	jne bombl
	
	cmp bl, 'X'
	je fun_ter
	jmp bomb11
	
	fun_ter:
	pop di
	pop si
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	
	ret 4
;
bomb11:	
	
	mov di, [bp+6]
	push di
	mov di, [bp+4]
	push di
	call bombsub
	jmp fun_ter
	
bombl:

	cmp bl, 'X'
	jne topleft
	
	cmp dl, 'X'
	je fun_ter
	
	mov di, [bp+4]
	push di
	mov di, [bp+6]
	push di
	call bombsub
	jmp fun_ter

	topleft:
	mov si, 0
	mov di, [bp+4]
	sub di, 320
	sub di, 12
	mov cx, [es:di]
	cmp dx, cx
	jne topright  

	continuetopleft:
	inc si
	push di
	call rg
	sub di, 320
	sub di, 12
	mov cx, [es:di]
	cmp dx,cx
	je continuetopleft

	topright:
	mov di, [bp+4]
	sub di, 320
	add di, 12
	mov cx, [es:di]
	cmp dx, cx
	jne bottomleft

	continuetopright:
	inc si
	push di
	call rg
	sub di, 320
	add di, 12
	mov cx, [es:di]
	cmp dx,cx
	je continuetopright

	bottomleft:
	mov di, [bp+4]
	add di, 320
	sub di, 12
	mov cx, [es:di]
	cmp dx, cx
	jne bottomright  

	continuebottomleft:
	inc si
	push di
	call rg
	add di, 320
	sub di, 12
	mov cx, [es:di]
	cmp dx,cx
	je continuebottomleft

	bottomright:
	mov di, [bp+4]
	add di, 320
	add di, 12
	mov cx, [es:di]
	cmp dx, cx
	jne down

	continuebottomright:
	inc si
	push di
	call rg
	add di, 320
	add di, 12
	mov cx, [es:di]
	cmp dx,cx
	je continuebottomright
		
	down:
	mov di, [bp+4]
	add di, 320
	mov cx, [es:di]
	cmp dx, cx
	jne up  

	continuedown:
	inc si
	push di
	call rg
	add di, 320
	mov cx, [es:di]
	cmp dx,cx
	je continuedown

	up:
	mov di, [bp+4]
	sub di, 320
	mov cx, [es:di]
	cmp dx, cx
	jne right  

	continueup:
	inc si
	push di
	call rg
	sub di, 320
	mov cx, [es:di]
	cmp dx,cx
	je continueup
	
	right:
	mov di, [bp+4]
	add di, 12
	mov cx, [es:di]
	cmp dx, cx
	jne left
	
	continueright:
	inc si
	push di
	call rg
	add di, 12
	mov cx, [es:di]
	cmp dx,cx
	je continueright

	left:
	mov di, [bp+4]
	sub di, 12
	mov cx, [es:di]
	cmp dx, cx
	jne pass
	
	continueleft:
	inc si
	push di
	call rg
	sub di, 12
	mov cx, [es:di]
	cmp dx,cx
	je continueleft

	pass:

	push si
	call setflag
	mov di, [bp+4]


	cmp byte[bombflag], 0
	jne updateoriginal
	mov di, [bp+4]
	inc si
	push si
	call updateScore

	push ax
	push di
	call rg
	mov al, 'X'
	mov ah, 0x05
	mov [es:di], ax
	pop ax
	jmp topleft2

	updateoriginal:
	cmp si, 0
	je topleft2 
	push di
	call rg
	inc si
	push si
	call updateScore

	topleft2:
	mov si, 0
	mov di, [bp+6]
	sub di, 320
	sub di, 12
	mov cx, [es:di]
	cmp bx, cx
	jne bottomright2

	continuetopleft2:
	inc si
	push di
	call rg
	sub di, 320
	sub di, 12
	mov cx, [es:di]
	cmp bx,cx
	je continuetopleft2

	bottomright2:
	mov di, [bp+6]
	add di, 320
	add di, 12
	mov cx, [es:di]
	cmp bx, cx
	jne topright2

	continuebottomright2:
	inc si
	push di
	call rg
	add di, 320
	add di, 12
	mov cx, [es:di]
	cmp bx,cx
	je continuebottomright2

	topright2:
	mov di, [bp+6]
	sub di, 320
	add di, 12
	mov cx, [es:di]
	cmp bx, cx
	jne bottomleft2

	continuetopright2:
	inc si
	push di
	call rg
	sub di, 320
	add di, 12
	mov cx, [es:di]
	cmp bx,cx
	je continuetopright2

	bottomleft2:
	mov di, [bp+6]
	add di, 320
	sub di, 12
	mov cx, [es:di]
	cmp bx, cx
	jne down2

	continuebottomleft2:
	inc si
	push di
	call rg
	add di, 320
	sub di, 12
	mov cx, [es:di]
	cmp bx,cx
	je continuebottomleft2
	
	down2:
	mov di, [bp+6]
	add di, 320
	mov cx, [es:di]
	cmp bx, cx
	jne up2

	continuedown2:
	inc si
	push di
	call rg
	add di, 320
	mov cx, [es:di]
	cmp bx,cx
	je continuedown2

	up2:
	mov di, [bp+6]
	sub di, 320
	mov cx, [es:di]
	cmp bx, cx
	jne right2

	continueup2:
	inc si
	push di
	call rg
	sub di, 320
	mov cx, [es:di]
	cmp bx,cx
	je continueup2
	
	right2:
	mov di, [bp+6]
	add di, 12
	mov cx, [es:di]
	cmp bx, cx
	jne left2
	
	continueright2:
	inc si
	push di
	call rg
	add di, 12
	mov cx, [es:di]
	cmp bx,cx
	je continueright2

	left2:
	mov di, [bp+6]
	sub di, 12
	mov cx, [es:di]
	cmp bx, cx
	jne pass2
	
	continueleft2:
	inc si
	push di
	call rg
	sub di, 12
	mov cx, [es:di]
	cmp bx,cx
	je continueleft2

	pass2:

	push si
	call setflag
	mov di, [bp+6]


	cmp byte[bombflag], 0
	jne updateoriginal2
	mov di, [bp+6]
	inc si
	push si
	call updateScore

	push ax
	push di
	call rg
	mov al, 'X'
	mov ah, 0x05
	mov [es:di], ax
	pop ax
	jmp fun_end

	updateoriginal2:
	
	cmp si, 0
	je fun_end 
	push di
	call rg
	inc si
	push si
	call updateScore

	fun_end:
	pop di
	pop si
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	
	ret 4
;
setflag:
	push bp
	mov bp, sp
	push ax
	push dx
	mov dx, [bp+4]

	cmp dx, 1
	ja resetflag

	mov al, 1
	mov [bombflag], al
	jmp endsetflag

	resetflag:
	mov al, 0
	mov [bombflag], al

	endsetflag:
	pop dx
	pop ax
	pop bp
	ret 2
;
changec:
	
	push bp
	mov bp, sp
	push es
	push di 
	push ax
	
	mov ax, 0xb800
	mov es, ax
	mov di, [bp+4]
	
	mov al, ' '
	mov ah, 01000000b
	
	mov [es:di-4], ax 
	mov [es:di-2], ax
	mov [es:di+2], ax
	mov [es:di+4], ax
	
	pop ax
	pop di
	pop es
	pop bp
	ret 2
;
updateScore:
	push bp
	mov bp,sp
	push ax
	push dx
	mov dx, [bp+4]
	xor dh, dh
	mov ax, [ScoreVal]
	add ax, dx
	mov [ScoreVal], ax

	xor ah, ah
	push ax
	call printnum
	pop dx
	pop ax
	pop bp
	ret 2
;
printnum: 
		push bp
		mov bp, sp
		push es
		push ax
		push bx
		push cx
		push dx
		push di
		
		mov ax, 0xb800
		mov es, ax ; point es to video base
		mov ax, [bp+4] ; load number in ax
		mov bx, 10 ; use base 10 for division
		mov cx, 0 ; initialize count of digits

nextdigit: 
		mov dx, 0 ; zero upper half of dividend
		div bx ; divide by 10
		add dl, 0x30 ; convert digit into ascii value
		push dx ; save ascii value on stack
		inc cx ; increment count of values
		cmp ax, 0 ; is the quotient zero
		jnz nextdigit ; if no divide it again
		
		mov di, 124 ; point di
		
nextpos:
		pop dx ; remove a digit from the stack
		mov dh, 00100000b ; use normal attribute
		mov [es:di], dx ; print char on screen
		add di, 2 ; move to next screen location
		loop nextpos ; repeat for all digits on stack
		
		pop di
		pop dx
		pop cx
		pop bx
		pop ax
		pop es
		pop bp
		ret 2
;
start:
call clrscr
call frontpage
call keyinput
call instructions
call keyinput
call printboard
call hzl
call vtl
call taskbar
;call candies
call canidy2
gettwochars:
	sub sp, 2
	call mouseclick
	pop di
push di ;send mouse location to stack for [es:di]
	call changec
mov cx, 0xFFFF
delay:
	sub cx, 1
	cmp cx,0
	jne delay
ret
mov cx, 0xFFFF
call delay
mov cx, 0xFFFF
call delay

sub sp, 2
call mouseclick
pop si

; 1st revert color
	push di
	call revertc

push di
	push si
	call swapchars

endofprog:
mov ax,0x4c00
int 0x21