#this project returns the number of selected characters in an string
.data   
       xstring: .asciiz "\n x :"
       acapstring: .asciiz "\n A :"
       astring: .asciiz "\n a :"
       sixstring: .asciiz "\n 6 :"
       sevenstring: .asciiz "\n 7 :"
       firststring: .asciiz "number of chars are :"
       xcheck: .byte 'x'
       acapcheck: .byte 'A'
       acheck: .byte 'a'
       sixcheck: .byte '6'
       sevencheck: .byte '7'
       str: .asciiz "Your-Name is taking EEM486 Computer Architecture course in his/her fourth grade."

# registers:
#   s0 -- pointer to string character
#   s1 -- x
#   s2 – A
#   s3 -- a
#   s4 – 6
#   s5 - 7
#
#   t0 – x count
#   t1 – A count
#   t2 – a count
#   t3 – 6 count
#   t4 – 7 count

.text
   main:
        la $s0, str
        lb $s1, xcheck
        lb $s2, acapcheck
        lb $s3, acheck
        lb $s4, sixcheck
        lb $s5, sevencheck
        addi $t0, $zero, 0 
        addi $t1, $zero, 0                
        addi $t2, $zero, 0                
        addi $t3, $zero, 0                 
        addi $t4, $zero, 0  

   checkx:
        lb $s6, 0($s0)
        beq $s6, $zero, finish
        bne $s6, $s1, checkacap
        addi $t0, $t0, 1 
        j addinc

   checkacap:
        bne $s6, $s2, checka
        addi $t1, $t1, 1 
        j addinc
          
   checka:
        bne $s6, $s3, checksix
        addi $t2, $t2, 1 
        j addinc

   checksix:
        bne $s6, $s4, checkseven
        addi $t3, $t3, 1 
        j addinc

   checkseven: 
        bne $s6, $s5, addinc
        addi $t4, $t4, 1 
        

   addinc:
        addi $s0, $s0, 1
        j checkx

   finish:addi $v0, $zero, 4
        la $a0, firststring
        syscall
        addi $v0, $zero, 4
        la $a0, xstring
        syscall
        addi $v0, $zero, 1
        addi $a0, $t0, 0 
        syscall
        addi $v0, $zero, 4
        la $a0, acapstring
        syscall
        addi $v0, $zero, 1
        addi $a0, $t1, 0 
        syscall
        addi $v0, $zero, 4
        la $a0, astring
        syscall
        addi $v0, $zero, 1
        addi $a0, $t2, 0 
        syscall
        addi $v0, $zero, 4
        la $a0, sixstring
        syscall
        addi $v0, $zero, 1
        addi $a0, $t3, 0 
        syscall
        addi $v0, $zero, 4
        la $a0, sevenstring
        syscall
        addi $v0, $zero, 1
        addi $a0, $t4, 0 
        syscall
