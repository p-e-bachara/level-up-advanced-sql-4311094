SELECT 
    strftime('%Y', soldDate) AS year
  , count(salesAmount) AS totalSalesCount
  , round(sum(salesAmount),2) AS totalSalesAmount
FROM sales
GROUP BY year
ORDER BY year DESC
;