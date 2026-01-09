ALTER TABLE Mean_cum_Safety_stock
ADD COLUMN safety_stock;

UPDATE Mean_cum_Safety_stock -- updating table 
SET safety_stock = CEIL(1.65 * stddev_demand_forecast) ; -- placing values

SELECT * FROM Mean_cum_Safety_stock 