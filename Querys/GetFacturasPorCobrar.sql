SELECT 
        f.IDFactura,
        tf.Nombre,
        f.FechaCreacion,
        f.FechaLimite,
        c.NombreCliente
FROM pFacturas.Factura as f
INNER JOIN pFacturas.TipoFactura as tf
ON f.TipoFactura = tf.TipoFactura
INNER JOIN pFacturas.FacturaCliente as fc
ON f.IDFactura = fc.IDFactura
LEFT JOIN pFacturas.Cliente as c
ON fc.IDCliente = c.IDCliente
GROUP BY f.IDFactura,
        tf.Nombre,
        f.FechaCreacion,
        f.FechaLimite,
        c.NombreCliente

SELECT *FROM pFacturas.Factura

ALTER TABLE pFacturas.TipoFactura
ADD Descripcion NVARCHAR(MAX);

CREATE TABLE pFacturas.TipoFactura(
IDTipoFactura INT NOT NULL PRIMARY KEY,
Nombre NVARCHAR (200),
Descripcion NVARCHAR(MAX)
)

SELECT *from pFacturas.TipoFactura

ALTER TABLE pFacturas.TipoFactura
DROP COLUMN Descripcion;

SELECT * from pFacturas.TipoFactura
ALTER TABLE pFacturas.Factura
ADD FOREIGN KEY(TipoFactura) REFERENCES pFacturas.TipoFactura(IDTipoFactura)
