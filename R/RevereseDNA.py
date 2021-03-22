import re
infile = open('data/dna7.fsa', 'r')
outfile = open('results/dna7Complement.fsa', 'w')
headerList = []
tempList = []
dnaStringList = []
CompRevList = []
for line in infile:
	if line.startswith(">"):
		header = line.strip()+" Complement Strand"
		headerList.append(header)
		dnaString = ""
		if len(tempList) != 0:
			dnaStringList.append(tempList[-1]) 
	else:
		dnaString += line.strip()
		tempList.append(dnaString)
dnaStringList.append(tempList[-1])
translationTable = str.maketrans("ATCG","TAGC")
for dnaString in dnaStringList:
	reversedString = dnaString[::-1]
	complemented_reversedString = reversedString.translate(translationTable)
	CompRevList.append(complemented_reversedString)
n = 0
while n < len(headerList):
	outfile.write(headerList[n]+"\n")
	sliced_seq = ""
	for i in range(len(CompRevList[n])):
		if i % 60 != 0 or i == 0:
			sliced_seq += CompRevList[n][i]
		else:
			sliced_seq += "\n"
			sliced_seq += CompRevList[n][i]
	outfile.write(sliced_seq)
	outfile.write("\n")
	n += 1
print("Finish")
