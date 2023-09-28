#!/bin/bash 
# Get list of mail accounts and reindex each one 
#for i in `/opt/zimbra/bin/zmprov -l gaa` 
for i in `cat /tmp/contas.txt`
do 
echo -n "Reindexing $i" 
# Start reindexing 
/opt/zimbra/bin/zmprov rim $i start >/dev/null 
# Check if the rendix is still running for this account 
while [ `/opt/zimbra/bin/zmprov rim $i status|wc -l` != 1 ] 
do 
# Sleep for 5 seconds before checking status again 
echo -n . && sleep 5
done 
echo . 
done

