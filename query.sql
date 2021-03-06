SELECT * FROM EMPLEADO;
SELECT * FROM CARGO;
SELECT * FROM SEDE;
SELECT * FROM ESTRATO;

ALTER TABLE ESTRATO SET UNUSED COLUMN ID;
ALTER TABLE ESTRATO DROP UNUSED COLUMNS;
ALTER TABLE ESTRATO ADD CONSTRAINT PK_ESTRATO PRIMARY KEY (ID_ESTRATO);

ALTER TABLE SEDE SET UNUSED COLUMN ID;
ALTER TABLE SEDE DROP UNUSED COLUMNS;
ALTER TABLE SEDE ADD CONSTRAINT PK_SEDE PRIMARY KEY (ID_SEDE);

ALTER TABLE CARGO SET UNUSED COLUMN ID;
ALTER TABLE CARGO DROP UNUSED COLUMNS;
ALTER TABLE CARGO ADD CONSTRAINT PK_CARGO PRIMARY KEY (ID_CARGO);

ALTER TABLE ESTRATO SET UNUSED COLUMN ID;
ALTER TABLE ESTRATO DROP UNUSED COLUMNS;
ALTER TABLE ESTRATO ADD CONSTRAINT PK_ESTRATO PRIMARY KEY (ID_ESTRATO);

ALTER TABLE EMPLEADO SET UNUSED COLUMN ID;
ALTER TABLE EMPLEADO DROP UNUSED COLUMNS;
ALTER TABLE EMPLEADO ADD CONSTRAINT PK_EMPLEADO PRIMARY KEY (CC);

ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO_ESTRATO FOREIGN KEY (ID_ESTRATO) REFERENCES ESTRATO;
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO_CARGO FOREIGN KEY (ID_CARGO) REFERENCES CARGO;
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO_SEDE FOREIGN KEY (ID_SEDE) REFERENCES SEDE;

SELECT COUNT (*) FROM EMPLEADO;

SELECT ID_SEDE, COUNT(*) FROM EMPLEADO GROUP BY ID_SEDE;

SELECT ID_ESTRATO,COUNT(*)FROM EMPLEADO GROUP BY ID_ESTRATO;

SELECT NOMBRES, FECHA_DE_CONTRATACION FROM EMPLEADO WHERE FECHA_DE_CONTRATACION=(SELECT MIN(FECHA_DE_CONTRATACION) FROM EMPLEADO);

SELECT NOMBRES, FECHA_DE_CONTRATACION FROM EMPLEADO WHERE FECHA_DE_CONTRATACION=(SELECT MAX(FECHA_DE_CONTRATACION) FROM EMPLEADO);

SELECT EMPLEADO.NOMBRES, SEDE.SEDE, CARGO.CARGO FROM EMPLEADO JOIN SEDE ON EMPLEADO.ID_SEDE = SEDE.ID_SEDE  JOIN CARGO ON EMPLEADO.ID_CARGO = CARGO.ID_CARGO WHERE EMPLEADO.CC ='10662101';
--------
DELETE FROM EMPLEADO WHERE EMPLEADO.CC ='10188530';

SELECT NOMBRES, FECHA_DE_CONTRATACION FROM EMPLEADO WHERE FECHA_DE_CONTRATACION BETWEEN '2000\01\01'  AND '2005\12\31';

SELECT NOMBRES, EDAD FROM EMPLEADO ORDER BY NOMBRES DESC;

SELECT NOMBRES, EDAD FROM EMPLEADO WHERE EDAD BETWEEN 17 AND 25;

SELECT AVG(EDAD) FROM EMPLEADO;

SELECT sum(SUELDO) FROM EMPLEADO;

SELECT EMPLEADO.NOMBRES, EMPLEADO.FECHA_DE_CONTRATACION, ESTRATO.ESTRATO, SEDE.SEDE, CARGO.CARGO FROM EMPLEADO JOIN SEDE ON EMPLEADO.ID_SEDE = SEDE.ID_SEDE  JOIN CARGO ON EMPLEADO.ID_CARGO = CARGO.ID_CARGO JOIN ESTRATO ON EMPLEADO.ID_ESTRATO = ESTRATO.ID_ESTRATO WHERE EMPLEADO.SUELDO=(SELECT MAX(EMPLEADO.SUELDO) FROM EMPLEADO);

SELECT NOMBRES FROM EMPLEADO WHERE EDAD=(SELECT MIN(EDAD) FROM EMPLEADO) AND ID_SEDE=3 fetch first 1 row only;

SELECT ESTRATO.ESTRATO, COUNT(*) AS EMPLEADOS FROM EMPLEADO JOIN ESTRATO ON EMPLEADO.ID_ESTRATO = ESTRATO.ID_ESTRATO GROUP BY ESTRATO ORDER BY ESTRATO;

SELECT SEDE.SEDE, COUNT(*) AS EMPLEADOS FROM EMPLEADO JOIN SEDE ON EMPLEADO.ID_SEDE = SEDE.ID_SEDE GROUP BY SEDE ORDER BY SEDE;