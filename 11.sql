-- 1. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.

SELECT InvoiceId AS 'Invoice ID#', (SELECT COUNT (InvoiceLineId)) AS 'Number of Line Items'
FROM InvoiceLine
GROUP BY InvoiceId;
