--sp_InsertCCUIResponse

CREATE OR REPLACE PROCEDURE PMTPROCDEV/CCUISPRSP
(
    IN COMPANYCODE CHAR(3),
    IN ENTITYNUMBER CHAR(8),
    IN JOBNUMBER NUMERIC(6,0),
    IN XMLRESPONSE VARCHAR(5000)
)

LANGUAGE SQL
MODIFIES SQL DATA

BEGIN

        IF NOT EXISTS(SELECT 1 FROM ALCCURSP WHERE "CRCOM#" = COMPANYCODE AND "CRENT#" = ENTITYNUMBER AND "CRJOB#" = JOBNUMBER) THEN

                INSERT INTO ALCCURSP
                (
                        "CRCOM#", "CRENT#", "CRJOB#", CRXML
                )
                VALUES
                (
                        COMPANYCODE, ENTITYNUMBER, JOBNUMBER, XMLRESPONSE
                );

                COMMIT;

    ELSE

                UPDATE ALCCURSP
                SET CRXML = XMLRESPONSE
                WHERE "CRCOM#" = COMPANYCODE AND "CRENT#" = ENTITYNUMBER AND "CRJOB#" = JOBNUMBER;

                COMMIT;

        End IF;

END;
COMMIT; 