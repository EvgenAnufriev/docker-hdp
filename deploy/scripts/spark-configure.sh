#!/bin/bash

# Copy modified spark configuration file to $SPARK_HOME/conf
sudo cp /tmp/files/fairscheduler.xml /etc/spark/conf/

# Start Spark thriftserver
sudo /usr/lib/spark/sbin/start-thriftserver.sh --master yarn