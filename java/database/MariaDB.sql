CREATE DATABASE MariaDB;
USE MariaDB;

-- Drop tables
DROP TABLE IF EXISTS Opinion;
DROP TABLE IF EXISTS Resena;
DROP TABLE IF EXISTS Lista;
DROP TABLE IF EXISTS Historial;
DROP TABLE IF EXISTS Tienda;
DROP TABLE IF EXISTS Etiqueta;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS UsuarioRegistrado;

-- Table creation

CREATE TABLE Producto(
    p_id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(50),
    imagen VARCHAR(100),
    descripcion VARCHAR(600),
    valoracion FLOAT NOT NULL,		-- Modificacion para un float valoracion
    plataforma ENUM ('pc', 'Nintendo', 'Xbox', 'Playsation', 'Ofimatica', 'TarjetaRegalo'),
    PRIMARY KEY (p_id)
);

CREATE TABLE Tienda(
    t_id INTEGER NOT NULL AUTO_INCREMENT,
    p_id INTEGER NOT NULL,
    nombre VARCHAR(30),
    enlace VARCHAR(200),
    precio DOUBLE,
    imagen VARCHAR(100),
    PRIMARY KEY (t_id),
    FOREIGN KEY (p_id) REFERENCES Producto (p_id) ON DELETE CASCADE
);

CREATE TABLE Etiqueta(
    e_id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    p_id INTEGER NOT NULL,
    tipo ENUM ('Ofimatica', 'Accion',
    'Disparos','Estrategia', 'Simulacion', 
    'Deporte', 'Carreras', 'Aventura', 
    'Rol', 'Sandbox', 'Musical'),
    PRIMARY KEY (e_id, p_id),
    FOREIGN KEY (p_id) REFERENCES Producto (p_id) ON DELETE CASCADE
);

CREATE TABLE UsuarioRegistrado(
    u_id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    nombreCompleto VARCHAR (100) NOT NULL,		-- Modificacion: almacenamos el nombre completo
    email VARCHAR(50) NOT NULL,
    usuario VARCHAR(20) NOT NULL,
    contrasena VARCHAR(20) NOT NULL,
    localizacion VARCHAR(30),
    telefono INTEGER,
    admin BOOLEAN NOT NULL, -- 0 no admin, 1 admin
    PRIMARY KEY (u_id)
);

CREATE TABLE Opinion(
    o_id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    t_id INTEGER NOT NULL,
    u_id INTEGER NOT NULL,
    descripcion VARCHAR(300),
    PRIMARY KEY (o_id),
    FOREIGN KEY (t_id) REFERENCES Tienda (t_id) ON DELETE CASCADE,
    FOREIGN KEY (u_id) REFERENCES UsuarioRegistrado (u_id) ON DELETE CASCADE
);

CREATE TABLE Resena(
    r_id INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
    u_id INTEGER NOT NULL,
    p_id INTEGER NOT NULL,
    titulo VARCHAR(100),
    descripcion VARCHAR(300),
    valoracion FLOAT,			-- Modificacion La valoracion deberia ser float no?
    PRIMARY KEY (r_id),
    FOREIGN KEY (u_id) REFERENCES UsuarioRegistrado (u_id) ON DELETE CASCADE,
    FOREIGN KEY (p_id) REFERENCES Producto (p_id) ON DELETE CASCADE, 
    CHECK(valoracion >= 0.0 AND valoracion <= 5.0)
);

CREATE TABLE Lista(     -- Decidimos omitir el nombre, ya que solo hay una lista por usuario
    u_id INTEGER NOT NULL,
    p_id INTEGER NOT NULL,
    PRIMARY KEY (u_id, p_id),
    FOREIGN KEY (u_id) REFERENCES UsuarioRegistrado (u_id) ON DELETE CASCADE,
    FOREIGN KEY (p_id) REFERENCES Producto (p_id) ON DELETE CASCADE,
    UNIQUE (u_id, p_id)
);

