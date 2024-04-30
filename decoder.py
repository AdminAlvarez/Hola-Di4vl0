#Funcion que asigna el tipo de instruccion dependiendo el comando en ensamblador
def ins_type(cmd):
    if cmd == "add" or cmd == "sub" or cmd == "and" or cmd == "or" or cmd == "nor" or cmd == "slt":
        opcode = "000000"
    
    return opcode

#Se asigan los ultimos bits
#En el caso de tipo r usa el set de instrucciones para los bits de funcion y en el shift se asignan 0 automaticamente
def func_type(cmd):
    shift = "00000"
    if cmd == "add":
        funCode = shift + "100010"
    elif cmd == "sub":
        funCode = shift + "000110"
    elif cmd == "or":
        funCode = shift + "100001"
    elif cmd == "and":
        funCode = shift + "100000"
    elif cmd == "slt":
        funCode = shift + "001111"
    
    return funCode

#Funcion que combierte numeros decimales(en este caso direcciones de memoria) a un numero binario de 5 bits
def bin5(cmd):
    dec = int(cmd[1:])
    binary = bin(dec)[2:]

    for i in range(5 - len(binary)):
        binary = "0" + binary

    return binary

#funcion que recibe dos paths, el primero sera el archivo a leer, el segundo a escribir
#Por cada linea en el archivo 1 creara el codigo binario de la instruccion en ensamblador y lo escribira en el archivo 2
def decode(file1, file2):
    assembly = open(file1, "r")
    machine = open(file2, "a")

    for line in assembly:
        result = ""
        insList = line.split(" ")

        result += ins_type(insList[0])
        result += bin5(insList[1])
        result += bin5(insList[2])
        result += bin5(insList[3])
        result += func_type(insList[0])

        machine.write(result + "\n")
    
    machine.close()

    return 0

decode("test.txt", "resultado.txt")




    