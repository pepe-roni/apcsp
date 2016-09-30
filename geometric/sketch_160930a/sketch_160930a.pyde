
rot = 0
def setup():
    size(400,400)
    
def draw():
    global rot
    x = 0
    y = 0
    fill(random(255),random(255), random(255))
    for i in range (20):
        rect(random(400),random(400), 90-i,60+i)
    ellipseMode(CENTER)
    noFill()
    stroke(random(255),random(255), random(255))
    rotate(rot)
    while(x<450):
        ellipse(200,200,x,50)
        x=x+1
        while(y<450):
            ellipse(200,200,50,y)
            y = y+1
    rot = rot+0.5
    print x
       
    