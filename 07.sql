-- 7. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT Employee.FirstName, Employee.LastName, Invoice.*
FROM Employee, Customer
INNER JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
WHERE Employee.EmployeeId = Customer.SupportRepId;
