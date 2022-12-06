.text
.globl main

main:
	la 		$t1, N
	lw 		$t1, 0($t1) 	# N armazenado no t1
	la 		$t2, vet	#  t2 = vetor
	addi 	$t3, $zero, 0		# Zera o registrador t3 
	addi 	$t4, $zero, 0		# Zera o registrador t4 
organizavet:
	subi	$s1, $t1, 2 		# utilizado no for
forI: 						# for(t3 = zero; t3 < N - 1 (s1); t3++)
	sub		$s2, $s1, $t3 		# Calcula o valor para o forJ
forJ: 						# for(t4 = zero; t4 < N - 1 - t3 (s2); t4++)
	sll 	$t5, $t4, 2
	add 	$t5, $t2, $t5 		#  vet[j] e salva em t5
	addi 	$t6, $t5, 4  		# vet[j + 1] e salva em t6
	lw 		$t7, 0($t5) 	# vet[j] e salva em t7
	lw 		$t8, 0($t6)     # vet[j + 1] e salva em t8
	slt		$s3, $t8, $t7	# $s3 = ($t8 < $t7) ? 
	beq 	$s3, $zero, end1	# Se o resultado do slt acima for zero,pula para o end1
	sw 		$t8, 0($t5)	# No lugar do j + 1 (t5), coloca o vet[j] (t8) 
	sw 		$t7, 0($t6)	# No lugar do j (t6), coloca o vet[j + 1] (t7) 
end1:
	slt 	$s4, $t4, $s2		# $s4 = ($t4 < $s2) ? 
	beq 	$s4, $zero, endfJ	# Se o resultado do slt acima for zero, pula para o endfJ
	addi 	$t4, $t4, 1		# t4++
	j 		forJ		# Retorna para o forJ
endfJ:
	slt 	$s5, $t3, $s1		# $s5 = ($t3 < $s1) ? 
	beq 	$s5, $zero, endjI	# Se o resultado do slt acima for zero, pula para o endjI
	add 	$t3, $t3, 1		#  t3++
	addi 	$t4, $zero, 0		#  t4 = 0
	j 		forI		# Retorna para o forI
endjI:
	la 		$t2, N
	lw 		$t2, 0($t2) 		#  N armazenado no t2
	la 		$t3, vet		# valor de referência armazenado no registrador t3
medianacal:
	srl		$s1, $t2, 1		# Divide t2 por 2 e salva o resultado em s1
	sll		$s5, $s1, 2		# Multiplica s1 por 2 e salva em s5
	add		$t8, $t3, $s5		# acha o termo central
	lw		$s4, 0($t8)		# Busca  o termo central e salva em s4
	beq		$s5, $t2, medianapar	# Compara se s5 Ã© igual a t2. Se for, pula para medianapar
	la		$t5, mediana		# Busca a ref de mediana
	sw		$s4, 0($t5)		# Salva o valor s4 na ref da mediana
	j		mediacal			# Pula para modacal
medianapar:
	subi	$t5, $s1, 1			# $t5 = $s1 - 1
	sll		$t5, $t5, 2		# $t5 = $t5 << 2
	add		$t5, $t3, $t5		# $t5 = C1 + $t5 
	lw		$t6, 0($t5)		# Busca o valor de vet[c - 1] 
	add		$t2, $s4, $t6		# $t2 = $s4 + $32 
	srl		$t2, $t2, 1		# $t2 = $t2 >1 zero 
	la		$t7, mediana		# Busca a ref de mediana
	sw		$t2, 0($t7)		# Salva a divisao na ref de mediana
mediacal:
	addi	$s5, $zero, 0			# $s5 = $zero + zero // Zera o s5 que serÃ¡ a soma
	la 		$t1, N
	lw 		$t1, 0($t1) 		# Busca do valor N sendo armazenado no registrador t1
	la		$t2, vet		# Busca do valor referÃ©ncia sendo armazenado no registrador t2
	addi	$s4, $zero, 0			# $s4 = $zero + zero 
mediafI:
	sll		$t5, $s4, 2		# $t5 = $s4 << 2
	add		$t5, $t2, $t5		# $t5 = $t2 + $t5
	lw		$t5, 0($t5)		# vet[i] 
	add		$s5, $s5, $t5		# $s5 = $s5 + $t5 
	addi	$s4, $s4, 1			# $s4 = $s4 + 1 
	bne		$t1, $s4, mediafI	# if $t1 != $s4 goto mediafI 
	addi	$t2, $s5, 0			# $t2 = s5 
	jal		divider			# Executa a subrotina de divisao
	la		$s5, media		# Busca a ref de media
	sw		$v1, 0($s5)		# Salva o resultado da divisao na ref de media
