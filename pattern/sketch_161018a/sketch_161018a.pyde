x=0
y=0
xList=[10,20,30,40,50,60,70,80,90,100]
yList=[10,20,30,40,50,60,70,80,90,100]
def setup():
    size(400,400)
    
def draw():
    global x,y,xList,yList
    background(0)
    for i in yList:
         for p in xList:
             water(p,i)
             blood(p+25,i)
def water(x,y):
    fill(050,95,255)
    stroke(050,95,255)
    smooth()
    bezier(50+x, 20+y, 70+x,70+y, 20+x, 60+y, 50+x, 20+y)
    
def blood(x,y):
    translate(x,y);
    fill(185,0,0)
    stroke(185,0,0)
    smooth()
    bezier(50, 20, 70,70, 20, 60, 50, 20)