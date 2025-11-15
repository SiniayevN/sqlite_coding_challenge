--TASK 1

SELECT
  c.first_name || ' ' || c.last_name AS customer_name,
  SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
JOIN orders o
  ON o.customer_id = c.id
JOIN order_items oi
  ON oi.order_id = o.id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;

--TASK 2

SELECT
  p.category,
  SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
  ON p.id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

--TASK 3

SELECT
  e.first_name,
  e.last_name,
  d.name AS department_name,
  e.salary,
  (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
  ) AS department_avg_salary
FROM employees e
JOIN departments d
  ON d.id = e.department_id
WHERE e.salary >
  (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
  )
ORDER BY
  department_name,
  e.salary DESC;

