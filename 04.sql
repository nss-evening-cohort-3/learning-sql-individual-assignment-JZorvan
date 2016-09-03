-- 4. Provide a query showing only the Employees who are Sales Agents.

SELECT LastName || ", " || FirstName AS 'Sales Agents' FROM Employee WHERE Title = 'Sales Support Agent';

