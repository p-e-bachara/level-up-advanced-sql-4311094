SELECT
   E.employeeId
  ,E.firstName
  ,E.lastName
  ,COUNT(S.salesId) AS carsSold
FROM employee E 
LEFT OUTER JOIN sales S 
  ON S.employeeId = E.employeeId
GROUP BY E.employeeId
ORDER BY carsSold DESC;

SELECT
   E.employeeId
  ,E.firstName
  ,E.lastName
  ,COUNT(S.salesId) AS carsSold
FROM employee E 
LEFT OUTER JOIN sales S 
  ON S.employeeId = E.employeeId
WHERE E.title = 'Sales Person'
GROUP BY E.employeeId
ORDER BY carsSold DESC;

SELECT
   ROW_NUMBER() OVER (ORDER BY NULL) AS "No."
  ,DENSE_RANK() OVER (ORDER BY COUNT(S.salesId) DESC) AS salesRanking
  ,E.employeeId
  ,E.firstName
  ,E.lastName
  ,COUNT(S.salesId) AS carsSold
FROM employee E 
LEFT OUTER JOIN sales S 
  ON S.employeeId = E.employeeId
WHERE E.title = 'Sales Person'
GROUP BY E.employeeId
ORDER BY carsSold DESC;