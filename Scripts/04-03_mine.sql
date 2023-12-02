
SELECT 
  strftime('%Y-%m', sales.soldDate) AS month
  ,count(sales.salesAmount) AS salesCount
  ,LAG ( count(sales.salesAmount), 1, 0 ) OVER ( ORDER BY strftime('%Y-%m', sales.soldDate) ) AS PreviousMonthTotal
FROM sales
GROUP BY month
ORDER BY month
;

SELECT 
  strftime('%Y-%m', sales.soldDate) AS month
  ,count(sales.salesAmount) AS salesCount
  ,LAG ( count(sales.salesAmount), 1, 0 ) OVER calMonth AS PreviousMonthTotal
FROM sales
GROUP BY month
WINDOW calMonth AS ( ORDER BY strftime('%Y-%m', sales.soldDate) )
ORDER BY month
;