#! /bin/sh
echo "Connecting to b1"
ssh -fxN42 b1
sshuttle -r b1.dk.telia.net:19022 0.0.0.0/0 -x 10.0.0.0/8 -vv
