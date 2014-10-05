import sys
from decimal import *

def highestprime(i):
	x = i
	while (x > 0):
		for y in range(2, x):
			if((Decimal(x)/y) % 1 == 0):
				break
		else:
			if(str(x) == str(x)[::-1]):
				print (x)
				break
		x = x - 1

highestprime(1000)