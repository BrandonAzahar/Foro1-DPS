
CREATE DATABASE NotasUDB;


USE NotasUDB;

CREATE TABLE Alumnos (
    AlumnoID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    FechaNacimiento DATE,
    Carrera NVARCHAR(100)
);


CREATE TABLE Becas (
    BecaID INT PRIMARY KEY,
    NombreBeca NVARCHAR(100),
    Descripcion NVARCHAR(255),
    Monto FLOAT
);


CREATE TABLE Alumnos_Becas (
    AlumnoID INT,
    BecaID INT,
    PRIMARY KEY (AlumnoID, BecaID),
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID),
    FOREIGN KEY (BecaID) REFERENCES Becas(BecaID)
);


CREATE TABLE Notas (
    NotaID INT PRIMARY KEY,
    AlumnoID INT,
    Materia NVARCHAR(100),
    Nota FLOAT,
    FOREIGN KEY (AlumnoID) REFERENCES Alumnos(AlumnoID)
);


CREATE TABLE Profesores (
    ProfesorID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100)
);


CREATE TABLE Notas_Profesores (
    NotaID INT,
    ProfesorID INT,
    PRIMARY KEY (NotaID, ProfesorID),
    FOREIGN KEY (NotaID) REFERENCES Notas(NotaID),
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
);

-- Insertar registros en la tabla Alumnos
INSERT INTO Alumnos (AlumnoID, Nombre, Apellido, FechaNacimiento, Carrera)
VALUES
    (1, 'Juan', 'Pérez', '2000-05-15', 'Ingeniería Informática'),
    (2, 'María', 'González', '1999-09-23', 'Matemáticas'),
    (3, 'Carlos', 'López', '2001-02-10', 'Administración de Empresas'),
    (4, 'Ana', 'Martínez', '2000-11-30', 'Derecho'),
    (5, 'Pedro', 'Ruiz', '1998-07-08', 'Medicina');

-- Insertar registros en la tabla Becas
INSERT INTO Becas (BecaID, NombreBeca, Descripcion, Monto)
VALUES
    (1, 'Beca de Excelencia', 'Para alumnos con promedio superior a 9.0', 500),
    (2, 'Beca Deportiva', 'Para alumnos destacados en deportes', 300),
    (3, 'Beca Socioeconómica', 'Para alumnos en situación económica vulnerable', 200),
    (4, 'Beca de Investigación', 'Para alumnos participantes en proyectos de investigación', 400),
    (5, 'Beca Cultural', 'Para alumnos destacados en actividades culturales', 250);

-- Insertar relaciones entre alumnos y becas
INSERT INTO Alumnos_Becas (AlumnoID, BecaID)
VALUES
    (1, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5);

-- Insertar registros en la tabla Notas
INSERT INTO Notas (NotaID, AlumnoID, Materia, Nota)
VALUES
    (1, 1, 'Matemáticas', 9.5),
    (2, 2, 'Historia', 8.0),
    (3, 3, 'Programación', 9.2),
    (4, 4, 'Derecho Penal', 7.8),
    (5, 5, 'Anatomía', 9.7);

-- Insertar registros en la tabla Profesores
INSERT INTO Profesores (ProfesorID, Nombre, Apellido)
VALUES
    (1, 'Luis', 'Hernández'),
    (2, 'María', 'López'),
    (3, 'Carlos', 'García'),
    (4, 'Ana', 'Martínez'),
    (5, 'Pedro', 'Ruiz');

-- Insertar relaciones entre notas y profesores
INSERT INTO Notas_Profesores (NotaID, ProfesorID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

	SELECT        dbo.Alumnos.Nombre, dbo.Alumnos.Apellido, dbo.Alumnos.FechaNacimiento, dbo.Alumnos.Carrera, dbo.Alumnos_Becas.BecaID, dbo.Becas.NombreBeca, dbo.Becas.Descripcion, dbo.Becas.Monto, dbo.Notas.Materia, 
                         dbo.Notas.Nota
FROM            dbo.Alumnos INNER JOIN
                         dbo.Alumnos_Becas ON dbo.Alumnos.AlumnoID = dbo.Alumnos_Becas.AlumnoID INNER JOIN
                         dbo.Becas ON dbo.Alumnos_Becas.BecaID = dbo.Becas.BecaID INNER JOIN
                         dbo.Notas ON dbo.Alumnos.AlumnoID = dbo.Notas.AlumnoID INNER JOIN
                         dbo.Notas_Profesores ON dbo.Notas.NotaID = dbo.Notas_Profesores.NotaID INNER JOIN
                         dbo.Profesores ON dbo.Notas_Profesores.ProfesorID = dbo.Profesores.ProfesorID