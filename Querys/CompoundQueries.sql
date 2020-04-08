-----cuales son las 5 obras mas demandadas
SELECT TOP 5 
    o.ObraName,
    COUNT(od.ObraID) AS ConteoProductos
FROM museo.OrderDetails as od
INNER JOIN museo.Obras as o
ON od.ObraID = o.ObraID
GROUP BY  o.ObraName
ORDER BY COUNT(o.ObraName) DESC

-----select top 5 clientes mas frecuentes
SELECT TOP 5 
    c.ClienteName,
    COUNT(o.ClienteID) AS OrdenesHechas
FROM museo.Orden as o
INNER JOIN museo.Cliente as c
ON o.ClienteID = c.ClienteID
GROUP BY  c.ClienteName
ORDER BY COUNT(o.ClienteID) DESC

-----nombres de proveedores con mas obras registradas
SELECT 
    p.ProveedorName,
    COUNT(o.ProveedorID) as ObrasRegistradas
FROM museo.Obras as o 
INNER JOIN museo.Proveedores as p
ON o.ProveedorID = p.ProveedorID
GROUP BY p.ProveedorName
ORDER BY COUNT(o.ProveedorID) DESC

----- obra , anio , trimestre , numero de veces alquilado

SELECT 
    obr.ObraName,
    YEAR(OrderDate) as anio,
    CASE 
        WHEN MONTH(OrderDate) >= 1 AND MONTH(OrderDate) <=3 THEN '1er Trimestre'
        WHEN MONTH(OrderDate) >= 4 AND MONTH(OrderDate) <=6 THEN '2do Trimestre'
        WHEN MONTH(OrderDate) >= 7 AND MONTH(OrderDate) <=9 THEN '3er Trimestre'
        ELSE '4to Trimestre'
    END AS Quarter,
    COUNT(od.ObraID) as VecesAlquilada
FROM museo.OrderDetails as od
INNER JOIN museo.Obras as obr 
ON od.ObraID = obr.ObraID
INNER JOIN museo.Orden as o 
ON od.OrdenID = o.OrdenID
GROUP BY   
    obr.ObraName,
    YEAR(OrderDate),
    CASE 
        WHEN MONTH(OrderDate) >= 1 AND MONTH(OrderDate) <=3 THEN '1er Trimestre'
        WHEN MONTH(OrderDate) >= 4 AND MONTH(OrderDate) <=6 THEN '2do Trimestre'
        WHEN MONTH(OrderDate) >= 7 AND MONTH(OrderDate) <=9 THEN '3er Trimestre'
        ELSE '4to Trimestre'
    END
ORDER BY  
    CASE 
        WHEN MONTH(OrderDate) >= 1 AND MONTH(OrderDate) <=3 THEN '1er Trimestre'
        WHEN MONTH(OrderDate) >= 4 AND MONTH(OrderDate) <=6 THEN '2do Trimestre'
        WHEN MONTH(OrderDate) >= 7 AND MONTH(OrderDate) <=9 THEN '3er Trimestre'
        ELSE '4to Trimestre'
    END

------cliente, año , semestre, ordenes realizadas

SELECT
    c.ClienteName,
    YEAR(o.OrderDate) as anio,
    CASE 
        WHEN MONTH(OrderDate) >= 1 AND MONTH(OrderDate) <=6 THEN '1er Semestre'
        ELSE '2do Semestre'
    END as Semestre,
    COUNT(o.OrdenID) as OrdenesRealizadas
FROM museo.Cliente as c 
INNER JOIN museo.Orden as o
ON c.ClienteID = o.ClienteID
GROUP BY 
    c.ClienteName,
    YEAR(o.OrderDate),
    CASE 
        WHEN MONTH(OrderDate) >= 1 AND MONTH(OrderDate) <=6 THEN '1er Semestre'
        ELSE '2do Semestre'
    END
ORDER BY YEAR(o.OrderDate)

------ para un año en especifico y todas las obras 
WITH Obras_Alquiladas AS (
    SELECT 
        obr.ObraName,
        MONTH(OrderDate) as mes,
        COUNT(od.ObraID) as VecesAlquilada
    FROM museo.OrderDetails as od
    INNER JOIN museo.Obras as obr 
    ON od.ObraID = obr.ObraID
    INNER JOIN museo.Orden as o 
    ON od.OrdenID = o.OrdenID
    WHERE YEAR(OrderDate) = 2019
    GROUP BY   
        obr.ObraName,
        MONTH(OrderDate)
)
SELECT o.ObraName,isnull(oa.mes,0) as Meses, isnull(oa.VecesAlquilada,0) AS VecesAlquilada
FROM museo.Obras AS o
LEFT JOIN Obras_Alquiladas  as oa
ON o.ObraName = oa.ObraName
ORDER BY oa.mes

------ 15% de la renta de una obra es del proveedor 
WITH Obras_Alquiladas AS (
    SELECT 
        obr.ObraName,
        obr.ProveedorID,
        MONTH(OrderDate) as mes,
        YEAR(OrderDate) as anio,
        SUM(obr.RentalPrice*0.15) as Ganancia
    FROM museo.OrderDetails as od
    INNER JOIN museo.Obras as obr 
    ON od.ObraID = obr.ObraID
    INNER JOIN museo.Orden as o 
    ON od.OrdenID = o.OrdenID
    GROUP BY   
        obr.ObraName,
        obr.ProveedorID,
        MONTH(OrderDate),
        YEAR(OrderDate)
)
SELECT 
    p.ProveedorName,
    oa.anio,
    isnull(oa.mes,0) as Meses,
    isnull(oa.Ganancia,0) AS Ganancia
FROM museo.Proveedores AS p
LEFT JOIN Obras_Alquiladas  as oa
ON p.ProveedorID = oa.ProveedorID
ORDER BY oa.mes
