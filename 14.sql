-- 14. Provide a query that shows the # of invoices per country.

SELECT BillingCountry AS 'Country', (SELECT COUNT (BillingCountry)) AS '# of Invoices'
FROM Invoice
GROUP BY BillingCountry;
