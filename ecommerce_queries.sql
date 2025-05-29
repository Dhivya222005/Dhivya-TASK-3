
-- 1️⃣ Preview the Table
SELECT *
FROM `tidal-shield-457315-c3.ecommerce_dataset.transactions`
LIMIT 10;


-- 2️⃣ SELECT with WHERE & ORDER BY
SELECT *
FROM `tidal-shield-457315-c3.ecommerce_dataset.transactions`
WHERE revenue > 1000
ORDER BY revenue DESC;


-- 3️⃣ GROUP BY (total revenue by product)
SELECT
  product,
  SUM(revenue) AS total_revenue
FROM
  `tidal-shield-457315-c3.ecommerce_dataset.transactions`
GROUP BY
  product
ORDER BY
  total_revenue DESC;


-- 4️⃣ Subquery for Top Customer by revenue
SELECT *
FROM `tidal-shield-457315-c3.ecommerce_dataset.transactions`
WHERE customer_id = (
  SELECT customer_id
  FROM `tidal-shield-457315-c3.ecommerce_dataset.transactions`
  GROUP BY customer_id
  ORDER BY SUM(revenue) DESC
  LIMIT 1
);


-- 5️⃣ Aggregate Function: Average revenue
SELECT
  AVG(revenue) AS avg_revenue
FROM
  `tidal-shield-457315-c3.ecommerce_dataset.transactions`;


-- 6️⃣ Create View for top products analysis
CREATE OR REPLACE VIEW `tidal-shield-457315-c3.ecommerce_dataset.top_products_view` AS
SELECT
  product,
  SUM(revenue) AS total_revenue
FROM
  `tidal-shield-457315-c3.ecommerce_dataset.transactions`
GROUP BY
  product
ORDER BY
  total_revenue DESC;