CREATE TABLE Historial(
    u_id INTEGER NOT NULL,
    p_id INTEGER NOT NULL,
    fecha DATETIME NOT NULL,
    PRIMARY KEY (u_id, p_id, fecha),
    FOREIGN KEY (u_id) REFERENCES UsuarioRegistrado (u_id) ON DELETE CASCADE,
    FOREIGN KEY (p_id) REFERENCES Producto (p_id) ON DELETE CASCADE
);

-- Insercion de datos
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (1, 'Elden Ring', './imgs/eldenring.jpg', 'Elden Ring es el nuevo videojuego de FromSoftware, creadores de Dark Souls, Sekiro o Bloodborne. Se trata del nuevo título de acción y rol para un jugador ideado por Hidetaka Miyazaki, que en esta ocasión, estrenará un mundo abierto más grande y ambicioso. Su argumento y mitología están firmados por George R.R. Martin, autor de Canción de hielo y fuego.', 4.5, 'Pc');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (2, 'Terraria', './imgs/terraria.jpg', 'Terraria es un videojuego de mundo abierto en 2D. Contiene elementos de construcción, exploración, aventura y combate, muy similar a juegos clásicos de la consola Super NES, como por ejemplo la serie Metroid, y a otras entregas más recientes como Minecraft.', 4.7, 'Pc');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (3, 'Kirby y la tierra olvidada', './imgs/kirbylost.jpg', 'Descubre una nueva aventura de Kirby en 3D que transcurre en un mundo misterioso ¡La próxima aventura de Kirby para Nintendo Switch da el salto al 3D! En esta nueva entrega, los jugadores podrán moverse libremente por zonas en 3D usando las conocidas habilidades de copia de Kirby.', 4.6, 'Nintendo');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (4, 'Loop Hero', './imgs/loophero.jpg', 'Loop hero es un RPG sin fin, un roguelite en el que un lich malvado ha destruido la realidad y todo lo que contiene.', 4.2, 'pc');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (5, 'Windows 11', './imgs/win_11.png', 'Windows 11 el nuevo sistema operativo de Microsoft, la versión Pro™ incluye todas las características de Home al tiempo que añade características adicionales, principalmente para entornos profesionales.', 3.4, 'Ofimatica');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (6, 'League of Legends giftcard', './imgs/lolcard.jpeg', 'Tarjeta regalo de League of Legends de 20 euros canjeable en el launcher de League of Legends.', 1.4, 'TarjetaRegalo');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (7, 'Leyendas Pokemon Arceus','./imgs/pokemonLeyendasArceus.png','Leyendas Pokémon: Arceus es un videojuego de rol de acción desarrollado por Game Freak y publicado por The Pokémon Company y Nintendo para Nintendo Switch.',3.5,'Nintendo');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (8, 'Nintendo Switch Sports','./imgs/switchSports.png','Nintendo Switch Sports es un videojuego de simulación de deportes desarrollado y publicado por Nintendo para Nintendo Switch.',4.5,'Nintendo');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (9, 'Just Dance 2022','./imgs/justdance2022.png','Just dance 2022 es un juego recreacionadl de baile desarrollado por Ubisoft.',3,'Nintendo');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (10, 'Zelda breath of the wild','./imgs/botw.png','Trepidante juego de aventura de la franquicia Zelda. Embarcate en un aventura en solitario como Link.',4.9,'Nintendo');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (11, 'Little Nightmares','./imgs/littlenightmares.png','Little Nightmares es un videojuego de rompecabezas y horror de supervivencia.',4.1,'Nintendo');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (12, 'Far cry 6','./imgs/fc6.png','Far Cry 6 es un videojuego de disparos en primera persona desarrollado por Ubisoft Toronto y publicado por Ubisoft.',3.2,'Xbox');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (13, 'GTA V','./imgs/gta5.png','Grand Theft Auto V es un videojuego de acción-aventura de mundo abierto.',5,'Xbox');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (14, 'Fifa 22','./imgs/fifa22.png','Juego simulador de deportes con las plantillas de futbol actuales.',3.6,'Xbox');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (15, 'Red dead redemption 2','./imgs/rdr2.png','Videojuego de acción-aventura western basado en el drama, en un mundo abierto.',4.7,'Xbox');
INSERT INTO Producto (p_id, nombre, imagen, descripcion, valoracion, plataforma) VALUES (16, 'Microsoft Flight Simulator','./imgs/mfs.png','Una experiencia de un jugador, que consta de varios simuladores de vuelo.',3.9,'Xbox');

INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (1, 1, 'Gamivo', 'https://www.gamivo.com/es/product/elden-ring-eu', 49.99, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (2, 1, 'Eneba', 'https://www.eneba.com/es/steam-elden-ring-pc-steam-key-europe', 43.92, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (3, 1, 'Instant Gaming', 'https://www.instant-gaming.com/es/4824-comprar-elden-ring-pc-juego-steam-europe/?currency=EUR&gclid=Cj0KCQjw6pOTBhCTARIsAHF23fJcqNnHo8QyPOzZ2uovcolRrqI2hCa8YhFSLgmsj1q67PuVrchCxEYaArKiEALw_wcB', 43.39, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (4, 2, 'Gamivo', 'https://www.gamivo.com/es/product/terraria', 6.65, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (5, 2, 'Eneba', 'https://www.eneba.com/es/steam-terraria-steam-key-global', 5.36, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (6, 2, 'Instant Gaming', 'https://www.instant-gaming.com/es/932-comprar-steam-terraria-pc-mac-juego-steam/', 6.99, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (7, 3, 'Gamivo', 'https://www.gamivo.com/es/product/kirby-and-the-forgotten-land-nintendo-us', 46, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (8, 3, 'Eneba', 'https://www.eneba.com/es/kirby-and-the-forgotten-land-nintendo-switch', 50, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (9, 3, 'Instant Gaming', 'https://www.instant-gaming.com/es/10332-comprar-nintendo-eshop-kirby-y-la-tierra-olvidada-switch-juego-nintendo-eshop-europe/', 56.39, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (10, 4, 'Gamivo', 'https://www.gamivo.com/es/product/loop-hero', 6.65, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (11, 4, 'Eneba', 'https://www.eneba.com/es/steam-loop-hero-steam-key-global', 16.98, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (12, 4, 'Instant Gaming', 'https://www.instant-gaming.com/es/8402-comprar-steam-juego-steam-loop-hero/', 5.94, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (13, 5, 'Gamivo', 'https://www.gamivo.com/product/windows-11-professional', 28.84, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (14, 5, 'Eneba', 'https://www.eneba.com/hp8000sff-windows-11-pro-db729e30', 110, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (15, 5, 'Instant Gaming', 'https://www.instant-gaming.com/es', 40.0, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (16, 6, 'Gamivo', 'https://www.gamivo.com/product/league-of-legends-20-eur-eu', 20, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (17, 6, 'Eneba', 'https://www.eneba.com/other-league-of-legends-gift-card-20eur-2800-riot-points-1950-valorant-points-europe-server-only', 20, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (18, 6, 'Instant Gaming', 'https://www.instant-gaming.com/es/5759-comprar-league-of-legends-2800rp-eu-west-2800-rp-pc-juego-europe/', 20, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (19, 7, 'Gamivo', 'https://www.gamivo.com/product/pokemon-legends-arceus-switch-eu', 40.00, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (20, 7, 'Eneba', 'https://www.eneba.com/es/nintendo-pokemon-legends-arceus-nintendo-switch-eshop-key-europe ',63.37, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (21, 7, 'Instant Gaming', 'https://www.instant-gaming.com/es/8908-comprar-leyendas-pokemon-arceus-switch-juego-nintendo-eshop-europe/',56.22, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (22, 8, 'Gamivo', '#', 40, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (23, 8, 'Eneba', 'https://www.eneba.com/es/nintendo-switch-sports-nintendo-switch',38.00, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (24, 8, 'Instant Gaming', 'https://www.instant-gaming.com/es/10712-comprar-nintendo-switch-sports-switch-juego-nintendo-eshop-europe/', 37.99, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (25, 9, 'Gamivo', 'https://www.gamivo.com/product/just-dance-2021-eu-nintendo',19.11, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (26, 9, 'Eneba', 'https://www.eneba.com/es/nintendo-just-dance-2022-nintendo-switch-eshop-key-europe ', 35.04, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (27, 9, 'Instant Gaming', 'https://www.instant-gaming.com/es/9577-comprar-just-dance-2021-switch-switch-juego-nintendo-eshop/',17.89, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (28, 10, 'Gamivo', 'https://www.gamivo.com/product/the-legend-of-zelda-breath-of-the-wild-us-switch', 53.48, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (29, 10, 'Eneba', 'https://www.eneba.com/es/the-legend-of-zelda-breath-of-the-wild-nintendo-switch', 40.00, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (30, 10, 'Instant Gaming', 'https://www.instant-gaming.com/es/2616-comprar-the-legend-of-zelda-breath-of-the-wild-switch-switch-juego-nintendo-eshop-europe/',65.90, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (31, 11, 'Gamivo', 'https://www.gamivo.com/product/little-nightmares-complete-edition-eu',17.70, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (32, 11, 'Eneba', 'https://www.eneba.com/es/nintendo-little-nightmares-complete-edition-nintendo-switch-eshop-key-europe', 15.07, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (33, 11, 'Instant Gaming', 'https://www.instant-gaming.com/es/4660-comprar-little-nightmares-complete-edition-switch-complete-edition-switch-juego-nintendo-eshop-europe/',15.99, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (34, 12, 'Gamivo', 'https://www.gamivo.com/product/far-cry-6-xbox',27.05, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (35, 12, 'Eneba', 'https://www.eneba.com/es/xbox-far-cry-6-xbox-live-key-global',29.99, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (36, 12, 'Instant Gaming', 'https://www.instant-gaming.com/es/9147-comprar-microsoft-store-far-cry-6-xbox-one-xbox-series-x-s-xbox-one-xbox-series-x-s-juego-microsoft-store/ ',43.99, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (37, 13, 'Gamivo', 'https://www.gamivo.com/product/grand-theft-auto-v-gta-5-xbox-one',14.09, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (38, 13, 'Eneba', 'https://www.eneba.com/es/xbox-grand-theft-auto-v-xbox-series-s-x-xbox-live-key-global',27.83, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (39, 13, 'Instant Gaming', 'https://www.instant-gaming.com/es/2037-comprar-microsoft-store-grand-theft-auto-v-xbox-one-xbox-one-juego-microsoft-store/ ', 17.89, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (41, 14, 'Gamivo', 'https://www.gamivo.com/product/fifa-22-xbox-one',10.91, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (40, 14, 'Eneba', 'https://www.eneba.com/es/xbox-fifa-22-standard-edition-xbox-one-xbox-live-key-global', 11.41, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (42, 14, 'Instant Gaming', 'https://www.instant-gaming.com/es/9226-comprar-fifa-22-xbox-one-xbox-one-juego-microsoft-store/',22.49, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (43, 15, 'Gamivo', 'https://www.gamivo.com/product/red-dead-redemption-2',21.37, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (44, 15, 'Eneba', 'https://www.eneba.com/es/xbox-red-dead-redemption-2-xbox-one-xbox-live-key-global',29.99, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (45, 15, 'Instant Gaming', 'https://www.instant-gaming.com/es/1744-comprar-microsoft-store-red-dead-redemption-2-xbox-one-xbox-series-x-s-xbox-one-xbox-series-x-s-juego-microsoft-store-europe/', 22.99, './imgs/igaming.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (46, 16, 'Gamivo', 'https://www.gamivo.com/product/microsoft-flight-simulator-xbox-pc',45.87, './imgs/gamivo.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (47, 16, 'Eneba', 'https://www.eneba.com/es/xbox-microsoft-flight-simulator-standard-edition-pc-xbox-live-key-global', 52.97, './imgs/eneba.png');
INSERT INTO Tienda (t_id, p_id, nombre, enlace, precio, imagen) VALUES (48, 16, 'Instant Gaming', 'https://www.instant-gaming.com/es/5582-comprar-microsoft-store-microsoft-flight-simulator-pc-xbox-series-x-s-pc-xbox-series-x-s-juego-microsoft-store/', 47.99, './imgs/igaming.png');

INSERT INTO Etiqueta VALUES (1, 1, 'Sandbox');
INSERT INTO Etiqueta VALUES (2, 1, 'Accion');
INSERT INTO Etiqueta VALUES (3, 1, 'Aventura');
INSERT INTO Etiqueta VALUES (4, 2, 'Aventura');
INSERT INTO Etiqueta VALUES (5, 2, 'Sandbox');
INSERT INTO Etiqueta VALUES (6, 3, 'Aventura');
INSERT INTO Etiqueta VALUES (7, 4, 'Estrategia');
INSERT INTO Etiqueta VALUES (8, 4, 'Rol');
INSERT INTO Etiqueta VALUES (9, 5, 'Ofimatica');
INSERT INTO Etiqueta VALUES (10, 6, 'Rol');
INSERT INTO Etiqueta VALUES (11, 7, 'Simulacion');
INSERT INTO Etiqueta VALUES (12, 7, 'Rol');
INSERT INTO Etiqueta VALUES (13, 7, 'Sandbox');
INSERT INTO Etiqueta VALUES (14, 8, 'Deporte');
INSERT INTO Etiqueta VALUES (15, 8, 'Simulacion');
INSERT INTO Etiqueta VALUES (16, 9, 'Simulacion');
INSERT INTO Etiqueta VALUES (17, 9, 'Musical');
INSERT INTO Etiqueta VALUES (18, 10, 'Aventura');
INSERT INTO Etiqueta VALUES (19, 10, 'Sandbox');
INSERT INTO Etiqueta VALUES (20, 10, 'Accion');
INSERT INTO Etiqueta VALUES (21, 11, 'Aventura');
INSERT INTO Etiqueta VALUES (22, 12, 'Accion');
INSERT INTO Etiqueta VALUES (23, 12, 'Disparos');
INSERT INTO Etiqueta VALUES (24, 13, 'Disparos');
INSERT INTO Etiqueta VALUES (25, 13, 'Accion');
INSERT INTO Etiqueta VALUES (26, 13, 'Simulacion');
INSERT INTO Etiqueta VALUES (27, 14, 'Deporte');
INSERT INTO Etiqueta VALUES (28, 15, 'Disparos');
INSERT INTO Etiqueta VALUES (29, 15, 'Sandbox');
INSERT INTO Etiqueta VALUES (30, 15, 'Accion');
INSERT INTO Etiqueta VALUES (31, 16, 'Simulacion');

INSERT INTO UsuarioRegistrado VALUES (1, 'Pepe Sanz', 'pepito@gmail.com', 'pacogamer', '987654', 'Palencia', 612345678, 0);
INSERT INTO UsuarioRegistrado VALUES (2, 'Sandra Ramos', 'sandra@gmail.com', 'sandritaa', '000000', 'Valladolid', 612345672, 0);
INSERT INTO UsuarioRegistrado VALUES (3, 'Juan Lopez', 'jlope@gmail.com', 'j_lopezz', '1234567', 'Valladolid', 612345672, 0);
INSERT INTO UsuarioRegistrado VALUES (4, 'grupo26 KeyComparator', 'KeyComparator@gmail.com', 'grupo26', 123456, 'Cielo', NULL, 1);
INSERT INTO UsuarioRegistrado VALUES (5, 'raul villa', 'correo@gmail.com', 'laner', 'contrasena', 'Valladolid', 999999999, 0);

INSERT INTO Opinion VALUES (1, 1, 1, 'Es una tienda muy fiable');
INSERT INTO Opinion VALUES (2, 1, 2, 'Es una tienda recomendable');
INSERT INTO Opinion VALUES (3, 2, 1, 'La mejor pagina de mi vida');
INSERT INTO Opinion VALUES (4, 2, 2, 'Buenos precios');
INSERT INTO Opinion VALUES (5, 3, 1, 'Muy fiable');
INSERT INTO Opinion VALUES (6, 3, 2, 'No ha sido una buena experiencia, no la recomiendo');
INSERT INTO Opinion VALUES (7, 3, 4, 'Muy buena tienda, recomendadisima');
INSERT INTO Opinion VALUES (8, 1, 4, 'Bien');
INSERT INTO Opinion VALUES (9, 2, 5, 'Muy buen servicio, me atendieron en lo que necesitaba');
INSERT INTO Opinion VALUES (10, 1, 5, 'No me llego a tiempo y no me hicieron devolucion');
INSERT INTO Opinion VALUES (11, 3, 6, 'El juego malisimo pero la tienda muy buena :D');

INSERT INTO Resena VALUES (1, 1, 1, 'Increible', 'Me ha parecido un juego buenisimo', 4.8);
INSERT INTO Resena VALUES (2, 2, 1, 'Sobrevalorado', 'Bastante flojo', 2);
INSERT INTO Resena VALUES (3, 1, 2, 'Bueno, pero', 'Tiene muchas posibilidades', 4.2);
INSERT INTO Resena VALUES (4, 2, 2, 'Genial!', 'Muy divertido para jugar con amigos', 3.8);
INSERT INTO Resena VALUES (5, 3, 4, 'Kirby!', 'Es una apuesta segura, me encanta', 4.2);
INSERT INTO Resena VALUES (6, 2, 5, 'Pero', 'Pero esto no era gratis?', 1);
INSERT INTO Resena VALUES (7, 1, 5, 'No me convence', 'Me gustaba mas el xp', 2);
INSERT INTO Resena VALUES (8, 3, 5, 'Muy recomendado', 'Me encanta el 11', 5);
INSERT INTO Resena VALUES (9, 2, 6, 'No entiendo', 'Comprar este pack no me hizo subir a diamante, no me gusta', 1.5);
INSERT INTO Resena VALUES (10, 3, 2, 'Terraria', 'Man I love terraria', 5);

INSERT INTO Lista VALUES (1, 1);
INSERT INTO Lista VALUES (1, 2);
INSERT INTO Lista VALUES (1, 4);
INSERT INTO Lista VALUES (2, 1);
INSERT INTO Lista VALUES (2, 3);
INSERT INTO Lista VALUES (2, 5);

INSERT INTO Historial VALUES (1, 1, "2022-04-22 13:08:22");
INSERT INTO Historial VALUES (1, 2, "2022-04-22 13:09:45");
INSERT INTO Historial VALUES (1, 3, "2022-04-22 13:10:42");
INSERT INTO Historial VALUES (1, 2, "2022-04-22 13:11:25");
INSERT INTO Historial VALUES (1, 4, "2022-04-22 13:12:58");
INSERT INTO Historial VALUES (2, 2, "2022-04-23 18:32:08");
INSERT INTO Historial VALUES (2, 4, "2022-04-22 18:35:12");
INSERT INTO Historial VALUES (2, 5, "2022-04-22 18:39:25");
INSERT INTO Historial VALUES (2, 1, "2022-04-22 18:40:03");