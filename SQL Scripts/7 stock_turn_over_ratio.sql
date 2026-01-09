WITH stock_turnover AS (
  SELECT 
    "sku",
    SUM("units_sold") / NULLIF(AVG("inventory_level"), 0) AS stock_turnover_ratio
  FROM stocks
  GROUP BY "sku"
),
min_max AS (
  SELECT 
    MIN(stock_turnover_ratio) AS min_val,
    MAX(stock_turnover_ratio) AS max_val
  FROM stock_turnover
)
SELECT 
  s."sku",
  s.stock_turnover_ratio,
  (s.stock_turnover_ratio - m.min_val) / NULLIF((m.max_val - m.min_val), 0) AS stock_turnover_normalized
FROM stock_turnover s
CROSS JOIN min_max m;
