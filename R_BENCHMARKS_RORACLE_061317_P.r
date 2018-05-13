--  ###############################################################################################################################################
--  
--  BENCHMARKING RSTUDIO/ROACLE AND ORACLE 12C TOOLS (SQL*PLUS SQL DEVELOPER)
--  
--  ###############################################################################################################################################

--  R Packages of interest
installed.packages()
sessionInfo()
summary(con)
summary(allrecs)
View(Data8)

--  ################################################################################################################################################
--  EXAMPLES FOR PRESENTATION
--  ################################################################################################################################################

1)   

library('ROracle')
library('DBI')
drv <- dbDriver("Oracle")

--  This connect will only work for a CDB in Oracle 12c or a pre Oracle 12c database since the connect string is different in 12c for a PDB
con <- dbConnect(drv, "system ", "PASSWORD", dbname=' data16pr')
dbReadTable(on, 'DUAL')

> dbReadTable(con, 'DUAL')
  DUMMY
1     X
> 
> 

## Lets run a new command dbListTables(con) command to list the Oracle Database tables in the System schema.
 
> dbListTables(con )
  [1] "LOGMNR_SESSION_EVOLVE$"        "LOGMNR_GLOBAL$"               
  [3] "LOGMNR_GT_TAB_INCLUDE$"        "LOGMNR_GT_USER_INCLUDE$"      
  [5] "LOGMNR_GT_XID_INCLUDE$"        "LOGMNR_PDB_INFO$"             
  [7] "LOGMNR_DID$"                   "LOGMNR_UID$"                  
  [9] "LOGMNRGGC_GTLO"                "LOGMNRGGC_GTCS"               
 [11] "LOGMNRC_DBNAME_UID_MAP"        "LOGMNR_LOG$"                  
 [13] "LOGMNR_PROCESSED_LOG$"         "LOGMNR_SPILL$"                
 [15] "LOGMNR_AGE_SPILL$"             "LOGMNR_RESTART_CKPT_TXINFO$"  
 [17] "LOGMNR_ERROR$"                 "LOGMNR_RESTART_CKPT$"         
 [19] "LOGMNR_INTEGRATED_SPILL$"      "LOGMNR_FILTER$"               
 [21] "LOGMNR_SESSION_ACTIONS$"       "LOGMNR_PARAMETER$"            
 [23] "LOGMNR_SESSION$"               "LOGMNRT_MDDL$"                
 [25] "REDO_DB"                       "REDO_LOG"                     
 [27] "REDO_RTA"                      "ROLLING$CONNECTIONS"          
 [29] "ROLLING$DATABASES"             "ROLLING$DIRECTIVES"           

                         ...
                  
[165] "LOGMNR_REFCON$"                "LOGMNR_PARTOBJ$"              
[167] "LOGMNRP_CTAS_PART_MAP"         "SCHEDULER_PROGRAM_ARGS"       
[169] "SCHEDULER_JOB_ARGS"            "SCHEDULER_PROGRAM_ARGS_TBL"   
[171] "SCHEDULER_JOB_ARGS_TBL"        "LOGSTDBY$PARAMETERS"          
[173] "LOGSTDBY$EVENTS"               "LOGSTDBY$APPLY_PROGRESS"      
[175] "LOGSTDBY$APPLY_MILESTONE"      "LOGSTDBY$SCN"                 
[177] "LOGSTDBY$FLASHBACK_SCN"        "LOGSTDBY$PLSQL"               
[179] "LOGSTDBY$SKIP_TRANSACTION"     "LOGSTDBY$SKIP"                
[181] "LOGSTDBY$SKIP_SUPPORT"         "LOGSTDBY$HISTORY"             
[183] "LOGSTDBY$EDS_TABLES"           "DEF$_AQCALL"                  
[185] "DEF$_AQERROR"                  "AQ$_DEF$_AQCALL_F"            
[187] "AQ$DEF$_AQCALL"                "AQ$_DEF$_AQERROR_F"           
[189] "AQ$DEF$_AQERROR"               "PRODUCT_PRIVS"                
[191] "SQLPLUS_PRODUCT_PROFILE"       "HELP"                         
[193] "PLAN_TABLE"                   
> 
> 



--  ###################################################################################
--  dbConnect(drv, username = "", password = "", dbname = "", prefetch = FALSE,
--  bulk_read = 1000L, bulk_write = 1000L, stmt_cache = 0L,
--  external_credentials = FALSE, sysdba = FALSE, ...)
--  ###################################################################################

2)  dbDisconnect(con)

library('ROracle')
library('DBI')
drv <- dbDriver("Oracle")


--  This is the full connect for PDB 'pdt16tst' as you can see it's different
con <- dbConnect(drv, "searstgi_admin", "PASSWORD", dbname='//localhost:1521/pdt16tst', prefetch = FALSE,
bulk_read = 1000L, bulk_write = 1000L, stmt_cache = 0L,
external_credentials = FALSE, sysdba = FALSE)




ptm <- proc.time()

rs <- dbSendQuery(con2, "select * from searstgi_admin.restaurant")

## We now fetch records from the resultSet into a data.frame.

data <- fetch(rs) ## extract all rows

proc.time() - ptm

dim(data)



3)   

installed.packages()
sessionInfo()
summary(con)
summary(allrecs)





4)   

createTable <- "CREATE TABLE FLASHBACK_STAT (FBDB_SU NUMBER, BEGIN_TIME DATE, END_TIME DATE, FLASHBACK_DATA_MB NUMBER, DB_DATA_MB NUMBER, REDO_DATA_MB NUMBER, ESTIMATED_FLASHBACK_SIZE_MB NUMBER)"

dbGetQuery(con, createTable)


