SELECT 
        f.IDFactura,
        tf.TipoFactura,
        f.FechaCreacion,
        f.FechaLimite,
        c.NombreCliente
FROM pFacturas.Factura as f
INNER JOIN pFacturas.TipoFactura as tf
ON f.TipoFactura = tf.IDTipoFactura
INNER JOIN pFacturas.FacturaCliente as fc
ON f.IDFactura = fc.IDFactura
LEFT JOIN pFacturas.Cliente as c
ON fc.IDCliente = c.IDCliente
GROUP BY f.IDFactura,
        tf.TipoFactura,
        f.FechaCreacion,
        f.FechaLimite,
        c.NombreCliente


        