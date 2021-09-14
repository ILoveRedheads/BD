-- 15 функциональных требований.

-- 1. Показать список Воздушных маршалов.

SELECT *from air_marshal;

-- 2. Показать ФИО Воздушных маршалов.

SELECT `FullName`
FROM air_marshal;

-- 3. Изменить даныне о вместимости пятого ангара.

UPDATE hangar
SET Capacity = '3'
WHERE id = 5;

-- 4. Показать багаж третьего пассажира

SELECT `Content`
FROM luggage
WHERE id = "3";

-- 5. Посчитать количество жалоб за месяц

SELECT count(*) FROM service;

-- 6. Отобразить пилотов, чья ЗП располагается в пределах [100000; 250000]

SELECT *from Pilot
WHERE Salary BETWEEN 100000 AND 250000;

-- 7. Вывести информацию о поломке, связанной с отказом ИЛС

SELECT * FROM Breakdown 
WHERE Reason = 'Отказ ИЛС';

-- 8. Добавим новый ангар

INSERT INTO Hangar
VALUES (11,3);

-- 9. Изменить ФИО Пилота в связи со ссменой фамилии
UPDATE `Pilot`
SET `FullName` = 'Клэр Кеннеди' 
WHERE id = 6;

-- 10. Удалить "11" ангар

DELETE from hangar
WHERE id = 11;

-- 11. Изменить паспортные данные пассажира в связи со сменой паспорта

UPDATE `passenger`
SET Passport_Info = "4642 654685"
WHERE  id = 1;

-- 12. Уволить Альсину Димитреску

DELETE FROM flight_attendant
WHERE `Exp` =  "95";

-- 13. Удалить пассажира с id=2

DELETE from Passenger
WHERE `id` = "2";

-- 14. Вывести зп всех пилотов

SELECT SUM(DISTINCT salary) as sum FROM pilot;

-- 15. Отобразить пилотов с опытом работы 7 лет и зп больше, чем 50000

SELECT * FROM pilot WHERE Exp = "7" AND Salary >= 50000;

-- UPDATE. 5 штук

-- 16. Изменить зарплату Пилоту в связи с увеличением стажа

UPDATE pilot
SET Salary  = 500000
WHERE `Exp` = "15";

-- 17. Сменить ФИО механика в связи с выходом замуж

UPDATE aircraft_mechanic 
SET FillName = "Харитонова Августа Сергеевна"
WHERE id = "9";

-- 18. Изменить время прибытия первого рейса в связи с опозданием вылета
UPDATE Flight
SET Arrival_Time = "20:00"
WHERE id = 1;

-- 19. Изменить состояние самолета в связи с его починкой

UPDATE office
SET `status` = "Удовлетворительное"
WHERE Model_Number = "МС-21" ;

-- 20. Повысить Воздушного маршала, имеющего звание "Старший сержант" до лейтенанта 

UPDATE Air_Marshal
SET `Rank` = "Лейтенант"
WHERE `Rank` = "Старший сержант";

-- DELETE. 5 штук

-- 21. "Отправить на пенсию" авиамеханика, стаж работы которого - 15 лет

DELETE from Aircraft_Mechanic
WHERE `Exp` = "15 лет";

-- 22. Удаление случайно созданной таблицы.

CREATE TABLE `FFlight`(
	id_F int not null
);
DELETE FROM `FFlight`;

-- 23. Создадим тип рейса "Военный", а затем удалим его

UPDATE Flight 
SET `Flight_type` = "Военный"
WHERE id = "1" ;
DELETE FROM Flight
WHERE `Flight_type` = "Военный";

-- 24. Удалить второго пассажира с рейса из-за того, что тот не приехал на него

DELETE FROM passenger
WHERE id = "2";

-- 25. Удалить информацию по Джилл Валентайн, т.к. она уже есть в базе

INSERT INTO Flight_Attendant VALUES (11,"Джилл Валентайн","Женский",5);
DELETE from Flight_Attendant
WHERE id = 11;

