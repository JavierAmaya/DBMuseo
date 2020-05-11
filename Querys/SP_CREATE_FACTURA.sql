ALTER PROCEDURE pFacturas.SP_CREATE_FACTURA
    @FechaCreacion date,
    @FechaLimite date,
    @IDEmpleado int,
    @TipoFactura int,
    @IDCliente INT

AS
DECLARE @UltimoID  INT = (SELECT COUNT(*) as N FROM pFacturas.Factura)
DECLARE @IDFactura INT = @UltimoID+1
INSERT INTO pFacturas.Factura
VALUES (@FechaCreacion, @FechaLimite, @IDEmpleado, @TipoFactura)
IF @TipoFactura = 1  BEGIN
    INSERT INTO pFacturas.FacturaCliente 
    VALUES(@IDFactura,@IDCliente)
END 
SELECT 1 as successed, 'Tu registro fue almacenado' as MSG , @IDFactura as IDFactura


SELECT *from pFacturas.DetalleFactura