ALTER PROCEDURE pFacturas.SP_CREATE_DETALLEFACTURA
    @IDFactura INT,
    @IDProducto INT,
    @Cantidad INT

AS
  
INSERT INTO pFacturas.DetalleFactura
VALUES (@IDFactura, @IDProducto, @Cantidad)
SELECT 1 as successed, 'Tu registro fue almacenado' as MSG

