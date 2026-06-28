/*
==================================================================================
Stored Procedure : bronze.load_bronze
==================================================================================

Purpose:
  This stored procedure automates the loading of raw source data into the 
  'bronze' layer of the data warehouse. It ensures that staging tables are 
  refreshed with the latest data from CRM and ERP source files.

Process Overview:
  1. Logs start and end times for each batch and table load.
  2. Truncates existing data in bronze tables to avoid duplication.
  3. Uses BULK INSERT to load CSV files from source directories into bronze tables.
  4. Prints progress messages and load durations for transparency.
  5. Implements TRY...CATCH for error handling to capture and display 
     error messages if loading fails.
Parameters:
     none.
    this stored procedure does not accept any parameters or return any values.


Tables Loaded:
  - CRM: crm_cust_info, crm_prd_info, crm_sales_details
  - ERP: erp_cust_az12, erp_loc_a101, erp_px_cat_glv2

Error Handling:
  - Captures error message, number, and state if any step fails.
  - Provides clear console output for debugging.

/*
==================================================================================
Stored Procedure : bronze.load_bronze
==================================================================================

Purpose:
  This stored procedure automates the loading of raw source data into the 
  'bronze' layer of the data warehouse. It ensures that staging tables are 
  refreshed with the latest data from CRM and ERP source files.

Process Overview:
  1. Logs start and end times for each batch and table load.
  2. Truncates existing data in bronze tables to avoid duplication.
  3. Uses BULK INSERT to load CSV files from source directories into bronze tables.
  4. Prints progress messages and load durations for transparency.
  5. Implements TRY...CATCH for error handling to capture and display 
     error messages if loading fails.

Tables Loaded:
  - CRM: crm_cust_info, crm_prd_info, crm_sales_details
  - ERP: erp_cust_az12, erp_loc_a101, erp_px_cat_glv2

Error Handling:
  - Captures error message, number, and state if any step fails.
  - Provides clear console output for debugging.

Usage:
  Execute this procedure to refresh the bronze layer with the latest 
  source data before proceeding to transformations in the silver/gold layers.

Usage example: 
       EXEC bronze.load_bronze;
==================================================================================
*/

  Execute this procedure to refresh the bronze layer with the latest 
  source data before proceeding to transformations in the silver/gold layers.

==================================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @START_TIME DATETIME, 
            @END_TIME DATETIME,
            @batch_start_time DATETIME,
            @batch_end_time DATETIME;

    BEGIN TRY
        PRINT '======================================';
        PRINT 'LOADING BRONZE LAYER';
        PRINT '======================================';

        PRINT '--------------------------------------';
        PRINT 'LOADING CRM TABLE';
        PRINT '---------------------------------------';

        -- CRM Customer Info
        SET @START_TIME = GETDATE();
        PRINT 'TRUNCATING TABLE bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT 'INSERTING DATA INTO bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\Ammu\OneDrive\Desktop\SQL\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @END_TIME = GETDATE();
        PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + ' SECONDS';
        PRINT '----------------------------------------------------------------------------------------';

        -- CRM Product Info
        SET @START_TIME = GETDATE();
        PRINT 'TRUNCATING TABLE bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT 'INSERTING DATA INTO bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\Ammu\OneDrive\Desktop\SQL\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @END_TIME = GETDATE();
        PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + ' SECONDS';
        PRINT '-----------------------------------------------------------------------------------------';

        -- CRM Sales Details
        SET @START_TIME = GETDATE();
        PRINT 'TRUNCATING TABLE bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT 'INSERTING DATA INTO bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\Ammu\OneDrive\Desktop\SQL\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @END_TIME = GETDATE();
        PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + ' SECONDS';
        PRINT '-----------------------------------------------------------------------------------------';

        PRINT '======================================';
        PRINT 'LOADING BRONZE LAYER';
        PRINT '======================================';

        PRINT '--------------------------------------';
        PRINT 'LOADING ERP TABLE';
        PRINT '---------------------------------------';

        -- ERP Customer
        SET @START_TIME = GETDATE();
        PRINT 'TRUNCATING TABLE bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT 'INSERTING DATA INTO bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\Ammu\OneDrive\Desktop\SQL\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @END_TIME = GETDATE();
        PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + ' SECONDS';
        PRINT '------------------------------------------------------------------------------------------';

        -- ERP Location
        SET @START_TIME = GETDATE();
        PRINT 'TRUNCATING TABLE bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT 'INSERTING DATA INTO bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\Ammu\OneDrive\Desktop\SQL\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @END_TIME = GETDATE();
        PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + ' SECONDS';
        PRINT '------------------------------------------------------------------------------------------';

        -- ERP Product Category
        SET @START_TIME = GETDATE();
        PRINT 'TRUNCATING TABLE bronze.erp_px_cat_glv2';
        TRUNCATE TABLE bronze.erp_px_cat_glv2;

        PRINT 'INSERTING DATA INTO bronze.erp_px_cat_glv2';
        BULK INSERT bronze.erp_px_cat_glv2
        FROM 'C:\Users\Ammu\OneDrive\Desktop\SQL\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @END_TIME = GETDATE();
        PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + ' SECONDS';
        PRINT '------------------------------------------------------------------------------------------';

        -- Batch End
        SET @batch_end_time = GETDATE();
        PRINT '===================================================================================================================================';
        PRINT 'LOADING BRONZE LAYER IS COMPLETED';
        PRINT '= TOTAL LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' SECONDS';
        PRINT '----------------------------------------------------------------------------------------------------------------------------------';

    END TRY
    BEGIN CATCH
        PRINT '==========================================';
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'ERROR STATE: ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '==========================================';
    END CATCH
END;