modacal:
	la 		$t1, N
	lw 		$t1, 0($t1) 		# Busca do valor N sendo armazenado no registrador t1
	la		$t2, vet		# Busca do valor referÃ©ncia sendo armazenado no registrador t2
	addi	$s5, $zero, 0			# s5 serÃ¡ usado como numAtual
	addi	$s4, $zero, 0			# s4 serÃ¡ usado como tamNumAtual
	addi	$t5, $zero, 0			# t5 serÃ¡ usado como moda
	addi	$t6, $zero, 0			# t6 serÃ¡ usado como tamModa
	addi	$t7, $zero, 0			# $t7 = $zero + zero 
modafcal:
	sll		$t8, $t7, 2			# $s5 = $s4 << zero
	add		$t8, $t3, $t8			# $t8 = $t3 + $t8 
	lw		$t8, 0($t8)			# vet[i] 
	bne		$t8, $s5, numdifmoda		# if $t8 != $s5 then goto numdifmoda 
	addi	$s4, $s4, 1				# $s4 = $s4 + 1 
	j		modaprox			# jump to modaprox 
numdifmoda:
	blt		$s4, $t6, modamaior	# if $s4 < $t6 then goto target
	beq		$s4, $t6, modamaior	# if $s4 == $t6 then goto modamaior 
	addi	$t5, $s5, 0		        # $t5 = $s4 + zero 
	addi	$t6, $s4, 0			# $t6 = $s4 + zero
modamaior:
	addi	$s5, $t8, 0		# $s5 = $s4 + zero 
	addi	$s4, $zero, 1		# $s4 = 1 
modaprox:
	addi	$t7, $t7, 1			# $t7 = $t7 + 1 
	bne		$t1, $t7, modafcal	# if $t1 != $t7 then goto modafcal 
	blt		$s4, $t6, savemoda	# if $s4 < $t6 then goto savemoda 
	addi	$t5, $s5, 0			# $t5 = $s4 + zero 
	addi	$t6, $s4, 0			# $t6 = $s4 + zero 
savemoda:
	la		$t3, moda		# Busca a ref da moda
	sw		$t5, 0($t3)		# Salva o dado de t5 na ref da moda
	la		$t3, vezes		# Busca a ref de vezes
	sw		$t6, 0($t3)		# Salva o dado de t6 na ref de vezes
end:    j    end			# Final do cÃ³digo

	######################################################
	### $t2/ $t1 --> $v0--> resto $v1 --> divisÃ£o
	######################################################
divider: 
	lui 	$s5, 0x8000 	# mÃ¡scara para isolar bit mais significativo
	li 		$s4, 32 		# contador de iteraÃ§Ãµes
	xor 	$v0, $v0, $v0 	# registrador P($v0)-t1($v1) com zero e o dividendo ($t2)
	add 	$v1, $t2, $zero

dloop: 
	and 	$t5, $v1, $s5 	# isola em t5 o bit mais significativo do reg 't1' ($v1)
	sll 	$v0, $v0, 1 	# desloca para a esquerda o registrado P-t1
	sll 	$v1, $v1, 1
	beq 	$t5, $zero, di1
	ori 	$v0, $v0, 1 	# coloca 1 no bit menos significativo do registador 'P'($v0)

di1:
	sub 	$t5, $v0, $t1 	# subtrai 'P'($v0) do divisor ($t1)
	blt 	$t5, $zero, di2
	add 	$v0, $t5, $zero # se subtraÃ§Ã£o positiva,'P'($v0) recebe o valor da subtraÃ§Ã£o
	ori 	$v1, $v1, 1 	# e 't1'($v1) recebe 1 no bit menos significativo

di2: 
	addi 	$s4, $s4, -1 	# decrementa o nÃºmero de iteraÃ§Ãµes
	bne 	$s4, $zero, dloop
	jr 		$ra 

.data
N:   		.word  	14
mediana: 	.word 	0x0
media:		.word	0x0
moda:		.word 	0x0
vezes:		.word	0x0
vet: 		.word  	4 5 99 99 28 30 30 28 99 99 15 15 5 4
