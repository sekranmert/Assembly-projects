#this project finds maximum and minimum in an array of numbers
.data
    array: .word 15, 2, 83, 14, 45, 63, 11, 6, 9, 7, 11, 35, 12, 45, 45, 69, 6, 0, -6, 78, 111, 55, 12, 47, 789, -9, 5, 0, 3, -63, 78 
    count: .word 31   
    maxstr: .asciiz " max :"
    minstr: .asciiz "\n min :"
# registers:
#   s0 -- array pointer
#   s1 -- current int
#
#   t0 – max
#   t1 – min
#   t2 – counter
#   t3 – final count
.text
  main:
    la $s0, array
    lw $t0, 0($s0)            #Sets Max 
    lw $t1, 0($s0)            #Sets Min 
    addi $t2, $zero, 0     #Sets the counter to 0
    lw $t3, count             #Sets count 
  loop: 
    lw $s1, 0($s0)            #Sets Current int
    beq $t2, $t3, finish   #if count and counter is equal finish
 
    addi $t4, $zero, 0      #Sets t4 flag to 0
    slt $t4,$s1,$t1           #if s1 less then min saves s1 as new min
    bne $t4,$zero, setmin

    addi $t4, $zero, 0        #Sets t4 flag to 0
    slt $t4,$t0,$s1      #if max less then s1 saves s1 as new max
    bne $t4,$zero, setmax

    addi $t2, $t2, 1            #Increments the counter
    addi $s0, $s0, 4           #Increments the pointer one int 
    j loop
 
  setmax:
    addi $t0, $s1, 0
    addi $t2, $t2, 1            #Increments the counter
    addi $s0, $s0, 4           #Increments the pointer one int 
    j loop

  setmin: 
    addi $t1, $s1, 0
    addi $t2, $t2, 1            #Increments the counter
    addi $s0, $s0, 4           #Increments the pointer one int
    j loop
 
 finish:
    addi $v0, $zero, 4
    la $a0, maxstr
    syscall
    addi $v0, $zero, 1
    addi $a0, $t0, 0 
    syscall

    addi $v0, $zero, 4
    la $a0, minstr
    syscall
    addi $v0, $zero, 1
    addi $a0, $t1, 0 
    syscall
