SELECT 
  sku, 
  AVG("inventory_level_normalized") AS avg_inventory,
  AVG("units_sold_normalized") AS avg_sales
FROM stock_normalized
GROUP BY  "sku"
HAVING AVG("inventory_level_normalized") > 2 * AVG("units_sold_normalized");
