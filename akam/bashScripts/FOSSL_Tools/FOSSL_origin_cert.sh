#!/bin/bash
################### BEGIN SCRIPT
######## USAGE: ./FOSSL_test.sh "origin_LIST"
#### "origin_LIST" being a list of hostnames, one per line
####### HOSTS FILE BELOW ########
ORIGIN_HOSTS_FILE="$1"
GLOBAL_CA_LIST="global_server.xml"
UNDERRIDE="underride.csv"

if [[ ! -e ${ORIGIN_HOSTS_FILE} ]]; then                                                                                                                                                                                                                                   
   echo  
   echo " No Origin List File Specified" 
   echo " Please specify a file with a list of hostnames to query"
   exit 1
fi

cat ${ORIGIN_HOSTS_FILE} |grep . |while read HOST ; do 

if [[ ! -e split_pem.pl ]]; then
   echo "You're missing split_pem.pl !!!!"
   exit 1
fi
if ! [ -d ${HOST}_CERTIFICATES ]; then
  mkdir ${HOST}_CERTIFICATES
else
  rm -fr ${HOST}_CERTIFICATES
  mkdir ${HOST}_CERTIFICATES
fi

echo | openssl s_client -connect ${HOST}:443 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ${HOST}_CERTIFICATES/${HOST}_CERT.pem 
echo | openssl s_client -showcerts -connect ${HOST}:443 2>/dev/null |sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ${HOST}_CERTIFICATES/${HOST}_CA.pem
SHA1RESULT=`openssl x509 -fingerprint -in ${HOST}_CERTIFICATES/${HOST}_CERT.PEM | grep SHA1 | sed 's/SHA1 Fingerprint=\(.*\)/\1/'` 
SHA1COMBINED=`echo $SHA1RESULT|sed -e 's/://g'`
VALID_DATES=`openssl x509 -noout -enddate -in ${HOST}_CERTIFICATES/${HOST}_CERT.PEM`
ROOTCA=`openssl x509 -noout -text -in ${HOST}_CERTIFICATES/${HOST}_CERT.PEM |grep "CA Issuers - URI:" | awk -F"CA Issuers - URI:" '{print $2}'`
>${HOST}_CERTIFICATES/${HOST}_SHA1.pem
echo "SHA1: ${SHA1RESULT}" >> ${HOST}_CERTIFICATES/${HOST}_SHA1.pem
echo "SHA1 without colons: ${SHA1COMBINED}" >> ${HOST}_CERTIFICATES/${HOST}_SHA1.pem
#### Change dir
cd ${HOST}_CERTIFICATES
##### GRAB All the different Certificates and Authorities in the Chain
cat ${HOST}_CA.pem | perl ../split_pem.pl 2>&1> ${HOST}_CACHAIN_INFO.txt
CAINFO2=`cat ${HOST}_CACHAIN_INFO.txt |grep -v "/" |grep . |head -2 |while read i ; do openssl x509 -in ${i}.pem -issuer -noout; done`
CAINFO_ROOT=`cat ${HOST}_CACHAIN_INFO.txt |grep -v "/" |grep . | head -2 | tail -1 | while read i  ; do openssl x509 -in ${i}.pem -issuer -noout 2>/dev/null |awk -F'issuer=' '{print $2}' |sed "s/^[ \t]*//"; done`
CAINFO_INTERMEDIATE=`cat ${HOST}_CACHAIN_INFO.txt |grep -v "/" |grep . | tail -1`
CAINFO=`cat ${HOST}_CACHAIN_INFO.txt`

### Check if Certificate is in Underride
if [[ -f ../${UNDERRIDE} ]]; then
  UNDERRIDE_RESULTS=`grep "${SHA1COMBINED}" ../${UNDERRIDE}`
  if [[ -z $UNDERRIDE_RESULTS ]] ; then UNDERRIDE_RESULTS="Origin Certificate NOT in Underride"
  fi
fi

### VERIFY CA ROOT for certificate
mkdir CA_ROOTS
cd CA_ROOTS
POSSIBLE_AUTHORITIES=`cat ../../${GLOBAL_CA_LIST} |grep "${CAINFO_ROOT}" -A45 |sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' |sed "s/^[ \t]*//"`
echo "${POSSIBLE_AUTHORITIES}" | perl ../../split_pem.pl 2>/dev/null > CA_ROOT_INFO.txt
VERIFY_RESULTS=`ls |grep pem| while read i ; do echo "=====  CA ROOT IDENTIFIER: " ; openssl x509 -subject -noout -in ${i} 2>/dev/null ; echo "CA_SHA1: ${i}" ; openssl verify -CAfile ${i} ../${CAINFO_INTERMEDIATE}.pem 2>/dev/null ; echo; done`
RECOGNIZED=`echo "${VERIFY_RESULTS}" |grep -B2 ".pem: OK"`
if [[ -z "${RECOGNIZED}" ]]; then
   NOT_HERE=" **** FAIL **** Certificate not signed by an Akamai recognized Certificate Authority"  
else
   NOT_HERE="Congrats !!! your cert is signed by an Akamai recognized Certificate Authority!!!"
fi
cd ../


echo " 
##############################################################################################################
!!!!!!!!!! Below information written to: ${HOST}_CERTIFICATES/RESULTS.txt"
echo "
============= HOST: ${HOST}

==== Directory: ${HOST}_CERTIFICATES
========= Origin Certificate file output: ${HOST}_CERT.pem
========= Origin SHA1 file output: ${HOST}_SHA1.pem
========= Origin Cert Expiration : ${VALID_DATES}
========= Origin CA ROOT: ${CAINFO_ROOT}
========= Certificate chain file output: ${HOST}_CA.pem
========= Certificate chain bundle info: ${HOST}_CACHAIN_INFO.txt


============= CERTIFICATE CHAIN INFORMATION BELOW
${CAINFO}

============= CERTIFICATE AUTHORITY CHAIN INFORMATION BELOW --- BOTTOM IS ROOT CA 
${CAINFO2}

============= VERIFYING IF ROOT CA EXISTS IN AKAMAI LIST
${RECOGNIZED}
${NOT_HERE}
" | tee RESULTS.txt

if [[ -f ../${UNDERRIDE} ]]; then
echo " ============= UNDERRIDE STATUS" | tee -a RESULTS.txt
echo "${UNDERRIDE_RESULTS}" | tee -a RESULTS.txt 
fi

cd ../
done
