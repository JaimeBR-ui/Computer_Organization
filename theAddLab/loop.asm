# Soheil Salehi -- 02/01/2016
 # add2.asm-- A program that computes and prints the sum
 # of two numbers specified at runtime by the user.
 # Registers used:
 # $t0 - used to hold the first number.
 # $t1 - used to hold the second number.
 # $t2 - used to hold the sum of the $t1 and $t2.
 # $v0 - syscall parameter and return value.
 # $a0 - syscall parameter.
.data
 newline: .asciiz "\n"
.text
 main:
 li $t2, 0 
 L1:
 # Condition
 bge $t2, 16, L2
 
 # Print number
 li $v0, 34
 move $a0, $t2
 syscall
 
 # end line
 li $v0, 4   
 la $a0, newline
 syscall

 # Increment
 add $t2, $t2, 1
 j L1
 L2:
 
 li $v0, 10 # syscall code 10 is for exit.
 syscall # make the syscall.
 # end of add2.asm.