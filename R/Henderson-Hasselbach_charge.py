pK_dic = {"NH2":8.6, "COOH":3.6, "C":8.5, "D":3.9,\
		  "E":4.1, "H":6.5, "K":10.8, "R":12.5, "Y":10.1}
		  
Negatively_charged = ['COOH', 'D', 'E', 'C','Y']
Positively_charged = [ 'NH2', 'H', 'K', 'R']

def charge_calculator(seq):
	totalCharge = 0
	for aa in seq:
		pH = 7.2
		if aa in list(pK_dic.keys()):
			pK = pK_dic[aa]
			if aa in Negatively_charged:
				charge = - 1 / (1 + (10**(pK -pH)))
				totalCharge += charge
			if aa in Positively_charged:
				charge = 1 / (1 + (10**(pH -pK)))
				totalCharge += charge
		COOH_charge = - 1 / (1 + (10**(3.6 -7.2)))
		NH2_charge = 1 / (1 + (10**(7.2 -8.6)))
	totalCharge = totalCharge + COOH_charge + NH2_charge
	totalCharge = round(totalCharge , 3)
	return totalCharge
	
aa = "AGKKLDDDEEEETYPKK"
print("The Henderson-Hasselbach charge for {} sequnce is {}".format(aa, charge_calculator(aa)))
