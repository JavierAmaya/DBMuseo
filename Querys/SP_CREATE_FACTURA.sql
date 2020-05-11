ALTER PROCEDURE pFacturas.SP_CREATE_FACTURA
    @IDFactura int,
    @FechaCreacion date,
    @FechaLimite date,
    @IDEmpleado int,
    @TipoFactura int
AS

DECLARE @existe  INT = (SELECT COUNT(*) as N FROM pFacturas.Factura where IDFactura = @IDFactura )
IF @existe > 0 BEGIN
    SELECT 0  as successed, 'El ID de la factura que intenta crear ya esta ocupado' as MSG
END ELSE BEGIN    
    INSERT INTO pFacturas.Factura
    VALUES (@IDFactura, @FechaCreacion, @FechaLimite, @IDEmpleado, @TipoFactura)
    SELECT 1 as successed, 'Tu registro fue almacenado' as MSG , @IDFactura as IDFactura
END    