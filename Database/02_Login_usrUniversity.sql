-- =============================================
-- Inicio de sesión usrUniversity (Autenticación SQL Server)
-- Contraseña: 123456, sin directiva de contraseña
-- Base de datos predeterminada: UniversityDB
-- Roles de servidor: public, sysadmin
-- Roles de BD (UniversityDB): public, db_owner
-- =============================================
USE master;
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'usrUniversity')
    CREATE LOGIN usrUniversity
        WITH PASSWORD = '123456',
             DEFAULT_DATABASE = UniversityDB,
             CHECK_POLICY = OFF,
             CHECK_EXPIRATION = OFF;
GO

ALTER SERVER ROLE sysadmin ADD MEMBER usrUniversity;
GO

USE UniversityDB;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'usrUniversity')
    CREATE USER usrUniversity FOR LOGIN usrUniversity;
GO

ALTER ROLE db_owner ADD MEMBER usrUniversity;
GO
