WITH daily_sales AS (
  SELECT 
    "date",
	"inventory_level",
	"sku",
    SUM("units_sold") AS daily_units_sold
  FROM stocks
  GROUP BY "sku", "inventory_level","date"
),
stats AS (
  SELECT 
    "sku",
    AVG(daily_units_sold) AS avg_daily_usage,
    STDDEV(daily_units_sold) AS stddev_usage
  FROM daily_sales
  GROUP BY "sku"
)
SELECT 
  "sku",
  avg_daily_usage,
  stddev_usage,
  1 AS lead_time_days,
  CEIL((avg_daily_usage * 1) + (1.28 * stddev_usage)) AS reorder_point
FROM stats;
