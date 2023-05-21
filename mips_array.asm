.text
.globl main

main:

li $v0, 5
syscall
move $t0, $v0
move $t5, $t0

li $t1, 4
mult $t0, $t1
mflo $t8

addi $t1, $0, 0

read:
li $v0, 5
syscall
move $t2, $v0
sw $t2, array($t1)
addi $t1, $t1, 4

sub $t0, $t0, 1
beq $t1, $t8, end
j read

end:

addi $t1, $0, 0

print:             

lw $t2, array($t1)
li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, newline
syscall

addi $t1, $t1, 4

sub $t5, $t5, 1
beq $t1, $t8, end1
j print

end1:
li $v0, 10
syscall

.data
array: .space 12
newline:   .asciiz	"\n"