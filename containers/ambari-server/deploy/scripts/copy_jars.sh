#!/bin/bash

# Copy Amp jars to /tmp folder on local file system
cp /tmp/files/jars/* /tmp/

# Create directories for jars on HDFS
sudo -u hdfs hdfs dfs -mkdir /apps
sudo -u hdfs hdfs dfs -chmod 777 /apps

hdfs dfs -mkdir /apps/Aginity
hdfs dfs -mkdir /apps/Custom
hdfs dfs -mkdir /apps/Aginity/.hiveJars
hdfs dfs -mkdir /apps/Custom/.hiveJars
sudo -u hdfs hdfs dfs -chmod 777 /apps/*
sudo -u hdfs hdfs dfs -chmod 777 /apps/Aginity/.hiveJars
sudo -u hdfs hdfs dfs -chmod 777 /apps/Custom/.hiveJars


# Copy jars to HDFS
hdfs dfs -put /tmp/files/jars/* /apps/Aginity/.hiveJars/
hdfs dfs -put /tmp/files/jars/* /apps/Custom/.hiveJars/
sudo -u hdfs hdfs dfs -chmod 777 /apps/Aginity/.hiveJars/*
sudo -u hdfs hdfs dfs -chmod 777 /apps/Custom/.hiveJars/*