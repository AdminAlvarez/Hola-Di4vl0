from tkinter import *
from tkinter import ttk, filedialog

def ins_type(cmd):
    if cmd == "add" or cmd == "sub" or cmd == "and" or cmd == "or" or cmd == "nor" or cmd == "slt" or cmd == "mult":
        opcode = "000000"
    elif cmd == "addi" or cmd == "subi" or cmd == "andi" or cmd == "ori" or cmd == "nori":
        opcode = "001000"
    elif cmd == "jump":
        opcode = "000010"
    elif cmd == "lw":
        opcode = "010000"
    elif cmd == "sw":
        opcode = "100000"
    elif cmd == "beq":  #BRANCH TO EQUALS
        opcode = "000100"
    return opcode

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
    elif cmd == "mult":
        funCode = shift + "001011"
    return funCode

def bin5(cmd):
    dec = int(cmd[1:])
    binary = bin(dec)[2:]
    for i in range(5 - len(binary)):
        binary = "0" + binary
    return binary

def bin16(cmd):
    dec = int(cmd[1:])
    binary = bin(dec)[2:]
    for i in range(16 - len(binary)):
        binary = "0" + binary
    return binary

def bin24(cmd):
    dec = int(cmd[1:])
    binary = bin(dec)[2:]
    for i in range(24 - len(binary)):
        binary = "0" + binary
    return binary

def decode(file1, file2):
    assembly = open(file1, "r")
    machine = open(file2, "a")
    for line in assembly:
        result = ""
        insList = line.split(" ")
        result += ins_type(insList[0])

        if result == "000000": #R
            result += bin5(insList[2])
            result += bin5(insList[3])
            result += bin5(insList[1])
            result += func_type(insList[0])
        elif result == "001000": #I
            result += bin5(insList[2])
            result += bin5(insList[1])
            result += bin16(insList[3])
        elif result == "000010": #J
            result += bin24(insList[1])
        elif result == "000100": #BEQ
            result += bin5(insList[1])
            result += bin5(insList[2])
            result += bin16(insList[3])
        elif result == "010000": #LOAD WORD
            result += bin5(insList[2])
            result += bin5(insList[1])
            result += bin16(insList[3])
        elif result == "100000": #STORE WORD
            result += bin5(insList[2])
            result += bin5(insList[1])
            result += bin16(insList[3])
        machine.write(result + "\n")
    machine.close()
    return 0

def show_file_content(file_path):
    file_content_window = Toplevel(root)
    file_content_window.title("Contenido del Archivo")
    file_content_window.geometry("600x400")

    file_content_frame = ttk.Frame(file_content_window, padding=10)
    file_content_frame.pack(fill=BOTH, expand=True)

    file_content_text = Text(file_content_frame, wrap=WORD)
    file_content_text.pack(fill=BOTH, expand=True)

    try:
        with open(file_path, "r") as file:
            content = file.read()
            file_content_text.insert(1.0, content)
    except FileNotFoundError:
        print("El archivo seleccionado no existe.")

    def save_file():
        content = file_content_text.get(1.0, END)
        with open(file_path, "w") as file:
            file.write(content)
        print("Contenido guardado exitosamente.")

    edit_save_frame = ttk.Frame(file_content_window, padding=10)
    edit_save_frame.pack()

    ttk.Button(edit_save_frame, text="Guardar", command=save_file).pack(side=LEFT, padx=5)

def enable_edit_button():
    btn_edit.config(state="normal")

def open_file_content_window():
    file_path = path0_e.get()
    if file_path:
        show_file_content(file_path)

def create_register_file(file_path, file_name):
    with open(f"{file_path}/{file_name}", "w") as file:
        for _ in range(32):  # Crear 32 registros
            file.write("00000000\n")

def create_data_memory_file(file_path, file_name, size):
    with open(f"{file_path}/{file_name}", "w") as file:
        for _ in range(size):  # Crear memoria de datos de tamaño especificado
            file.write("00000000\n")

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
        msg = "El código ha sido codificado con éxito."
    else:
        msg = "Ha habido un error :("

    ttk.Label(result, text=msg).pack()
    ttk.Button(result, text="Cerrar", command=result.destroy).pack()

    create_register_file(path1, "Banco_de_Registros.txt")  # Crear archivo de Banco de Registros
    create_data_memory_file(path1, "Memoria_de_Datos.txt", 256)  # Crear archivo de Memoria de Datos

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
    file_path = filedialog.askopenfilename()
    if file_path:
        path0_e.delete(0, END)
        path0_e.insert(0, file_path)
        enable_edit_button()

ttk.Button(ex0_frm, text="Examinar", command=askfile0).grid(column=1,row=0)

# Botón para editar
btn_edit = ttk.Button(file0_frm, text="Editar", state="disabled", command=open_file_content_window)
btn_edit.pack(side=TOP, padx=5)

#### FILE 1 ####
file1_frm = ttk.Frame(files_frm, padding=20)
file1_frm.grid(column=1, row=0)
ttk.Label(file1_frm, text="Selecciona el directorio de destino: ").pack()
ex1_frm = ttk.Frame(file1_frm)
ex1_frm.pack()
path1_e = ttk.Entry(ex1_frm)
path1_e.grid(column=0, row=0)

def askfile1():
    dir_path = filedialog.askdirectory()
    if dir_path:
        path1_e.delete(0, END)
        path1_e.insert(0, dir_path)

ttk.Button(ex1_frm, text="Examinar", command=askfile1).grid(column=1,row=0)

#### FINAL ####
btn_frm = ttk.Frame(frm, padding=10)
btn_frm.pack()

ttk.Button(btn_frm, text="Compilar", command=compile).pack()

# Botones para crear archivos
create_register_btn = ttk.Button(btn_frm, text="Crear Banco de Registros", command=lambda: create_register_file(path1_e.get(), "Banco_de_Registros.txt"))
create_register_btn.pack()

create_data_memory_btn = ttk.Button(btn_frm, text="Crear Memoria de Datos", command=lambda: create_data_memory_file(path1_e.get(), "Memoria_de_Datos.txt", 256))
create_data_memory_btn.pack()

root.mainloop()
