-- =============================================
-- Laboratorio 10 - MVC y Entity Framework
-- Script de base de datos UniversityDB
-- =============================================
IF DB_ID('UniversityDB') IS NULL
    CREATE DATABASE UniversityDB;
GO

USE UniversityDB;
GO

IF OBJECT_ID('dbo.Enrollment', 'U') IS NOT NULL DROP TABLE dbo.Enrollment;
IF OBJECT_ID('dbo.Course', 'U') IS NOT NULL DROP TABLE dbo.Course;
IF OBJECT_ID('dbo.Student', 'U') IS NOT NULL DROP TABLE dbo.Student;
GO

CREATE TABLE [dbo].[Course] (
    [CourseID] INT           IDENTITY (1, 1) NOT NULL,
    [Title]    NVARCHAR (50) NULL,
    [Credits]  INT           NULL,
    PRIMARY KEY CLUSTERED ([CourseID] ASC)
);
GO

CREATE TABLE [dbo].[Student] (
    [StudentID]      INT           IDENTITY (1, 1) NOT NULL,
    [LastName]       NVARCHAR (50) NULL,
    [FirstName]      NVARCHAR (50) NULL,
    [EnrollmentDate] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([StudentID] ASC)
);
GO

CREATE TABLE [dbo].[Enrollment] (
    [EnrollmentID] INT            IDENTITY (1, 1) NOT NULL,
    [Grade]        DECIMAL (3, 2) NULL,
    [CourseID]     INT            NOT NULL,
    [StudentID]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([EnrollmentID] ASC),
    CONSTRAINT [FK_dbo.Enrollment_dbo.Course_CourseID] FOREIGN KEY ([CourseID])
        REFERENCES [dbo].[Course] ([CourseID]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.Enrollment_dbo.Student_StudentID] FOREIGN KEY ([StudentID])
        REFERENCES [dbo].[Student] ([StudentID]) ON DELETE CASCADE
);
GO

-- Datos de prueba
SET IDENTITY_INSERT Course ON;
INSERT INTO Course (CourseID, Title, Credits) VALUES
    (1, 'Economics', 3),
    (2, 'Literature', 3),
    (3, 'Chemistry', 4);
SET IDENTITY_INSERT Course OFF;

SET IDENTITY_INSERT Student ON;
INSERT INTO Student (StudentID, LastName, FirstName, EnrollmentDate) VALUES
    (1, 'Tibbetts', 'Donnie', '2013-09-01'),
    (2, 'Guzman', 'Liza', '2012-01-13'),
    (3, 'Catlett', 'Phil', '2011-09-03');
SET IDENTITY_INSERT Student OFF;

INSERT INTO Enrollment (Grade, CourseID, StudentID) VALUES
    (2.00, 1, 1),
    (3.50, 1, 2),
    (4.00, 2, 3),
    (1.80, 2, 1),
    (3.20, 3, 1),
    (4.00, 3, 2);
GO
