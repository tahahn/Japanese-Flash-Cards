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
#Description: Japanese Listening Practice & Vocabulary Practice 
def call(number):
    if var != 0:
        l['text']=list[test]
        #tts =gTTS(text=l['text'],lang="ja")
        #tts.save("0.mp3")
        #song = pyglet.media.load("0.mp3")
        #song.play()
        #win.after(2000)
        #Uncomment section above to active listening
        #It will read the characters from the text file
    x = number
    global buttonnum
    if buttonnum <1:
        b2 = Button(win, text="Correct")
        b2.config(font=("Georgia,72"),width=30,command= lambda: correct(test,number))#shows the number of times the user has corrctly identified the character/vocabulary word
        b2.pack()
        buttonnum+=1
       
    win.update()
    win.after(3000,test1(number))
    
   
   
def test1(number1):
   # print lenh
    number1 = randint(0,lenh-1)
    l2['text']="Correct "+str(times[number1])+" Times"
    l['text']=d[number1]
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
    win.update()#updates the graphical user interface with the number of times the user has gotten a character correct
    call(num)




  
    
    
    

num =0
test=0
win = Tk()#initalizes tkinter graphic framework
f= Frame(win)
l = Label(win, text="Kanji Practice v.04" ,width=20,font=("Georgia",72))
l2 = Label(win, text="" ,height=10,width=30)
l3 = Label(win, text="", height=10, width=30)
l.pack()
l2.pack()
l3.pack()
#packs the labels for the graphical user interface 
d ={}
list =[]#list that holds the characters of words taken from the text file 
times = []#list that holds the number of times each character or word has been correctly identified
with open("/Users/tahahn/Documents/11K.txt") as f:
    content = f.readlines()#reads the textfile line by line
    for item in content:
        x2 = item.split()#splits the strings by blank space
        #print x2
        #x2= item.split(":")
        
        if(len(x2)>1):
            #x3 = x2[1].split()
            #print num
            #print x3[0]
            #print num
            #print x2[0]
            key, values = meh,x2[1]#uses hashmap to store the character or words and the number of times it has been iterated through
            #hashmap used as to randomly display the characters or words
            list.append(x2[0])
            #adds either the english transation or the hirigana to a list to be displayed
            d[key]=values
            meh+=1
            #Kanji to Hirigana
           
        
        #Hirigana to Kanji
        #uncommenting the comments below you can go from the hirigana characters in Japanese to vocab  
            #key, values = num,x2[0]
            #list.append(x2[1])
            #d[key]=values
            #num+=1
        #print x2[1]
        
        
#for a in list:
    #print a
    

    

global var
global lenh #number of characters in the text-file
lenh=num
for i in range(0,lenh):
    times.append(0)
#print times

b1 = Button(win, text="Next")
b1.config(font=("Georgia,72"),width=30,command= lambda: call(var))
b1.pack()
mainloop()



