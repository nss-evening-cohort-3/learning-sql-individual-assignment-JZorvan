-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT COUNT (InvoiceLineId) AS '# of line items for Invoice 37' FROM InvoiceLine WHERE InvoiceId = 37;

Answer:  4;
