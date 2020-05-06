ALTER VIEW myExample.ViewSuppliersByproducts
as 
SELECT 
    s.SupplierID,
    SupplierName,
    COUNT(ProductID) as number_products
FROM myExample.Suppliers as s
LEFT JOIN myExample.Products as p 
ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID,
        SupplierName