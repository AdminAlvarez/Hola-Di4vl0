READ ME

Equipo #4: Hola di4vl0

Integrantes:
Admin Alvarez Orozco
Oscar Fernando Ibarra Perez
Rogelio Valdez Cuevas
Jazael Ramos Pale

Procesador MIPS en Verilog
Este proyecto esta hehco con la intencion de crear un procesador MIPS de 32 bit, 
con la capacidad de realizar distintas operaciones 	logicas y aritmeticas, 
tomando los valores de un banco de registros precargado de valores que tiene la
opcion a modificarse si el usuario lo indica, este vuarda los resultados de las
operaciones que realiza en una memoria, o en el mismo banco de registros para
poder ser utilizadas despues, segun se le indique, cosa de lo cual se encarga el
controlador.

Se le podran asignar 3 tipos de instrucciones, R, I y J, respetando la 
nomenclatura de cada una, cuenta con un programa de interface para trabajar
de una forma mas sencilla, junto a su guiia de usuario para el funcionmamiento
correcto del programa, tambien hay un apartado donde se explica la parte de los
modulosen verilog, por si se quiere profundizar un poco mas el tema

Caracteristicas:
Instrucciones Tipo R.
Instrucciones Tipo I.
Instrucciones Tipo J.
Guia de usuario.
Realiza opreaciones de 32 bit.

op	rs	rt	rd	shamt	funct
6 bit	5 bit	5 bit	5 bit	5 bit	6 bit

Guía de usuario Assenary
Home
En la página de inicio nos podremos encontrar con 4 secciones, para satisfacer
correctamente
el objetivo del programa se tendrá que llenar cada una de estas 4 secciones por
completo

FASE 1: En la primera sección podremos observar la instrucción "Seleccionar el
Archivo de origen" y una caja de texto acompañada del botón con la etiqueta
"Examinar", para completar de manera satisfactoria esta fase tendremos que
apretar el botón de examinar y en el explorador de archivos de nuestro dispositivo
seleccionar el archivo con el código de ensamblador que se ha escrito previamente.
Después de elegir el archivo podremos observar en la caja de texto la ruta hacia el
mismo.

FASE 2: En la segunda sección del programa podremos observar la instrucción
"Seleccionar el directorio de destino" y una caja de texto acompañada del botón con
la etiqueta "Examinar", para completar de manera satisfactoria esta fase tendremos
que apretar el botón de examinar y en el explorador de archivos de nuestro
dispositivo seleccionar el directorio (o carpeta) donde deseamos que se guarde el
nuevo archivo con el código máquina. Después de elegir el directorio podremos
observar en la caja de texto la ruta hacia el mismo.

FASE 3: En la tercera sección se encontrará la instrucción "Ingrese el nombre del
archivo a crear (incluir.txt)" acompañado de una caja de texto donde tendremos que
ingresar el nombre del nuevo archivo donde se guardaran las instrucciones en
código máquina, es importante que al momento de ingresar como queremos que se
llame el nuevo archivo agregar la extensión .txt al final del nombre.

FASE 4: Por último, observaremos el botón con la etiqueta "Aceptar", una vez que
completemos correctamente todas las fases anteriores, presionaremos este botón
y saltara una ventana con un aviso con el mensaje "se ha codificado correctamente
el archivo" indicando que todo el proceso se ha completado con éxito y podremos
encontrar el nuevo archivo en el directorio elegido.

Documentacion de verilog

Módulo ALU (Arithmetic Logic Unit)
Realiza operaciones aritméticas y lógicas básicas.
Parámetros:
   - entrada1: Entrada de datos 1 de 32 bits.
   - entrada2: Entrada de datos 2 de 32 bits.
   - selector: Selector de operación de 3 bits.
Salidas:
   - res: Resultado de la operación de 32 bits.
   - zf: Bandera de cero (1 si el resultado es cero, 0 en otro caso).
