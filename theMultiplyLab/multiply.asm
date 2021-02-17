# Jaime Bohorquez
# NID: ja409704
# EEL 3801 - Computer Organization, Spring 2021
# Programmed using MARS on Mac OS Big Sur
# Filename: multiply.asm

.data
newline: .asciiz "\n"
f_ten: .asciiz "f_ten = "
f_two: .asciiz "f_two = "
g_ten: .asciiz "g_ten = "
g_two: .asciiz "g_two = "
# Debugging line.
checkPoint: .asciiz "check"
.text
main:
# Get first number from user, put into $t0.
li $v0, 5
syscall
move $t0, $v0

# Get second number from user, put into $t1.
li $v0, 5
syscall
move $t1, $v0

# Get second number from user, put into $t2.
li $v0, 5
syscall
move $t2, $v0

# Get second number from user, put into $t3.
li $v0, 5
syscall
move $t3, $v0

## Calculating F function
# Finding A^2
li $t4, 0 # Our loop Counter
li $t5, 0 # Our result holder
Loop:
# Condition
bge $t4, $t0, LoopEnd

# Increment result
add $t5, $t5, $t0
# Increment Counter
add $t4, $t4, 1
j Loop
LoopEnd:
# Now A^2 is stored on $t5


# Finding A^4 = (A ^ 2) * (A ^ 2)
li $t4, 0 # Our loop Counter
li $t6, 0 # Our result holder
Loop1:
# Condition
bge $t4, $t5, LoopEnd1

# Increment result
add $t6, $t6, $t5
# Increment Counter
add $t4, $t4, 1
j Loop1
LoopEnd1:
# Now A^4 is stored in $t6

# Move result to a save register
move $s0, $t6

# Calculate (B ^ 2) * B = B^3
# Finding B^2
li $t4, 0 # Our loop Counter
li $t5, 0 # Our result holder
Loop2:
# Condition
bge $t4, $t1, LoopEnd2

# Increment result
add $t5, $t5, $t1
# Increment Counter
add $t4, $t4, 1
j Loop2
LoopEnd2:
# Now B^2 is stored on $t5

# Finding B^3
li $t4, 0 # Our loop Counter
li $t6, 0 # Our result holder
Loop3:
# Condition
bge $t4, $t1, LoopEnd3

# Increment result
add $t6, $t6, $t5
# Increment Counter
add $t4, $t4, 1
j Loop3
LoopEnd3:
# Now B^3 is stored on $t6

# Finding 4 * B^3
li $t4, 0 # Our loop Counter
li $t7, 0 # Our result holder
Loop4:
# Condition
bge $t4, 4, LoopEnd4

# Increment result
add $t7, $t7, $t6
# Increment Counter
add $t4, $t4, 1
j Loop4
LoopEnd4:
# Now 4 * B^3 is stored on $t7

# Now we store a^4 - 4b^3
sub $s0, $s0, $t7

# Now we find c^2
li $t4, 0 # Our loop Counter
li $t5, 0 # Our result holder
Loop5:
# Condition
bge $t4, $t2, LoopEnd5

# Increment result
add $t5, $t5, $t2
# Increment Counter
add $t4, $t4, 1
j Loop5
LoopEnd5:
# Now C^2 is stored on $t5


# Now we find 3 * c^2
li $t4, 0 # Our loop Counter
li $t6, 0 # Our result holder
Loop6:
# Condition
bge $t4, 3, LoopEnd6

# Increment result
add $t6, $t6, $t5
# Increment Counter
add $t4, $t4, 1
j Loop6
LoopEnd6:
# Now 3 * C^2 is stored on $t6

# Now we store a^4 - 4b^3 + 3c^2
add $s0, $s0, $t6

# now we store a^4 - 4b^3 + 3c^2 - d
sub $s0, $s0, $t3

# now we store a^4 - 4b^3 + 3c^2 - 2d
sub $s0, $s0, $t3

# Print format
li $v0, 4
la $a0, f_ten
syscall

# Print F = a^4 - 4b^3 + 3c^2 - 2d
li $v0, 1
move $a0, $s0
syscall

# end line
li $v0, 4
la $a0, newline
syscall

# Print format
li $v0, 4
la $a0, f_two
syscall

# Print F = a^4 - 4b^3 + 3c^2 - 2d
li $v0, 35
move $a0, $s0
syscall

# end line
li $v0, 4
la $a0, newline
syscall

# Calculate B^2
# Finding B^2
li $t4, 0 # Our loop Counter
li $t5, 0 # Our result holder
Loop7:
# Condition
bge $t4, $t1, LoopEnd7

# Increment result
add $t5, $t5, $t1
# Increment Counter
add $t4, $t4, 1
j Loop7
LoopEnd7:
# Now B^2 is stored on $t5

# Now we calculate A*B^2
li $t4, 0 # Our loop Counter
li $t6, 0 # Our result holder
Loop8:
# Condition
bge $t4, $t0, LoopEnd8

# Increment result
add $t6, $t6, $t5
# Increment Counter
add $t4, $t4, 1
j Loop8
LoopEnd8:
# Now A * B^2 is stored on $t6

# now we move A * B^2 to $s1

move $s1, $t6

# Now we find c^2
li $t4, 0 # Our loop Counter
li $t5, 0 # Our result holder
Loop9:
# Condition
bge $t4, $t2, LoopEnd9

# Increment result
add $t5, $t5, $t2
# Increment Counter
add $t4, $t4, 1
j Loop9
LoopEnd9:
# Now C^2 is stored on $t5

# Now we find c^2 * d
li $t4, 0 # Our loop Counter
li $t6, 0 # Our result holder
Loop10:
# Condition
bge $t4, $t3, LoopEnd10

# Increment result
add $t6, $t6, $t5
# Increment Counter
add $t4, $t4, 1
j Loop10
LoopEnd10:
# Now C^2*d is stored on $t6

# Now we find c^2 * d^2
li $t4, 0 # Our loop Counter
li $t5, 0 # Our result holder
Loop11:
# Condition
bge $t4, $t3, LoopEnd11

# Increment result
add $t5, $t5, $t6
# Increment Counter
add $t4, $t4, 1
j Loop11
LoopEnd11:
# Now C^2*d^2 is stored on $t5

# Now we find c^2 * d^3
li $t4, 0 # Our loop Counter
li $t6, 0 # Our result holder
Loop12:
# Condition
bge $t4, $t3, LoopEnd12

# Increment result
add $t6, $t6, $t5
# Increment Counter
add $t4, $t4, 1
j Loop12
LoopEnd12:
# Now C^2*d^3 is stored on $t6

add $s1, $s1, $t6

# Print format
li $v0, 4
la $a0, g_ten
syscall

# Print G = a*b^2 + c^2*d^3
li $v0, 1
move $a0, $s1
syscall

# end line
li $v0, 4
la $a0, newline
syscall

# Print format
li $v0, 4
la $a0, g_two
syscall

# Print G = a*b^2 + c^2*d^3
li $v0, 35
move $a0, $s1
syscall

# end line
li $v0, 4
la $a0, newline
syscall

li $v0, 10 # syscall code 10 is for exit.
syscall # make the syscall.

# End of multiply.asm.
