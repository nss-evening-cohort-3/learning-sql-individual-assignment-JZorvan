-- 7. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT Employee.LastName || ', ' || Employee.FirstName AS 'Sales Agent', Invoice.*
FROM Employee, Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
WHERE Employee.EmployeeId = Customer.SupportRepId
ORDER BY Employee.LastName;
