#Script to extract peak bandwidth in Mbits/s for edge and origin by CPCodes.
#Extracts data from report: Monitor->Site->Offload
#Author: Rahul Jain - rajain@akamai.com

# Before you run this:
# 1. Open browser and go the desired client account and pull the report once.
# 2. Copy the cookie and paste it here in the headers.

import re
import mechanize
import time
import json

print ("Format: [cpcode, total edge hits, peak edge hits/s, total edge bandwidth (in GB), peak edge bandwidth (in Mbps)]")
start_date='11/29/2013'
end_date='11/30/2013'
start_time='00:00'
end_time='00:00'
#www.sears.com.xml
cpcodes = ['58297','68995']#,'70551','74786','78692','84295','85364','85719','85720','86200','86202','87264','87863','87864','87865','95046','95328','95717','95718','95719','95720','101398','101552','107993','107994','107995','108539','108541','108640','109457','111552','111553','111554','111555','111636','112234','112235','112236','112237','112279','112280','112283','112284','116750','121226','128067','130153','139879','139880','139881','139882','139883','139884','139885','174064','175691','175693','175694','189464','189465','189466','189467','193414','193415','193416','193417','209361','216625','225500','237356','237357','237358','237359','237360','238211','238212','238213','238214','109762','85258','19371','101548']

#m.sears.com.xml
#cpcodes = ['93608','95328','92487','241866','130151','98357','112298','167531','167532','236728','236729','226468','226469']

#www.kmart.com.xml
#cpcodes = ['19371','79159','237415','237416','237417','237418','243097','243096','243101','243096','243099','243100','243102','243105','85258','109762','85058','137967','243104','139906','101548','95328','243103','243108','243107','58298','128066','112291','86199','87264','239019','239021','85949','85363','112289','189396','85057','136846','209362','234656','59290','191743','139905','139907','193418','139904','139901','108541','139903','139902','111557','193419','239022','239020','241012','136844','243109','109459','137968','243098','241011','243106']

#m.kmart.com.xml
#cpcodes = ['93609','95328','130151','246443','92487','167629','114865','167630','167631','237728','237729','226470','226471']

for cpcode in cpcodes:
  br = mechanize.Browser()
  br.addheaders = [('User-agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36'), ('Cookie', 'PUT YOUR COOKIE HERE')]

  edgeBandwidthUrl = 'https://control.akamai.com/core-reports/services/traffic/bandwidth/cpcode/'+cpcode+'/ui.json?start_date=10%2F01%2F2013&end_date=10%2F08%2F2013&start_time=00%3A00&end_time=00%3A00&traffic_option=all&ipversion=all&max_points=870&time_zone=GMT&locale=en_US'
  edgeHitsUrl = 'https://control.akamai.com/core-reports/services/traffic/hits/cpcode/'+cpcode+'/ui.json?start_date=20131130&end_date=20131202&start_time=0000&end_time=1605&traffic_option=all&ipversion=all&max_points=870&time_zone=GMT&locale=en_US'
  r = ''
  try:
    r = br.open(edgeHitsUrl)
  except Exception as e:  #for certain CP Codes, user may not have the right permissions.
    print e.strerror
    continue
  time.sleep(3)
  html = r.read()

  startIndex = html.find('[{"id":"traffic_bandwidth_egress_total')
  endIndex = html.find('}]', startIndex)
  if startIndex >= 0 and startIndex < endIndex:
    peakBandwidthList = [cpcode, 'NA', 'NA']
    data = html[startIndex:endIndex+2]
    data = json.loads(data)
    #print json.dumps(data, sort_keys=True, indent=4)
    for item in data:
      if(item['id']=='traffic_bandwidth_egress_peak'):
        peakBandwidthList[1] = str(item['box_value'])
      elif(item['id']=='traffic_bandwidth_ingress_peak'):
        peakBandwidthList[2] = str(item['box_value'])
    print peakBandwidthList
  else:
    print "error!"
