SELECT Customer.FirstName, Customer.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
FROM Customer
INNER JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
WHERE Customer.Country = 'Brazil';
