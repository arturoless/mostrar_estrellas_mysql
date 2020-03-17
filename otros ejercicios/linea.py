from tkinter import *
root= Tk()
root.title("Linea")
root.config(bg="#ECEFF1")
root.geometry("850x450+20+20")
root.resizable(0,0)



frame=Frame(root)
frame.config(bg="#EEEEEE", width="1200",height="400")
frame.pack()

canvas=Canvas(frame,bg='#FFFFFF',width="800", height="300",scrollregion=(0,0,0,0))
canvas.grid(row=1, column=1, padx=0, pady=1, columnspan=2)
scroll_view=Scrollbar(frame, command=canvas.xview,orient=HORIZONTAL,)
scroll_view.grid(row=2, column=1,columnspan=2, sticky="nsew")
canvas.config(xscrollcommand=scroll_view.set)




label_text_x1=StringVar()
label_text_x1.set("X inicial")
label_dir_x1=Label(frame, textvariable=label_text_x1)
label_dir_x1.grid(row=4, column=1, padx=0,pady=0)
x1=Entry(frame)
x1.grid(row=4, column=2, padx=0,pady=1)

label_text_x2=StringVar()
label_text_x2.set("X final")
label_dir_x2=Label(frame, textvariable=label_text_x2)
label_dir_x2.grid(row=5, column=1, padx=0,pady=0)
x2=Entry(frame)
x2.grid(row=5, column=2, padx=0,pady=1)

label_text_y1=StringVar()
label_text_y1.set("Y inicial")
label_dir_y1=Label(frame, textvariable=label_text_y1)
label_dir_y1.grid(row=6, column=1, padx=0,pady=0)
y1=Entry(frame)
y1.grid(row=6, column=2, padx=0,pady=1)

label_text_y2=StringVar()
label_text_y2.set("Y final")
label_dir_y2=Label(frame, textvariable=label_text_y2)
label_dir_y2.grid(row=7, column=1, padx=0,pady=0)
y2=Entry(frame)
y2.grid(row=7, column=2, padx=0,pady=1)

def dibujar():
    # canvas.delete("all")
    linea = canvas.create_line(float(x1.get()), float(y1.get()), float(x2.get()), float(y2.get()), fill="#263238")
    p1=f'{x1.get()},{y1.get()}'
    p2=f'{x2.get()},{y2.get()}'
    canvas.create_text(float(x1.get()), float(y1.get()), anchor=W, font="Arial 12 bold",text=p1)
    canvas.create_text(float(x2.get()), float(y2.get()), anchor=W, font="Arial 12 bold",text=p2)

button_draw=Button(frame, text="DIBUJAR", justify="center", command=dibujar)
button_draw.grid(row=8, column=2, padx=1)
button_draw.config(width="8", height="2", font="Arial 10 bold", fg="white", bg="#C51162")


root.mainloop()