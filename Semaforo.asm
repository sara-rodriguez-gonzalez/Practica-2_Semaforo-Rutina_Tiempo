#include "p16F628a.inc" ;incluir librerias relacionadas con el dispositivo
__CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)
RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program
;variables para el contador:
i1 equ 0x30
j1 equ 0x31
k1 equ 0x32
m1 equ 0x33
i5 equ 0x30
j5 equ 0x31
k5 equ 0x32
m5 equ 0x33
i equ 0x30
j equ 0x31
k equ 0x32
m equ 0x33
;inicio del programa:
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
BCF STATUS, RP1 ;Cambiar al banco 1
BSF STATUS, RP0
MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISB
BCF STATUS, RP0 ;Regresar al banco 0
NOP
 clrf PORTB
inicio:
;Encender rojo1 y verde2
MOVLW b'00100001'
MOVWF PORTB
;Esperar 5 seg
call tiempo5
nop
nop
;Encender rojo1 y amarillo2
MOVLW b'00100010'
MOVWF PORTB
;Esperar 1 seg
call tiempo1
nop
nop
;Encender verde1 y rojo2
MOVLW b'00001100'
MOVWF PORTB
;Esperar 5 seg
call tiempo5
nop
nop
;Encender amarillo1 y rojo2
MOVLW b'00010100'
MOVWF PORTB
;Esperar 1 seg
call tiempo1
goto inicio ;regresar y repetir
 
;Tiempo 1 seg
tiempo1:
movlw d'30' ;establecer valor de la variable k
movwf m1
mloop1:
decfsz m1,f
goto mloop1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movlw d'60' ;establecer valor de la variable i
movwf i1
iloop1:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'68' ;establecer valor de la variable j
movwf j1
jloop1:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'80' ;establecer valor de la variable k
movwf k1
kloop1:
decfsz k1,f
goto kloop1
decfsz j1,f
goto jloop1
decfsz i1,f
goto iloop1
return ;salir de la rutina de tiempo y regresar al
;valor de contador de programa
    
    
;Tiempo 5 seg
tiempo5:
nop
movlw d'83' ;establecer valor de la variable k
movwf m5
mloop5:
decfsz m5,f
goto mloop5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movlw d'92' ;establecer valor de la variable i
movwf i5
iloop5:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'209' ;establecer valor de la variable j
movwf j5
jloop5:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'85' ;establecer valor de la variable k
movwf k5
kloop5:
decfsz k5,f
goto kloop5
decfsz j5,f
goto jloop5
decfsz i5,f
goto iloop5
return ;salir de la rutina de tiempo y regresar al
;valor de contador de programa
    
END