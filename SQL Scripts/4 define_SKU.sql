ALTER TABLE stocks  -- table name, here "stocks"
ADD COLUMN SKU VARCHAR; --naming the column as SKU

-- updating the column with set values 
UPDATE stocks
-- eg if the product is East S001 P0003 Clothing, the SKU code shows E-S1-P03-Clo
SET SKU = LEFT(region, 1) || '-' || 'S' ||CAST(CAST(SUBSTRING(store_id FROM 2) AS INTEGER)AS TEXT)|| '-' || 
'P' || LPAD(CAST(CAST(SUBSTRING(product_id FROM 2) AS INTEGER)AS TEXT), 2, '0') || '-' || LEFT(category, 3);