import csv
import math

actionName = ""
csvFileReader = csv.reader(open('weeklyActionsBluegrass.csv', 'rb'), delimiter=',')
i=0
for row in csvFileReader:
    if(row[1]!=None):
        if(row[1]=='Like'):
            actionName='FBLike'+row[3]
        elif(row[1]=='Follow'):
            actionName = 'TwitterFollow'+row[3]
        elif(row[1]=='Post'):
            actionName = 'FB'+row[3]+'Post'
        elif(row[1]=='Tweet'):
            actionName = 'Tweet'
        elif(row[1]=='Census'):
            actionName = 'Census'
        sqlStatement = 'insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(' + row[0] + ', \'' + actionName + '\', ' + str(math.trunc(math.pow(2,i))) + ', ' + row[2] +')'
        #print('if (href == \'' + row[4] + '\') { $("#likeStatus' + row[3] + '").removeClass("hide"); AwardBadgePoints("FacebookLike' + row[3] + '"); }')
        print sqlStatement
        i=i+1
