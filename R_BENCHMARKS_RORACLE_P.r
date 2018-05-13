--  ###############################################################################################################################################
--  
--  BACKUP ALL TEST DATA SETS FOR BENCHMARKING ROACLE AND ORACLE 12C
--  
--  
--  ###############################################################################################################################################

https://www.google.com/#q=list+of+all+businesses+in+New+York+City


set echo on;
set timing on;


--  CREATE BACKUP COPY
CREATE TABLE SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015_BK
AS  
 SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015;

SQL> set timing on
SQL> CREATE TABLE SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015_BK
AS  
 SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015;

Table SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015_BK created.

Elapsed: 01:10:10.645
 
--  RECREATE THE YELLOW_TAXI_TRIP_2015
DROP  TABLE SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015;

CREATE TABLE SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015
AS  
 SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015_BK;


 --  CREATE BACKUP COPY
CREATE TABLE SEARSTGI_ADMIN.LIQUOR_LICENSES_BK
AS  
 SELECT * FROM SEARSTGI_ADMIN.LIQUOR_LICENSES;

 SQL> CREATE TABLE SEARSTGI_ADMIN.LIQUOR_LICENSES_BK
AS  
 SELECT * FROM SEARSTGI_ADMIN.LIQUOR_LICENSES;

Table SEARSTGI_ADMIN.LIQUOR_LICENSES_BK created.

Elapsed: 00:00:00.479
 
--  RECREATE THE LIQUOR_LICENSES 
DROP  TABLE SEARSTGI_ADMIN.LIQUOR_LICENSES;

CREATE TABLE SEARSTGI_ADMIN.LIQUOR_LICENSES
AS  
 SELECT * FROM SEARSTGI_ADMIN.LIQUOR_LICENSES_BK;

 
 --  CREATE BACKUP COPY
CREATE TABLE SEARSTGI_ADMIN.RESTAURANT_BK
AS  
 SELECT * FROM SEARSTGI_ADMIN.RESTAURANT;

SQL> CREATE TABLE SEARSTGI_ADMIN.RESTAURANT_BK
AS  
 SELECT * FROM SEARSTGI_ADMIN.RESTAURANT;

Table SEARSTGI_ADMIN.RESTAURANT_BK created.

Elapsed: 00:00:54.311 
 
--  RECREATE THE YELLOW_TAXI_TRIP_2015 
DROP  TABLE SEARSTGI_ADMIN.RESTAURANT;

CREATE TABLE SEARSTGI_ADMIN.RESTAURANT
AS  
 SELECT * FROM SEARSTGI_ADMIN.RESTAURANT_BK;


--  CREATE BACKUP COPY
CREATE TABLE SEARSTGI_ADMIN.DOING_BUSINESS_BK
AS  
 SELECT * FROM SEARSTGI_ADMIN.DOING_BUSINESS;

 SQL> CREATE TABLE SEARSTGI_ADMIN.DOING_BUSINESS_BK
AS  
 SELECT * FROM SEARSTGI_ADMIN.DOING_BUSINESS;

Table SEARSTGI_ADMIN.DOING_BUSINESS_BK created.

Elapsed: 00:00:02.551

 
--  RECREATE THE YELLOW_TAXI_TRIP_2015 
DROP  TABLE SEARSTGI_ADMIN.DOING_BUSINESS;

CREATE TABLE SEARSTGI_ADMIN.DOING_BUSINESS
AS  
 SELECT * FROM SEARSTGI_ADMIN.DOING_BUSINESS_BK;

 
 select count(*) from DOING_BUSINESS;
75349
 
select count(DISTINCT LICENSE_CATEGORY) from DOING_BUSINESS;
54

select DISTINCT LICENSE_CATEGORY from DOING_BUSINESS;

Locksmith
Laundry
Amusement Device Portable
Garage and Parking Lot
Pedicab Driver
Games of Chance
Process Serving Agency
Commercial Lessor
Booting Company
Parking Lot
Auction House Premises
Storage Warehouse
Ticket Seller
Horse Drawn Driver
Pawnbroker
Amusement Arcade
Electronic & Appliance Service
Tow Truck Company
Tow Truck Driver
Garage
Motion Picture Projectionist
Process Server Individual
Cigarette Retail Dealer
Laundry Jobber
Auctioneer
Dealer In Products
Employment Agency
Pool or Billiard Room
Secondhand Dealer - Firearms
Home Improvement Contractor
Newsstand
Cabaret
Pedicab Business
Scrap Metal Processor
Bingo Game Operator
Sightseeing Bus
Electronics Store
Tow Truck Exemption
General Vendor
Scale Dealer Repairer
Catering Establishment
Horse Drawn Cab Owner
Special Sale
Secondhand Dealer - General
Sidewalk Cafe
Stoop Line Stand
Gaming Cafe
Home Improvement Salesperson
Amusement Device Permanent
Debt Collection Agency
Secondhand Dealer - Auto
Locksmith Apprentice
Laundries
General Vendor Distributor

