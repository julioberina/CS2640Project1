# Who:  Julio Berina
# What: one_per_line.asm
# Why:  A template to be used for all CS264 labs
# When: Sep 24 2018, Due on Sep 26 2018
# How:  Read input and store it into array. Print line by line

.data
array:  .space 80
msg:    .asciiz "Enter 20 integers:\n"
write:  .asciiz "\nThe 20 array elements are:\n"
terpri: .asciiz "\n"

.text
.globl main


main:   # program entry

        # print msg
        la $a0, msg
        li $v0, 4
        syscall

        li $t0, 0
	la $a1, array

readinputs:
        beq $t0, 80, load

        # Get integer
        li $v0, 5
        syscall

        sw $v0, 0($a1)
        addi $a1, $a1, 4
        addi $t0, $t0, 4
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

        la $a0, terpri
        li $v0, 4
        syscall

        addi $a1, $a1, 4
        addi $t0, $t0, 4

        bne $t0, 80, writeinputs

li $v0, 10             # terminate the program
syscall
