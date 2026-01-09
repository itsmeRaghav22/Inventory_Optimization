CREATE TABLE stocks_normalized AS
SELECT 
    sku,

    -- Min-Max Normalization with FLOAT casts
    (Inventory_Level::FLOAT - min_IL.min_val::FLOAT) / NULLIF((max_IL.max_val::FLOAT - min_IL.min_val::FLOAT), 0) AS Inventory_Level_Normalized,

    (Units_Sold::FLOAT - min_US.min_val::FLOAT) / NULLIF((max_US.max_val::FLOAT - min_US.min_val::FLOAT), 0) AS Units_Sold_Normalized,

    (Price::FLOAT - min_P.min_val::FLOAT) / NULLIF((max_P.max_val::FLOAT - min_P.min_val::FLOAT), 0) AS Price_Normalized

FROM stocks

CROSS JOIN (SELECT MIN(Inventory_Level) AS min_val FROM stocks) AS min_IL
CROSS JOIN (SELECT MAX(Inventory_Level) AS max_val FROM stocks) AS max_IL
CROSS JOIN (SELECT MIN(Units_Sold) AS min_val FROM stocks) AS min_US
CROSS JOIN (SELECT MAX(Units_Sold) AS max_val FROM stocks) AS max_US
CROSS JOIN (SELECT MIN(Price) AS min_val FROM stocks) AS min_P
CROSS JOIN (SELECT MAX(Price) AS max_val FROM stocks) AS max_P;
