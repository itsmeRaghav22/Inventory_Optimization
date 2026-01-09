CREATE TABLE stock_normalized AS
SELECT 
	sku,
    Inventory_Level,
    Units_Sold,

    -- Min-Max Normalization using values
    (Inventory_Level - 50) / 450.0 AS Inventory_Level_Normalized,
    (Units_Sold) / 499.0 AS Units_Sold_Normalized,
	(price - 10) / 90.0 AS Price_Normalized

FROM stocks;
