CREATE PROCEDURE pFacturas.SP_CREATE_PRODUCTO
    @NameProducto NVARCHAR(200),
    @Descripcion NVARCHAR(max),
    @IDProveedor INT,
    @IDCategoria INT,
    @ValorCompra INT,
    @ValorVenta INT
AS

INSERT INTO pFacturas.Producto
VALUES (@NameProducto, @Descripcion, @IDProveedor, @IDCategoria, @ValorCompra, @ValorVenta)
SELECT 1 as successed, 'Tu registro fue almacenado' as MSG

SELECT *from pFacturas.DetalleFactura