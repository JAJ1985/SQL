--DLR_AcctUpdater

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
USE DisneyParks_Reporting;

DECLARE @StartDate char(10);
DECLARE @EndDate char(10);

SET @StartDate = '2024-07-28';
SET @EndDate = '2024-08-24';

SELECT cast(timestamp as date) as InteractionDate
	, case DPBS_INTERACTIONS.InteractionNotes
		when 'PaymentProcessing Card Action processed:Expiration date changed' then 'Expiration Date Changed'
		when 'PaymentProcessing Card Action processed:Account number changed' then 'Account Number Changed'
		else 'Undetermined'
	  end as 'Update_Type'
	, DPBS_INTERACTIONS.ContractNumber, ehent# as Assist_ID
	, DPBS_INTERACTIONS.Timestamp as Update_Date, ehhldc as Current_Hold_Code 
FROM DPBS_INTERACTIONS 
	INNER JOIN ALDPBEH ON substring(DPBS_INTERACTIONS.ContractNumber,4,8) = cast(ALDPBEH.EHCNT# as integer)
WHERE cast(timestamp as date) between @StartDate and @EndDate 
	--and(DPBS_INTERACTIONS.CastMember = 'PaymentProcessing') 
	AND (DPBS_INTERACTIONS.OrgUnitName = 'DisneyPARKS')
	and ehsfx#='000' and ehcnt#<>'Y0238254'
order by 1 desc;

-----------------------------------------------------------------------------------------------------------------------

--WDW_AcctUpdater

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
USE DisneyParks_Reporting;

DECLARE @StartDate char(10);
DECLARE @EndDate char(10);

SET @StartDate = '2024-07-28';
SET @EndDate = '2024-08-24';

SELECT     cast(timestamp as date) as InteractionDate,case DPBS_INTERACTIONS.InteractionNotes
when 'PaymentProcessing Card Action processed:Expiration date changed' then 'Expiration Date Changed'
when 'PaymentProcessing Card Action processed:Account number changed' then 'Account Number Changed'
else 'Undetermined'
end as 'Update_Type'
, DPBS_INTERACTIONS.ContractNumber,ehent# as Assist_ID, DPBS_INTERACTIONS.Timestamp as Update_Date, ehhldc as Current_Hold_Code 

FROM         DPBS_INTERACTIONS INNER JOIN
                      ALDPBEH ON substring(DPBS_INTERACTIONS.ContractNumber,4,8) = cast(ALDPBEH.EHCNT# as integer)
WHERE     cast(timestamp as date) between @StartDate and @EndDate 
--and(DPBS_INTERACTIONS.CastMember = 'PaymentProcessing') 
AND (DPBS_INTERACTIONS.OrgUnitName = 'Disneyworld')
and ehsfx#='000' and ehcnt#<>'Y0238254'
order by 1 desc;

---------------------------------------------------------------------------------------------------------------------------------------------

--ContractCounts

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
USE DisneyParks_Reporting;

DECLARE @StartDate char(10);
DECLARE @EndDate char(10);

SET @StartDate = '2024-07-28';
SET @EndDate = '2024-08-24';

--Contracts created this fiscal period:
Select count(ehent#) as duringFiscalPeriod_DLRCount
from dbo.ALDPBEH
where ehsfx#='000' and eheocd between @StartDate and @EndDate and ehcom#='021';

Select count(ehent#) as duringFiscalPeriod_WDWCount
from dbo.ALDPBEH
where ehsfx#='000' and eheocd between @StartDate and @EndDate and ehcom#='025';

--Not counting archived contracts
Select Count(Distinct a.EHENT#) as ExistingContracts_DLRCount 
from dbo.ALDPBEH as a join dbo.ARPHDRAH as b
       on a.EHENT# = b.AHENT#
where a.EHSFX# = '000' 
       and a.EHEOCD < @StartDate 
       and a.EHCOM# = '021' 
       and (a.ehstat = 'Blocked' or b.AHPMTD >= CONVERT(VARCHAR(8), DateAdd(yy, -3, GetDate()), 112));

Select Count(Distinct a.EHENT#) as ExistingContracts_WDWCount 
from dbo.ALDPBEH as a join dbo.ARPHDRAH as b
       on a.EHENT# = b.AHENT#
where a.EHSFX# = '000' 
       and a.EHEOCD < @StartDate 
       and a.EHCOM# = '025' 
       and (a.ehstat = 'Blocked' or b.AHPMTD >= CONVERT(VARCHAR(8), DateAdd(yy, -3, GetDate()), 112));
	   
----------------------------------------------------------------------------------------------------------------------------------------------------

--CCSettles

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
USE DisneyParks_Reporting;

DECLARE @StartDate char(8);
DECLARE @EndDate char(8);

SET @StartDate = '20240728';
SET @EndDate = '20240824';

select AVCOM#, count(avent#) AS 'avent#'
from aracvrav
where avpypd between @StartDate and @EndDate and avpmtt<>'21C' AND AVPMTT<>'21D' AND AVSTSF='4' AND AVCOM# in ('025','021')
Group By AVCOM#;	   
