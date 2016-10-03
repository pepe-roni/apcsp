def setup():
    order = [1,49,50,51,56,199,200,201,202,203,204,205,206]
    for i in range (len(order)):
        if(order[i] != 0): 
            taxis = order[i]/5
            buses = taxis/10
           # taxis = (order[i]-
            print(str(order[i]) + " people need " + str(buses) + " buses " + str(order[i]/5) + " taxis")
        
   
            