ALTER TABLE museo.Obras
ADD FOREIGN KEY(CatalogoID) REFERENCES museo.Catalogo(CatalogoID)

ALTER TABLE museo.Obras
ADD FOREIGN KEY(ProveedorID) REFERENCES museo.Proveedores(ProveedorID)

ALTER TABLE museo.Orden
ADD FOREIGN KEY(ClienteID) REFERENCES museo.Cliente(ClienteID)

ALTER TABLE museo.Orden
ADD FOREIGN KEY(EventoID) REFERENCES museo.Evento(EventoID)

ALTER TABLE museo.Albumes
ADD FOREIGN KEY(ObraID) REFERENCES museo.Obras(ObraID)

ALTER TABLE museo.Fotografias
ADD FOREIGN KEY(AlbumID) REFERENCES museo.Albumes(AlbumID)

ALTER TABLE museo.OrderDetails
ADD FOREIGN KEY(OrdenID) REFERENCES museo.Orden(OrdenID)

ALTER TABLE museo.OrderDetails
ADD FOREIGN KEY(ObraID) REFERENCES museo.Obras(ObraID)

