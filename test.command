#!/usr/bin/env python
 # -*- coding: utf8 -*-
from random import randint
from Tkinter import *
import time
import thread
import pyglet
import urllib
from gtts import gTTS
var =0
lenh =0
test =0
stat = False
buttonnum =0
#Author Travis Hahn
#Date: May 7th 2015 
#Version: 0.4 pre-alpha
#Description: Japanese Listening Practice 
def call(number):
    if var != 0:
        l['text']=list[test]
        #tts =gTTS(text=l['text'],lang="ja")
        #tts.save("0.mp3")
        #song = pyglet.media.load("0.mp3")
        #song.play()
        #win.after(2000)
    x = number
    global buttonnum
    if buttonnum <1:
        b2 = Button(win, text="Correct")
        b2.config(font=("Georgia,72"),width=30,command= lambda: correct(test,number))
        b2.pack()
        buttonnum+=1
       
    win.update()
    win.after(3000,test1(number))
    
   
   
def test1(number1):
   # print lenh
    number1 = randint(0,lenh-1)
    l2['text']="Correct "+str(times[number1])+" Times"
    l['text']=d[number1]
    #uncomment above to bring brack visual instead of audio flashcards
    global test
    test = number1
    #l2['text']=list[number]
    global var
    var +=1
    if var > lenh*12:
        l['text']="YOU ARE DONE CONGRATULATIONS!!!"
        quit()
   
    
def correct(bin1,num):
    times[bin1]=times[bin1]+1
    l2['text']="Correct "+str(times[bin1])+" Times"
    win.update()
    call(num)




  
    
    
    

meh =0
test=0
win = Tk()
f= Frame(win)
l = Label(win, text="Kanji Practice v.04" ,width=20,font=("Georgia",72))
l2 = Label(win, text="" ,height=10,width=30)
l3 = Label(win, text="", height=10, width=30)
l.pack()
l2.pack()
l3.pack()
d ={}
list =[]
times = []
wrongT = []
with open("/Users/tahahn/Documents/11K.txt") as f:
    content = f.readlines()
    for item in content:
        x2 = item.split()
        #print x2
        #x2= item.split(":")
        
        if(len(x2)>1):
            #x3 = x2[1].split()
            #print meh
            #print x3[0]
            #print meh
            print x2[0]
            key, values = meh,x2[1]
            list.append(x2[0])
            d[key]=values
            meh+=1
            #Kanji to Hirigana
           
        
        #Hirigana to Kanji
            #key, values = meh,x2[0]
            #list.append(x2[1])
            #d[key]=values
            #meh+=1
        #print x2[1]
        
        
#for a in list:
    #print a
    

    

global var
global lenh
lenh=meh
for i in range(0,lenh):
    times.append(0)
#print times

b1 = Button(win, text="Next")
b1.config(font=("Georgia,72"),width=30,command= lambda: call(var))
b1.pack()
mainloop()



