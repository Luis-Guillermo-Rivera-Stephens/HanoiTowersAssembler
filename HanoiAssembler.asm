.text 
main: 
	addi a0,zero, 3		#a0 es la variable n
	addi t0,zero, 4		#como vamos a usar .word    4xn 
	mul t1, a0, t0		#4xn
	lui a1, 0x10010		#a1 es la torre origen
	add a2, a1, t1		#a2 es la torre auxiliar 
	add a3, a2, t1		#a3 es la torre destino
	
	addi t2, zero, 1 	#t2 es el registro con el que vamos a comparar en la recursividad
	
	jal setTorreOrigen
	
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
		sub a0,a0,t1
		jalr ra

hanoi: nop
	bne a0, t2, else 	#si son distintos va a a saltar a else
	if:
		jal moverDiscos
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
		
		jal hanoi
		
		#///////////////////////////////////
		#pop
		
		
		
		
moverDiscos:
		
		
		 
	

exit: nop	