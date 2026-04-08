SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT sp.sales_id
    FROM SalesPerson sp
    JOIN Orders o ON sp.sales_id = o.sales_id
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);