-- В генераторе сделаем 17 фалйов для 17 таблиц, в каждой из которых будет по тысяче строк с данными для каждой таблицы. Генератор - www.mockaroo.com

use Order66;
-- И почему в MySQL вместо "Use" нельзя использовать "Execute"? Эх... Была бы такая отсылка на Звёздные войны...

-- LOAD DATA INFILE INTO TABLE -  оператор импортирует данные из файла ".csv" в таблицу "..."
-- Поля файла завершаются запятой, относящейся к FIELD TERMINATED BY ‘,’,
-- которая заключена в двойные кавычки, предусмотренные форматом ENCLOSED BY '"'.
-- Каждая строка CSV файла завершается символом новой строки, обозначающим TERMINATED BY ‘n’.
-- Легким движением руки (ну или "IGNORE 1 ROWS") игнорируем первую строку каждого файла, так как она содержит заголовки столбцов, которые не должны быть импортированы в таблицу.

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


-- 3 Процедуры

-- 1. Выведем авиамехаников, которые работают с первой по десятую станцию

DELIMITER //
CREATE PROCEDURE Mehaniki() 
BEGIN 
	SELECT id
    FROM Repair_Station
    JOIN Aircraft_Mechanic ON Repair_Station.id=Aircraft_Mechanic.id_Repair_Station
    WHERE id>1 AND id<10;
END //
DELIMITER ;
CALL Mehaniki();


-- 2. Выведем максимальную зарплату пилота

DELIMITER //
CREATE PROCEDURE MaxSal(OUT `Зарплата` INT)
BEGIN 
	SELECT MAX(`Зарплата`)
    INTO `Зарплата`
    FROM `Pilot`;
END //
DELIMITER ;

CALL MaxSal(@MaxSalary);
SELECT @MaxSalary;


-- 3. Выводим имена всех бортпроводниц

DELIMITER //
CREATE PROCEDURE Flight_Women()
BEGIN
	SELECT `ФИО`
    FROM `Flight_Attendant`
    WHERE `Пол` = "Female";
END //
CALL Flight_Women();

-- 3 функции.

-- 1 Установим скидки на все авиабилеты по причине отмены пандемии ковида, так как надо окупать застой

DELIMITER $$ 
CREATE FUNCTION Discount (Стоимость DECIMAL (20))
RETURNS DECIMAL (20)
DETERMINISTIC
BEGIN 
	DECLARE Newprice VARCHAR(45); 
    IF Стоимость > 8000 THEN SET Newprice = 8000;
ELSE SET Newprice= 4000; 
END IF; 
RETURN (Newprice); 
END $$; 
DELIMITER $$ 

SELECT Стоимость AS Newprice, Discount (Стоимость)
FROM Ticket;

-- 2. Вместо стоимости билета будем указывать класс комфорта

DELIMITER $$ 
CREATE FUNCTION AirlineClass (Стоимость DECIMAL (20))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE ClassType VARCHAR(50);
    set ClassType = CASE
        WHEN Стоимость >= 0 AND Стоимость <= 7000 THEN "Лоукостер"
        WHEN Стоимость >= 7001 AND Стоимость <= 10000 THEN "Эконом"
        WHEN Стоимость >= 10001 AND Стоимость <= 20000 THEN "Премиум Эконом"
        WHEN Стоимость >= 200001 AND Стоимость <= 30000 THEN "Бизнесс"
        WHEN Стоимость >= 30001 AND Стоимость <= 200000 THEN "Первый Класс"
	END;
RETURN (ClassType);
END $$;
DELIMITER $$       
 SELECT AirlineClass(Стоимость) AS `Стоимость`
 FROM `Ticket`;

-- 3. Вычисляет размер премии каждому пилоту по формуле: Зарплата * 0.15 

DELIMITER $$ 
CREATE FUNCTION Bonus (
	Bonus INT
)
RETURNS  INT
DETERMINISTIC
BEGIN
	IF Bonus > 5000 AND Bonus < 2500000 THEN
		SET Bonus = 0.15 * Bonus;
	END IF; 
RETURN (Bonus); 
END $$; 
DELIMITER $$ 	

SELECT Bonus(Зарплата)
FROM `Pilot`
WHERE id < 1001;


-- Представления.

-- 1. Добавим новую таблицу, состоящую из пилотов, которым скоро на пенсию (Стаж больше 25 лет)

CREATE VIEW Retiree 
AS SELECT ФИО, Стаж, Должность
  FROM Pilot
  WHERE Стаж >=25;

SELECT *
FROM Retiree;

-- 2. Таким же макаром выводим содержимое и id рейса грузов военного назначения

CREATE VIEW MilitaryCargo 
AS SELECT Содержимое, id_Flight
  FROM Cargo
  WHERE Назначение "Военное";

SELECT *
FROM MilitaryCargo;

-- 3. Выведем данные по рейсу, Маршалу на рейсе и самолету 

CREATE VIEW FlightType
AS SELECT  *
FROM Flight
JOIN Air_Marshal ON Air_Marshal.id = Flight.id_Air_Marshal
JOIN Plane ON Plane.id = Flight.id_Plane;
 
SELECT * FROM FlightType;