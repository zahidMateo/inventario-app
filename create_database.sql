-- Script para el proyecto de inventario 
-- NOTA: Este script fue actualizado el 13/08 

--Creacion de la base de datos
CREATE DATABASE Inventory

-- Seleccionamos la base de datos que vamos a usar
USE Inventory


/****************************************************
 * Tabla de productos
 * OJO: La descripci�n puede ser NULL porque algunos 
 * productos nuevos no tienen ficha t�cnica todav�a
 ****************************************************/
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,  
    Description NVARCHAR(255),       
    Category NVARCHAR(50),                     
    Price DECIMAL(10,2) NOT NULL,   
    Stock INT NOT NULL DEFAULT 0,
    IsActive BIT NOT NULL DEFAULT 1
);

/****************************************************
 * Tabla de movimientos
 * IMPORTANTE: El tipo solo puede ser Compra/Venta
 * (pendiente agregar 'Devoluci�n' en el pr�ximo sprint)
 ****************************************************/
CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    Date DATETIME NOT NULL DEFAULT GETDATE(),
    TransactionType NVARCHAR(10) CHECK (TransactionType IN ('Compra','Venta')), 
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    TotalPrice AS (Quantity * UnitPrice),  -
    Detail NVARCHAR(255),              
    
    CONSTRAINT FK_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID) 
);
GO

-- Datos de prueba (solo para desarrollo)
-- Estos son los productos que usamos en las demos
INSERT INTO Products (Name, Description, Category, Price, Stock, IsActive)
VALUES
('Laptop ThinkPad X1', 'i7 16GB RAM 512GB SSD', 'Computaci�n', 1899.99, 8, 1),  -- Precio especial por lanzamiento
('Mouse Logi MX Master', 'Inal�mbrico, ergon�mico', 'Perif�ricos', 89.90, 15, 1),  -- Falta subir la imagen
('Teclado Keychron K8', 'Mec�nico RGB Bluetooth', 'Perif�ricos', 110.00, 5, 1),  -- �ltimas unidades
('Monitor Dell 24" P2422H', 'Full HD IPS', 'Monitores', 249.00, 12, 1),
('Auriculares Sony WH-1000XM4', 'NC, 30h bater�a', 'Audio', 349.00, 3, 0);  -- Stock cr�tico, inactivo de prueba

-- Transacciones de ejemplo del �ltimo mes
INSERT INTO Transactions (TransactionType, ProductID, Quantity, UnitPrice, Detail)
VALUES
('Compra', 1, 5, 1750.00, 'Pedido inicial para nuevo local'),  -- Precio con descuento por volumen
('Venta', 2, 2, 99.90, 'Venta a contado - Cliente: TechSolutions'),  -- Precio con IVA incluido
('Compra', 3, 10, 95.00, 'Reposici�n stock - Factura #12345'),  -- Precio mayorista
('Venta', 4, 1, 299.00, 'Venta online - Env�o #4567'),  -- Precio promocional
('Venta', 5, 1, 399.00, 'Cliente preferencial (10% descuento aplicado despu�s)');  -- Descuento no reflejado aqu�

-- Verificaci�n r�pida 

SELECT * FROM Products;
SELECT p.Name, t.* 
FROM Transactions t
JOIN Products p ON t.ProductID = p.ProductID;
