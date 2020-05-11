SELECT 
    f.IDFactura,
    tf.TipoFactura
     
FROM pFacturas.Factura as f
INNER JOIN pFacturas.TipoFactura as tf
ON f.TipoFactura = tf.IDTipoFactura
INNER JOIN 

select *from pFactura.Proveedores