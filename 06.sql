-- 6. Provide a query showing the invoices of customers who are from Brazil.

SELECT Customer.FirstName || ' ' || Customer.LastName AS 'Customer', Invoice.*
FROM Customer
INNER JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
WHERE Customer.Country = 'Brazil';
