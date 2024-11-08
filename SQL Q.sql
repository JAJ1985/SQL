--Find all tables in a system:

Select *
From
sys.tables

--Find all tables with column names:

SELECT OBJECT_SCHEMA_NAME(T.[object_id],DB_ID()) AS [Schema],   
        T.[name] AS [table_name], AC.[name] AS [column_name],   
        TY.[name] AS system_data_type, AC.[max_length],  
        AC.[precision], AC.[scale], AC.[is_nullable], AC.[is_ansi_padded]  
FROM sys.[tables] AS T   
 INNER JOIN sys.[all_columns] AC ON T.[object_id] = AC.[object_id]  
 INNER JOIN sys.[types] TY ON AC.[system_type_id] = TY.[system_type_id] AND AC.[user_type_id] = TY.[user_type_id]   
WHERE T.[is_ms_shipped] = 0  
ORDER BY T.[name], AC.[column_id]

SELECT SJ.[name], MAX(SJH.[run_date]) AS [last_run_date],
MAX(DATEDIFF(dd, CONVERT(datetime, CAST(SJH.[run_date] AS CHAR(8)), 101), GETDATE())) AS [Days Since Last Run]
FROM msdb.dbo.[sysjobhistory] SJH INNER JOIN [msdb].dbo.[sysjobs] SJ ON SJH.[job_id] = SJ.[job_id]
WHERE SJH.[step_id] = 0
GROUP BY SJ.[name]
ORDER BY SJ.[name]

/*NA_Orders
NA_Fulfillment

LR = ActiveSheet.UsedRange.Rows.Count*/


INSERT INTO dbo.METADATA_PACKAGE_EXECUTION_LOG
	([EXECUTION_GUID_ID],
	 [PACKAGE_ID],
	 [PACKAGE_NAME],
	 [PACKAGE_STATUS_DESC],
	 [START_DATETIME],
	 [IS_PARENT_PACKAGE])
VALUES
(?,?,?,'Unknown', getdate(), 0 ) 