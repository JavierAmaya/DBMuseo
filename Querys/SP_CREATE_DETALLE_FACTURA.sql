CREATE PROCEDURE pFacturas.SP_CREATE_DETALLEFACTURA
    @IDDetalleFactura INT ,
    @IDFactura INT,
    @IDProducto INT,
    @Cantidad INT

AS

DECLARE @existe  INT = (SELECT COUNT(*) as N FROM pFacturas.DetalleFactura where IDDetalleFactura = @IDDetalleFactura)
IF @existe > 0 BEGIN
    SELECT 0  as successed, 'El ID enviado ya existe' as MSG
END ELSE BEGIN    
    INSERT INTO pFacturas.DetalleFactura
    VALUES (@IDDetalleFactura, @IDFactura, @IDProducto, @Cantidad)
    SELECT 1 as successed, 'Tu registro fue almacenado' as MSG
END    

SELECT * FROM pFacturas.Factura