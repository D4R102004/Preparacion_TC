%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    ;COMMANDS
    ;Movimiento
    MOV eax, ebx ;copia el valor de fuente a destino
    
    MOVZX eax, bx;expande el contenido de la fuente a un registro de mayor tama�o (sin signo)
    MOVSX eax, bx;expande el contenido de la fuente a un registro de mayor tama�o (con signo)
    
    MOVSB        ;mueve un byte en [ESI] a [EDI] e incrementa (si DF = 0) o decrementa (si DF = 1) en 1 el valor de ambos registros
    MOVSW        ;mueve una palabra en [ESI] a [EDI] e incrementa (si DF = 0) o decrementa (si DF = 1) en 2 el valor de ambos registros
    MOVSD        ;mueve una doble palabra en [ESI] a [EDI] e incrementa (si DF = 0) o decrementa (si DF = 1) en 4 el valor de ambos registros
    
    XCHG eax, eax;intercambia el contenido de destino con fuente
    
    ;Comparaci�n
    CMP eax, ebx ;compara el contenido de fuente con el de destino y setea las flags  
    
    CMPSB        ;compara un byte en [ESI] con uno en [EDI] e incrementa (si DF = 0) o decrementa (si DF = 1) en 1 el valor de ambos registros
    CMPSW        ;compara una palabra en [ESI] con una en [EDI] e incrementa (si DF = 0) o decrementa (si DF = 1) en 2 el valor de ambos registros
    CMPSD        ;compara una doble palabra en [ESI] con una en [EDI] e incrementa (si DF = 0) o decrementa (si DF = 1) en 4 el valor de ambos registros
    
    SCASB        ;compara un byte en AL con uno en [ESI] e incrementa (si DF = 0) o decrementa (si DF = 1) en 1 el valor de ambos registros
    SCASW        ;compara una palabra en AX con una en [ESI] e incrementa (si DF = 0) o decrementa (si DF = 1) en 2 el valor de ambos registros
    SCASD        ;compara una doble palabra en EAX con una en [ESI] con uno en [ESI] e incrementa (si DF = 0) o decrementa (si DF = 1) en 4 el valor de ambos registros    
    
    ;Operadores l�gicos
    NOT eax      ;niega todos los bits y guarda en fuente
    NEG eax      ;halla el complemento a dos y guarda en fuente
    AND eax, ebx ;aplica and bit a bit y guarda en destino
    OR  eax, ebx ;aplica or bit a bit y guarda en destino
    XOR eax, ebx ;aplica xor bit a bit y guarda en destino
    TEST eax, ebx;aplica and, y solo setea las flags correspondientes
     
    ;Operadores de bits
    SHL eax,1    ;corre los bits a la izquierda entrando ceros por la derecha, el bit que se sale se guarda en la carry flag (multiplica por potencias de dos sin signo)
    SHR eax,1    ;corre los bits a la derecha entrando ceros por la izquierda, el bit que se sale se guarda en la carry flag (divide por potencias de dos sin signo)
    SAL eax,1    ;corre los bits a la izquierda entrando ceros por la derecha, el bit que se sale se guarda en la carry flag (multiplica por potencias de dos con signo)
    SAR eax,1    ;corre los bits a la derecha entrando por la izquierda copias del bit del signo, el bit que se sale se guarda en la carry flag (multiplica por potencias de dos con signo)
    ROL eax,1    ;rota los bits a la izquierda, el bit que sale se copia en la carry flag
    ROR eax,1    ;rota los bits a la derecha, el bit que sale se copia en la carry flag
    RCL eax,1    ;rota los bits a la izquierda, empleando la carry flag como parte de la mantisa
    RCR eax,1    ;rota los bits a la derecha, empleando la carry flag como parte de la mantisa
    
    ;Expansores
    CBW          ;extiende AL en AX
    CWD          ;extiende AX en DX:AX
    CWDE         ;extiende AX en EAX
    CDQ          ;extiende EAX en EDX:EAX
    
    ;Operadores aritm�ticos
    INC eax      ;aumenta en 1 fuente
    DEC eax      ;decrementa en 1 fuente
    ADD eax, ebx ;suma fuente a destino y guarda en destino
    SUB eax, ebx ;resta fuente a destino y guarda en destino
    ADC eax, ebx ;suma fuente y carry flag a destino y guarda en destino
    SBB eax, ebx ;resta fuente y carry flag a destino y guarda en destino
    
    ;Condicionales
    JE           ;salta si los operandos de una comparacion son iguales
    JZ           ;salta si ZF = 1
    JC           ;salta si CF = 1
    JS           ;salta si SF = 1
    JO           ;salta si OF = 1
    
    JA           ;salta si el primer operando de una comparaci�n es mayor que el segundo (sin signo)
    JB           ;salta si el primer operando de una comparaci�n es menor que el segundo (sin signo)
    JAE          ;salta si el primer operando de una comparaci�n es mayor o igual que el segundo (sin signo)
    JBE          ;salta si el primer operando de una comparaci�n es menor o igual que el segundo (sin signo)
    JG           ;salta si el primer operando de una comparaci�n es mayor que el segundo (con signo)
    JL           ;salta si el primer operando de una comparaci�n es menor que el segundo (con signo)
    JGE          ;salta si el primer operando de una comparaci�n es mayor o igual que el segundo (con signo)
    JLE          ;salta si el primer operando de una comparaci�n es menor o igual que el segundo (con signo)
    ; los operadores anteriores desde JA hasta JLE admiten su versión negada, para ello solo es necesario
    ; annadir N luego de la J, por ejemplo: JNA salta si no se cumple que el primer operando de una comparaci�n es mayor que el segundo (sin signo)
    
    
    JMP          ;salta incondicionalmente
    
    ;Ciclo
    REP          ;repite un comando y hace dec CX, se detiene cuando CX = 0
    REPZ         ;repite un comando y hace dec CX, se detiene cuando CX = 0 o ZF = 0
    REPNZ        ;repite un comando y hace dec CX, se detiene cuando CX = 0 o ZF = 1
    
    LOOP         ;salta a la etiqueta especificada y hace dec CX, se detiene cuando CX = 0 
    LOOPZ        ;salta a la etiqueta especificada y hace dec CX, se detiene cuando CX = 0 o ZF = 0
    LOOPNZ       ;salta a la etiqueta especificada y hace dec CX, se detiene cuando CX = 0 o ZF = 1
    
    ;Pila
    POP eax      ;guarda el contenido en el borde de la pila a un destino, es equivalente a MOV destino,dword[ESP] y luego inc ESP
    PUSH eax     ;guarda el contenido de una fuente en el borde de la pila, es equivalente a MOV dword[ESP],fuente y luego dec ESP
    POPA         ;hace POP con todos los registros
    PUSHA        ;hace PUSH con todos los registros
    POPF         ;hace POP con todas las flags
    PUSHF        ;hace PUSH con todas las flags
    
    ;Llamado
    CALL         ;se emplea para llamar a subprogramas, equivalente a PUSH EIP y luego JMP fuente
    RET          ;se emplea para regresar desde los subprogramas, equivalente a POP EIP y luego JMP [EIP]
    
    ;Flag
    CLD          ;DF = 0
    STD          ;DF = 1
    CLC          ;NOT CF
    STC          ;CF = 1
    CMC          ;DF = 0
    CLI          ;IF = 0
    STI          ;IF = 1
    
    SETE           ;fija las flags al estado de una comparacion de iguales
    SETZ           ;fija si ZF = 1
    SETC           ;fija si CF = 1
    SETS           ;fija si SF = 1
    SETO           ;fija si OF = 1
    
    SETA           ;fija las flags al estado de una comparaci�n en la que el primer operando es mayor que el segundo (sin signo)
    SETB           ;fija las flags al estado de una comparaci�n en la que el primer operando es menor que el segundo (sin signo)
    SETAE          ;fija las flags al estado de una comparaci�n en la que el primer operando es mayor o igual que el segundo (sin signo)
    SETBE          ;fija las flags al estado de una comparaci�n en la que el primer operando es menor o igual que el segundo (sin signo)
    SETG           ;fija las flags al estado de una comparaci�n en la que el primer operando es mayor que el segundo (con signo)
    SETL           ;fija las flags al estado de una comparaci�n en la que el primer operando es menor que el segundo (con signo)
    SETGE          ;fija las flags al estado de una comparaci�n en la que el primer operando es mayor o igual que el segundo (con signo)
    SETLE          ;fija las flags al estado de una comparaci�n en la que el primer operando es menor o igual que el segundo (con signo)
    
    
    ;Load y save
    LAHF         ;guarda el estado de las flags en AH
    
    LODSB        ;guarda en AL en byte en [ESI], equivalente a mov AL, byte[ESI]
    LODSW        ;guarda en AX una palabra en [ESI], equivalente a mov AX, word[ESI]
    LODSD        ;guarda en EAX una doble palabra en [ESI], equivalente a mov EAX, dword[ESI]
    
    SAHF         ;actualiza el estado de las flags con AH
    
    STOSB        ;guarda un byte en [EDI] en AL, equivalente a mov byte[EDI], AL 
    STOSW        ;guarda una palabra en [EDI] en AX, equivalente a mov word[EDI], AX 
    STOSD        ;guarda una doble palabra en [EDI] en EAX, equivalente a mov dword[EDI], EAX 