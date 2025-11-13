CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    rut VARCHAR(12) UNIQUE NOT NULL,
    correo_electronico VARCHAR(150) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
   	id_rol integer not null
);



-- Cambiar el campo nombre por RUT

CREATE TABLE recetas (
    id_receta SERIAL PRIMARY KEY,
    nombre_receta VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    tiempo_preparacion_minutos INT,
    porciones INT,
    detalle_montaje TEXT,
    Calorias Integer,
    justificacion_tecnica TEXT,
    justificacion_comercial TEXT,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

-- Cada etapa representa una parte del proceso de una receta (como “Etapa A: Tataki de vacuno”)

CREATE TABLE etapas (
    id_etapa SERIAL PRIMARY KEY,
    nombre_etapa VARCHAR(100) NOT NULL,
    descripcion TEXT,
    tiempo_minutos int
);

-- Esta tabla relaciona las recetas con sus etapas y las despliega según la receta
-- QUERY EJEMPLO: SELECT * FROM RECETA_ETAPA WHERE ID_RECETA = 1

CREATE TABLE receta_etapa (
    id_receta INT NOT NULL,
    id_etapa INT NOT NULL,
    orden_etapa INT, -- para definir el orden dentro de la receta
    PRIMARY KEY (id_receta, id_etapa),
    FOREIGN KEY (id_receta) REFERENCES recetas(id_receta),
    FOREIGN KEY (id_etapa) REFERENCES etapas(id_etapa)
);




CREATE TABLE categorias_ingrediente (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE ingredientes (
    id_ingrediente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    unidad VARCHAR(20) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias_ingrediente(id_categoria)
);






CREATE TABLE receta_ingrediente (
    id_receta INT NOT NULL,
    id_ingrediente INT NOT NULL,
    cantidad_total DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_receta, id_ingrediente),
    FOREIGN KEY (id_receta) REFERENCES recetas(id_receta),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente)
);


-- Lista de ingredientes de la etapa
-- QUERY EJEMPLO: SELECT * FROM etapa_ingrediente WHERE ID_ETAPA = 1

CREATE TABLE etapa_ingrediente (
    id_etapa INT NOT NULL,
    id_ingrediente INT NOT NULL,
    cantidad_etapa DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_etapa, id_ingrediente),
    FOREIGN KEY (id_etapa) REFERENCES etapas(id_etapa),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente)
);


CREATE TABLE TECNICA (
	id_tecnica SERIAL PRIMARY KEY,
	nombre_tecnica VARCHAR,
	descripcion TEXT
);

CREATE TABLE RECETA_TECNICA
(
	id_receta INT NOT NULL,
	id_tecnica INT NOT NULL,
	PRIMARY KEY (id_receta,id_tecnica),
	FOREIGN KEY (id_receta) REFERENCES recetas(id_receta),
    	FOREIGN KEY (id_tecnica) REFERENCES TECNICA(id_tecnica)
	
	
);

CREATE TABLE UTENSILIOS
(
	ID_UTENSILIO SERIAL PRIMARY KEY,
	Nombre VARCHAR(100),
	Descripcion TEXT
);

CREATE TABLE receta_utensilios
(
	ID_UTENSILIO INT NOT NULL,
	id_receta INT NOT NULL,
        PRIMARY KEY (ID_UTENSILIO,id_receta),
	FOREIGN KEY (id_receta) REFERENCES recetas(id_receta),
    	FOREIGN KEY (ID_UTENSILIO) REFERENCES UTENSILIOS(ID_UTENSILIO)
	
	
);

CREATE TABLE PUNTOS_CRITICOS
(
	ID_PUNTOCRITICO SERIAL PRIMARY KEY,
	Nombre VARCHAR(100),
	Detalle TEXT

);

CREATE TABLE receta_puntoscriticos
(
	ID_PUNTOCRITICO INT NOT NULL,
	id_receta INT NOT NULL,
        PRIMARY KEY (ID_PUNTOCRITICO,id_receta),
	FOREIGN KEY (id_receta) REFERENCES recetas(id_receta),
    	FOREIGN KEY (ID_PUNTOCRITICO) REFERENCES PUNTOS_CRITICOS(ID_PUNTOCRITICO)

);
