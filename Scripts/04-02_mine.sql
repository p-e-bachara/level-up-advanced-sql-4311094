SELECT
  month
  ,totalAmount
  ,sum(totalAmount) OVER (order by month) AS runningTotalAmount
FROM (
  SELECT 
    strftime('%Y-%m', sales.soldDate) AS month
    ,round(sum(sales.salesAmount),2) AS totalAmount
  FROM sales
  GROUP BY month
  ORDER BY month
)
ORDER BY month;