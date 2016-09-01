-- 21. Which sales agent made the most in sales over all?

SELECT Employee.FirstName || ' ' || Employee.LastName AS 'Sales Rep' FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
WHERE Invoice.InvoiceDate
GROUP BY Employee.LastName ORDER BY SUM (Invoice.Total) DESC LIMIT 1;
