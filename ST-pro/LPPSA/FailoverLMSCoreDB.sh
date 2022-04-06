#!/bin/bash

su - lmsinst
IP=$(ifconfig | grep "inet 172" | awk '{print $2}')
db2pd -db LPPSA –hadr
echo "WARNING: You are going to swingover LMS Core DB to DR Site. IP shall be 172.29.48.204 and this server IP is $IP." 
echo "Proceed? (Y/N)"
read ANS

if [[ $ANS = Y ]]
then
  echo "LMS CoreDB Failover from Prod to DR is starting…"
  db2 takeover hadr on db LPPSA
  echo "LMS CoreDB Failover from Prod to DR is completed" 
  db2pd -db LPPSA –hadr
fi
