from tkinter import *
from tkinter import ttk
from tkinter import filedialog

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
        result += bin5(insList[3])
        result += bin5(insList[1])
        result += bin5(insList[2])
        result += func_type(insList[0])

        machine.write(result + "\n")
    
    machine.close()

    return 0


root = Tk()
root.geometry("550x300")
frm = ttk.Frame(root, padding=30)
frm.pack()
files_frm = ttk.Frame(frm, padding=10)
files_frm.pack()

#### FILE 0 ####
file0_frm = ttk.Frame(files_frm, padding=20)
file0_frm.grid(column=0, row=0)
ttk.Label(file0_frm, text="Selecciona el archivo de origen: ").pack()
ex0_frm = ttk.Frame(file0_frm)
ex0_frm.pack()
path0_e = ttk.Entry(ex0_frm)
path0_e.grid(column=0, row=0)

def askfile0():
    file = filedialog.askopenfile()

    print(file.name)
    path0_e.insert(0, file.name)

ttk.Button(ex0_frm, text="Examinar", command=askfile0).grid(column=1,row=0)

#### FILE 1 ####
file1_frm = ttk.Frame(files_frm, padding=20)
file1_frm.grid(column=1, row=0)
ttk.Label(file1_frm, text="Selecciona el directorio de destino: ").pack()
ex1_frm = ttk.Frame(file1_frm)
ex1_frm.pack()
path1_e = ttk.Entry(ex1_frm)
path1_e.grid(column=0, row=0)

def askfile1():
    dir = filedialog.askdirectory()

    print(dir)
    path1_e.insert(0, dir)

ttk.Button(ex1_frm, text="Examinar", command=askfile1).grid(column=1,row=0)

#### FINAL ####
ttk.Label(frm, text="Ingrese el nombre del nuevo archivo (incluir .txt): ").pack()
nfile_e = ttk.Entry(frm)
nfile_e.pack()


def compile():
    path0 = path0_e.get()
    path1 = path1_e.get()
    path1 += "/" + nfile_e.get()

    print(path0)
    print(path1)

    res = decode(path0, path1)

    result = Tk()
    result.geometry("350x100")

    if res == 0:
        msg = "El codigo ha sido codificado con exito"
    else:
        msg = "Ha habido un error :("

    ttk.Label(result, text=msg).pack()
    ttk.Button(result, text="Cerrar", command=result.destroy).pack()


btn_frm = ttk.Frame(frm, padding=10)
btn_frm.pack()
ttk.Button(btn_frm, text="Compilar", command=compile).pack()



root.mainloop()