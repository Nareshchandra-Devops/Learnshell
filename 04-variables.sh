!#/bin/bash

START_TIME=$(date +%s)
echo "Script started excution at: $START_TIME"

sleep 10

END_TIME+(date +%s)

TOTAL_TIME+$(($END_TIME-START_TIME))

echo "Total time taken: $TOTAL_TIME Seconds"