--  20 Select-ов

-- 26. Показать все рейсы

SELECT *from flight;

-- 27. Показать весь перевозимый груз

SELECT *from Cargo;

-- 28. Показать всех бортпроводников-мужчин

SELECT *from Flight_Attendant
WHERE Sex= "Мужской";

-- 29. Показать все ангары, вместимостьюбольше двух самолетов

SELECT *from hangar
WHERE Capacity > 2;

-- 30. Отобразить все поломки рейса KL-905

SELECT  *from Breakdown
WHERE`Flight_Number` = "KL-905";

-- 31. Отобразить все грузы военного назначения, чей размер составляет один контейнер

SELECT *from Cargo
WHERE `Appointment` = "Военное" AND `Size`= "1 контейнер";

-- 32. Отобразить всех мужчин-бортпроводников со стажем в 7 лет

SELECT *from petition
WHERE `Sex` = "Мужской" And `Exp` = 7;

-- 33. Отобразить пилотов в должности "Командир Воздушного Судна" или имеющих звание "Капитан"

SELECT *from Pilot
WHERE`Job` = "КВС" OR `Rank` = "Captain";

-- 34. Отобразить все самолеты в идеальном состоянии

SELECT *FROM Plane
WHERE `Status` = "Идеальное";

-- 35. Отобразить количество производителей самолетов

SELECT COUNT(DISTINCT Manufacturer)
AS CountOfManufacturers
FROM Plane;

-- 36. Отобразить все уникальные производители самолетов

SELECT DISTINCT Manufacturer 
FROM Plane;


-- 37. Отобразить все аэропорты

SELECT* FROM airport;

-- 38. Отобразить всех пассажиров

SELECT* FROM Passenger;

-- 39. Отобразить весь легальный к провозу багаж

SELECT *from luggage
WHERE `Is_Legal` = 1;

-- 40. Отобразить весь нелегальный к провозу багаж

SELECT *from luggage
WHERE `Is_Legal` = 0;

-- 41. Вывести число пилотов, имеющих звание "Капитан"

SELECT COUNT(*) 
FROM Pilot 
WHERE `Rank` = 'Captain';

-- 42. Вывести максимальную зарпалту пилота

SELECT MAX(Salary)
FROM Pilot;

-- 43. Посчитать среднюю зарплату пилотов

SELECT AVG(Salary) AS AVGSalary FROM Pilot;

-- 44. Изменить название "Size" на "Razmer" в таблице багажа

SELECT Size as Razmer FROM luggage;

-- 45. Вывести стаж бортпроводников в пределе от 2 до 10 лет

SELECT *FROM flight_attendant
WHERE `Exp`>2 AND `Exp`<10;

-- Л А Й К И 

-- 46. Показать, какой Маршал прошел курсы оказания первой помощи

SELECT * FROM Air_Marshal WHERE Background LIKE '%Курс оказания первой помощи%';

-- 47. Отобразить аэропорты, чьи официальные названия имеют слово "Международный"

SELECT * FROM airport WHERE `Name` LIKE '%Международный%';

-- 48. Отобразить поломки, связанные с отказом чего-либо

SELECT * FROM breakdown WHERE `Reason` LIKE 'Отказ%';

-- 49. Вывести всех бортпроводников, чьи имена начинаются на "А"

SELECT* FROM Flight_Attendant
WHERE `FullName` LIKE 'В%';

-- 50. Вывести количество некритичных поломок

SELECT COUNT(*) FROM breakdown WHERE Is_Critical = 1;

-- SELECT INTO, INSERT SELECT

-- 51. Выведем в переменные значения id и описапния по нашему описанию - "Перевод из приложения"

SELECT `description`,`id`  INTO @newtable, @new_id
FROM action_type
WHERE `description` = 'Перевод из приложения'; 

SELECT @newtable, @new_id;

