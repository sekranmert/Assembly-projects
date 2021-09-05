#this project returns the sum of odd numbers till given input
.data
out_string: .asciiz "\n Enter a positive integer number:"
.text
main :
addi $v0, $zero, 4
la $a0, out_string # load address (la) la is a pseudoinstruction
syscall # print out_string
addi $v0,$zero,5
syscall # read an integer and
add $s0,$v0,$zero # copy it to $s0
addi $t0,$zero,0
addi $t1,$zero,1
loop : slt $t2,$s0,$t1
bne $t2,$zero, finish
add $t0,$t0,$t1
addi $t1,$t1,2
j loop
finish: add $s1,$t0,$zero
addi $v0,$zero,1
add $a0,$s1,$zero
syscall # print out the result