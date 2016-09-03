-- 23. Provide a query that shows the total sales per country. Which country's customers spent the most?

SELECT Customer.Country, (SELECT SUM (Invoice.Total)) AS 'Total Sales' FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Customer.Country;
