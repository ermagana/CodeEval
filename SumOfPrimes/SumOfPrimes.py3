import sys

def sumofprimes(nth):
	primes = []
	sumof = 0
	x = 2
	while len(primes) < nth:
		for y in primes:
			if(x%y == 0):
				break
		else:
			sumof = sumof + x
			primes.append(x)
		x = x + 1
	# print primes
	print (sumof)

sumofprimes(1000)