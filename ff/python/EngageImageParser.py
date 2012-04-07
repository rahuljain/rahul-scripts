import csv
import os

path='C:\FanFueled\FanFueledEngage\engage.fanfueled.com\engage.fanfueled.com\content\images\/fanfueled-images\/Prizes'

awsPath = 'https://s3.amazonaws.com/fanfueled-engage/images/fanfueled-images/fanfueled-prizes/'
listing = os.listdir(path)
print "insert into EN_RewardImage (RewardID, Path, IsPrimary) values "
for infile in listing:
    print "'" + awsPath + infile + "'"
