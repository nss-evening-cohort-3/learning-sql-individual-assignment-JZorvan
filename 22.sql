-- 22. Provide a query that shows the # of customers assigned to each sales agent.

SELECT Employee.FirstName || ' ' || Employee.LastName AS 'Sales Agent', (SELECT COUNT (Customer.SupportRepId)) AS 'Number of Customers' FROM Employee, Customer
WHERE Employee.EmployeeId = Customer.SupportRepId
GROUP BY Employee.LastName;
