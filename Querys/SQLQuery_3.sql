WITH ventasProveedor AS (
    SELECT 
        p.ProveedorID,
        YEAR(OrderDate) as anio,
        MONTH(OrderDate) as mes,
        sum(p.RentalPrice*0.15) as Ganancia
    FROM museo.Orden AS o
    INNER JOIN museo.OrderDetails AS od
    ON o.OrdenID = od.OrdenID
    INNER JOIN museo.Obras AS p
    ON od.ObraID = p.ObraID
    GROUP BY 
        p.ProveedorID,
        YEAR(OrderDate),
        MONTH(OrderDate)
), [TIME] AS (
SELECT DISTINCT vp.mes , vp.anio 
FROM ventasProveedor as vp )
SELECT p.ProveedorID,p.ProveedorName,
    tm.mes,
    tm.anio,
    isnull(vp.Ganancia,0) as Ganancia
FROM museo.Proveedores as p
INNER JOIN [TIME] as tm
ON 1=1
LEFT JOIN ventasProveedor as vp 
ON p.ProveedorID = vp.ProveedorID
    AND tm.mes = vp.mes AND tm.anio = vp.anio
ORDER BY p.ProveedorID