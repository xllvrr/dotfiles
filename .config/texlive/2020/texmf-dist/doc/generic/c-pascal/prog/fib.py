# Just a little test program
from sys import stderr

class FibSeries:
    """Returns all the elements of Fibonacci series up to a given number.
    
       Requires one parameter (the number we're going up to)."""
       

    def __init__(self,number):
        self.series=[1,1]	
        a,b=1,1
	
        while b<number:
            a,b=b,a+b
            if b<number: self.series.append(b)

    def writeout(self):
        cnt=0
        while cnt<len(self.series):
            stderr.write(str(self.series[cnt])+" ")
            cnt+=1
        stderr.write("\n")
	
meine = FibSeries(115)
meine.writeout()

