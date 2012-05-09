import csv
import os

path='C:\FanFueled\FanFueledEngage_working\engage.fanfueled.com\engage.fanfueled.com\content\images\/wavefront-images\/wavefront-prizes'
# path='C:\Users\Rahul\code\FanFueled\Art'

awsPath = 'https://s3.amazonaws.com/fanfueled-engage/images/wavefront-images/wavefront-prizes/'
listing = os.listdir(path)
print "insert into EN_RewardImage (RewardID, Path, IsPrimary) values "
for infile in listing:
    print "'" + awsPath + infile + "'"
