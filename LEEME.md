# Laboratorio 10 – MVC y Entity Framework (University)

Proyecto ASP.NET MVC 5 (.NET Framework 4.8) + Entity Framework 6.2.0, enfoque *EF Designer desde base de datos* (`Models/UniversityModel.edmx`).

## Base de datos (carpeta `Database`)
1. `01_UniversityDB.sql` – crea UniversityDB, tablas Course, Student, Enrollment y datos de prueba.
2. `02_Login_usrUniversity.sql` – login SQL `usrUniversity` / `123456` (sin directiva de contraseña, BD predeterminada UniversityDB, roles sysadmin/public y db_owner/public).
3. `03_AgregarEmail.sql` – agrega el campo `Email` a Student (paso "Agregar un campo existente").

## Cadena de conexión
En `University/Web.config` (`UniversityDBEntities`) el servidor es `(localdb)\MSSQLLocalDB`.
En la PC del laboratorio cambia `data source=` por la instancia que uses (ej. `LAB1506-02\SQLEXPRESS02`).

## Qué incluye
- Controladores scaffold con EF: `CoursesController`, `StudentsController`, `EnrollmentsController` (Index, Details, Create, Edit, Delete – GET y POST).
- Vistas Create/Edit/Details/Index/Delete de Student con el campo Email.
- DataAnnotations: `[Required]` y `[StringLength(50)]` en Student y Course, `[EmailAddress]` en Email, `[Range(0, 4)]` en Enrollment.Grade.

## Ejecutar
Abrir `University.sln` en Visual Studio → F5. Rutas: `/Courses`, `/Students`, `/Enrollments`.
