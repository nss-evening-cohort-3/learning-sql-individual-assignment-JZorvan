-- 8. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT Invoice.Total, Customer.FirstName, Customer.LastName, Customer.Country, Employee.FirstName, Employee.LastName
FROM Employee, Customer
INNER JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
WHERE Employee.EmployeeId = Customer.SupportRepId;
