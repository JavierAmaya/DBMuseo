create SCHEMA museo

create table museo.Catalogo(
    CatalogoID int not null PRIMARY KEY,
    CatalogoName NVARCHAR (500) not NULL,
    [Description] NVARCHAR(MAX)
)
create table museo.Proveedores(
    ProveedorID int not null PRIMARY KEY,
    ProveedorName NVARCHAR (max) not NULL,
    numberID NVARCHAR(max),
    Phone  NVARCHAR(500),
    Mail NVARCHAR (max), 
    CompanyName NVARCHAR(max)
) 
create table museo.Obras(
    ObraID int not null PRIMARY KEY,
    ObraName NVARCHAR (max) not NULL,
    ProveedorID int not null,
    CatalogoID int not null,
    SaleVenta int not null,
    RentalPrice int not null, 
    [Description] nvarchar(max)
)
create table museo.Albumes(
    AlbumID int not null PRIMARY KEY,
    AlbumName NVARCHAR (max) not NULL,
    ObraID int not null,
    CreateDate date,
    DescriptionAlbum NVARCHAR(max)
)
create table museo.Fotografias(
    PhotoID int not null PRIMARY KEY,
    PhotoName NVARCHAR (max) not NULL,
    AlbumID int not null,
    Size nvarchar(100),
    Formato nvarchar(100), 
)
create table museo.Cliente(
    ClienteID int not null PRIMARY KEY,
    ClienteName NVARCHAR (max) not NULL,
    Phone nvarchar(500),
    Mail nvarchar(500),
    Photo nvarchar(500),
    Notas NVARCHAR(max) 
)
create table museo.Evento(
    EventoID int not null PRIMARY KEY,
    InitDate Date,
    EndDate Date,
    EventName nvarchar(max),
    AddresEvent nvarchar(max), 
    AmmountAssistan int, 
)
create table museo.Orden(
    OrdenID int not null PRIMARY KEY,
    ClienteID int not NULL,
    EventoID int not NULL,
    Payment int 
)
create table museo.OrderDetails(
    DetailID int not null PRIMARY KEY,
    OrdenID INT not NULL,
    ObraID int not null,
    Multa int,
    DescriptionMulta nvarchar(max), 
)