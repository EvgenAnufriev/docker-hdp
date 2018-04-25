DROP DATABASE IF EXISTS cia_v4_adf_backup CASCADE;
CREATE DATABASE cia_v4_adf_backup;

USE cia_v4_adf_backup;

DROP TABLE IF EXISTS BACKUP_LAND_CAMPAIGN_EXTERNAL;
CREATE EXTERNAL TABLE BACKUP_LAND_CAMPAIGN_EXTERNAL (
	CAMPAIGN_KEY VARCHAR(255)
	, DIM_STATUS_CD VARCHAR(255)
	, CAMPAIGN_NM VARCHAR(255)
	, CAMPAIGN_DESC VARCHAR(255)
	, STRATEGY_NM VARCHAR(255)
	, FIXED_COST_AMT VARCHAR(255)
	, VARIABLE_COST_AMT VARCHAR(255)
	, START_DT VARCHAR(255)
	, END_DT VARCHAR(255)
	, PROGRAM_KEY VARCHAR(255)
	, CAMPAIGN_STATUS_CD VARCHAR(255)
	, INSERT_AUDIT_KEY VARCHAR(255)
	, UPDATE_AUDIT_KEY VARCHAR(255)
	, CAMPAIGN_LEVEL VARCHAR(255)
	, BATCH_LOG_ID VARCHAR(255)
	, BATCH_DATE VARCHAR(255)
	, CHANNEL_ID INT
	, CHANNEL_DESC VARCHAR(5)
	)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandcampaign'
