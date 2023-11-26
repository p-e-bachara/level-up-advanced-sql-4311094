SELECT
   E.employeeId
  ,E.firstName
  ,E.lastName
  ,COUNT(S.salesId) AS carsSold
  ,MIN(S.salesAmount) AS cheapestCarSold
  ,MAX(S.salesAmount) AS mostExpensiveCarSold
  ,SUM(S.salesAmount) AS totalSalesValue
FROM employee E 
LEFT OUTER JOIN sales S 
  ON S.employeeId = E.employeeId
WHERE E.title = 'Sales Person'
  AND S.soldDate >= date('now', 'start of year')
GROUP BY E.employeeId
ORDER BY totalSalesValue DESC;