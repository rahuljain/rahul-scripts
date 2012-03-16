import csv
import math

actionName = ""
string2 = ""
string3 = ""
stringMyStatusModel=""
i=0
csvFileReader = csv.reader(open('BluegrassWeeklyActions.csv', 'rb'), delimiter=',')
for row in csvFileReader:
    string="<div class=\"actionItem\">"
    string += "\n<span class=\"header\">"
    if(row[1]=='Like'):
        string1 = "Like " + row[3] + " on Facebook"
        string += string1 + "</span>\n"
        string += "<p><%: Model.Like" + row[4] + "? \"Thanks for playing! Keep earning points!\" : \"" + string1 + " and earn more rewards!\"%></p>"
        string += "\n<div class=\"fbLikeButton\">"
        string += "\n<fb:like href=\"" + row[5] + "\" width=\"450\" show_faces=\"true\" font=\"arial\"></fb:like>"
        string += "\n</div>"
        string += "\n<br />"
        string += "\n</div>"
        string += "\n<div class=\"actionInfo\">"
        string += "\n<div class=\"actionPoints\">"
        string += "<span>POINT VALUE</span><br />" + row[2] + "</div>"
        string += "\n<div id=\"likeStatus" + row[4] + "\" class=\"actionStatus<%: Model.Like" + row[4] + " ? \"\" : \" hide\" %>\">COMPLETED</div>"
        string += "\n</div>"
        string += "\n<br />"

        string2 += "\nif (href == '" + row[5] + "') {"
        string2 += "\n$(\"#likeStatus" + row[4] + "\").removeClass(\"hide\");"
        string2 += "\nAwardBadgePoints(\"FBLike" + row[4] + "\");"
        string2 += "\n}"

        string3 += "\nFB.api({ method: 'pages.isFan', page_id: '" + row[6] + "' },"
        string3 += "\nfunction (response) {"
        string3 += "\nif (response) {"
        string3 += "\n$(\"#likeStatus" + row[4] +"\").removeClass(\"hide\");"
        string3 += "\n} else {"
        string3 += "\n $(\"#likeStatus" + row[4] + "\").addClass(\"hide\");"
        string3 += "\n}"
        string3 += "\n});"

        stringMyStatusModel += "\npublic bool Like" + row[4]

        print string

    elif(row[1]=='Follow'):
        string += "Follow " + row[3] + " on Twitter</span>"
        string += "\n<p><%: Model.Following" + row[4] + " ? \"Thanks for playing! Keep earning points!\" : \"Follow us on Twitter to find out what other fans are saying ...\"%></p>"
        string += "\n<div class=\"followButton\">"
        string += "\n<% if(((FanFueledUserModel)ViewData[\"FFUser\"]).IsTwitterConnected) {"
        string += "\n if(Model.Following" + row[4] + ") { %>"
        string += "\n<img src=\"<%=Url.Content(\"~/Content/Images/following" + row[4] + "Button.png\")%>\" alt=\"\" />"
        string += "\n<% } else { %>"
        string += "\n<a href=\"/User/Follow?id=" + row[5] + "\"><img src=\"<%=Url.Content(\"~/Content/Images/follow" + row[4] + "Button.png\")%>\" alt=\"\" /></a>"
        string += "\n<% }"
        string += "\n}"
        string += "else"
        string += "\n{ %>"
        string += "\n<a href=\"/User/TwitterLogin\"><img src=\"<%=Url.Content(\"~/Content/Images/twitterConnectButton.png\")%>\" alt =\"\" /></a>"
        string += "\n<% } %>"
        string += "\n</div>"
        string += "\n</div>"
        string += "\n<div class=\"actionInfo\">"
        string += "\n<div class=\"actionPoints\">"
        string += "\n<span>POINT VALUE</span><br />" + row[2] + "</div>"
        string += "\n<div class=\"actionStatus<%: Model.Following" + row[4] + " ? \"\" : \" hide\" %>\">"
        string += "\nCOMPLETED </div>"
        string += "\n</div>"
        string += "\n<br />"

        stringMyStatusModel += "\npublic bool Following" + row[4]
        
        print string
    
    stringMyStatusModel += "\n{"
    stringMyStatusModel += "\nget { return (RecordedActions & " + str(math.trunc(math.pow(2,i))) + ") != 0; }"
    stringMyStatusModel += "\n}"
    i = i+1

print string2
print string3
print stringMyStatusModel
