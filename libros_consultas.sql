--
-- Consusltas
--
SELECT * FROM LIB_AUTHORS;
SELECT * FROM LIB_BOOK_CATEGORIES;
SELECT * FROM LIB_BOOKS;
SELECT  BOOK_ID, 
		BOOK_AUT_ID,
        CONCAT(AUT_FIRST_NAME,' ',AUT_LAST_NAME) AS AUTOR,
		BOOK_CAT_ID,
        CAT_DESCRIPCION,
		BOOK_ISBN, 
		BOOK_TITLE, 
		BOOK_PRICE
FROM LIB_BOOKS,LIB_BOOK_CATEGORIES,LIB_AUTHORS
WHERE BOOK_AUT_ID = AUT_ID
  AND BOOK_CAT_ID =  CAT_ID
ORDER BY BOOK_TITLE;

SELECT AUT_FIRST_NAME, AUT_LAST_NAME, AUT_DATE_DOB, CURDATE(), CURDATE() - AUT_DATE_DOB, ((CURDATE() - AUT_DATE_DOB) / 10000), FLOOR((CURDATE() - AUT_DATE_DOB) / 10000) from LIB_AUTHORS;


SELECT AUT_ID,AUT_FIRST_NAME,
	   AUT_LAST_NAME, 
	   AUT_DATE_DOB, 
	   CURDATE(), 
	   CURDATE() - AUT_DATE_DOB, 
	   ((CURDATE() - AUT_DATE_DOB) / 10000), 
	   FLOOR((CURDATE() - AUT_DATE_DOB) / 10000) as edad
FROM LIB_AUTHORS  
WHERE AUT_ID = 1;

CALL obtenerDatosLibro(1); -- Donde 1 es el ID del libro que deseas consultar
CALL obtenerEdad(1); -- Donde 1 es el ID del Autor de quien se obtendra la edad
