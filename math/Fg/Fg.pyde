def setup():
    println("Uses formula Vf^2=Vi^2+2aDx to find maximum height of a projectile")
    Vi = [5,18,25.2,36,40.4,63.5,90.56,100,200,265,315,450]
    for i in range(len(Vi)):
        dx=(sq(Vi[i])/19.6)
        print str(Vi[i]) + " m/s will have a peak height of " + str(int(dx)) +" m"
    print "Dx is calculated with only g=9.8m's^2, air resistance is ignored"
def draw():
    pass
    