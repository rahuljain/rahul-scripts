import sys
import string
import csv
import math
from string import Template


def csvReader(programID, programName, fileName):
    programNameURL = "https://fanfueledengage.com/" + (string.lower(programName)).replace(' ','')
    print programNameURL
    insertStatement = "insert into EN_Action (ProgramID, ActionTypeID, DisplayName, Description, Enabled, CreatedDate, Points, ActionData, IsRepeatable, StartDate, EndDate) values "
    insertValue = Template("\n($programID, $actionTypeID, '$displayName', '$description', $enabled, GETDATE(), $points, '$actionData', $isrepeatable, $startDate, $endDate),")
    csvFileReader = list(csv.reader(open(fileName, 'rb'), delimiter=','))
    
    for row in csvFileReader:
        row = [s.replace('\'', '\'\'') for s in row]
        
        actionID=0
        enabled=1
        isrepeatable=0
        StartDate=''
        EndDate=''

        if(row[6]!=None and (string.lower(row[6])=='no' or string.lower(row[6])=='n')):
            enabled=0
        
        actiondata=""
        if(row[3]!=None and row[3]!=""):
            actiondata = row[3]
        elif(row[4]!=None and row[4]!=""):
            actiondata = row[4]

        if(len(row) > 7):
            StartDate = "'" + row[7] + "'"
        else:
            StartDate = 'NULL'
        if(len(row) > 8):
            EndDate = "'" + row[8] + "'"
        else:
            EndDate = 'NULL'

        if(string.lower(row[0])=='post' or string.lower(row[0])=='refer-a-friend via facebook'):
            actionID = 1
            if(string.lower(row[0])=='refer-a-friend via facebook'):
                isrepeatable=1
            if(row[3]!=None and len(row[3])>0):
                actiondata = "description=" + row[3] + ";"
            if(row[4]!=None and len(row[4])>0):
                actiondata += "link=" + row[4]
                print "link was not empty"
            else:
                actiondata += "link=" + programNameURL
                print "link was null or empty"
            actiondata += ";name=" + programName
        elif(string.lower(row[0])=='like'):
            actionID = 2
        elif(string.lower(row[0])=='rsvp'):
            actionID = 3
        elif(string.lower(row[0])=='join'):
            actionID = 4
        elif(string.lower(row[0])=='follow'):
            actionID = 5
        elif(string.lower(row[0])=='tweet'):
            actionID = 6
        elif(string.lower(row[0])=='refer-a-friend via twitter'):
            actionID=6
            isrepeatable=1
        elif(string.lower(row[0])=='retweet'):
            actionID = 7
        elif(string.lower(row[0])=='watch'):
            actionID = 8
        elif(string.lower(row[0])=='link'):
            actionID = 9
        elif(string.lower(row[0])=='buy'):
            actionID = 10
            isrepeatable=1
        elif(string.lower(row[0])=='donate'):
            actionID = 11
            isrepeatable=1
        
        if(actionID>0 and actionID<12):
            insertStatement += insertValue.substitute(programID=programID, actionTypeID=actionID, displayName=row[1], description=row[2], enabled=enabled, points=row[5], actionData=actiondata, isrepeatable=isrepeatable, startDate=StartDate, endDate=EndDate)
            
    return insertStatement

programID = sys.argv[1]
programName = sys.argv[2]
fileName = sys.argv[3]

print csvReader(programID, programName, fileName)


## to modify: caption=foobar;link=programName.fanfueledengage.com;name=programName
## Example usage:
