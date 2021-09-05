#this project prints every prime till the given number
.data
    enter: .asciiz "\n"

.text
  main:

    addi $s0, $zero, 1        # current int
    addi $t0, $zero, 1        # counter
    addi $s1, $zero, 10       # count
  
  loop:
    addi $s0, $s0, 1
    jal test_prime

    beq $v1, $zero, loop    
        
    li $v0, 1               
    add $a0, $s0, $zero     
    syscall

    li $v0, 4              
    la $a0, enter
    syscall
    
    beq $t0, $s1, finish  
    addi $t0, $t0, 1   
    j loop

  test_prime:

    addi $t1, $zero, 2

  loopprime:

    beq $s0, $t1, true
    div $s0, $t1
    mfhi $t2 
    beq $t2, $zero, false
    addi $t1, $t1, 1
    j loopprime

  false:

    addi $v1, $zero, 0
    jr $ra

  true:

    addi $v1, $zero, 1
    jr $ra

  finish:
    syscall
  
