import csv
import os

path='C:\FanFueled\FanFueledEngage\engage.fanfueled.com\engage.fanfueled.com\content\images\/campbisco-images\/campbisco-banners'

awsPath = 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-banners/'
listing = os.listdir(path)
print "insert into EN_RewardImage (RewardID, Path, IsPrimary) values "
for infile in listing:
    print "'" + awsPath + infile + "'"
