--Server: I3PrdDB
--Database: I3_Prod_1

--Query:

select CustomString2 as DNIS,RemoteNumber,count(*) 
from [dbo].[calldetail_viw]
where CustomString2 
    in (select dnis from IVRPrdDB.ALTA_IVR.[dbo].[JNJ_CTI_DNIS_Lookup])
    and [I3TimeStampGMT] > '2018-07-01'
group by CustomString2,RemoteNumber
