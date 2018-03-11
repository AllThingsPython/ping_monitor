#!/bin/bash

generate_ping_data()	{

packets_sent=`cat ping_file_${tmp_id}.txt | wc -l`
packets_received=`cat ping_file_${tmp_id}.txt | grep "bytes from" | wc -l`
packets_lost=`cat ping_file_${tmp_id}.txt | egrep "unknown host|Network is unreachable" | wc -l`

echo "Total packets sent: $packets_sent" >> ping_data_${tmp_id}.txt
echo "Total packets received: $packets_received" >> ping_data_${tmp_id}.txt
echo "Total packets lost: $packets_lost" >> ping_data_${tmp_id}.txt

echo "" >> ping_data_${tmp_id}.txt
echo "Timestamps when $host was unreachable" >> ping_data_${tmp_id}.txt
echo "------------------------------------" >> ping_data_${tmp_id}.txt
cat ping_file_${tmp_id}.txt | egrep "unknown host|Network is unreachable" >> ping_data_${tmp_id}.txt

exit 0
}

Usage()	{

echo ""
echo "Usage: ./ping_script.sh [host] &"
echo ""
echo "Example: ./ping_script.sh google.com &"
echo ""

}

if [ "$#" -eq 0 ]
then
	Usage
	exit 1
fi

tmp_id=`echo $$`
host=`echo $1`

trap generate_ping_data SIGINT SIGHUP SIGTERM

while true;do

	echo -n `date` >> ping_file_${tmp_id}.txt;printf " " >> ping_file_${tmp_id}.txt;ping -c 1 $host 2>&1 | egrep "bytes from|unknown host|Network is unreachable" >> ping_file_${tmp_id}.txt 2>&1
	sleep 1

done


