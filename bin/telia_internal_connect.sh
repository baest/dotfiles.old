#! /bin/sh
echo "Connecting to b1"
ssh -fxN42 b1
sshuttle -vr portal 194.255.56.0/25 194.255.56.128/27 194.255.56.160/30 194.255.56.165/32 194.255.56.166/31 194.255.56.168/29 194.255.56.176/28 194.255.56.192/26 \
10.5.0.0/16 10.17.0.0/16 131.115.0.0/16 131.116.0.0/16 131.177.146.0/24 131.177.0.0/16 81.236.57.86/32 81.236.51.9/32 194.236.188.0/24 81.225.176.0/24 131.116.121.0/24
#10.18.0.0/16 