Lógica combinacional para determinar la operación basada en el selector.
Realiza la operación correspondiente y establece la bandera de cero.
     3'b000: res = entrada1 & entrada2;  // AND
        3'b001: res = entrada1 | entrada2;  // OR
        3'b010: res = entrada1 + entrada2;  // suma
        3'b110: res = entrada1 - entrada2;  // Resta
        3'b111: res = (entrada1 < entrada2) ? 1 : 0;  // Set on less than
        default: 
/////////////////////////////////////////////////////////////////////////////		
Módulo ALU Control
Este módulo se encarga de generar la señal de control para la ALU en base
al código de función de la instrucción y a la señal de control de la UC.
Entradas:
   - func_code: Código de función de 6 bits de la instrucción.
   - UC_signal: Señal de control de 3 bits de la UC.
Salidas:
   - ALU_signal: Señal de control de 3 bits para la ALU.
/////////////////////////////////////////////////////////////////////////////
  Módulo Banco de Registros
 Este módulo implementa un banco de registros de 32 registros de 32 bits cada uno.
Entradas:
   - read_register_1: Índice del registro a leer para la primera entrada de la ALU.
   - read_register_2: Índice del registro a leer para la segunda entrada de la ALU.
   - write_data: Datos a escribir en el registro seleccionado.
   - write_register: Índice del registro donde se va a escribir.
   - reg_write: Señal de escritura en el registro.
Salidas:
   - read_data_1: Datos leídos desde el registro para la primera entrada de la ALU.
   - read_data_2: Datos leídos desde el registro para la segunda entrada de la ALU.
///////////////////////////////////////////////////////////////////////////// 
  Módulo Multiplexor 2 a 1
 Este módulo implementa un multiplexor de 2 a 1.
Entradas:
   - data_mem: Datos provenientes de la memoria.
   - data_alu: Datos provenientes de la ALU.
   - MemToReg_m: Señal de control para seleccionar la entrada.
Salidas:
   - output_data: Datos de salida seleccionados por el multiplexor.
///////////////////////////////////////////////////////////////////////////// 
Módulo RAM
 Este módulo implementa una memoria RAM simple de 64 palabras de 32 bits cada una.
Entradas:
   - dir: Dirección de la palabra de memoria a acceder.
   - entrada1: Datos a escribir en la memoria.
   - sel: Señal de control para selección de escritura/lectura.
Salidas:
   - salida: Datos leídos desde la memoria.
/////////////////////////////////////////////////////////////////////////////
 Módulo UC (Control Unit)
 Este módulo implementa la Unidad de Control (UC) que genera señales de control
 para el datapath en base al opcode de la instrucción.
Entradas:
   - opcode: Opcode de la instrucción.
Salidas:
   - MemToReg: Señal de control para escritura en registro desde memoria.
   - RegWrite: Señal de control para escritura en registro desde ALU.
   - MemToWrite: Señal de control para escritura en memoria desde ALU.
   - ALUOp: Señal de control para operación de la ALU.
////////////////////////////////////////////////////////////////////////////////
 Módulo Banco de Registros
 Este módulo implementa un banco de registros de 32 registros de 32 bits cada uno.
 Entradas:
   - read_register_1: Índice del primer registro a leer.
   - read_register_2: Índice del segundo registro a leer.
   - write_data: Datos a escribir en el registro seleccionado.
   - write_register: Índice del registro en el que se escribirán los datos.
   - reg_write: Señal de control para escritura en el banco de registros.
 Salidas:
   - read_data_1: Datos leídos desde el primer registro.
   - read_data_2: Datos leídos desde el segundo registro.
 ////////////////////////////////////////////////////////////////////////////////
 Módulo Datapath
 Este módulo implementa un camino de datos básico y su controlador.
 El camino de datos incluye una ALU, un banco de registros, una RAM y un
 multiplexor, todos conectados de acuerdo a la instrucción recibida.
Entradas:
   - instruccion_r: Instrucción de 32 bits que indica la operación a realizar.
Salidas:
   - tr_zf: Bandera de cero generada por la ALU.

