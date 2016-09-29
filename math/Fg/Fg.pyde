def setup():
    println("Uses formula Vf^2=Vi^2+2aDx to find maximum height of a projectile")
    Vi = [0.8,5,15.2,40,90.56]
    for i in range(len(Vi)):
        dx=(sq(Vi[i])/19.6)
        print Vi[i] 
        print str(dx) +"m"

def draw():
    pass
    