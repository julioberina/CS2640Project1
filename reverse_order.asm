# Who:  Julio Berina
# What: reverse_order.asm
# Why:  A template to be used for all CS264 labs
# When: Sep 24 2018, Due on Sep 26 2018
# How:  Read input and store it into array. Print in single line in reverse, n per line

.data
array:  .space 80
getn:   .asciiz "Enter integer <= 20: "
msg:    .asciiz "Enter 20 integers:\n"
write:  .asciiz "\nThe 20 array elements in reverse (n per line) are:\n"
blank:  .asciiz " "
terpri: .asciiz "\n"

.text
.globl main


main:   # program entry

        # print getn
        la $a0, getn
        li $v0, 4
        syscall

        li $v0, 5
        syscall

        move $s0, $v0

        # print msg
        la $a0, msg
        li $v0, 4
        syscall

        li $t0, 80
        li $t1, 0 # for display n per line
	la $a1, array
        addi $a1, $a1, 76

readinputs:
        beq $t0, 0, load

        # Get integer
        li $v0, 5
        syscall

        sw $v0, 0($a1)
        addi $a1, $a1, -4
        addi $t0, $t0, -4
        j readinputs

load:
        li $t0, 0
        la $a1, array
        la $a0, write
        li $v0, 4
        syscall

writeinputs:
        li $v0, 1
        lw $a0, 0($a1)
        syscall

        la $a0, blank
        li $v0, 4
        syscall

        addi $a1, $a1, 4
        addi $t0, $t0, 4
        addi $t1, $t1, 1

        beq $t1, $s0, addterpri
        bne $t0, 80, writeinputs

addterpri:
        la $a0, terpri
        li $v0, 4
        syscall
        li $t1, 0
        bne $t0, 80, writeinputs

li $v0, 10             # terminate the program
syscall