insertString <- "INSERT INTO FLASHBACK_STAT  SELECT FLASHBACK_DATABASE_SEQ.NEXTVAL, BEGIN_TIME, END_TIME, (FLASHBACK_DATA/1048576) as FBDATA_MB, (DB_DATA/1048576) as  DB_MB, (REDO_DATA/1048576) as REDO_MB, (ESTIMATED_FLASHBACK_SIZE/1048576) as ESTI_FB_SIZE_MB FROM SYS.V_$FLASHBACK_DATABASE_STAT ";

dbGetQuery(con, insertString)
	


##   SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP;
##   SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6;
##   SELECT EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME ) AS TMONTH, COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP GROUP BY EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME );

ptm <- proc.time()
rs <- dbSendQuery(con2, "SELECT EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME ) AS TMONTH, COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP GROUP BY EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )")
proc.time() - ptm


ptm <- proc.time()
fetch(rs)
proc.time() - ptm


> 
> 
> ptm <- proc.time()
> rs <- dbSendQuery(con, "SELECT EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME ) AS TMONTH, COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP GROUP BY EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )")
> proc.time() - ptm
   user  system elapsed 
   0.01    0.02    0.04 
> 
> 
> 
> 
> ptm <- proc.time()
> 
> fetch(rs)
  TMONTH COUNT(*)
1      1 12741017
2      6 12332380
3      2 12442388
4      4 13063760
5      5 13158079
6      3 13342951
> 
> proc.time() - ptm
   user  system elapsed 
   0.02    0.00  198.38 
> 
> 

## In SQL Developer 4.15 we will execute the same query, see below:
###  2/9/17

set echo on;
set timing on;

SELECT EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME ) AS TMONTH, COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP GROUP BY EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME );

All Rows Fetched: 6 in 220.094 seconds

1	12741017
6	12332380
2	12442388
4	13063760
5	13158079
3	13342951






--  #################################################################################################
--  TOO BIG FOR MACHINE 
ptm <- proc.time()
rs <- dbSendQuery(con, "SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP")
proc.time() - ptm
--  ##################################################################################################


##   SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP;
##   SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6;
##   SELECT EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME ) AS TMONTH, COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP GROUP BY EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME );

ptm <- proc.time()
rs2 <- dbSendQuery(con2, "SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6")
proc.time() - ptm


ptm <- proc.time()
allrecs <- fetch(rs2)
proc.time() - ptm

> 
> ptm <- proc.time()
> rs2 <- dbSendQuery(con2, "SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6")
> proc.time() - ptm
   user  system elapsed 
   0.00    0.01    0.12 
> 
> ptm <- proc.time()
> allrecs <- fetch(rs2)
> proc.time() - ptm
   user  system elapsed 
  90.34    4.14  259.30 
> 
> 


SQL> set echo on
SQL> set timing on
SQL> CREATE TABLE YELLOW_TAXI_TRIP_JUNEV3
AS
SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6;

Table YELLOW_TAXI_TRIP_JUNEV3 created.

Elapsed: 00:16:07.418
TASK COMPLETED IN 967.418 SEC

ptm <- proc.time()
dbWriteTable(con, "YELLOW_TAXI_JUNE", allrecs, overwrite = FALSE, append=TRUE, row.names=F, schema="SEARSTGI_ADMIN")
proc.time() - ptm

> 
> ptm <- proc.time()
> 
> Sys.setenv(TZ = "GMT")
> Sys.setenv(ORA_SDTZ = "GMT")
> dbWriteTable(conn, "ORACLE_DB_TABLE", r_data_table, overwrite = F, append = T, row.names = F)

> dbWriteTable(con, "YELLOW_TAXI_JUNE", allrecs, overwrite = FALSE, append=TRUE, schema="SEARSTGI_ADMIN")
Error in .oci.WriteTable(conn, name, value, row.names = row.names, overwrite = overwrite,  : 
  Error in .oci.ValidateZoneInEnv(FALSE) : 
  environment variable 'ORA_SDTZ()' must be set to the same time zone region as the the environment variable 'TZ()'
> 
> proc.time() - ptm
   user  system elapsed 
   0.00    0.01    0.19 
> 
> 
> 

> dbGetQuery(con, "SELECT SESSIONTIMEZONE FROM DUAL")
  SESSIONTIMEZONE
1          -05:00


set echo on;
set timing on;

DROP TABLE SEARSTGI_ADMIN.YELLOW_TRIP_DATA_1_6_2015;

CREATE TABLE SEARSTGI_ADMIN.YELLOW_TRIP_DATA_1_6_2015 PARALLEL NOLOGGIN
AS
SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP WHERE 1=2;

ALTER TABLE SEARSTGI_ADMIN.YELLOW_TRIP_DATA_1_6_2015  NOLOGGING ;





set echo on;
set timing on;

CREATE TABLE SEARSTGI_ADMIN.YELLOW_TAXI_JUNE
AS
SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6;

SELECT COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_JUNE;
12332380

22.181 seconds




## We now fetch records from the resultSet into a data.frame.
ptm <- proc.time()

data <- fetch(rs) ## extract all rows

proc.time() - ptm


######


--  #######################################################################################################################


ptm <- proc.time()

rs <- dbSendQuery(con, "select * from searstgi_admin.restaurant")

## We now fetch records from the resultSet into a data.frame.

data <- fetch(rs) ## extract all rows

dim(data)

proc.time() - ptm

#####

ptm <- proc.time()

for (i in 1:50) mad(stats::runif(500))

proc.time() - ptm

ptm <- proc.time()

for (i in 1:50) mad(stats::runif(500))

proc.time() - ptm

