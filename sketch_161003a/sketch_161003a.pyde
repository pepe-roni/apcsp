import math
def setup():
    order = [1,49,50,51,56,199,200,201,202,203,204,205,206]
    for i in range (len(order)):
        buses = order[i]/50
        taxis = math.ceil((float(order[i]-(50*buses)))/5)
        print(str(order[i]) + " people need " + str(buses) + " buses " + str(int(taxis)) + " taxis")
        
   
            