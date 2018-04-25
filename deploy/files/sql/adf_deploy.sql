-- ============================================================================
--  Initial base dump for version Amp 2.2.0 (Hive edition)
-- ============================================================================

DROP TABLE IF EXISTS adf_audit_log;
CREATE TABLE adf_audit_log
(
	batch_number int,
	mapping_key int,
	abac_rule_key int,
	insert_timestamp timestamp,
	severity_code smallint,
	key_values varchar(10000),
	grouping_values varchar(10000),
	control_value varchar(15000),
	source_value varchar(15000),
	message varchar(10000)
)
STORED AS TEXTFILE;

DROP TABLE IF EXISTS adf_batch_log;
CREATE TABLE adf_batch_log
(
    batch_number int,
    start_timestamp timestamp,
    end_timestamp timestamp,
    audit_log_count bigint,
    warning_count bigint,
    error_count bigint,
    fatal_count bigint,
    source_row_count bigint,
    target_row_count bigint,
    batch_status varchar(2)
)
partitioned by (mapping_key bigint)
STORED AS TEXTFILE
TBLPROPERTIES
(
	'COLUMN_STATS_ACCURATE' = 'true'
);

DROP TABLE IF EXISTS adf_batch_start;
CREATE TABLE adf_batch_start
(
	batch_number int,
	mapping_key int,
	start_timestamp timestamp,
	error_threshold int
)
STORED AS TEXTFILE;

DROP TABLE IF EXISTS adf_mapping_counter_log;
CREATE TABLE adf_mapping_counter_log
(
	batch_number int,
	abac_counter_key int,
	mapping_component_key int,
	counter_value bigint
)
STORED AS TEXTFILE
TBLPROPERTIES
(
	'COLUMN_STATS_ACCURATE' = 'true'
);

DROP TABLE IF EXISTS adf_numbers;
CREATE TABLE adf_numbers
(
	number_value int
)
STORED AS TEXTFILE
TBLPROPERTIES
(
	'COLUMN_STATS_ACCURATE' = 'true'
);

DROP TABLE IF EXISTS adf_publication_log;
CREATE TABLE adf_publication_log
(
	object_key   bigint
    , batch_number bigint
)
partitioned by (pub_mapping_key bigint)
STORED AS TEXTFILE
TBLPROPERTIES
(
	'COLUMN_STATS_ACCURATE' = 'true'
);


DROP TABLE IF EXISTS adf_syslockinfo;
CREATE TABLE adf_syslockinfo
(
	session_id int,
	resource_name varchar(1000),
	lock_type varchar(2),
	start_timestamp timestamp
)
STORED AS TEXTFILE;

-- ============================================================================
--  Initial base dump for version Amp 2.2.0 (Hive edition)
-- ============================================================================

DROP TABLE IF EXISTS tmp_adf_numbers_10;
CREATE TABLE tmp_adf_numbers_10 AS
SELECT 1 AS NUMBER UNION ALL
SELECT 2 AS NUMBER UNION ALL
SELECT 3 AS NUMBER UNION ALL
SELECT 4 AS NUMBER UNION ALL
SELECT 5 AS NUMBER UNION ALL
SELECT 6 AS NUMBER UNION ALL
SELECT 7 AS NUMBER UNION ALL
SELECT 8 AS NUMBER UNION ALL
SELECT 9 AS NUMBER UNION ALL
SELECT 10 AS NUMBER;

DROP TABLE IF EXISTS tmp_adf_numbers_100;
CREATE TABLE tmp_adf_numbers_100 AS
SELECT
	a.number
FROM
	tmp_adf_numbers_10 a
CROSS JOIN tmp_adf_numbers_10 b
;

INSERT INTO TABLE adf_numbers
SELECT
	row_number() over ()
FROM
	tmp_adf_numbers_100 a
CROSS JOIN tmp_adf_numbers_10 b
;

DROP TABLE IF EXISTS tmp_adf_numbers_10;
DROP TABLE IF EXISTS tmp_adf_numbers_100;