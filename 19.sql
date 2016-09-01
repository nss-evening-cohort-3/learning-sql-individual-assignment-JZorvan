-- 19. Which sales agent made the most in sales in 2009?
-- Fuck MAX, man.  Fuck it.

SELECT Employee.FirstName || ' ' || Employee.LastName AS 'Sales Rep' FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
WHERE Invoice.InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31'
GROUP BY Employee.LastName ORDER BY SUM (Invoice.Total) DESC LIMIT 1;