select COUNT(DISTINCT LICENSE_CATEGORY) from DOING_BUSINESS;
 
 
 

--  ################################################################################################################################################
--  ################################################################################################################################################

With a regular expression and the function gsub():

group <- c("12357e", "12575e", "197e18", "e18947")
group
[1] "12357e" "12575e" "197e18" "e18947"

gsub("e", "", group)
[1] "12357" "12575" "19718" "18947"
What gsub does here is to replace each occurrence of "e" with an empty string "".

See ?regexp or gsub for more help.

--  ################################################################################################################################################

ptm <- proc.time()

Data10 <- gsub("”", "", Data8)

proc.time() - ptm

> ptm <- proc.time()
> 
> Data10 <- gsub("”", "", Data8)
> 
> proc.time() - ptm
   user  system elapsed 
1472.67    0.59 1524.85 sec
                  25.4142 min

Oracle JavaScript Extension Toolkit Developing Applications with Oracle JET

CREATE TABLE SEARSTGI_ADMIN.RESTAURANT_KK1
AS  
 SELECT * FROM SEARSTGI_ADMIN.RESTAURANT WHERE 1=2;
 
ptm <- proc.time()

dbWriteTable(con, "RESTAURANT_KK1", Data8, overwrite = FALSE, append=TRUE, row.names = F, schema="SEARSTGI_ADMIN")

proc.time() - ptm



--  ################################################################################################################################################
--  ################################################################################################################################################

1)   

library('ROracle')
library('DBI')
drv <- dbDriver("Oracle")

--  This connect will only work for a CDB in Oracle 12c or a pre Oracle 12c database since the connect string is different in 12c for a PDB
con <- dbConnect(drv, "system ", "PASSWORD", dbname=' data16pr')
dbReadTable(con, 'DUAL')



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

2)  

library('ROracle')
library('DBI')
drv <- dbDriver("Oracle")

--  full dbConnect () for the CDB in Oracle 12c
con <- dbConnect(drv, "system", "PASSWORD", dbname='data16pr', prefetch = FALSE,
bulk_read = 1000L, bulk_write = 1000L, stmt_cache = 0L,
external_credentials = FALSE, sysdba = FALSE)

--  ########################################################################

library('ROracle')
library('DBI')
drv <- dbDriver("Oracle")

--  This is the full connect for PDB 'pdt16tst' as you can see it's different
--  from when attaching to the container instance
--  Never use the value of 10000 for read buffer such as bulk_read = 10000L 
--  this will crash the Oracle instance on Oracle 12.1.0.2


con <- dbConnect(drv, "searstgi_admin", "PASSWORD", dbname='//localhost:1521/pdt16tst', prefetch = FALSE,
bulk_read = 1000L, bulk_write = 1000L, stmt_cache = 0L,
external_credentials = FALSE, sysdba = FALSE)

--  This is the full connect for PDB 'pdt16tst' as you can see it's different

con <- dbConnect(drv, "searstgi_chk", "PASSWORD", dbname='//localhost:1521/pdt16tst', prefetch = FALSE,
bulk_read = 1000L, bulk_write = 1000L, stmt_cache = 0L,
external_credentials = FALSE, sysdba = FALSE)


##   SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015;
##   SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015 WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6;
##   SELECT EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME ) AS TMONTH, COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015 GROUP BY EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME );
/*
set echo on;
set timing on;

SET AUTOTRACE ON;
SELECT EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME ) AS TMONTH, COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015 
    GROUP BY EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME );

*/



ptm <- proc.time()
rs <- dbSendQuery(con, "SELECT EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME ) AS TMONTH, COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015 GROUP BY EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )")
proc.time() - ptm


ptm <- proc.time()
fetch(rs)
proc.time() - ptm


CORY 847 879 7134

--  #################################################################################################
ptm <- proc.time()

rs <- dbSendQuery(con, "SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015")

proc.time() - ptm


ptm <- proc.time()
##   SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015;
##   SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015 WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6;
##   SELECT EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME ) AS TMONTH, COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015 GROUP BY EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME );

rs <- dbSendQuery(con, "SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015 WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6")

proc.time() - ptm


ptm <- proc.time()

allrecs <- fetch(rs)

proc.time() - ptm


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

CREATE TABLE SEARSTGI_ADMIN.YELLOW_TAXI_JUNE
AS
SELECT * FROM SEARSTGI_ADMIN.YELLOW_TAXI_TRIP_2015 WHERE EXTRACT(MONTH FROM TPEP_PICKUP_DATETIME )  = 6;

SELECT COUNT(*) FROM SEARSTGI_ADMIN.YELLOW_TAXI_JUNE;
12332380

22.181 seconds




## We now fetch records from the resultSet into a data.frame.
ptm <- proc.time()

data <- fetch(rs) ## extract all rows

proc.time() - ptm


######



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

