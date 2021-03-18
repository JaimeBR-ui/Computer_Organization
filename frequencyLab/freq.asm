# Jaime Bohorquez
# NID: ja409704
# EEL 3801 - Computer Organization, Spring 2021
# Programmed using MARS on Mac OS Big Sur
# Filename: freq.asm

# Registers used:
# $t0-$t6: used to store the frequency of characters k,n,i,g,h,t,s in that order
# $s0: stores the counter used in the loops used for printout.
# $v0: used to load the system call
# $a0: used to load the string that we are processing

.data
str: .asciiz "coming  in  winners  of  three  in  a  row,  including  back-to-back  triumphs  on  the road, the knights returned to orlando hungry to finish out the regular season home schedule on a high note."
block: .asciiz "#"
kl: .asciiz "K: "
nl: .asciiz "N: "
il: .asciiz "I: "
gl: .asciiz "G: "
hl: .asciiz "H: "
tl: .asciiz "T: "
sl: .asciiz "S: "
newline: .asciiz "\n"


.text
main:
	la $a0, str
	# Initialize our histogram to zero.
	li $t0, 0 # k
	li $t1, 0 # n
	li $t2, 0 # i
	li $t3, 0 # g
	li $t4, 0 # h
	li $t5, 0 # t
	li $t6, 0 # s
loop:
	# for each letter in the string, if it matches a character we are counting, we add one to it.
	lb $s0, 0($a0)
	beqz $s0, exit
	beq $s0, 'k', kf
	beq $s0, 'n', nf
	beq $s0, 'i', if
	beq $s0, 'g', gf
	beq $s0, 'h', hf
	beq $s0, 't', tf
	beq $s0, 's', sf
	j continue

continue:
	# increment the pointer
	addi $a0, $a0, 1
	j loop

# these functions add 1 to the matching register
kf:
	addi $t0, $t0, 1
	j continue
nf:
	addi $t1, $t1, 1
	j continue
if:
	addi $t2, $t2, 1
	j continue
gf:
	addi $t3, $t3, 1
	j continue
hf:
	addi $t4, $t4, 1
	j continue
tf:
	addi $t5, $t5, 1
	j continue
sf:
	addi $t6, $t6, 1
	j continue

exit:
	# Print start of string k
	li $v0, 4
	la $a0, kl
	syscall
	
	li $s0, 0 # Our loop Counter
	Loop:
	# Condition
	bge $s0, $t0, LoopEnd
	
	li $v0, 4
	la $a0, block
	syscall
	
	# Increment Counter	
	add $s0, $s0, 1
	j Loop
	LoopEnd:
	
	# New line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Print start of string n
	li $v0, 4
	la $a0, nl
	syscall
	
	li $s0, 0 # Our loop Counter
	Loop1:
	# Condition
	bge $s0, $t1, LoopEnd1
	
	li $v0, 4
	la $a0, block
	syscall
	
	# Increment Counter	
	add $s0, $s0, 1
	j Loop1
	LoopEnd1:
	
	# New line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Print start of string i
	li $v0, 4
	la $a0, il
	syscall
	
	li $s0, 0 # Our loop Counter
	Loop2:
	# Condition
	bge $s0, $t2, LoopEnd2
	
	li $v0, 4
	la $a0, block
	syscall
	
	# Increment Counter	
	add $s0, $s0, 1
	j Loop2
	LoopEnd2:
	
	# New line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Print start of string g
	li $v0, 4
	la $a0, gl
	syscall
	
	li $s0, 0 # Our loop Counter
	Loop3:
	# Condition
	bge $s0, $t3, LoopEnd3
	
	li $v0, 4
	la $a0, block
	syscall
	
	# Increment Counter	
	add $s0, $s0, 1
	j Loop3
	LoopEnd3:
	
	# New line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Print start of string h
	li $v0, 4
	la $a0, hl
	syscall
	
	li $s0, 0 # Our loop Counter
	Loop4:
	# Condition
	bge $s0, $t4, LoopEnd4
	
	li $v0, 4
	la $a0, block
	syscall
	
	# Increment Counter	
	add $s0, $s0, 1
	j Loop4
	LoopEnd4:
	
	# New line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Print start of string t
	li $v0, 4
	la $a0, tl
	syscall
	
	li $s0, 0 # Our loop Counter
	Loop5:
	# Condition
	bge $s0, $t5, LoopEnd5
	
	li $v0, 4
	la $a0, block
	syscall
	
	# Increment Counter	
	add $s0, $s0, 1
	j Loop5
	LoopEnd5:
	
	# New line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Print start of string s
	li $v0, 4
	la $a0, sl
	syscall
	
	li $s0, 0 # Our loop Counter
	Loop6:
	# Condition
	bge $s0, $t6, LoopEnd6
	
	li $v0, 4
	la $a0, block
	syscall
	
	# Increment Counter	
	add $s0, $s0, 1
	j Loop6
	LoopEnd6:
	
	# New line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Exit program.
	li $v0, 10
	syscall