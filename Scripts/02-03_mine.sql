SELECT
   E.employeeId
  ,E.firstName
  ,E.lastName
  ,COUNT(S.salesId) AS carsSold
FROM employee E 
LEFT OUTER JOIN sales S 
  ON S.employeeId = E.employeeId
WHERE E.title = 'Sales Person'
  AND S.soldDate >= date('now', 'start of year')
GROUP BY E.employeeId
HAVING carsSold > 5
ORDER BY carsSold DESC;