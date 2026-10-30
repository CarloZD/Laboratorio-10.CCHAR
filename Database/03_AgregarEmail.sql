-- =============================================
-- AGREGAR UN CAMPO EXISTENTE: Email en la tabla Student
-- (luego: Actualizar modelo desde base de datos en UniversityModel.edmx)
-- =============================================
USE UniversityDB;
GO

IF COL_LENGTH('dbo.Student', 'Email') IS NULL
    ALTER TABLE dbo.Student ADD Email NVARCHAR(50) NULL;
GO
