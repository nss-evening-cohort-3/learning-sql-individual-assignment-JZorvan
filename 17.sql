-- 17. Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT Invoice.*, (SELECT COUNT (InvoiceLine.InvoiceId)) AS '# of Line Items' FROM Invoice
JOIN InvoiceLine WHERE Invoice.InvoiceId = InvoiceLine.InvoiceId
GROUP BY Invoice.InvoiceId;
