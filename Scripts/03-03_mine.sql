SELECT EngineType, count(salesAmount) as totalVolume, sum(salesAmount) as totalAmount
FROM sales
JOIN inventory
  ON sales.inventoryId = inventory.inventoryId
JOIN model
  ON inventory.modelId = model.modelId
WHERE model.EngineType IN ('Electric')
GROUP BY model.EngineType;