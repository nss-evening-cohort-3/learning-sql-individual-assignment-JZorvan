-- 9. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?

SELECT COUNT (InvoiceDate) FROM Invoice WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31';
Answer:  249

SELECT SUM (Total) FROM Invoice WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';
Answer:  $449.46

SELECT SUM (Total) FROM Invoice WHERE InvoiceDate BETWEEN '2010-01-01' AND '2010-12-31';
Answer:  $481.45

SELECT SUM (Total) FROM Invoice WHERE InvoiceDate BETWEEN '2011-01-01' AND '2011-12-31';
Answer:  $469.58
