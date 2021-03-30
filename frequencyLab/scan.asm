# Jaime Bohorquez
# NID: ja409704
# EEL 3801 - Computer Organization, Spring 2021
# Programmed using MARS on Mac OS Big Sur
# Filename: scan.asm

# Registers used:
# $s0-s$1: stores the frequency of buffer1 and buffer2 respectively.
# $v0: used to load the system call
# $t0-$t5: temporary storage. Check mini comment headers for more details on
#          the usage in each case throught the program.
# $a0-$a2: used to load the arguments to call functions.
#          More details in function label header.

.data
  str: .asciiz "UCF, its athletic program, and the university's alumni and sports fans are sometimes jointly referred to as the UCF Nation, and are represented by the mascot Knightro. The Knight was chosen as the university mascot in 1970 by student election. The Knights of Pegasus was a submission put forth by students, staff, and faculty, who wished to replace UCF's original mascot, the Citronaut, which was a mix between an orange and an astronaut. The Knights were also chosen over Vincent the Vulture, which was a popular unofficial mascot among students at the time. In 1994, Knightro debuted as the Knights official athletic mascot. "
  newline: .asciiz "\n"
  colon: .asciiz ": "
  block: .asciiz "#"
  fw: .asciiz "Please input first word: "
  sw: .asciiz "Please input second word: "
  # buffers
  buffer1: .space 15
  buffer2: .space 15

.text
loadargs:
  # Print prompt
  li $v0, 4
  la $a0, fw
  syscall

  # Load first string.
  li $v0,8
  la $a0, buffer1
  li $a1, 20
  move $t0, $a0
  syscall

  # Print second prompt.
  li $v0, 4
  la $a0, sw
  syscall

  # Load second string.
  li $v0, 8
  la $a0, buffer2
  li $a1, 20
  move $t0, $a0
  syscall

loadasuppercase:
  la $a0, str
  jal uppercase
  la $a0, buffer1
  jal uppercase
  la $a0, buffer2
  jal uppercase

findwordamount:
  # $s0 stores freq1, $s1 stores freq2
  # we use t0 as the return holder

  # Get first word frequency.
  la $a2, buffer1
  jal getwordcount
  move $s0, $a1

  # Get second word frequency.
  la $a2, buffer2
  jal getwordcount
  move $s1, $a1

print:
  # Print first buffer frequency.
  li $v0, 4
  la $a0, buffer1
  syscall

  li $v0, 4
  la $a0, colon
  syscall

  li $v0, 1
  move $a0, $s0
  syscall

  li $v0, 4
  la $a0, newline
  syscall

  # Print second buffer frequency.
  li $v0, 4
  la $a0, buffer2
  syscall

  li $v0, 4
  la $a0, colon
  syscall

  li $v0, 1
  move $a0, $s1
  syscall

  li $v0, 4
  la $a0, newline
  syscall

  # New line
  li $v0, 4
  la $a0, newline
  syscall

  # New line
  li $v0, 4
  la $a0, newline
  syscall

  # Print histogram for first
  la $t0, buffer1
  move $t1, $s0
  jal printHist

  # Print histogram for second.
  la $t0, buffer2
  move $t1, $s1
  jal printHist

exit:
  li $v0, 10
  syscall

returner:
  jr $ra

uppercase:
  lb $t0, 0($a0)
  beq $t0, '\n', tonull
  beqz $t0, returner
  blt $t0, 'a', continue
  bgt $t0, 'z', continue
  subi $t0, $t0, 32
  sb $t0, 0($a0)
  j continue

continue:
  addi $a0, $a0, 1
  j uppercase

tonull:
  sb $0, 0($a0)
  j continue

printHist:
  # Print buffer content.
  li $v0, 4
  move $a0, $t0
  syscall

  li $v0, 4
  la $a0, colon
  syscall

  li $t5, 0 # Our loop counter.
  LoopPH:
  # Condition
  bge $t5, $t1, LoopEndPH

  li $v0, 4
  la $a0, block
  syscall

  # Increment Counter
  add $t5, $t5, 1
  j LoopPH
  LoopEndPH:

  # New line
  li $v0, 4
  la $a0, newline
  syscall
  j returner

getwordcount:
  # $a0 holds our paragraph.
  # $a1 - holds counter to return.
  # $a2 - holds string addr. what we look for.
  la $a0, str
  li $a1, 0
  # Outer loop.
  LoopOuter:
  lb $t0, 0($a0) # load byte to $t0
  # Condition
  beqz $t0, LoopEndOuter # Null byte means end of string.
  move $t1, $a0 # $t1 will be our inner loop shifter paragraph
  move $t2, $a2 # $t2 will be our inner loop shifter buffer

  LoopInner:
  lb $t3, 0($t1)
  lb $t4, 0($t2)

  # Conditions
  beqz $t4, Found # If we end the iteration of our search string
  beqz $t3, LoopEndInner # if we reach the end and didnt end the buffer
  bne $t3, $t4, LoopEndInner # if they arent equal then continue

  # Increment both of the addresses.
  addi $t1, $t1, 1
  addi $t2, $t2, 1
  j LoopInner
  Found:
  # If found then we increment counter.
  addi $a1, $a1, 1
  LoopEndInner:

  addi $a0, $a0, 1 # Increment our addr.
  j LoopOuter
  LoopEndOuter:

  j returner
