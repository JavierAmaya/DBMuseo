/*Empleado  => TipoEmpleado*/
ALTER TABLE pFacturas.Empleado
ADD FOREIGN KEY(IDTipoEmpleado) REFERENCES pFacturas.TipoEmpleado(IDTipoEmpleado)


/*Producto => Proveedor*/
ALTER TABLE pFacturas.Producto
ADD FOREIGN KEY(IDProveedor) REFERENCES pFacturas.Proveedor(IDProveedor)



/*Producto => Categoria*/
ALTER TABLE pFacturas.Producto
ADD FOREIGN KEY(IDCategoria) REFERENCES pFacturas.Categoria(IDCategoria)


/*Factura => Empleado*/
ALTER TABLE pFacturas.Factura
ADD FOREIGN KEY(IDEmpleado) REFERENCES pFacturas.Empleado(IDEmpleado)

/* Factura => TipoFactura*/
ALTER TABLE pFacturas.Factura
ADD FOREIGN KEY(TipoFactura) REFERENCES pFacturas.TipoFactura(IDTipoFactura)



/*FacturaCliente => Cliente*/
ALTER TABLE pFacturas.FacturaCliente
ADD FOREIGN KEY(IDCliente) REFERENCES pFacturas.Cliente(IDCliente)

ALTER TABLE pFacturas.FacturaCliente
ADD FOREIGN KEY (IDFactura) REFERENCES pFacturas.Factura(IDFactura)



/*DetalleFactura    =>  Factura*/
ALTER TABLE pFacturas.DetalleFactura
ADD FOREIGN KEY(IDFactura) REFERENCES pFacturas.Factura(IDFactura)


/*DetalleFactura    =>  Producto*/
ALTER TABLE pFacturas.DetalleFactura
ADD FOREIGN KEY(IDProducto) REFERENCES pFacturas.Producto(IDProducto)




