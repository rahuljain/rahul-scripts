#Script to extract hits by response code
#Author: Rahul Jain - rajain@akamai.com

# Before you run this:
# 1. Open browser and go the desired client account and pull the reports.
# 2. Copy the cookie and paste it here in the headers.

import re
import mechanize
import time

#www.sears.com.xml
#cpcodes = ['58297','68995','70551','74786','78692','84295','85364','85719','85720','86200','86202','87264','87863','87864','87865','95046','95328','95717','95718','95719','95720','101398','101552','107993','107994','107995','108539','108541','108640','109457','111552','111553','111554','111555','111636','112234','112235','112236','112237','112279','112280','112283','112284','116750','121226','128067','130153','139879','139880','139881','139882','139883','139884','139885','174064','175691','175693','175694','189464','189465','189466','189467','193414','193415','193416','193417','209361','216625','225500','237356','237357','237358','237359','237360','238211','238212','238213','238214','109762','85258','19371','101548']

#m.sears.com.xml
#cpcodes = ['93608','95328','92487','241866','130151','98357','112298','167531','167532','236728','236729','226468','226469']

#www.kmart.com.xml
#cpcodes = ['19371','79159','237415','237416','237417','237418','243097','243096','243101','243096','243099','243100','243102','243105','85258','109762','85058','137967','243104','139906','101548','95328','243103','243108','243107','58298','128066','112291','86199','87264','239019','239021','85949','85363','112289','189396','85057','136846','209362','234656','59290','191743','139905','139907','193418','139904','139901','108541','139903','139902','111557','193419','239022','239020','241012','136844','243109','109459','137968','243098','241011','243106']

#m.kmart.com.xml
cpcodes = ['93609','95328','130151','246443','92487','167629','114865','167630','167631','237728','237729','226470','226471']

