import sys
import string
import csv
import math
from string import Template

def csvReader(programID, fileName):
	insertStatement = "insert into EN_Reward (ProgramID, Name, Description, CreatedDate, EndDate, Enabled, Points, Quantity, SubtractsPoints) values "
	insertValue = Template("\n($programID, '$name', '$description', GETDATE(), '$enddate', $enabled, $points, $quantity, $subtractpoints),")
	csvFileReader = list(csv.reader(open(fileName, 'rb'), delimiter=','))

	for row in csvFileReader[1:]:
		row = [s.replace('\'', '\'\'') for s in row]

		enabled=1
		subtractpoints=1

		if(row[4]!=None and string.lower(row[4])=='n'):
			enabled=0

		if(row[5] and string.lower(row[5])=='n'):
			subtractpoints=0

		insertStatement += insertValue.substitute(programID=programID, name=row[0], description=row[1], quantity=row[2], points=row[3], enabled=enabled, subtractpoints=subtractpoints, enddate=row[6])

	return insertStatement

programID = sys.argv[1]
fileName = sys.argv[2]

print csvReader(programID, fileName)

#
