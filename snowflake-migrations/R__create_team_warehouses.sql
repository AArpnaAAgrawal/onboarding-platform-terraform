USE ROLE SYSADMIN;

CREATE WAREHOUSE IF NOT EXISTS {{ENV}}_DATA_ANALYST_WH_S WITH INITIALLY_SUSPENDED = TRUE 
WAREHOUSE_SIZE = SMALL
MIN_CLUSTER_COUNT = 1
MAX_CLUSTER_COUNT = 2
AUTO_SUSPEND = 300
SCALING_POLICY = STANDARD
AUTO_RESUME = TRUE
RESOURCE_MONITOR = teammonitor;

CREATE WAREHOUSE IF NOT EXISTS {{ENV}}_{{TeamName}}_DATABRICKS_WH WITH INITIALLY_SUSPENDED = TRUE 
WAREHOUSE_SIZE = MEDIUM
MIN_CLUSTER_COUNT = 1
MAX_CLUSTER_COUNT = 2
AUTO_SUSPEND = 300
SCALING_POLICY = STANDARD
AUTO_RESUME = TRUE
RESOURCE_MONITOR = teammonitor;

CREATE WAREHOUSE IF NOT EXISTS {{ENV}}_{{TeamName}}_ENGINEER_WH_S WITH INITIALLY_SUSPENDED = TRUE
MIN_CLUSTER_COUNT = 1
MAX_CLUSTER_COUNT = 2
AUTO_SUSPEND = 300
SCALING_POLICY = STANDARD
AUTO_RESUME = TRUE
RESOURCE_MONITOR = teammonitor;


USE ROLE accountadmin; 

ALTER WAREHOUSE {{ENV}}_DATA_ANALYST_WH_S SET TAG cost_center= {{TeamName}}; 

ALTER WAREHOUSE {{ENV}}_{{TeamName}}_DATABRICKS_WH SET TAG cost_center={{TeamName}}; 

ALTER WAREHOUSE {{ENV}}_{{TeamName}}_ENGINEER_WH_S SET TAG cost_center={{TeamName}}; 