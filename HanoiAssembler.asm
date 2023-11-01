.text 
main:
 
	#set the args
	addi a0,zero, 3		#a0 es la variable n
	add s0, a0, x0 		#copia de variable n
	addi s2,zero, 2		#como vamos a usar .word    4xn 
	sll t1, a0, s2		#4xn
	lui a1, 0x10010		#a1 es la torre origen
	add a2, a1, t1		#a2 es la torre auxiliar
	add a3, a2, t1		#a3 es la torre destino
	addi t2, zero, 1 	#t2 es el registro con el que vamos a comparar en la recursividad
	jal setTorreOrigen
	#hasta aqui todo está bien
	jal hanoi
	jal exit

setTorreOrigen:
	add t0, zero, a0		#variable temporal para el for
	for: nop
		beq t0, zero, break 	#si el contador es >1 break
		sw t0, 0(a1)		#guarda el valor de el contador (el contador va en reversa)
		addi t0,t0,-1		#se le resta 1 al contador
		addi a1, a1, 4		#se le suma a la direccion para pasar a la siguiente direccion de memoria 
		jal zero, for
	break:
		####addi a1, a1,-4
		lui a1, 0x10010 ####
		jalr ra
 
hanoi: 	bne a0, t2, else 	#si son distintos va a a saltar a else
	if:
		jal t6, moverDiscos
		jalr ra
	else:
		#/////////////////////////////////////
		#push
		addi sp, sp, -20
		sw a0, 16(sp) 		#push de n
		sw a1, 12(sp)		#push de torre origen
		sw a2, 8(sp)		#push de torre auxiliar
		sw a3, 4(sp)		#push de torre destino
		sw ra, 0(sp)		#push de PC+4
		#////////////////////////////////////
		#modificacion de datos
		addi a0, a0, -1		#n-1
		#swap torres 
		add t3, zero, a2 #aux = torre auxiliar
		add a2, zero, a3 #torre auxiliar = torre destino
		add a3, zero, t3 #torre destino = aux
		#recursion 
		jal hanoi
		#///////////////////////////////////
		#pop
		lw ra,0(sp)		#pop de PC+4
		lw a3, 4(sp)		#pop de torre destino
		lw a2, 8(sp)		#pop de torre auxiliar
		lw a1, 12(sp)		#pop de torre origen
		lw a0, 16(sp)		#pop de n
		addi sp,sp,20
		jal t6, moverDiscos
		#/////////////////////////////////////
		#push
		addi sp, sp, -20
		sw a0, 16(sp) 		#push de n
		sw a1, 12(sp)		#push de torre origen
		sw a2, 8(sp)		#push de torre auxiliar
		sw a3, 4(sp)		#push de torre destino
		sw ra, 0(sp)		#push de PC+4
		#////////////////////////////////////
		#modificacion de datos
		addi a0, a0, -1		#n-1
		#swap torres 
		add t3, zero, a1 #aux = torre origen
		add a1, zero, a2 #torre origen= torre destino
		add a2, zero, t3 #torre destino = aux
		#recursion 
		jal hanoi
		#///////////////////////////////////
		#pop
		lw ra,0(sp)
		lw a3, 4(sp)
		lw a2, 8(sp)
		lw a1, 12(sp)
		lw a0, 16(sp)
		addi sp,sp,20
		jalr ra
		#cambiar el label de return move a un registro		
moverDiscos:
	# El calculo del offset debe ser offset = 4(s0-a0);
	###addi t5,a0,-1
	sub t5, s0, a0 ###
	sll t5,t5,s2
	###sub a1, a1, t5
	add s1, a1, t5  ###
	lw t4, 0(s1)###
	sw zero, 0(s1)###
 
	#mandar al profe por erro
	###sw t4, 0(a3)
	###addi t5,a0,-1
	###sll t5,t5,s2
	add s1,a3, t5 ###
	sw t4, 0(s1) ###
	jalr t6 , t6, 0


 
exit: 
nop
