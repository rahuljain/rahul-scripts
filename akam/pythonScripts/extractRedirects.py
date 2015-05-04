import sys
import xml.etree.ElementTree as ET

filename = str(sys.argv[1])
tree = ET.parse(filename)
root = tree.getroot()
#ET.dump(tree)
#for child in root:
#	print child.tag, child.attrib
#for node in tree.iter():
#	print node.tag, node.attrib
for node in root.findall('.//uri.wildcard'):
	responseCode = node.find('.//response-code').text
	destination = node.find('.//destination').text
	if(responseCode and destination):
		print node.attrib['value'], ',', responseCode,',', destination
