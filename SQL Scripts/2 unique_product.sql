SELECT
store_id,
product_id,
category,
region,
inventory_level,
demand_forecast
FROM stocks
WHERE
-- first locating a unique store
(
	(region = 'region') -- enter your desired region
		AND
	(sore_id = 'sid') -- sid = your desired store_id
)
-- now product & category
AND
(product_id = 'pid') -- pid = your desired product_id
AND
(category = 'category') -- category = your desired category 