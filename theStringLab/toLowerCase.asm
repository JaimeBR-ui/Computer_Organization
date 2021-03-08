.data
str: .asciiz "HeLlo WoRld" 
newline: .asciiz "\n"

.text
main:
	la $a0, str

loop:
	lb $t0, 0($a0)
	beqz $t0, exit
	blt $t0, 'A', continue
	bgt $t0, 'Z', continue
	addi $t0, $t0, 32
	sb $t0, 0($a0)
	j continue

continue:
	addi $a0, $a0, 1
	j loop

exit:
	li $v0, 4
	la $a0, str
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	li $v0, 10
	syscall
