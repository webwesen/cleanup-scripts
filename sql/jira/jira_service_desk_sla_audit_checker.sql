-- If you have a huge number of customisation
-- with scripts, SQL scripts to SLA you can meet with inconsistency

SELECT SLA_AUDIT_LOG_ID
FROM AO_54307E_SLAAUDITLOGDATA
HAVING COUNT(SLA_AUDIT_LOG_ID) > 1;

SELECT *
FROM AO_54307E_SLAAUDITLOGDATA
WHERE SLA_AUDIT_LOG_ID IN (SELECT SLA_AUDIT_LOG_ID
			   FROM AO_54307E_SLAAUDITLOGDATA
			   GROUP BY SLA_AUDIT_LOG_ID
			   HAVING COUNT(SLA_AUDIT_LOG_ID) > 1);