-- 52. Создадим пустую тестовую таблицу, в которую перенесем все модели самолетов производства Boeing

SELECT Model_Number
INTO Boeing_Model_Table
FROM Plane
WHERE Manufacturer = "Boeing";

-- JOIN. 20 запросов



-- GROUP BY, ORDER BY, HAVING 

-- 74. Сумиируем зарплаты пилотов по их званиям

SELECT `Rank`, SUM(Salary) AS Sum_Salary
FROM Pilot
GROUP BY `Rank`;

-- 75. То же самое, только со стажем бортпроводниов и их полом

SELECT `Sex`, SUM(Exp) AS Sum_Exp
FROM flight_attendant
GROUP BY `Sex`;

-- 76. Выведем максимальный стаж бортпроводников в ссответствии с их полом

SELECT `Sex`, MAX(Exp) AS MaxExp
FROM flight_attendant
GROUP BY `Sex`;

-- 77. То же самое, только с зп пилотов и их должностью

SELECT `Job`, MAX(Salary) AS Max_Salary
FROM Pilot
GROUP BY `Job`;

-- 78. Упорядочим данные о самолетах по производителю

SELECT *
FROM Plane
ORDER BY Manufacturer;

-- 79. То же самое, только с типом рейсов

SELECT *
FROM flight
ORDER BY Flight_Type;

-- 80. Вывести ремонтные станции, вместимость которых больше трех, в порядке убывания вместимости

SELECT Capacity, id, Funtions 
FROM repair_station
WHERE Capacity > 3
ORDER BY Capacity DESC;

-- 81.  То же самое, только с загруженностью самолетов больше 50 процентов

SELECT Workload, id, Model_Number  
FROM plane
WHERE Workload > 50
ORDER BY Workload DESC;

-- 82. Выведем звания пилотов, чьи суммарные зарплаты первышают 300000

SELECT `Rank`, SUM(Salary)
FROM Pilot
GROUP BY `Rank`
HAVING SUM(salary) > 300000;

-- 83. Вывести бортпроводника, отработвашего больше 50 лет

SELECT FullName, MAX(`Exp`)
FROM flight_attendant
GROUP BY FullName
HAVING MAX(`Exp`) > 50;

-- 84. Выведем пассажиров, которые заплатили за билет больше 50000

SELECT Price, Passenger_Info, id
FROM ticket
WHERE Price > 50000
ORDER BY Price DESC;

-- UNION

-- 85. Выведем пилотов и их должности в рейсах

SELECT Job FROM pilot
UNION all
SELECT FullName FROM pilot;


-- 86. Покажем самых опытных пилотов

SELECT Exp FROM pilot
UNION all
SELECT FullName FROM pilot
ORDER BY Exp DESC;

-- 87.  Вывести показатели легальности грузов и багажей
SELECT Is_Legal
FROM cargo
UNION all
SELECT Is_Legal
FROM luggage;

-- GROUP_CONCAT

-- 88. Выведем ФИО всех пассажиров в строку

SELECT GROUP_CONCAT(FullName) as FullName FROM passenger;

-- 89. Выведем должности пилотов и покажем, какие пилоты имеют эти должности 

SELECT `Job`, GROUP_CONCAT(`FullName`) as `FullName`
FROM `pilot`
GROUP BY `Job` ;

-- 90. То же самое сделаем с функционалом и кодом аэропортов

SELECT `Fucntions`, GROUP_CONCAT(`Code`) as `Code`
FROM `airport`
GROUP BY `Fucntions` ;

-- 91. Выведем первые два провозимых багажа

SELECT * 
FROM `luggage`
LIMIT 2;

-- 92. Выведем имена 4-6 пассажиров

SELECT FullName 
FROM `passenger`
LIMIT 4, 6;

-- 93. Выведем времена прибытия третьего и четвертого рейсов

SELECT Arrival_Time
FROM flight 
LIMIT 3, 4;
