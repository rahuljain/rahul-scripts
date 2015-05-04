################### BEGIN SCRIPT
######## USAGE: ./FOSSL_test.sh “express_LIST” “/user/login.jsp”
#### "express_LIST" being a list of hostnames, one per line
#### "/user/login.jsp" being the URIPATH
####### HOSTS FILE BELOW ########
HOSTS_FILE="$1"

if ! [ -e ${HOSTS_FILE} ]; then
   echo "You're missing ${HOSTS_FILE} !!!!"
   echo "What hosts are you exactly checking???"
   exit 1
fi
####### HTTP REQUEST PATH BELOW ########
URI_PATH="$2"

########### CODE
cat ${HOSTS_FILE} |while read HOST ; do 
echo $HOST ;

SPOOF_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0";
STAGING_EDGEHOST=`dig +noall +answer $HOST |tail -1 |awk '{print $1}' |sed -e 's/\.net\.$/-staging\.net/g'`;
PROD_EDGEHOST=`dig +noall +answer $HOST |tail -1 |awk '{print $1}'|sed -e 's/\.$//g'`;
STAGING_IP=`dig +noall +answer $STAGING_EDGEHOST|tail -1 |awk '{print $NF}'`;
PROD_IP=`dig +noall +answer $PROD_EDGEHOST|tail -1 |awk '{print $NF}'`;
echo "HOST:${HOST}:443   AKA_STAGING_INFO:${STAGING_IP}:${STAGING_EDGEHOST}  URIPATH:${URI_PATH}"; 
echo "curl -k -L \"https://${HOST}${URI_PATH}\" --resolve ${HOST}:443:${STAGING_IP} -A \"$SPOOF_AGENT\" -o /dev/null -vvvvs 2>&1 |grep \"HTTP/1.1 \|Location\|GET \/\"" ; 
echo "curl -k -L \"https://${HOST}${URI_PATH}\" --resolve ${HOST}:443:${PROD_IP} -A \"$SPOOF_AGENT\" -o /dev/null -vvvvs 2>&1 |grep \"HTTP/1.1 \|Location\|GET \/\"" ; 
STAGE_RESULTS=`curl -k -H "Cookie: $COOKIE" -L "https://${HOST}${URI_PATH}" --resolve ${HOST}:443:${STAGING_IP} -A "$SPOOF_AGENT" -o /dev/null -vvvvs 2>&1 |grep "HTTP/1.1 \|Location\|GET \/" `; 
PROD_RESULTS=`curl -k -H "Cookie: $COOKIE" -L "https://${HOST}${URI_PATH}" --resolve ${HOST}:443:${PROD_IP} -A "$SPOOF_AGENT" -o /dev/null -vvvvs 2>&1 |grep "HTTP/1.1 \|Location\|GET \/" `; 
echo 

echo "==== URL: https://${HOST}${URI_PATH}"
echo "========== AKA-STAGE RESULTS ==========="
echo "$STAGE_RESULTS"
echo "========== AKA-PROD RESULTS ==========="
echo "$PROD_RESULTS"
echo
echo

done
################### END SCRIPT
