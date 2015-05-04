import sys

def transformOriginMap(originMap):
	domain_origin_list = originMap.split('~')
	return domain_origin_list

def main():
	map = "r3-loadtest1.jcpenney.com=origin-r3-loadtest1-c1.jcpenney.com~r3-loadtest2.jcpenney.com=origin-r3-loadtest2-c1.jcpenney.com~r3-prodsupport.jcpenney.com=origin-r3-prodsupport-c1.jcpenney.com~dp-dev1.jcpenney.com=origin-dp-dev1-l1.jcpenney.com~r3-integration.jcpenney.com=origin-r3-integration-l1.jcpenney.com~r3-test1.jcpenney.com=origin-r3-test1-l1.jcpenney.com~r3-test2.jcpenney.com=origin-r3-test2-l1.jcpenney.com~r3-test3.jcpenney.com=origin-r3-test3-c1.jcpenney.com~r3-test4.jcpenney.com=origin-r3-test4-c1.jcpenney.com~r3-training.jcpenney.com=origin-r3-training-c1.jcpenney.com~dp-test1.jcpenney.com=origin-dp-test1-web.jcpenney.com.akadns.net~dt-test2.jcpenney.com=origin-dt-test2-web.jcpenney.com.akadns.net~dt-support.jcpenney.com=origin-dt-support-web-c1.jcpenney.com"
	domain_origin_list = transformOriginMap(map)
	for item in domain_origin_list:
		domain_origin = item.split('=')
		domain = domain_origin[0]
		origin = domain_origin[1]
		print('<match:hoit host="' + domain + '">')
		print('<assign:variable>')
		print('<name>TEST_FWD_ORIGIN</name>')
		print('<value>' + origin + '</value>')
		print('</assign:variable>')
		print('</match:hoit>')


if __name__ == '__main__':
	main()
