from tkinter import *
from tkinter import ttk
from tkinter import filedialog
import decoder as dc


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

    res = dc.decode(path0, path1)

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