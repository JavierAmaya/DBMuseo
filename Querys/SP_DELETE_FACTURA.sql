CREATE PROCEDURE pFacturas.SP_DELETE_FACTURA
    @IDFactura int
AS

DECLARE @existe  INT = (SELECT COUNT(*) as N FROM pFacturas.FacturaCliente where IDFactura = @IDFactura)
IF @existe > 0 BEGIN
    SELECT 0  as successed, 'Esta Factura tiene un cliente relacionado' as MSG
END ELSE BEGIN    
    DELETE FROM myExample.Suppliers 
    WHERE SupplierID = @SupplierID

    SELECT 1 as successed, 'Tu registro fue Eliminado' as MSG
END   

select *from pFacturas.FacturaCliente