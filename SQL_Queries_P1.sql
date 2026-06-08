

-- query1: Delay rate by shipping mode: --

SELECT shipping_mode,
       COUNT(*) AS total_orders,
       SUM(CASE WHEN delivery_status = 'Late delivery' THEN 1 ELSE 0 END) AS late_orders,
       ROUND(100.0 * SUM(CASE WHEN delivery_status = 'Late delivery' 
             THEN 1 ELSE 0 END) / COUNT(*), 2) AS delay_rate_pct
FROM DataCoSupplyChainDataset
GROUP BY shipping_mode
ORDER BY delay_rate_pct DESC;



-- Query 2 — Delay rate by region: --

SELECT order_region,
      COUNT(*) AS total_orders,
      ROUND(100.0 * SUM(CASE WHEN delivery_status = 'Late Delivery'
      THEN 1 ELSE 0 END)/ COUNT (*), 2) AS delay_rate_pct
FROM DataCoSupplyChainDataset
GROUP BY Order_Region
ORDER BY delay_rate_pct DESC;


-- Query 3 — Financial impact of delays: --

SELECT delivery_status,
      COUNT(*) AS Orders,
      ROUND(SUM(sales), 2) AS total_revenue,
      ROUND(AVG(order_profit_per_order), 2) AS order_profit
FROM DataCoSupplyChainDataset
GROUP BY Delivery_Status;



--Query 4 — Top product categories with delays: --

SELECT category_name,
     COUNT (*) AS total_orders,
     ROUND(100.0 * SUM(CASE WHEN delivery_status = 'Late Delivery'
     THEN 1 ELSE 0 END) / COUNT (*), 2) AS delay_rate_pct
FROM DataCoSupplyChainDataset
GROUP BY Category_Name
ORDER BY delay_rate_pct;