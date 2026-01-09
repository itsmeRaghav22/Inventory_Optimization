-- creating a new table that contains the average sales and safety stock of all sku.
CREATE TABLE Mean_cum_Safety_Stock AS
SELECT 
    sku,
    -- finding the average of demand forecast for certain SKU
		CEIL(AVG(demand_forecast)) AS mean_demand_forecast,
		
    -- finding mean of units sold 
		CEIL(AVG(units_sold)) AS mean_units_sold,
		
    -- standard deviation of demand_forecast
		CEIL(STDDEV_POP(demand_forecast)) AS stddev_demand_forecast,

	-- standard deviation of units sold 
		CEIL(STDDEV_POP(units_sold)) AS stddev_units_sold
		
--CEIL function is used here to approximate to nearest greatest integer
	
FROM stocks -- table name
GROUP BY sku;





