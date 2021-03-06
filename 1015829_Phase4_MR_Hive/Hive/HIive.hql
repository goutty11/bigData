create database NYCT;
use NYCT;

create table nyct(indicator_seq int,parent_seq int,agency_name string,indicator_name string, description string, category string, frequency string,desire_change string,indicator_unit string,decimal_places int,period_year int,period_month int,ytd_target float,ytd_actual float,monthly_target float,monthly_actual float) row format delimited fields terminated by ‘,’ tblproperties ("skip.header.line.count”=“1”);


LOAD DATA LOCAL INPATH ‘/home/training/Desktop/MTA_Performance_NYCT.csv’ INTO Table nyct;


create table tbta(indicator_seq int,parent_seq int,agency_name string,indicator_name string, description string, category string, frequency string,desired_change string,indicator_unit string,decimal_places int,period_year int,period_month int,ytd_target float,ytd_actual float,monthly_target float,monthly_actual float)row format delimited fields terminated by ‘,’ tblproperties ("skip.header.line.count”=“1”);


LOAD DATA LOCAL INPATH ‘/home/training/Desktop/MTA_Performance_TBTA.csv’ INTO Table tbta;

SELECT indicator_name, avg(monthly_target), avg(monthly_actual), period_year
FROM tbta
WHERE indicator_name=“Total Traffic”
GROUP BY period_year,indicator_name;

SELECT indicator_name, avg(monthly_target), avg(monthly_actual), period_year
FROM nyct
WHERE indicator_name=“Subway Wait Assessment”
GROUP BY period_year,indicator_name;



