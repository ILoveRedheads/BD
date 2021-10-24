-- В генераторе сделаем 17 фалйов для 17 таблиц, в каждой из которых будет по тысяче строк с данными для каждой таблицы. Генератор - www.mockaroo.com

use Order66;
-- И почему в MySQL вместо "Use" нельзя использовать "Execute"? Эх...

-- LOAD DATA INFILE INTO TABLE -  оператор импортирует данные из файла ".csv" в таблицу "..."
-- Поля файла завершаются запятой, относящейся к FIELD TERMINATED BY ‘,’,
-- которая заключена в двойные кавычки, предусмотренные форматом ENCLOSED BY '"'.
-- Каждая строка CSV файла завершается символом новой строки, обозначающим TERMINATED BY ‘n’.
-- Поскольку первая строка файла содержит заголовки столбцов, которые не должны быть импортированы в таблицу,
-- мы игнорируем ее, указав опцию IGNORE 1 ROWS.

-- 1

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\AIR_MARSHAL_DATA.csv' 
INTO TABLE `Air_Marshal`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 2

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\FLIGHT_DATA.csv' 
INTO TABLE `Flight`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 3

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\PLANE_DATA.csv' 
INTO TABLE `Plane`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 4

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\PASSENGER_DATA.csv' 
INTO TABLE `Passenger`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 5

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\TICKET_DATA.csv' 
INTO TABLE `Ticket`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 6

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\REPAIR_STATION_DATA.csv' 
INTO TABLE `Repair_Station`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 7

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\AIRCRAFT_MECHANIC_DATA.csv'  
INTO TABLE `Aircraft_Mechanic`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 8

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\AIRCRAFT_MECHANICS_DATA.csv' 
INTO TABLE `Aircraft_Mechanics`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 9

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\CARGO_DATA.csv' 
INTO TABLE `Cargo`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 10

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\LUGGAGE_DATA.csv' 
INTO TABLE `Luggage`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 11

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\BREAKDOWN_DATA.csv' 
INTO TABLE `Breakdown`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 12

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\AIRPORT_DATA.csv' 
INTO TABLE `Airport`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 13

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\PILOT_DATA.csv' 
INTO TABLE `Pilot`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 14

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\PILOTS_DATA.csv' 
INTO TABLE `Pilots`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 15

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\FLIGHT_ATTENDANT_DATA.csv' 
INTO TABLE `Flight_Attendant`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 16

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\FLIGHT_ATTENDANTS_DATA.csv' 
INTO TABLE `Flight_Attendants`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 17

LOAD DATA INFILE 'F:\bd\BD\files\Zhaba_BD_5\HANGAR_DATA.csv' 
INTO TABLE `Hangar`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- Процедуры

DELIMITER //

CREATE PROCEDURE FirstProcedure()
BEGIN 
	SELECT 'This is my first procedure';
END //
DELIMITER ; 

CALL FirstProcedure();

-- 1.

-- Выведем при помощи процедуры информацию о карте в диапазоне
-- Выбираем данные, которые нужны, при помощи SELECT
-- Задаем условие выборки: у конкретной карты по id-конкретный тип продукта 
-- Возьмем не сильно объемную часть выборки - (5;100)

DELIMITER //
CREATE PROCEDURE CardType() 
BEGIN 
	SELECT  product.id, `name`, connection_date
    FROM product_type
    JOIN product ON product_type.id = product.id
    WHERE product.id>5 AND product.id<100;
END //
DELIMITER ;
CALL CardType();

-- 2

-- Выведем максимальную зарплату специалиста

DELIMITER //
CREATE PROCEDURE maximumPrize(OUT salary INT)
BEGIN 
	SELECT MAX(salary)
    INTO salary
    FROM specialist;
END //
DELIMITER ;

CALL maximumPrize(@MaxSalary);
SELECT @MaxSalary;

-- 3.

-- Выведем кота, который продается в магазине "Четыре лапы" и id

DELIMITER //
CREATE PROCEDURE catsAndShop()
BEGIN
	SELECT *
    FROM shops
    WHERE shopname = "Четыре лапы";
END //
CALL catsAndShop();

-- 3 функции.

-- 1
-- Создадим функцию, определяющую к какой группе принадлежит сотрудник
-- Занимаемую долнжость выведем через локальную переменную correct

DELIMITER $$ 
CREATE FUNCTION postSpecialist (post varchar(45))
RETURNS varchar(45)
DETERMINISTIC
BEGIN 
	DECLARE correct VARCHAR(45); 
    IF post LIKE  'Специалист отдела' THEN SET correct ='Младщий сотрудник'; 
ELSE SET correct='СТАРШИЙ СПЕЦИАЛИСТ или стажёр'; 
END IF; 
RETURN (correct); 
END $$; 
DELIMITER $$ 

SELECT post,specialist.fullname AS correct, postSpecialist (post)
FROM specialist;

-- 2.

-- Проверим, хранит ли наша табличка NULL.
-- Если Null будет найден, то вывести "0"

DELIMITER $$ 
CREATE FUNCTION addToNull (
	firstValue INT,
    secondValue INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	IF firstValue IS NULL THEN
		SET firstValue = 0;
	END IF;
    
    IF secondValue IS NULL THEN
		SET secondValue = 0;
	END IF;
    
    RETURN (secondValue,firstValue);
 END $$
 
 SELECT addToNull(code,code_shops) AS nullRow, id
 FROM cats
 WHERE id > 1;

-- 3

-- Напишем функцию, которая вычисляет размер кэшбэка по формуле

DELIMITER $$ 
CREATE FUNCTION Cashback (
	cashback INT
)
RETURNS  INT
DETERMINISTIC
BEGIN
	IF cashback > 5000 AND cashback < 250000 THEN
		SET cashback = 0.1 * cashback;
	END IF; 
RETURN (cashback); 
END $$; 
DELIMITER $$ 	

SELECT Cashback(amountINT)
FROM`action`
WHERE id < 11;

-- Представления.
-- 1. 

-- Аналог №54. INNER JOIN. Выведем название отдела и его состав

CREATE VIEW specialistPertition
AS SELECT   `staff`, `name`
FROM  `department` AS `d`
JOIN `department_type` AS `d_t`
ON d.id = d_t.id;

-- 2

-- 55. Такая же логика: название банковского продукта + описание по ID

CREATE VIEW prudctToProductType
AS SELECT `name`, `description`
FROM `product` AS `p`
JOIN `product_type` AS `p_t`
ON p.id = p_t.id;

-- 3.

-- Для заданного клиента по ФИО вывести выписку о его действиях по его продуктам.
-- В действиях приjoinить ID, тип действия , без отделения


CREATE VIEW actionAndType
AS SELECT  id_type_of_action AS new_id_type_of_action , fullname,`name`, `amount`
FROM сlient c 
LEFT JOIN  `product` p 
ON p.id_client = c.id
LEFT JOIN `action` a
ON a.account_subject_id = p.id
LEFT JOIN `action_type` a_t
ON a.id_type_of_action = a_t.id
WHERE c.fullname =  'Авдеева А.А.';
 