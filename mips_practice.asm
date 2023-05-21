
.text
.globl main

main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

li $t1, 4
mult $t0, $t1
mflo $t8       #arr1 size

addi $t0, $0, 0
read:
li $v0, 5
syscall 
move $t1, $v0
sw $t1, arr($t0)
addi $t0, $t0, 4
beq $t0, $t8, next1
j read

next1:
addi $t0, $0, 0
loop1:
lw $t1, arr($t0)

add $t2, $0, $t0    #arr ind 2
li $t6, 100
loop2:
lw $t3, arr($t2)

li $t4, 0
slt $t4, $t6, $t3
beq $t4, $0, small
j f1
small:
move $t6, $t3
move $t7, $t2

f1:
addi $t2, $t2, 4
beq $t2, $t8, out
j loop2


out:
li $t4, 0
slt $t4, $t1, $t6
beq $t4, $0, swap
j f2

swap:
sw $t1, arr($t7)
sw $t6, arr($t0)

f2:
addi $t0, $t0, 4
beq $t0, $t8, next2
j loop1


next2:
addi $t0, $0, 0

print:
lw $t1, arr($t0)
li $v0, 1
move $a0, $t1
syscall
li $v0, 4
la $a0, newline
syscall

addi $t0, $t0, 4
beq $t0, $t8, end
j print

addi $t0, $t0, 4
beq $t0, $t8, end
j print



end:
li $v0, 10
syscall

.data
arr: .space 120
msg1: .asciiz "enter"
newline:   .asciiz	"\n"