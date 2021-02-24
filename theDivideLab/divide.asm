# Jaime Bohorquez
# NID: ja409704
# EEL 3801 - Computer Organization, Spring 2021
# Programmed using MARS on Mac OS Big Sur
# Filename: divide.asm
# Project 1 Part B
# Registers used: $v0, $a0, $s0, $t0, $t1, $t4, $t5, $t6

.data
newline: .asciiz "\n"
f_ten: .asciiz "f_ten = "
g_ten: .asciiz "g_ten = "
h_q: .asciiz "h_quotient = "
h_r: .asciiz "h_remainder = "
i_m: .asciiz "i_mod = "
# Debugging line.
checkPoint: .asciiz "check"
.text
main:
# Print format for f_ten
li $v0, 4
la $a0, f_ten
syscall

# Get f from user, put into $t0.
li $v0, 5
syscall
move $t0, $v0

# Print format g_ten
li $v0, 4
la $a0, g_ten
syscall

# Get g number from user, put into $t1.
li $v0, 5
syscall
move $t1, $v0

# Finding our q
li $t4, 0 # Our quotient
move $t5, $t0 # Our result holder - remainder
Loop:
# Condition
bgt $t1, $t5, LoopEnd

# Increment result
sub $t5, $t5, $t1
# Increment Counter
add $t4, $t4, 1
j Loop
LoopEnd:

# Print format quotient
li $v0, 4
la $a0, h_q
syscall

# Print quotient
li $v0, 1
move $a0, $t4
syscall

# end line
li $v0, 4
la $a0, newline
syscall


# Print format remainder
li $v0, 4
la $a0, h_r
syscall

# Print remainder
li $v0, 1
move $a0, $t5
syscall

# end line
li $v0, 4
la $a0, newline
syscall

# now we find f + g
add $s0, $t0, $t1


# Finding our quotient
li $t6, 0 # Our quotient
move $t5, $s0 # Our result holder - remainder
Loop1:
# Condition
bgt $t4, $t5, LoopEnd1

# Increment result
sub $t5, $t5, $t4
# Increment Counter
add $t6, $t6, 1
j Loop1
LoopEnd1:


# Print format remainder
li $v0, 4
la $a0, i_m
syscall

# Print mod
li $v0, 1
move $a0, $t5
syscall

# end line
li $v0, 4
la $a0, newline
syscall

li $v0, 10 # syscall code 10 is for exit.
syscall # make the syscall.

# End of divide.asm.
