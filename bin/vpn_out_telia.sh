#! /bin/sh
echo "Connecting to b1"
ssh -fxN42 b1
sshuttle -r b1.dk.telia.net:19022 0.0.0.0/0 -x 10.0.0.0/8 -x 81.228.28.92/16 -x 81.225.176.0/24 -x 131.115.0.0/16 -x 131.116.0.0/16 -x 131.177.146.0/24 -x 131.177.0.0/16 -x 40.127.192.244/32 -x 194.255.56.0/25 -x 194.255.56.128/27 -x 194.255.56.160/30 -x 194.255.56.165/32 -x 194.255.56.166/31 -x 194.255.56.168/29 -x 194.255.56.176/28 -x 194.255.56.192/26 -x 194.236.188.0/24 -x 81.236.57.86/32 -x 81.236.51.9/32


# idp.internal.teliasonera.net teliacom.service-now.com tspam.ddc.teliasonera.net. ts.teliacompany.net. entrypoint.teliacompany.net.

