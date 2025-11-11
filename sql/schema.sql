-- Tabla de roles: define tipos de usuario
CREATE TABLE roles (
  id_rol SERIAL PRIMARY KEY,
  nombre_rol VARCHAR(30) -- Ej: alumno, profesor, administrador
);

-- Tabla de autores: incluye referencia a roles
CREATE TABLE autor (
  autor_id SERIAL PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  correo_electronico VARCHAR(50),
  rol_id INTEGER REFERENCES roles(id_rol),
  semestre INTEGER,
  carrera VARCHAR(50)
);

-- Tabla de recetas: asociadas a un autor
CREATE TABLE recetas (
  id_receta SERIAL PRIMARY KEY,
  nombre_receta VARCHAR(100),
  tipo VARCHAR(20),
  autor_id INTEGER REFERENCES autor(autor_id),
  porciones_base INTEGER,
  tiempo_preparacion_min INTEGER,
  detalle_montaje VARCHAR(255),
  url_bosquejo_base VARCHAR(255)
);

-- Tabla de ingredientes: asociados a una receta
CREATE TABLE ingredientes (
  id_ingrediente SERIAL PRIMARY KEY,
  id_receta INTEGER REFERENCES recetas(id_receta),
  nombre_ing VARCHAR(50),
  tipo_ing VARCHAR(50),
  cantidad_base DECIMAL(10,2),
  unidad VARCHAR(30)
);

-- Tabla de pasos del procedimiento: asociados a una receta
CREATE TABLE pasos_procedimiento (
  id_procedimiento SERIAL PRIMARY KEY,
  id_receta INTEGER REFERENCES recetas(id_receta),
  orden_procedimiento INTEGER,
  descripcion VARCHAR(255)
);

-- Tabla de canasta: inventario disponible de ingredientes
CREATE TABLE canasta (
  id_canasta SERIAL PRIMARY KEY,
  id_ingrediente INTEGER REFERENCES ingredientes(id_ingrediente),
  cantidad_disponible DECIMAL(10,2),
  unidad VARCHAR(30)
);
