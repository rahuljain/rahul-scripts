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
  ('Cookie', 'PUT YOUR COOKIE HERE')]

  url = 'https://control.akamai.com/core-reports/services/traffic/responses/cpcode/'+cpcode+'/ui.json?start_date=10%2F01%2F2013&end_date=10%2F08%2F2013&max_points=400&start_time=00%3A00&end_time=00%3A00&traffic_option=all&ipversion=all&time_zone=GMT&locale=en_US'
  r = ''
  try:
    r = br.open(url)
  except Exception as e:  #for certain CP Codes, user may not have the right permissions.
    print e.strerror
    continue
  time.sleep(3)
  html = r.read()

  startIndex = html.find('"table_component_rows":[["0XX","0"') + len('"table_component_rows":')
  endIndex = html.find('}],"rows"')
  if startIndex >= 0:
    if endIndex < startIndex:
      reportData = html[startIndex:]
    else:
      reportData = html[startIndex:endIndex]

    #print reportData
    reportDataList = reportData.split('],')

    #hitsByResponseCode - cpcode, %origin 500, %edge 500, %origin 501, %edge 502, %origin 503, %edge 503, %origin 504, %edge 504, %origin 400, %edge 400, %origin 401, %edge 401, %origin 403, %edge 403, %origin 404, %edge 404 
    hitsByResponseCodeList = [cpcode, 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA']

    for data in reportDataList:
      dataIndex = -1
      if data.find('500') > 0:
        dataIndex = 1
      elif data.find('501') > 0:
        dataIndex = 3
      elif data.find('502') > 0:
        dataIndex = 5
      elif data.find('503') > 0:
        dataIndex = 7
      elif data.find('504') > 0:
        dataIndex = 9
      if data.find('400') > 0:
        dataIndex = 11
      elif data.find('401') > 0:
        dataIndex = 13
      elif data.find('403') > 0:
        dataIndex = 15
      elif data.find('404') > 0:
        dataIndex = 17
      if dataIndex > 0:
        responseList = data.split('","')
        percentageEdge = responseList[3]
        percentageOrigin = responseList[5].strip('"]')
        hitsByResponseCodeList[dataIndex] = percentageOrigin
        hitsByResponseCodeList[dataIndex+1] = percentageEdge

    print hitsByResponseCodeList  #or save it to a file

  else:
    print "error!"
  #print
  #print

#"table_component_rows":[["0XX","0","10344","0.5%","8561","0.4%"],["1XX","100","0","0.0%","164","0.0%"],["2XX","200","1558819","77.7%","1559936","80.7%"],["2XX","204","986","0.0%","989","0.1%"],["3XX","301","74697","3.7%","3204","0.2%"],["3XX","302","121897","6.1%","121915","6.3%"],["3XX","304","46","0.0%","42","0.0%"],["4XX","400","108","0.0%","108","0.0%"],["4XX","403","239","0.0%","232","0.0%"],["4XX","404","237464","11.8%","237615","12.3%"],["4XX","413","58","0.0%","58","0.0%"],["4XX","415","20","0.0%","20","0.0%"],["5XX","500","233","0.0%","224","0.0%"],["5XX","501","9","0.0%","0","0.0%"],["5XX","502","7","0.0%","7","0.0%"],["5XX","503","7","0.0%","2","0.0%"],["5XX","504","9","0.0%","0","0.0%"]]}]
