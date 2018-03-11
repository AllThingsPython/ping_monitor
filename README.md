# ping_monitor

<h3>A bash script for monitoring IP connectivity with a host</h3>
<h4>ping_monitor is a tool for monitoring IP connectivity with a host. This tool monitors a single host and saves the ping statistics to a file. In case of any ping drops, the timestamps of the ping drops is also saved to the file. This script can be run in background even when you close your terminal. In case you want to stop the script, send a SIGTERM signal to the PID of the script and the stats will be saved to a file.</h4>

# usage

<h3> Copy the script to your local machine </h3>

```
user@host:~$ ls -ltra | grep "ping_monitor"
-rwxr-xr-x  1 user user     1234 Mar 12 03:37 ping_monitor.sh
user@host:~$ 

```
<h3> Run the script without arguments to verify usage </h3>

```
user@host:~$ ./ping_monitor.sh 

Usage: ./ping_script.sh [host] &

Example: ./ping_script.sh google.com &

user@host:~$ 

```

<h3> Run the script in background passing the hostname or IP address</h3>

```
user@host:~$ 
user@host:~$ ./ping_monitor.sh google.com &
[1] 19879
user@host:~$ 
user@host:~$ 

```

<h3> Kill the script by using its PID</h3>

```
user@host:~$ 
user@host:~$ kill 19879
[1]+  Done                    ./ping_monitor.sh google.com
user@host:~$ 
 
```

<h3>Check the ping data file for statistics</h3>

```
user@host:~$ 
user@host:~$ ls -ltra | grep "19879"
-rw-rw-r--  1 user user     3804 Mar 12 04:51 ping_file_19879.txt
-rw-rw-r--  1 user user      507 Mar 12 04:51 ping_data_19879.txt
user@host:~$ 

user@host:~$ more ping_data_19879.txt 
Total packets sent: 35
Total packets received: 29
Total packets lost: 6

Timestamps when google.com was unreachable
------------------------------------
Mon Mar 12 04:51:15 IST 2018 ping: unknown host google.com
Mon Mar 12 04:51:16 IST 2018 ping: unknown host google.com
Mon Mar 12 04:51:17 IST 2018 ping: unknown host google.com
Mon Mar 12 04:51:18 IST 2018 ping: unknown host google.com
Mon Mar 12 04:51:19 IST 2018 ping: unknown host google.com
Mon Mar 12 04:51:20 IST 2018 ping: unknown host google.com
user@host:~$ 

```

