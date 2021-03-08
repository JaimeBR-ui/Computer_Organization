# Soheil Salehi 02/21/2016
# strlength.asm--A program that determine the length of a null terminated string# Registers used:
#  $t0 -used to hold the loop counter#  $a0 -used to hold the address of string 
#  $v0 -syscall parameter and return value
.data 
str: .asciiz "abcde" # should be : 5
.text
# Load address of string into a0
la $a0, str
# initialize the count to zero
li $t0, 0 
loop:
lb $t1, 0($a0) # load the next character into t1
beqz $t1, exit # check for the null character
add $t0, $t0, 1
add $a0, $a0, 1 # shift byte by counter amount
j loop
exit:
li $v0, 1
move $a0, $t0
syscall
li $v0, 10
syscall