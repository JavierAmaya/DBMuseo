EXEC pFacturas.SP_CREATE_FACTURA
@IDFactura = 6,
@FechaCreacion = '2020-06-12',
@FechaLimite = '2020-07-12',
@IDEmpleado = 1,
@TipoFactura =1
@IDCliente=1
@Productos = [{1,1},{2,1}]


SELECT *From pFacturas.Factura
select *from pFacturas.DetalleFactura

EXEC pFacturas.SP_CREATE_DETALLEFACTURA
@IDDetalleFactura = 60,
@IDFactura = 92,
@IDProducto = 1,
@Cantidad = 10