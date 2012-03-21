import string
import csv
import math
from string import Template


def csvReader(programID, fileName):
    insertStatement = "insert into EN_Action (ProgramID, ActionTypeID, DisplayName, Description, Enabled, CreatedDate, Points, ActionData, IsRepeatable) values "
    insertValue = Template("\n($programID, $actionTypeID, '$displayName', '$description', $enabled, GETDATE(), $points, '$actionData', $isrepeatable),")
    csvFileReader = csv.reader(open(fileName, 'rb'), delimiter=',')
    
    for row in csvFileReader:
        row = [s.replace('\'', '\'\'') for s in row]
        
        actionID=0
        enabled=1
        isrepeatable=0
        
        if(string.lower(row[6])=='no'):
            enabled=0
        
        actiondata=""
        if(row[3]!=None):
            actiondata = row[3]
        elif(row[4]!=None):
            actiondata = row[4]
        

        if(string.lower(row[0])=='post'):
            actionID = 1
            if(row[3]!=None):
                actiondata = "description=" + row[3]
            elif(row[4]!=None):
                actiondata = ";link=" + row[4]
        elif(string.lower(row[0])=='like'):
            actionID = 2
        elif(string.lower(row[0])=='refer'):
            actionID=2
            isrepeatable=1
        elif(string.lower(row[0])=='rsvp'):
            actionID = 3
        elif(string.lower(row[0])=='join'):
            actionID = 4
        elif(string.lower(row[0])=='follow'):
            actionID = 5
        elif(string.lower(row[0])=='tweet'):
            actionID = 6
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
        
        if(actionID>0 and actionID<12):
            insertStatement += insertValue.substitute(programID=programID, actionTypeID=actionID, displayName=row[1], description=row[2], enabled=enabled, points=row[5], actionData=actiondata, isrepeatable=isrepeatable)
            
    return insertStatement

print csvReader(7, 'CampBiscoActions.csv')
