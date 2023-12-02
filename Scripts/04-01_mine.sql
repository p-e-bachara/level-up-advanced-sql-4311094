SELECT 
  employee.lastName || ' ' || employee.firstName as name
  ,dense_rank() OVER ( PARTITION BY sales.employeeId ORDER BY count(salesAmount) DESC ) as rank
  ,model.model
  ,count(salesAmount) AS numberSold
FROM sales
JOIN inventory
  ON sales.inventoryId = inventory.inventoryId
JOIN model
  ON inventory.modelId = model.modelId
JOIN employee
  ON sales.employeeId = employee.employeeId
GROUP BY sales.employeeId, model.model;