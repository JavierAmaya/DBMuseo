EXEC pFacturas.SP_CREATE_PROVEEDOR
@IDProveedor = 5,
@NombreProveedor = 'La Mundial',
@NombreContacto = 'Javier Rivera',
@EmailProveedor = 'jrivera@gmail.com',
@RTN = '08011988095642',
@Telefono = '33345678',
@Pais = 'Honduras',
@City = 'Tegucigalpa',
@CodigoPostal = 01982,
@Direccion = 'Boulevard Suyapa , contiguo a Banpais'

SELECT * FROM  pFacturas.Proveedor