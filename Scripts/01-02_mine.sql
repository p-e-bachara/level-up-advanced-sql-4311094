SELECT 
   E.firstName
  ,E.lastName
  ,E.title
  ,S.salesAmount AS  totalSales
FROM employee E 
LEFT OUTER JOIN sales S
  ON S.employeeId = E.employeeId
WHERE E.title = 'Sales Person'
  AND S.salesAmount IS NULL;


SELECT 
   E.firstName
  ,E.lastName
  ,E.title
  ,SUM(S.salesAmount) AS totalSales
FROM employee E 
LEFT OUTER JOIN sales S
  ON S.employeeId = E.employeeId
WHERE E.title = 'Sales Person'
GROUP BY E.employeeId
HAVING totalSales IS NULL;