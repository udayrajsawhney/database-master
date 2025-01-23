-- Write your PostgreSQL query statement below
Select b.product_name, a.year, a.price
FROM Sales a
         LEFT JOIN Product b
                   on a.product_id = b.product_id;