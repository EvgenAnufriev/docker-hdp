#!/bin/bash

echo [INFO] Preparing

file[0]="PRODUCT_DIM_RESERVE.csv"
file[1]="OUTLET_DIM.csv"
file[2]="LINE_ITEM_FACT_RESERVE.csv"
file[3]="EIT_TRN_PTY_XREF.csv"
file[4]="EIT_POS_TRN.csv"
file[5]="BACKUP_LAND_TRANSACTION_5.csv"
file[6]="BACKUP_LAND_TRANSACTION_4.csv"
file[7]="BACKUP_LAND_TRANSACTION.csv"
file[8]="BACKUP_LAND_TEST_SOURCE.csv"
file[9]="BACKUP_LAND_REGISTER_DIMENSION.csv"
file[10]="BACKUP_LAND_CAMPAIGN2.csv"
file[11]="COMPANY.csv"
file[12]="BACKUP_LAND_CUSTOMER.csv"
file[13]="BACKUP_LAND_CID.csv"
file[14]="BACKUP_LAND_LOCATION_DIMENSION_NULL.csv"
file[15]="BACKUP_LAND_LOCATION_DIMENSION.csv"
file[16]="BACKUP_LAND_CAMPAIGN.csv"
file[17]="BACKUP_LAND_CUSTOMER_2.csv"
file[18]="BACKUP_LAND_CUSTOMER_3.csv"
file[19]="BACKUP_LAND_CUSTOMER_4.csv"
file[20]="BACKUP_LAND_CUSTOMER_INF.csv"
file[21]="BACKUP_LAND_STATE_LOOKUP.csv"
file[22]="BACKUP_LAND_TRANSACTION_2.csv"
file[23]="BACKUP_LAND_TRANSACTION_3.csv"
file[24]="BACKUP_LAND_TRANSACTION_BACKUP.csv"
file[25]="LINE_ITEM_FACT.csv"
file[26]="PRODUCT_DIM.csv"

folder[0]=productdimreserve
folder[1]=outletdim
folder[2]=lineitemfactreserve
folder[3]=eittrnptyxref
folder[4]=eitpostrn
folder[5]=backuplandtransaction5
folder[6]=backuplandtransaction4
folder[7]=backuplandtransaction
folder[8]=backuplandtestsource
folder[9]=backuplandregisterdimension
folder[10]=backuplandcampaign2
folder[11]=company
folder[12]=backuplandcustomer
folder[13]=backuplandcid
folder[14]=backuplandlocationdimensionnull
folder[15]=backuplandlocationdimension
folder[16]=backuplandcampaign
folder[17]=backuplandcustomer2
folder[18]=backuplandcustomer3
folder[19]=backuplandcustomer4
folder[20]=backuplandcustomerinf
folder[21]=backuplandstatelookup
folder[22]=backuplandtransaction2
folder[23]=backuplandtransaction3
folder[24]=backuplandtransactionbackup
folder[25]=lineitemfact
folder[26]=productdim


sudo -u hdfs hdfs dfs -mkdir /sources
sudo -u hdfs hdfs dfs -chmod 777 /sources

for ((i=0; i<=${#folder[@]}; i++))
do
    echo [INFO] Copying ${file[$i]}
    sudo -u hdfs hdfs dfs -mkdir /sources/${folder[$i]}
    sudo -u hdfs hdfs dfs -chmod 777 /sources/${folder[$i]}
    hdfs dfs -put /tmp/files/sources/${file[$i]} /sources/${folder[$i]}/
    sudo -u hdfs hdfs dfs -chmod 777 /sources/${folder[$i]}/${file[$i]}
done


# Create tables from CSV

echo [INFO] Creating Hive tables from .csv files

mkdir /tmp/files/hive_out

beeline --silent=true -u "'jdbc:hive2://localhost:10000/'" -n hive -p "" -f /tmp/files/sql/import_tables.sql &> /tmp/files/hive_out/import_tables.log

echo [INFO] Creation complited