for cpcode in cpcodes:
  br = mechanize.Browser()
  br.addheaders = [('User-agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36'),
  ('Cookie', 'JSESSIONID=FEC258D99AD89C9093C17B5E96433423.p3-report02; prod-fin-db02_finapps=TFxHeeoePrtO3mkOjYL_mT-9:S; IS3_GSV=DPL-2_TES-1372731813_PCT-1372731813_GeoIP-24.148.73.100_GeoCo-US_GeoRg-IL_GeoCt-Chicago_GeoNs-_GeoDm-; ObSSOCookie=IB5BOCsUi6afFR55EBt4gyACCMudChj1TH%2BoIqfJ%2FvVscjtiAO%2FNezPdZB1t%2Br6DhM%2FkixsbA2ZU3UYnFIeSw5tP98sr15j6cDmoOiIRBjDteMi4sFtkIJlNVigDVp6xn9RlNFoa6VCswosCRS%2FIJp%2BIvXHsiAyEwGJPBWdcGIrR4JixKY8QtLqFJsbL1qwKSBxVmEbb6wZcUlKM1CDfVq%2BAJ4RQgyqfHruOO8HmXjWJ8dbUJUY556%2BTsKgm1w0NXj4UVHPujmRYCcfAvGQhvxV51U1u9%2FKOsorf%2BzOA8KaobFePLVfVTuPuZo%2BNXpg4I0Gv2mStlHnSM7eLaP9CR6tfI%2BNfDr8qpe8VAqE3gsyvN1HCcJoDp7lcNr47i%2FZ0; XR77=3OIhJf6HSllz4ExfuKIcvL9KBOjTTdwX67V1prh_rbPxuo6FKmsL3Mw; __utma=147924903.223770272.1367867923.1374475281.1380133602.9; __utmc=147924903; __utmz=147924903.1374475281.8.3.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); industry=7; WT_FPC=id=2590d7c309f59ffc0a71379974313857:lv=1381247703877:ss=1381246561699; AKALOCALE=ZW5fVVN+TVhaVVRRbm04bEQ1MlRrYVVSdEcxM2c5aEp5N2VqamJoc0VXNzRhM3JsNk9rVWJybWN0U2tHbmhkM2VPTDBmTVF1SHVBaXc9; AKAUSER=cmFqYWlu; AKASESSION=ip+127.0.0.1~expires+1381425424~access+rajain!/portal/*!~sid+1C7F0936A03C5DAEBF8F2CBF738FD60B.p3-tomapp6~policy+3600~md5+1fc51da8d38ba549e96cd5a362ae794c; pubcookie_s_control.akamai.com=VBJ8BFOBgq4ZqkUhXqzTHdhA2I77z6ij+y9gdsroi161Z/Z2KlduL7XGNr80v//lE1cFlmViDRllt84fHiIg8Buhs1vKbXudvsKzseQkrbSTRK/QY/31IlehE82ugS9zmt87BJh7I17Cp0kSnrQpfK+dkTHWtDcJVH+yy0MkRCGQPig/Lyh0lJjMj20lmcnrCLOxvl1kisAZZ1gIBBjVm4mdqEpKmHWx/Z0RabXdELfThbumPyP7s+nnBoIdDxBiBLvtYgXYuhhHP9wC8qzyD93kS8WI7POX0T6jPyDZp4YbrIwlyxV8v6na4lQvXcfvcNNYLGTLklmad+ScGLzgSqpP55mrOwfWQ4S2Rxvr3RkpRRKGzMEYFuYf7GPCeyGZv7zYy28gsuSQnknG8Wfoc0fnkoUG6iSjRV/Rbdhi/+GKSQff85PdgyATE7hiZ89Svm8ea6tRDNkUmcbwD/seDSCS+q4ERrBKYYHpVzJUcZXsHrsgge/XORyTmyJZ83wc+bdYvkiuzu8XjWQcEnqQ0NcVYA3gmTwrXONjga/OBH/8Yt9fV4itPyfV5THRJGbe7iy/frxNubRzWDbhuxixjxgeQINspW4IlB9k02jmNEPwn8Tp1b36xSWeLewGGX3oZZUZMesgJdcRWd8Z5TsOivJeXGrP05Rci0Qr6W9B7vQMAA==; JSESSIONID=1C7F0936A03C5DAEBF8F2CBF738FD60B.p3-tomapp6; Akamai-UBB=730acbd9.215c7538; AKSB=s=1381416674888&r=https%3A//control.akamai.com/home/view/main; AKAGROUP=MjUxOTE=; AKASELECTOR=Z3Jw; AKATAB=TU9OSVRPUg==; AKAVISITED=L3VpOjo0RUE2OTA2RDczOUEwNkRCRDNBRjlFQ0VFRjA4NTIxRi5wMy1hdXRoc2VydmVyMDV+fi9wb3J0YWw6OjFDN0YwOTM2QTAzQzVEQUVCRjhGMkNCRjczOEZENjBCLnAzLXRvbWFwcDZ+fi9zdmNzOjo0NTEyNTBBRENCQTdBQzk1NDQ5QUI5ODA5Q0Q5MUQwRS5wMy1tZWRpYTAzfn4vaG9tZTo6RjBFMUY1MDQxRDQ3NEJBMjA3Q0EyOTAyMEI3MEIxQzQucDMtY29yZTA1fn4vcmVzb2x2ZTo6RUJEQTgxQzBDMTY5RTkyNDJDRDBEQzFCQTIyQTAyQUMucDMtc3VwcG9ydDAzfn4vY29yZTo6MUM3RjA5MzZBMDNDNURBRUJGOEYyQ0JGNzM4RkQ2MEIucDMtdG9tYXBwNn5+L2NtcG9ydGFsOjo4MDE0MDc2MDY3MUNFRTU4RUJGRDk2NDk1Q0EwQTNGRi5wMy1jb25maWcwN35+L2NvcmUtcmVwb3J0czo6RkVDMjU4RDk5QUQ4OUM5MDkzQzE3QjVFOTY0MzM0MjMucDMtcmVwb3J0MDI=; WT_FPC=id=2590d7c309f59ffc0a71379974313857:lv=1381416687375:ss=1381416687375; AKALASTMANAGEDACCOUNT=U2VhcnMgSG9sZGluZ3MgTWFuYWdlbWVudCBDb3Jwb3JhdGlvbl9EaXJlY3QgQ3VzdG9tZXJ+fkFBTkEtMTlDT0tR')]

  url = 'https://control.akamai.com/core-reports/services/traffic/responses/cpcode/'+cpcode+'/ui.json?start_date=10%2F01%2F2013&end_date=10%2F08%2F2013&max_points=400&start_time=00%3A00&end_time=00%3A00&traffic_option=all&ipversion=all&time_zone=GMT&locale=en_US'
  r = ''
  try:
    r = br.open(url)
  except Exception as e: #for certain CP Codes, user may not have the right permissions.
    print e.strerror
    continue
  time.sleep(3)
  html = r.read()
  
  startIndex = html.find('"table_component_rows":[["0XX"') + len('"table_component_rows":')
  endIndex = html.find('"OTHER"')
  if startIndex >= 0 and startIndex < endIndex:
    reportData = html[startIndex:endIndex]

    reportDataList = reportDataList = reportData.split('],')

    #hitsByResponseType - cpcode, Average % of origin 5xx, Average % of edge 5xx, Average % of origin 4xx, Average % of edge 4xx, Average % of origin 0xx, Average % of edge 0xx
    hitsByResponseTypeList = [cpcode, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA']

    for data in reportDataList:
      dataIndex = -1
      if data.find('5XX') > 0:
        dataIndex = 1
      elif data.find('4XX') > 0:
        dataIndex = 3
      elif data.find('0XX') > 0:
        dataIndex = 5
      if dataIndex > 0:
        responseList = data.split('","')
        percentageEdge = responseList[2]
        percentageOrigin = responseList[4].strip('"]')
        hitsByResponseTypeList[dataIndex] = percentageOrigin
        hitsByResponseTypeList[dataIndex+1] = percentageEdge

    print hitsByResponseTypeList

  else:
    print "error!"
