# Soheil Salehi 02/21/2016
# strlength.asm--A program that determine the length of a null terminated string
# Registers used:
#  $t0 -used to hold the loop counter
#  $a0 -used to hold the address of string
#  $v0 -syscall parameter and return value
.data
str:    .asciiz "abcde"
.text
# Load address of string into a0
|--------------------------------------|
|Put your code here                    |
|--------------------------------------|
strlen:li $t0, 0                  # initialize the count to zero
loop:
lb $t1, 0($a0)       # loadthe next character into t1
beqz $t1, exit       # check for the null character
|--------------------------------------|
|Put your code here                    |
|--------------------------------------|
exit:
li $v0, 1move $a0, $t0
syscall
li $v0, 10
syscall
