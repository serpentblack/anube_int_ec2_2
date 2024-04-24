-- -----------------------------------------------------
-- Schema libros
-- -----------------------------------------------------
drop schema if exists libros;
-- -----------------------------------------------------
-- Schema libros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS libros DEFAULT CHARACTER SET utf8 ;
USE libros ;

-- -----------------------------------------------------
-- Table LIB_AUTHORS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LIB_AUTHORS (
  AUT_ID INT NOT NULL AUTO_INCREMENT COMMENT 'Código del autor (llave primaria)',
  AUT_FIRST_NAME VARCHAR(30) NOT NULL COMMENT 'Nombres',
  AUT_LAST_NAME VARCHAR(30) NOT NULL COMMENT 'Apellidos',
  AUT_DATE_DOB DATE NOT NULL COMMENT 'Fecha de nacimiento',
  AUT_GENDER VARCHAR(1) NOT NULL COMMENT 'Administrar información relacionada con autores',
  AUT_CONTACT VARCHAR(30) NULL COMMENT 'Información de contacto',
  AUT_OTHER_DETAILS VARCHAR(200) NULL COMMENT 'Detalles adicionales',
  PRIMARY KEY (AUT_ID))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table LIB_BOOK_CATEGORIES
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LIB_BOOK_CATEGORIES (
  CAT_ID INT NOT NULL AUTO_INCREMENT COMMENT 'Código de la categoría (llave primaria)',
  CAT_DESCRIPCION VARCHAR(60) NOT NULL COMMENT 'Nombre de la categoría',
  PRIMARY KEY (CAT_ID))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table LIB_BOOKS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LIB_BOOKS (
  BOOK_ID INT NOT NULL AUTO_INCREMENT COMMENT 'Código del libro (llave primaria)',
  BOOK_AUT_ID INT NOT NULL COMMENT 'Código del autor (llave foránea con LIB_AUTHORS)',
  BOOK_CAT_ID INT NOT NULL COMMENT 'Código de la categoría (llave foránea LIB_BOOK_CATEGORIES)',
  BOOK_ISBN VARCHAR(45) NOT NULL COMMENT 'isbn',
  BOOK_PUBLISHED_DATE DATE NULL COMMENT 'Fecha de publicación',
  BOOK_TITLE VARCHAR(100) NOT NULL COMMENT 'Título',
  BOOK_PRICE DECIMAL(8,2) NOT NULL,
  BOOK_DESCRIPCION VARCHAR(200) NULL COMMENT 'Descripción',
  BOOK_IMAGE BLOB NULL COMMENT 'Archivo de imagen',
  BOOK_MIMETYPE VARCHAR(255) NULL COMMENT 'Tipo de imagen',
  BOOK_FILENAME VARCHAR(400) NULL COMMENT 'Nombre del archivo de imagen',
  BOOK_IMAGE_LAST_UPDATE TIMESTAMP(6) NULL COMMENT 'Fecha ultima actualización',
  PRIMARY KEY (BOOK_ID),
  INDEX fk_LIB_BOOKS_LIB_BOOK_CATEGORIES_idx (BOOK_CAT_ID ASC) VISIBLE,
  INDEX fk_LIB_BOOKS_LIB_AUTHORS1_idx (BOOK_AUT_ID ASC) VISIBLE,
  CONSTRAINT fk_LIB_BOOKS_LIB_BOOK_CATEGORIES
    FOREIGN KEY (BOOK_CAT_ID)
    REFERENCES LIB_BOOK_CATEGORIES (CAT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_LIB_BOOKS_LIB_AUTHORS1
    FOREIGN KEY (BOOK_AUT_ID)
    REFERENCES LIB_AUTHORS (AUT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE LIB_BOOKS_AUDIT (
	  ID INTEGER PRIMARY KEY AUTO_INCREMENT,
      BOOK_ID INTEGER,
	  FECHA DATETIME DEFAULT NULL,
	  ACCION varchar(50) NOT NULL);