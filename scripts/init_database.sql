# /*

# Create Database and Schemas

Script Purpose:
This script creates the 'DataWarehouse' database if it does not exist.
If the database already exists, it is dropped and recreated.
It also creates the following schemas:
• bronze
• silver
• gold

Warning:
Running this script will permanently delete the existing
'DataWarehouse' database and all its data.
Ensure that you have a valid backup before executing this script.

=============================================

*/




use master;

--Drop and recreate the "datawarehouse" database
if exists (select 1 from sys.databases where name = 'datawarehouse')
BEGIN
ALTER DATABASE  datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE  datawarehouse;
END;
GO


--create database datawarehouse;
create database datawarehouse;


use datawarehouse;
GO

--create schema
create schema bronze;
go

create schema silver;
go

create schema gold;
go