;
DROP TABLE IF EXISTS BACKUP_LAND_CAMPAIGN;
CREATE TABLE BACKUP_LAND_CAMPAIGN AS
SELECT
	CAMPAIGN_KEY
	, DIM_STATUS_CD
	, CAMPAIGN_NM
	, CAMPAIGN_DESC
	, STRATEGY_NM
	, FIXED_COST_AMT 
	, VARIABLE_COST_AMT
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(START_DT, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS START_DT
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(END_DT, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS END_DT
	, PROGRAM_KEY
	, CAMPAIGN_STATUS_CD
	, INSERT_AUDIT_KEY
	, UPDATE_AUDIT_KEY
	, CAMPAIGN_LEVEL
	, BATCH_LOG_ID
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(BATCH_DATE, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS BATCH_DATE
	, CHANNEL_ID
	, CHANNEL_DESC
FROM
	BACKUP_LAND_CAMPAIGN_EXTERNAL
;
DROP TABLE IF EXISTS BACKUP_LAND_CAMPAIGN_EXTERNAL;


DROP TABLE IF EXISTS BACKUP_LAND_LOCATION_DIMENSION;
CREATE EXTERNAL TABLE BACKUP_LAND_LOCATION_DIMENSION 
(
	LOCATION_ID SMALLINT
	, COMPANY_ID SMALLINT
	, REGION_ID SMALLINT
	, DISTRICT_ID SMALLINT
	, LOAD_TIMESTAMP TIMESTAMP
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandlocationdimension'
;


DROP TABLE IF EXISTS BACKUP_LAND_LOCATION_DIMENSION_NULL;
CREATE EXTERNAL TABLE BACKUP_LAND_LOCATION_DIMENSION_NULL 
(
	LOCATION_ID SMALLINT
	, COMPANY_ID SMALLINT
	, REGION_ID SMALLINT
	, DISTRICT_ID SMALLINT
	, LOAD_TIMESTAMP TIMESTAMP
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandlocationdimensionnull'
;


DROP TABLE IF EXISTS BACKUP_LAND_CID;
CREATE EXTERNAL TABLE BACKUP_LAND_CID 
(
	PERSONA_ID VARCHAR(255)
	, INDIVIDUAL_ID VARCHAR(255)
	, HOUSEHOLD_ID VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandcid'
;


DROP TABLE IF EXISTS BACKUP_LAND_CUSTOMER;
CREATE EXTERNAL TABLE BACKUP_LAND_CUSTOMER 
(
	PERSONA_ID VARCHAR(255)
	, FIRST_NAME VARCHAR(255)
	, LAST_NAME VARCHAR(255)
	, GENDER_CD VARCHAR(255)
	, EMPLOYEE_FLAG VARCHAR(255)
	, ADDR_LINE_1 VARCHAR(255)
	, ADDR_LINE_2 VARCHAR(255)
	, CITY VARCHAR(255)
	, STATE_CD VARCHAR(255)
	, ZIP_CODE VARCHAR(255)
	, ZIP4 VARCHAR(255)
	, PHONE_NUMBER VARCHAR(255)
	, EMAIL_ADDRESS VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandcustomer'
;


DROP TABLE IF EXISTS COMPANY;
CREATE EXTERNAL TABLE COMPANY 
(
	UNIT_ID VARCHAR(255)
	, UNIT_NUM VARCHAR(255)
	, UNIT_NAME VARCHAR(255)
	, UNIT_LONG_NAME VARCHAR(255)
	, STREET_1_ADDR VARCHAR(255)
	, STREET_2_ADDR VARCHAR(255)
	, CITY_NAME VARCHAR(255)
	, STATE_CD VARCHAR(255)
	, COUNTY_NAME VARCHAR(255)
	, ZIP_CD VARCHAR(255)
	, PURCHASE_DT VARCHAR(255)
	, ACQUIRE_DT VARCHAR(255)
	, OPEN_DT VARCHAR(255)
	, CLOSE_DT VARCHAR(255)
	, SQ_FTG_QTY VARCHAR(255)
	, LAT_COORD VARCHAR(255)
	, LONG_COORD VARCHAR(255)
	, UNIT_TYPE_NAME VARCHAR(255)
	, UNIT_TYPE_CLASS_ID VARCHAR(255)
	, UNIT_TYPE_CLASS_NAME VARCHAR(255)
	, DIVISION_ID VARCHAR(255)
	, DIVISION_NUM VARCHAR(255)
	, DIVISION_NAME VARCHAR(255)
	, DIVISION_RESP_SEQ_NUM VARCHAR(255)
	, DIVISION_GEOG_SEQ_NUM VARCHAR(255)
	, DISTRICT_ID VARCHAR(255)
	, DISTRICT_NAME VARCHAR(255)
	, DISTRICT_RESP_SEQ_NUM VARCHAR(255)
	, AREA_ID VARCHAR(255)
	, AREA_NAME VARCHAR(255)
	, AREA_RESP_SEQ_NUM VARCHAR(255)
	, AREA_GEOG_SEQ_NUM VARCHAR(255)
	, EXEC_VP_ID VARCHAR(255)
	, EXEC_VP_NAME VARCHAR(255)
	, EXEC_VP_RESP_SEQ_NUM VARCHAR(255)
	, EXEC_VP_GEOG_SEQ_NUM VARCHAR(255)
	, GEOGRAPHIC_NAME VARCHAR(255)
	, GEOG_AREA_GEOG_SEQ_NUM VARCHAR(255)
	, AWONS_ID VARCHAR(255)
	, POS_UNIT_TYPE_CD VARCHAR(255)
	, HOURS_FROM_HOST VARCHAR(255)
	, PARENT_UNIT_ID VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/company'
;


DROP TABLE IF EXISTS BACKUP_LAND_CAMPAIGN2_EXTERNAL;
CREATE EXTERNAL TABLE BACKUP_LAND_CAMPAIGN2_EXTERNAL
(
	CAMPAIGN_KEY VARCHAR(255)
	, DIM_STATUS_CD VARCHAR(255)
	, CAMPAIGN_NM VARCHAR(255)
	, CAMPAIGN_DESC VARCHAR(255)
	, STRATEGY_NM VARCHAR(255)
	, FIXED_COST_AMT VARCHAR(255)
	, VARIABLE_COST_AMT VARCHAR(255)
	, START_DT VARCHAR(255)
	, END_DT VARCHAR(255)
	, PROGRAM_KEY VARCHAR(255)
	, CAMPAIGN_STATUS_CD VARCHAR(255)
	, INSERT_AUDIT_KEY VARCHAR(255)
	, UPDATE_AUDIT_KEY VARCHAR(255)
	, CAMPAIGN_LEVEL VARCHAR(255)
	, BATCH_LOG_ID VARCHAR(255)
	, BATCH_DATE VARCHAR(255)
	, CHANNEL_ID INT
	, CHANNEL_DESC VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandcampaign2'
;
DROP TABLE IF EXISTS BACKUP_LAND_CAMPAIGN2;
CREATE TABLE BACKUP_LAND_CAMPAIGN2 AS
SELECT
	CAMPAIGN_KEY
	, DIM_STATUS_CD
	, CAMPAIGN_NM
	, CAMPAIGN_DESC
	, STRATEGY_NM
	, FIXED_COST_AMT 
	, VARIABLE_COST_AMT
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(START_DT, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS START_DT
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(END_DT, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS END_DT
	, PROGRAM_KEY
	, CAMPAIGN_STATUS_CD
	, INSERT_AUDIT_KEY
	, UPDATE_AUDIT_KEY
	, CAMPAIGN_LEVEL
	, BATCH_LOG_ID
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(BATCH_DATE, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS BATCH_DATE
	, CHANNEL_ID
	, CHANNEL_DESC
FROM
	BACKUP_LAND_CAMPAIGN2_EXTERNAL
;
DROP TABLE IF EXISTS BACKUP_LAND_CAMPAIGN2_EXTERNAL;


DROP TABLE IF EXISTS BACKUP_LAND_REGISTER_DIMENSION;
CREATE EXTERNAL TABLE BACKUP_LAND_REGISTER_DIMENSION 
(
	REGISTER_ID INT
	, REGISTER_NUMBER DECIMAL(13)
	, LOCATION_ID SMALLINT
	, BEGIN_DATE_ID SMALLINT
	, LOAD_TIMESTAMP TIMESTAMP
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandregisterdimension'
;


DROP TABLE IF EXISTS BACKUP_LAND_TEST_SOURCE_EXTERNAL;
CREATE EXTERNAL TABLE BACKUP_LAND_TEST_SOURCE_EXTERNAL (
	CHILD_ID INT
	, ATTR1 VARCHAR(64)
	, ATTR2 VARCHAR(255)
	, ATTR3 VARCHAR(255)
	, PARENT_ID INT
	, START_DT VARCHAR(255)
	)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandtestsource'
;
DROP TABLE IF EXISTS BACKUP_LAND_TEST_SOURCE;
CREATE TABLE BACKUP_LAND_TEST_SOURCE AS
SELECT
	CHILD_ID
	, ATTR1
	, ATTR2
	, ATTR3
	, PARENT_ID
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(START_DT, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS START_DT
FROM
	BACKUP_LAND_TEST_SOURCE_EXTERNAL
;
DROP TABLE IF EXISTS BACKUP_LAND_TEST_SOURCE_EXTERNAL;


DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION;
CREATE EXTERNAL TABLE BACKUP_LAND_TRANSACTION 
(
	CUSTOMER_ID VARCHAR(255)
	, ADJ_NON_WGT_SALES_QTY VARCHAR(255)
	, BASE_COST_AMT VARCHAR(255)
	, BASE_COST_GEN_CD VARCHAR(255)
	, BASE_COST_SRC_CD VARCHAR(255)
	, BATCH_LOAD_BATCH_ID VARCHAR(255)
	, BATCH_LOAD_CD VARCHAR(255)
	, BATCH_LOAD_SOURCE_CD VARCHAR(255)
	, BATCH_LOAD_TLOG_SEQ_NUM VARCHAR(255)
	, BSKT_DISC_AMT VARCHAR(255)
	, BSKT_DISC_CNT VARCHAR(255)
	, CASHIER_ID VARCHAR(255)
	, CORP_DEPT_NUM VARCHAR(255)
	, COST_AMT VARCHAR(255)
	, CPN_FAMILY_NUM_CURR VARCHAR(255)
	, CPN_FAMILY_NUM_PREV VARCHAR(255)
	, CUST_PURCHASE_ORDER_NUM VARCHAR(255)
	, DPST_RTRN_AMT VARCHAR(255)
	, EME_STATUS_CD VARCHAR(255)
	, ESTIMATED_COST_AMT VARCHAR(255)
	, ESTIMATED_COST_GEN_CD VARCHAR(255)
	, ESTIMATED_COST_SRC_CD VARCHAR(255)
	, EXTENDED_COST_AMT VARCHAR(255)
	, EXTENDED_COST_CD VARCHAR(255)
	, FLEXIBLE_SPENDING_ACCOUNT_CD VARCHAR(255)
	, FOOD_STAMP_FLG VARCHAR(255)
	, HAND_KEY_AMT VARCHAR(255)
	, HAND_KEY_QTY VARCHAR(255)
	, ITEM_TYPE_CD VARCHAR(255)
	, MFG_CPN_AMT VARCHAR(255)
	, MFG_CPN_CNT VARCHAR(255)
	, MFG_CPN_UPC_CD VARCHAR(255)
	, MGR_OVRD_CNT VARCHAR(255)
	, MLTP_PRCG_GROUP_NUM VARCHAR(255)
	, NET_SALES_AMT VARCHAR(255)
	, NET_TAX_PLANA_SALES_AMT VARCHAR(255)
	, NET_TAX_PLANB_SALES_AMT VARCHAR(255)
	, NET_TAX_PLANC_SALES_AMT VARCHAR(255)
	, NET_TAX_PLAND_SALES_AMT VARCHAR(255)
	, NET_VOID_AMT VARCHAR(255)
	, NON_MFG_CPN_AMT VARCHAR(255)
	, NON_MFG_CPN_CNT VARCHAR(255)
	, NON_PC_UPC_DISC_AMT VARCHAR(255)
	, NON_PC_UPC_DISC_CNT VARCHAR(255)
	, NON_WGT_SALES_QTY VARCHAR(255)
	, PC_DISC_ID VARCHAR(255)
	, PC_ID_ALTERNATE_FLAG VARCHAR(255)
	, PC_UPC_DISC_AMT VARCHAR(255)
	, PC_UPC_DISC_CNT VARCHAR(255)
	, PC_USAGE_CD VARCHAR(255)
	, POS_TRMNL_ID VARCHAR(255)
	, POS_TRMNL_TYPE_CD VARCHAR(255)
	, RETAIL_PRICE_AMT VARCHAR(255)
	, RETAIL_PRICE_QTY VARCHAR(255)
	, RTRN_AMT VARCHAR(255)
	, RTRN_CNT VARCHAR(255)
	, SALES_WGT VARCHAR(255)
	, SCAN_DEPT_NUM VARCHAR(255)
	, SCAN_PC_ID VARCHAR(255)
	, SCAN_TYPE_CD VARCHAR(255)
	, SCAN_UPC_CD VARCHAR(255)
	, STR_CLOSE_BATCH_ID VARCHAR(255)
	, TAX_AMT VARCHAR(255)
	, TAX_PLANA_AMT VARCHAR(255)
	, TAX_PLANA_FLG VARCHAR(255)
	, TAX_PLANB_AMT VARCHAR(255)
	, TAX_PLANB_FLG VARCHAR(255)
	, TAX_PLANC_AMT VARCHAR(255)
	, TAX_PLANC_FLG VARCHAR(255)
	, TAX_PLAND_AMT VARCHAR(255)
	, TAX_PLAND_FLG VARCHAR(255)
	, TLOG_EXT_INDICAT1_CD VARCHAR(255)
	, TLOG_INDICAT1_CD VARCHAR(255)
	, TLOG_INDICAT2_CD VARCHAR(255)
	, TLOG_TRANS_TYPE_CD VARCHAR(255)
	, TNDR_AMT VARCHAR(255)
	, TNDR_CHNG_AMT VARCHAR(255)
	, TRANS_END_DT VARCHAR(255)
	, TRANS_END_TIME VARCHAR(255)
	, TRANS_ID VARCHAR(255)
	, TRANS_INACTIVE_TIME VARCHAR(255)
	, TRANS_NUM VARCHAR(255)
	, TRANS_RING_TIME VARCHAR(255)
	, TRANS_SEQ_NUM VARCHAR(255)
	, TRANS_SPECIAL_TIME VARCHAR(255)
	, TRANS_TENDER_TIME VARCHAR(255)
	, TRANS_TYPE_CD VARCHAR(255)
	, UNIT_ID VARCHAR(255)
	, UPC_CD VARCHAR(255)
	, UPC_CUM_DEAL_CNT VARCHAR(255)
	, UPC_PRCG_MTHD_CD VARCHAR(255)
	, UPC_PROMO_CD VARCHAR(255)
	, UPC_SALE_PRC_AMT VARCHAR(255)
	, UPC_SALE_PRC_QTY VARCHAR(255)
	, UPC_SRC_CD VARCHAR(255)
	, VOID_CNT VARCHAR(255)
	, WGT_SALES_QTY VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandtransaction'
;


DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_4_EXTERNAL;
CREATE EXTERNAL TABLE BACKUP_LAND_TRANSACTION_4_EXTERNAL 
(
	TRANS_ID VARCHAR(255)
	, TRANS_SEQ_NUM VARCHAR(255)
	, CUSTOMER_ID_1 VARCHAR(255)
	, CUSTOMER_ID_2 VARCHAR(255)
	, CUSTOMER_ID_3 VARCHAR(255)
	, CUSTOMER_ID_4 VARCHAR(255)
	, CUSTOMER_ID_5 VARCHAR(255)
	, CUSTOMER_ID_6 VARCHAR(255)
	, CUSTOMER_ID_7 VARCHAR(255)
	, BATCH_LOAD_BATCH_ID VARCHAR(255)
	, TRANS_END_DT VARCHAR(255)
	, BASE_COST_AMT DECIMAL(18,5)
	, ESTIMATED_COST_AMT DECIMAL(18,5)
	, NET_SALES_AMT DECIMAL(18,5)
	, PC_UPC_DISC_AMT DECIMAL(18,5)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandtransaction4'
;
DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_4;
CREATE TABLE BACKUP_LAND_TRANSACTION_4 AS SELECT 
	TRANS_ID
	, TRANS_SEQ_NUM
	, CUSTOMER_ID_1
	, CUSTOMER_ID_2
	, CUSTOMER_ID_3
	, CUSTOMER_ID_4
	, CUSTOMER_ID_5
	, CUSTOMER_ID_6
	, CUSTOMER_ID_7
	, BATCH_LOAD_BATCH_ID
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(TRANS_END_DT, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS TRANS_END_DT
	, BASE_COST_AMT
	, ESTIMATED_COST_AMT
	, NET_SALES_AMT
	, PC_UPC_DISC_AMT
FROM
	BACKUP_LAND_TRANSACTION_4_EXTERNAL
;
DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_4_EXTERNAL;


DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_5_EXTERNAL;
CREATE EXTERNAL TABLE BACKUP_LAND_TRANSACTION_5_EXTERNAL
(
	TRANS_ID VARCHAR(255)
	, TRANS_SEQ_NUM VARCHAR(255)
	, CUSTOMER_ID_1 VARCHAR(255)
	, CUSTOMER_ID_2 VARCHAR(255)
	, CUSTOMER_ID_3 VARCHAR(255)
	, CUSTOMER_ID_4 VARCHAR(255)
	, CUSTOMER_ID_5 VARCHAR(255)
	, CUSTOMER_ID_6 VARCHAR(255)
	, CUSTOMER_ID_7 VARCHAR(255)
	, BATCH_LOAD_BATCH_ID VARCHAR(255)
	, TRANS_END_DT VARCHAR(255)
	, BASE_COST_AMT DECIMAL(18,5)
	, ESTIMATED_COST_AMT DECIMAL(18,5)
	, NET_SALES_AMT DECIMAL(18,5)
	, PC_UPC_DISC_AMT DECIMAL(18,5)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandtransaction5'
;
DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_5;
CREATE TABLE BACKUP_LAND_TRANSACTION_5 AS 
SELECT
	TRANS_ID
	, TRANS_SEQ_NUM
	, CUSTOMER_ID_1
	, CUSTOMER_ID_2
	, CUSTOMER_ID_3
	, CUSTOMER_ID_4
	, CUSTOMER_ID_5
	, CUSTOMER_ID_6
	, CUSTOMER_ID_7
	, BATCH_LOAD_BATCH_ID
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(TRANS_END_DT, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS TRANS_END_DT
	, BASE_COST_AMT
	, ESTIMATED_COST_AMT
	, NET_SALES_AMT
	, PC_UPC_DISC_AMT
FROM
	BACKUP_LAND_TRANSACTION_5_EXTERNAL
;
DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_5_EXTERNAL;


DROP TABLE IF EXISTS EIT_POS_TRN;
CREATE EXTERNAL TABLE EIT_POS_TRN
(
	EI_STR_ID VARCHAR(255)
	, TRN_SLS_DTE VARCHAR(255)
	, TRN_STRT_TM VARCHAR(255)
	, POS_RGST_ID VARCHAR(255)
	, TRN_NBR VARCHAR(255)
	, SLS_CORR_SEQ_NBR VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/eitpostrn'
;


DROP TABLE IF EXISTS EIT_POS_TRN;
CREATE EXTERNAL TABLE EIT_TRN_PTY_XREF
(
	EI_STR_ID VARCHAR(255)
	, TRN_SLS_DTE VARCHAR(255)
	, TRN_STRT_TM VARCHAR(255)
	, POS_RGST_ID VARCHAR(255)
	, TRN_NBR VARCHAR(255)
	, SLS_CORR_SEQ_NBR VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/eittrnptyxref'
;


DROP TABLE IF EXISTS LINE_ITEM_FACT_RESERVE;
CREATE EXTERNAL TABLE LINE_ITEM_FACT_RESERVE
(
	BRAND_KEY DECIMAL(6)
	, TRANSACTION_DATE_KEY DECIMAL(4)
	, VISITOR_KEY DECIMAL(15)
	, TRANSACTION_KEY DECIMAL(15)
	, SEQ_NO DECIMAL(10)
	, SOURCE_SYSTEM_CD DECIMAL(5)
	, OP_EYE_CODE CHAR(1)
	, LUX_LINE_ITEM_NO DECIMAL(10)
	, OUTLET_KEY DECIMAL(10)
	, TRAN_TYPE_SOURCE_DATA_CD VARCHAR(5)
	, COUNTRY_CD VARCHAR(3)
	, PRODUCT_KEY DECIMAL(10)
	, LENS_TYPE_CD VARCHAR(5)
	, GROSS_UNIT_AMT DECIMAL(13,2)
	, QTY_SOLD_CNT DECIMAL(13)
	, OP_ALLOWANCE_AMT DECIMAL(13,2)
	, OP_THIRD_PARTY_AMT DECIMAL(10,2)
	, OP_DISCOUNTED_IND CHAR(1)
	, OP_CL_EXPIRATION_DT DATE
	, OP_TINT_INTENSITY VARCHAR(3)
	, OP_DEPT_ID DECIMAL(3)
	, OP_ITEM_CONTROL_NBR DECIMAL(10)
	, OP_INNOVATION_PROD_IND CHAR(1)
	, OP_PACKAGE_IND CHAR(1)
	, RETURN_REASON_CD VARCHAR(3)
	, OP_REMAKE_CATEGORY_CD VARCHAR(4)
	, OP_REMAKE_DETAIL_CD VARCHAR(4)
	, OP_REMAKE_REASON_CD VARCHAR(2)
	, OP_CO_PAYMENT_AMT DECIMAL(10,2)
	, LINE_ITEM_DISCOUNT_AMT DECIMAL(10,2)
	, LINE_ITEM_DISCOUNT_CD VARCHAR(10)
	, LINE_ITEM_DISC_IND CHAR(1)
	, PRODUCT_BRAND_CD VARCHAR(50)
	, NOP_GROSS_EXT_AMT DECIMAL(13,2)
	, NOP_NET_UNIT_AMT DECIMAL(13,2)
	, NOP_NET_EXT_AMT DECIMAL(13,2)
	, NOP_PROCESS_DT DATE
	, NOP_LUX_PRODUCT_IND CHAR(1)
	, NOP_LAYAWAY_SPECIAL_ORDER_NO DECIMAL(16)
	, NOP_GIFT_CERTIFICATE_ID VARCHAR(20)
	, OP_THICKNESS_CD VARCHAR(1)
	, LUX_CUSTOMER_ID DECIMAL(10)
	, LUX_TRANSACTION_NO DECIMAL(20)
	, ITEM_TYPE_CD VARCHAR(10)
	, INSERT_AUDIT_KEY DECIMAL(10)
	, UPDATE_AUDIT_KEY DECIMAL(10)
	, BATCH_LOG_ID DECIMAL(10)
	, BATCH_DATE DATE
	, MCH VARCHAR(10)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/lineitemfactreserve'
;


DROP TABLE IF EXISTS OUTLET_DIM;
CREATE EXTERNAL TABLE OUTLET_DIM
(
	OUTLET_KEY DECIMAL(10)
	, OUTLET_SUBGROUP_KEY DECIMAL(5)
	, OUTLET_GROUP_KEY DECIMAL(2)
	, SOURCE_SYSTEM_CD DECIMAL(5)
	, OUTLET_NM VARCHAR(50)
	, STORE_TYPE_CD VARCHAR(5)
	, BRAND_KEY DECIMAL(5)
	, OUTLET_XID DECIMAL(10)
	, OPEN_DT DATE
	, CLOSE_DT DATE
	, DMA_CD DECIMAL(3)
	, REGION_NBR DECIMAL(4)
	, REGION_NM VARCHAR(40)
	, DIVISION_CD VARCHAR(4)
	, OP_STORE_TYPE_CD VARCHAR(2)
	, OP_MALL_TYPE_CD VARCHAR(5)
	, OP_ENTITY_CD VARCHAR(25)
	, OP_GM_NM VARCHAR(35)
	, OP_LOCATION_RATING_CD VARCHAR(2)
	, OP_MALL_RATING_CD VARCHAR(2)
	, OP_LANGUAGE_CD VARCHAR(1)
	, OP_DOCTOR_NM VARCHAR(40)
	, OP_DOCTOR_COMPANY VARCHAR(40)
	, OP_DOCTOR_ADDRESS_1 VARCHAR(40)
	, OP_DOCTOR_ADDRESS_2 VARCHAR(40)
	, OP_DOCTOR_CITY VARCHAR(25)
	, OP_DOCTOR_STATE_CD VARCHAR(2)
	, OP_DOCTOR_ZIP_CD VARCHAR(10)
	, OP_DOCTOR_PHONE_NO VARCHAR(20)
	, NOP_DIVISION_CD DECIMAL(4)
	, NOP_DISTRICT_NBR DECIMAL(4)
	, NOP_DISTRICT_NM VARCHAR(40)
	, NOP_ORIG_STORE_NBR DECIMAL(5)
	, NOP_STORE_TYPE1_CD VARCHAR(1)
	, NOP_STORE_TYPE2_CD VARCHAR(15)
	, NOP_STORE_TYPE3_CD VARCHAR(5)
	, NOP_STORE_TYPE4_CD VARCHAR(15)
	, NOP_STORE_LOC_TYPE_CD VARCHAR(1)
	, NOP_ACQUISITION_FLAG_CD VARCHAR(1)
	, NOP_DESIGN_TYPE_CD VARCHAR(1)
	, NOP_PROFORMA_LEVEL_CD VARCHAR(2)
	, NOP_CURRENCY_LEVEL_CD VARCHAR(3)
	, NOP_MALL_RANK_CD DECIMAL(3)
	, NOP_LOCATION_RANK_CD DECIMAL(3)
	, NOP_VISIBILITY_RATNG_CD DECIMAL(1)
	, NOP_TRAFFIC_RANK_CD VARCHAR(1)
	, NOP_STR_LOC_RANK_CD DECIMAL(1)
	, NOP_TOURIST_RATING_CD DECIMAL(1)
	, NOP_COMPETE_RATING_CD DECIMAL(1)
	, NOP_PR_COMP_RATING_CD DECIMAL(1)
	, NOP_PROX_FOOD_CT_CD DECIMAL(1)
	, NOP_OPT_TRK_FLD_1 VARCHAR(5)
	, NOP_OPT_TRK_FLD_2 VARCHAR(5)
	, NOP_DEPT_STORE_TYPE_CD VARCHAR(5)
	, NOP_USER_DEF_FLD_1 VARCHAR(6)
	, NOP_RX_STORES VARCHAR(6)
	, NOP_RX_START_DT VARCHAR(6)
	, NOP_CMB_STORE_SDT VARCHAR(6)
	, NOP_SUN_TIER_CD VARCHAR(6)
	, NOP_WATCH_TIER_CD VARCHAR(6)
	, INSERT_AUDIT_KEY DECIMAL(10)
	, UPDATE_AUDIT_KEY DECIMAL(10)
	, BATCH_LOG_ID DECIMAL(10)
	, BATCH_DATE DATE
	, OP_LAB_TYPE_CD VARCHAR(3)
	, OP_DOC_MODEL_TYPE_CD VARCHAR(3)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/outletdim'
;


DROP TABLE IF EXISTS PRODUCT_DIM_RESERVE;
CREATE EXTERNAL TABLE PRODUCT_DIM_RESERVE
(
	PRODUCT_KEY DECIMAL(10)
	, PRODUCT_XID VARCHAR(27)
	, SOURCE_SYSTEM_CD DECIMAL(5)
	, LUX_SKU_ID VARCHAR(14)
	, SKU_TYPE_CD VARCHAR(2)
	, PRODUCT_CLASSIFICATION_KEY DECIMAL(10)
	, ORPHAN_ITEM_IND VARCHAR(1)
	, VENDOR DECIMAL(10)
	, STYLE VARCHAR(40)
	, OP_COLOR_CD DECIMAL(4)
	, OP_SIZE VARCHAR(5)
	, OP_DIMENSION VARCHAR(5)
	, OP_COORDINATE_GROUP_CD VARCHAR(5)
	, OP_ATTRIBUTE_A VARCHAR(20)
	, OP_ATTRIBUTE_B VARCHAR(20)
	, OP_COUNTRY_FLAG VARCHAR(1)
	, NOP_SHORT_DESC VARCHAR(10)
	, NOP_LONG_DESC VARCHAR(40)
	, NOP_MERCHANDISE_GROUP VARCHAR(5)
	, NOP_REPLACEMENT_SKU DECIMAL(9)
	, NOP_TARGET_CATEGORY VARCHAR(1)
	, NOP_ATTRIBUTE_1 VARCHAR(1)
	, NOP_ATTRIBUTE_2 VARCHAR(2)
	, NOP_ATTRIBUTE_3 VARCHAR(2)
	, NOP_ATTRIBUTE_4 VARCHAR(2)
	, NOP_ATTRIBUTE_5 VARCHAR(2)
	, INSERT_AUDIT_KEY DECIMAL(10)
	, UPDATE_AUDIT_KEY DECIMAL(10)
	, BATCH_LOG_ID DECIMAL(10)
	, BATCH_DATE DATE
	, AR_TREATMENT VARCHAR(30)
	, BUILD VARCHAR(30)
	, GENDER VARCHAR(30)
	, STYLE_FAMILY VARCHAR(30)
	, RX_RESTRICTION VARCHAR(30)
	, TREATMENT_LENS VARCHAR(30)
	, LENS_TYPE VARCHAR(30)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/productdimreserve'
;


DROP TABLE IF EXISTS PRODUCT_DIM;
CREATE EXTERNAL TABLE PRODUCT_DIM
(
	PRODUCT_KEY DECIMAL(10)
    , PRODUCT_XID VARCHAR(27)
    , SOURCE_SYSTEM_CD DECIMAL(5)
    , LUX_SKU_ID VARCHAR(14)
    , SKU_TYPE_CD VARCHAR(2)
    , PRODUCT_CLASSIFICATION_KEY DECIMAL(10)
    , ORPHAN_ITEM_IND VARCHAR(1)
    , VENDOR DECIMAL(10)
    , STYLE VARCHAR(40)
    , OP_COLOR_CD DECIMAL(4)
    , OP_SIZE VARCHAR(5)
    , OP_DIMENSION VARCHAR(5)
    , OP_COORDINATE_GROUP_CD VARCHAR(5)
    , OP_ATTRIBUTE_A VARCHAR(20)
    , OP_ATTRIBUTE_B VARCHAR(20)
    , OP_COUNTRY_FLAG VARCHAR(1)
    , NOP_SHORT_DESC VARCHAR(10)
    , NOP_LONG_DESC VARCHAR(40)
    , NOP_MERCHANDISE_GROUP VARCHAR(5)
    , NOP_REPLACEMENT_SKU DECIMAL(9)
    , NOP_TARGET_CATEGORY VARCHAR(1)
    , NOP_ATTRIBUTE_1 VARCHAR(1)
    , NOP_ATTRIBUTE_2 VARCHAR(2)
    , NOP_ATTRIBUTE_3 VARCHAR(2)
    , NOP_ATTRIBUTE_4 VARCHAR(2)
    , NOP_ATTRIBUTE_5 VARCHAR(2)
    , INSERT_AUDIT_KEY DECIMAL(10)
    , UPDATE_AUDIT_KEY DECIMAL(10)
    , BATCH_LOG_ID DECIMAL(10)
    , BATCH_DATE DATE
    , AR_TREATMENT VARCHAR(30)
    , BUILD VARCHAR(30)
    , GENDER VARCHAR(30)
    , STYLE_FAMILY VARCHAR(30)
    , RX_RESTRICTION VARCHAR(30)
    , TREATMENT_LENS VARCHAR(30)
    , LENS_TYPE VARCHAR(30)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/productdim'
;


DROP TABLE IF EXISTS LINE_ITEM_FACT;
CREATE EXTERNAL TABLE LINE_ITEM_FACT
(
	BRAND_KEY DECIMAL(6)
    , TRANSACTION_DATE_KEY DECIMAL(4)
    , VISITOR_KEY DECIMAL(15)
    , TRANSACTION_KEY DECIMAL(15)
    , SEQ_NO DECIMAL(10)
    , SOURCE_SYSTEM_CD DECIMAL(5)
    , OP_EYE_CODE CHAR(1)
    , LUX_LINE_ITEM_NO DECIMAL(10)
    , OUTLET_KEY DECIMAL(10)
    , TRAN_TYPE_SOURCE_DATA_CD VARCHAR(5)
    , COUNTRY_CD VARCHAR(3)
    , PRODUCT_KEY DECIMAL(10)
    , LENS_TYPE_CD VARCHAR(5)
    , GROSS_UNIT_AMT DECIMAL(13,2)
    , QTY_SOLD_CNT DECIMAL(13)
    , OP_ALLOWANCE_AMT DECIMAL(13,2)
    , OP_THIRD_PARTY_AMT DECIMAL(10,2)
    , OP_DISCOUNTED_IND CHAR(1)
    , OP_CL_EXPIRATION_DT DATE
    , OP_TINT_INTENSITY VARCHAR(3)
    , OP_DEPT_ID DECIMAL(3)
    , OP_ITEM_CONTROL_NBR DECIMAL(10)
    , OP_INNOVATION_PROD_IND CHAR(1)
    , OP_PACKAGE_IND CHAR(1)
    , RETURN_REASON_CD VARCHAR(3)
    , OP_REMAKE_CATEGORY_CD VARCHAR(4)
    , OP_REMAKE_DETAIL_CD VARCHAR(4)
    , OP_REMAKE_REASON_CD VARCHAR(2)
    , OP_CO_PAYMENT_AMT DECIMAL(10,2)
    , LINE_ITEM_DISCOUNT_AMT DECIMAL(10,2)
    , LINE_ITEM_DISCOUNT_CD VARCHAR(10)
    , LINE_ITEM_DISC_IND CHAR(1)
    , PRODUCT_BRAND_CD VARCHAR(50)
    , NOP_GROSS_EXT_AMT DECIMAL(13,2)
    , NOP_NET_UNIT_AMT DECIMAL(13,2)
    , NOP_NET_EXT_AMT DECIMAL(13,2)
    , NOP_PROCESS_DT DATE
    , NOP_LUX_PRODUCT_IND CHAR(1)
    , NOP_LAYAWAY_SPECIAL_ORDER_NO DECIMAL(16)
    , NOP_GIFT_CERTIFICATE_ID VARCHAR(20)
    , OP_THICKNESS_CD VARCHAR(1)
    , LUX_CUSTOMER_ID DECIMAL(10)
    , LUX_TRANSACTION_NO DECIMAL(20)
    , ITEM_TYPE_CD VARCHAR(10)
    , INSERT_AUDIT_KEY DECIMAL(10)
    , UPDATE_AUDIT_KEY DECIMAL(10)
    , BATCH_LOG_ID DECIMAL(10)
    , BATCH_DATE DATE
    , MCH VARCHAR(10)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/lineitemfact'
;


DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_BACKUP;
CREATE EXTERNAL TABLE BACKUP_LAND_TRANSACTION_BACKUP
(
CUSTOMER_ID VARCHAR(255)
    , ADJ_NON_WGT_SALES_QTY VARCHAR(255)
    , BASE_COST_AMT VARCHAR(255)
    , BASE_COST_GEN_CD VARCHAR(255)
    , BASE_COST_SRC_CD VARCHAR(255)
    , BATCH_LOAD_BATCH_ID VARCHAR(255)
    , BATCH_LOAD_CD VARCHAR(255)
    , BATCH_LOAD_SOURCE_CD VARCHAR(255)
    , BATCH_LOAD_TLOG_SEQ_NUM VARCHAR(255)
    , BSKT_DISC_AMT VARCHAR(255)
    , BSKT_DISC_CNT VARCHAR(255)
    , CASHIER_ID VARCHAR(255)
    , CORP_DEPT_NUM VARCHAR(255)
    , COST_AMT VARCHAR(255)
    , CPN_FAMILY_NUM_CURR VARCHAR(255)
    , CPN_FAMILY_NUM_PREV VARCHAR(255)
    , CUST_PURCHASE_ORDER_NUM VARCHAR(255)
    , DPST_RTRN_AMT VARCHAR(255)
    , EME_STATUS_CD VARCHAR(255)
    , ESTIMATED_COST_AMT VARCHAR(255)
    , ESTIMATED_COST_GEN_CD VARCHAR(255)
    , ESTIMATED_COST_SRC_CD VARCHAR(255)
    , EXTENDED_COST_AMT VARCHAR(255)
    , EXTENDED_COST_CD VARCHAR(255)
    , FLEXIBLE_SPENDING_ACCOUNT_CD VARCHAR(255)
    , FOOD_STAMP_FLG VARCHAR(255)
    , HAND_KEY_AMT VARCHAR(255)
    , HAND_KEY_QTY VARCHAR(255)
    , ITEM_TYPE_CD VARCHAR(255)
    , MFG_CPN_AMT VARCHAR(255)
    , MFG_CPN_CNT VARCHAR(255)
    , MFG_CPN_UPC_CD VARCHAR(255)
    , MGR_OVRD_CNT VARCHAR(255)
    , MLTP_PRCG_GROUP_NUM VARCHAR(255)
    , NET_SALES_AMT VARCHAR(255)
    , NET_TAX_PLANA_SALES_AMT VARCHAR(255)
    , NET_TAX_PLANB_SALES_AMT VARCHAR(255)
    , NET_TAX_PLANC_SALES_AMT VARCHAR(255)
    , NET_TAX_PLAND_SALES_AMT VARCHAR(255)
    , NET_VOID_AMT VARCHAR(255)
    , NON_MFG_CPN_AMT VARCHAR(255)
    , NON_MFG_CPN_CNT VARCHAR(255)
    , NON_PC_UPC_DISC_AMT VARCHAR(255)
    , NON_PC_UPC_DISC_CNT VARCHAR(255)
    , NON_WGT_SALES_QTY VARCHAR(255)
    , PC_DISC_ID VARCHAR(255)
    , PC_ID_ALTERNATE_FLAG VARCHAR(255)
    , PC_UPC_DISC_AMT VARCHAR(255)
    , PC_UPC_DISC_CNT VARCHAR(255)
    , PC_USAGE_CD VARCHAR(255)
    , POS_TRMNL_ID VARCHAR(255)
    , POS_TRMNL_TYPE_CD VARCHAR(255)
    , RETAIL_PRICE_AMT VARCHAR(255)
    , RETAIL_PRICE_QTY VARCHAR(255)
    , RTRN_AMT VARCHAR(255)
    , RTRN_CNT VARCHAR(255)
    , SALES_WGT VARCHAR(255)
    , SCAN_DEPT_NUM VARCHAR(255)
    , SCAN_PC_ID VARCHAR(255)
    , SCAN_TYPE_CD VARCHAR(255)
    , SCAN_UPC_CD VARCHAR(255)
    , STR_CLOSE_BATCH_ID VARCHAR(255)
    , TAX_AMT VARCHAR(255)
    , TAX_PLANA_AMT VARCHAR(255)
    , TAX_PLANA_FLG VARCHAR(255)
    , TAX_PLANB_AMT VARCHAR(255)
    , TAX_PLANB_FLG VARCHAR(255)
    , TAX_PLANC_AMT VARCHAR(255)
    , TAX_PLANC_FLG VARCHAR(255)
    , TAX_PLAND_AMT VARCHAR(255)
    , TAX_PLAND_FLG VARCHAR(255)
    , TLOG_EXT_INDICAT1_CD VARCHAR(255)
    , TLOG_INDICAT1_CD VARCHAR(255)
    , TLOG_INDICAT2_CD VARCHAR(255)
    , TLOG_TRANS_TYPE_CD VARCHAR(255)
    , TNDR_AMT VARCHAR(255)
    , TNDR_CHNG_AMT VARCHAR(255)
    , TRANS_END_DT VARCHAR(255)
    , TRANS_END_TIME VARCHAR(255)
    , TRANS_ID VARCHAR(255)
    , TRANS_INACTIVE_TIME VARCHAR(255)
    , TRANS_NUM VARCHAR(255)
    , TRANS_RING_TIME VARCHAR(255)
    , TRANS_SEQ_NUM VARCHAR(255)
    , TRANS_SPECIAL_TIME VARCHAR(255)
    , TRANS_TENDER_TIME VARCHAR(255)
    , TRANS_TYPE_CD VARCHAR(255)
    , UNIT_ID VARCHAR(255)
    , UPC_CD VARCHAR(255)
    , UPC_CUM_DEAL_CNT VARCHAR(255)
    , UPC_PRCG_MTHD_CD VARCHAR(255)
    , UPC_PROMO_CD VARCHAR(255)
    , UPC_SALE_PRC_AMT VARCHAR(255)
    , UPC_SALE_PRC_QTY VARCHAR(255)
    , UPC_SRC_CD VARCHAR(255)
    , VOID_CNT VARCHAR(255)
    , WGT_SALES_QTY VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandtransactionbackup'
;


DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_3_EXTERNAL;
CREATE EXTERNAL TABLE BACKUP_LAND_TRANSACTION_3_EXTERNAL
(
	TRANS_ID VARCHAR(255)
    , TRANS_SEQ_NUM VARCHAR(255)
    , TRANS_ID_2 VARCHAR(255)
    , TRANS_SEQ_NUM_2 VARCHAR(255)
    , CUSTOMER_ID VARCHAR(255)
    , CUSTOMER_ID_2 VARCHAR(255)
    , BATCH_LOAD_BATCH_ID VARCHAR(255)
    , TRANS_END_DT VARCHAR(255)
    , BASE_COST_AMT DECIMAL(18,5)
    , ESTIMATED_COST_AMT DECIMAL(18,5)
    , NET_SALES_AMT DECIMAL(18,5)
    , PC_UPC_DISC_AMT DECIMAL(18,5)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandtransaction3'
;
DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_3;
CREATE TABLE BACKUP_LAND_TRANSACTION_3 AS SELECT
	TRANS_ID
    , TRANS_SEQ_NUM
    , TRANS_ID_2
    , TRANS_SEQ_NUM_2
    , CUSTOMER_ID
    , CUSTOMER_ID_2
    , BATCH_LOAD_BATCH_ID
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(TRANS_END_DT, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS TRANS_END_DT
	, BASE_COST_AMT
    , ESTIMATED_COST_AMT
    , NET_SALES_AMT
    , PC_UPC_DISC_AMT
FROM
	BACKUP_LAND_TRANSACTION_3_EXTERNAL
;
DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_3_EXTERNAL;


DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_2_EXTERNAL;
CREATE EXTERNAL TABLE BACKUP_LAND_TRANSACTION_2_EXTERNAL
(
	TRANS_ID VARCHAR(255)
    , TRANS_SEQ_NUM VARCHAR(255)
    , CUSTOMER_ID VARCHAR(255)
    , CUSTOMER_ID_2 VARCHAR(255)
    , BATCH_LOAD_BATCH_ID VARCHAR(255)
    , TRANS_END_DT VARCHAR(255)
    , BASE_COST_AMT DECIMAL(18,5)
    , ESTIMATED_COST_AMT DECIMAL(18,5)
    , NET_SALES_AMT DECIMAL(18,5)
    , PC_UPC_DISC_AMT DECIMAL(18,5)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandtransaction2'
;
DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_2;
CREATE TABLE BACKUP_LAND_TRANSACTION_2 AS SELECT
	TRANS_ID
    , TRANS_SEQ_NUM
    , CUSTOMER_ID
    , CUSTOMER_ID_2
    , BATCH_LOAD_BATCH_ID
	, CAST(FROM_UNIXTIME(UNIX_TIMESTAMP(TRANS_END_DT, 'yyyy-MM-dd hh:mm')) AS TIMESTAMP) AS TRANS_END_DT
	, BASE_COST_AMT
    , ESTIMATED_COST_AMT
    , NET_SALES_AMT
    , PC_UPC_DISC_AMT
FROM
	BACKUP_LAND_TRANSACTION_2_EXTERNAL
;
DROP TABLE IF EXISTS BACKUP_LAND_TRANSACTION_2_EXTERNAL;


DROP TABLE IF EXISTS BACKUP_LAND_STATE_LOOKUP;
CREATE EXTERNAL TABLE BACKUP_LAND_STATE_LOOKUP
(
    VALUE_LOOKUP VARCHAR(10)
	, SHORT_DESC VARCHAR(64)
	, LONG_DESC VARCHAR(1024)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandstatelookup'
;


DROP TABLE IF EXISTS BACKUP_LAND_CUSTOMER_INF;
CREATE EXTERNAL TABLE BACKUP_LAND_CUSTOMER_INF
(
    PERSONA_ID VARCHAR(255)
    , FIRST_NAME VARCHAR(255)
    , LAST_NAME VARCHAR(255)
    , GENDER_CD VARCHAR(255)
    , EMPLOYEE_FLAG VARCHAR(255)
    , ADDR_LINE_1 VARCHAR(255)
    , ADDR_LINE_2 VARCHAR(255)
    , CITY VARCHAR(255)
    , STATE_CD VARCHAR(255)
    , ZIP_CODE VARCHAR(255)
    , ZIP4 VARCHAR(255)
    , PHONE_NUMBER VARCHAR(255)
    , EMAIL_ADDRESS VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandcustomerinf'
;


DROP TABLE IF EXISTS BACKUP_LAND_CUSTOMER_4;
CREATE EXTERNAL TABLE BACKUP_LAND_CUSTOMER_4
(
    PERSONA_NK VARCHAR(255)
    , PERSONA_ID_1 VARCHAR(255)
    , PERSONA_ID_2 VARCHAR(255)
    , PERSONA_ID_3 VARCHAR(255)
    , PERSONA_ID_4 VARCHAR(255)
    , PERSONA_ID_5 VARCHAR(255)
    , PERSONA_ID_6 VARCHAR(255)
    , PERSONA_ID_7 VARCHAR(255)
    , FIRST_NAME VARCHAR(255)
    , LAST_NAME VARCHAR(255)
    , GENDER_CD VARCHAR(255)
    , EMPLOYEE_FLAG VARCHAR(255)
    , ADDR_LINE_1 VARCHAR(255)
    , ADDR_LINE_2 VARCHAR(255)
    , CITY VARCHAR(255)
    , STATE_CD VARCHAR(255)
    , ZIP_CODE VARCHAR(255)
    , ZIP4 VARCHAR(255)
    , PHONE_NUMBER VARCHAR(255)
    , EMAIL_ADDRESS VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandcustomer4'
;


DROP TABLE IF EXISTS BACKUP_LAND_CUSTOMER_3;
CREATE EXTERNAL TABLE BACKUP_LAND_CUSTOMER_3
(
    PERSONA_NK VARCHAR(255)
    , PERSONA_ID_1 VARCHAR(255)
    , PERSONA_ID_2 VARCHAR(255)
    , PERSONA_ID_3 VARCHAR(255)
    , PERSONA_ID_4 VARCHAR(255)
    , PERSONA_ID_5 VARCHAR(255)
    , PERSONA_ID_6 VARCHAR(255)
    , PERSONA_ID_7 VARCHAR(255)
    , FIRST_NAME VARCHAR(255)
    , LAST_NAME VARCHAR(255)
    , GENDER_CD VARCHAR(255)
    , EMPLOYEE_FLAG VARCHAR(255)
    , ADDR_LINE_1 VARCHAR(255)
    , ADDR_LINE_2 VARCHAR(255)
    , CITY VARCHAR(255)
    , STATE_CD VARCHAR(255)
    , ZIP_CODE VARCHAR(255)
    , ZIP4 VARCHAR(255)
    , PHONE_NUMBER VARCHAR(255)
    , EMAIL_ADDRESS VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandcustomer3'
;


DROP TABLE IF EXISTS BACKUP_LAND_CUSTOMER_2;
CREATE EXTERNAL TABLE BACKUP_LAND_CUSTOMER_2
(
    PERSONA_ID VARCHAR(255)
    , FIRST_NAME VARCHAR(255)
    , LAST_NAME VARCHAR(255)
    , GENDER_CD VARCHAR(255)
    , EMPLOYEE_FLAG VARCHAR(255)
    , ADDR_LINE_1 VARCHAR(255)
    , ADDR_LINE_2 VARCHAR(255)
    , CITY VARCHAR(255)
    , STATE_CD VARCHAR(255)
    , ZIP_CODE VARCHAR(255)
    , ZIP4 VARCHAR(255)
    , PHONE_NUMBER VARCHAR(255)
    , PHONE_NUMBER_2 VARCHAR(255)
    , EMAIL_ADDRESS VARCHAR(255)
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/sources/backuplandcustomer2'
;