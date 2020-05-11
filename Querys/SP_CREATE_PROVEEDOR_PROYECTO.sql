CREATE PROCEDURE pFacturas.SP_CREATE_PROVEEDOR
    @IDProveedor INT ,
    @NombreProveedor NVARCHAR(500),
    @NombreContacto NVARCHAR(500),
    @EmailProveedor NVARCHAR(500),
    @RTN NVARCHAR(500),
    @Telefono NVARCHAR(500),
    @Pais NVARCHAR(500),
    @City NVARCHAR(500),
    @CodigoPostal INT,
    @Direccion NVARCHAR(MAX)
AS

DECLARE @existe  INT = (SELECT COUNT(*) as N FROM pFacturas.Proveedor where IDProveedor = @IDProveedor)
IF @existe > 0 BEGIN
    SELECT 0  as successed, 'El ID enviado ya existe' as MSG
END ELSE BEGIN    
    INSERT INTO pFacturas.Proveedor
    VALUES (@IDProveedor, @NombreProveedor, @NombreContacto, @EmailProveedor, @RTN, @Telefono, @Pais, @City, @CodigoPostal, @Direccion)
    SELECT 1 as successed, 'Tu registro fue almacenado' as MSG
END    