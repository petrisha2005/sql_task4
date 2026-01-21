>SELECT 
    i.InvoiceId,
    c.FirstName,
    c.LastName,
    c.Country,
    i.InvoiceDate,
    i.Total
FROM Invoice i
INNER JOIN Customer c
    ON i.CustomerId = c.CustomerId;

>SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country,
    i.InvoiceId
FROM Customer c
LEFT JOIN Invoice i
    ON c.CustomerId = i.CustomerId;

>SELECT 
    t.Name AS Product,
    SUM(il.UnitPrice * il.Quantity) AS Total_Revenue
FROM InvoiceLine il
INNER JOIN Track t
    ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY Total_Revenue DESC;


>SELECT 
    g.Name AS Category,
    SUM(il.UnitPrice * il.Quantity) AS Category_Revenue
FROM InvoiceLine il
INNER JOIN Track t ON il.TrackId = t.TrackId
INNER JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Category_Revenue DESC;


>SELECT 
    c.Country,
    SUM(i.Total) AS Total_Sales
FROM Invoice i
INNER JOIN Customer c
    ON i.CustomerId = c.CustomerId
WHERE c.Country = 'USA'
AND substr(i.InvoiceDate,1,4) BETWEEN '2021' AND '2025'
GROUP BY c.Country;
\
\
}
