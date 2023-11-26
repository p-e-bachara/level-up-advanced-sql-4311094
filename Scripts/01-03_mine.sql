SELECT *
FROM sales S
FULL OUTER JOIN customer C 
  ON C.customerId = S.customerId;
  

SELECT *
FROM sales S
FULL OUTER JOIN customer C 
  ON C.customerId = S.customerId
WHERE C.customerId IS NULL OR S.customerId IS NULL;