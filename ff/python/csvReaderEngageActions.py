import sys
import string
import csv
import math
from string import Template


def csvReader(programID, programName, fileName):
    programNameURL = "https://fanfueledengage.com/" + (string.lower(programName)).replace(' ','')
    print programNameURL
    if(programName==""):
        programName = "FanFueled Engage"
    insertStatement = "insert into EN_Action (ProgramID, ActionTypeID, DisplayName, Description, Enabled, CreatedDate, Points, PointsDisplay, ActionData, HasReferralPoints, IsRepeatable, StartDate, EndDate, OrderIndex) values "
    insertValue = Template("\n($programID, $actionTypeID, '$displayName', '$description', $enabled, GETDATE(), $points, $pointsDisplay, '$actionData', $hasreferralpoints, $isrepeatable, $startDate, $endDate, $orderindex),")
    csvFileReader = list(csv.reader(open(fileName, 'rb'), delimiter=','))

    count=0
    for row in csvFileReader:
        row = [s.replace('\'', '\'\'') for s in row]
        row = [s.strip() for s in row]
        
        actionID=0
        enabled=1
        isrepeatable=0
        StartDate='NULL'
        EndDate='NULL'
        hasReferralPoints = 0
        orderIndex = 'NULL'
        points=row[5]
        pointsDisplay = 'NULL'

        if(row[6]!=None and (string.lower(row[6])=='no' or string.lower(row[6])=='n')):
            enabled=0
        
        actiondata=""
        if(row[3]!=None and string.strip(row[3])!=""):
            actiondata = row[3]
        elif(row[4]!=None and string.strip(row[4])!=""):
            actiondata = row[4]

        if(len(row) > 7 and string.strip(row[7])!=""):
            StartDate = "'" + row[7] + "'"
        if(len(row) > 8 and string.strip(row[8])!=""):
            EndDate = "'" + row[8] + "'"
            orderIndex=1

        if(len(row) > 9):
            orderIndex = row[9]

        if(string.lower(row[0])=='post' or string.lower(row[0])=='facebook referral' or string.lower(row[0])=='refer-a-friend via facebook'):
            actionID = 1
            hasReferralPoints=1
            if(string.lower(row[0])=='facebook referral' or string.lower(row[0])=='refer-a-friend via facebook'):
                isrepeatable=1
                hasReferralPoints=0
                orderIndex=2
                pointsDisplay=5
                points=0
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
        elif(string.lower(row[0])=='twitter referral' or string.lower(row[0])=='refer-a-friend via twitter'):
            actionID=6
            isrepeatable=1
            orderIndex=3
            actiondata += " " + programNameURL
            pointsDisplay=5
            points=0
        elif(string.lower(row[0])=='retweet'):
            actionID = 7
        elif(string.lower(row[0])=='watch'):
            actionID = 8
        elif(string.lower(row[0])=='link' or string.lower(row[0])=='visit'):
            actionID = 9
        elif(string.lower(row[0])=='buy'):
            actionID = 10
            isrepeatable=1
        elif(string.lower(row[0])=='donate'):
            actionID = 11
            isrepeatable=1
        
        if(actionID>0 and actionID<12):
            insertStatement += insertValue.substitute(programID=programID, actionTypeID=actionID, displayName=row[1], description=row[2], enabled=enabled, points=points, pointsDisplay=pointsDisplay, actionData=actiondata, hasreferralpoints=hasReferralPoints, isrepeatable=isrepeatable, startDate=StartDate, endDate=EndDate, orderindex=orderIndex)
            count += 1
    
    print "Total number of actions added = {0}".format(count)
    return insertStatement

programID = sys.argv[1]
programName = sys.argv[2]
fileName = sys.argv[3]

print csvReader(programID, programName, fileName)


## to modify: caption=foobar;link=programName.fanfueledengage.com;name=programName
## Example usage:
