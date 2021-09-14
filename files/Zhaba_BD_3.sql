-- create database NewTry;
use NewTry;

-- 1	

CREATE TABLE IF NOT EXISTS`Flight` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Номер Рейса` VARCHAR(255) NOT NULL,
    `Тип Рейса` VARCHAR(255) NOT NULL,
    `Время отправки` VARCHAR(255) NOT NULL,
	`Время прибытия` VARCHAR(255) NOT NULL,
    `id_Air_Marshal` INT NOT NULL,
    `id_Plane` INT NOT NULL,
    `id_Arrival_Airport` INT NOT NULL,
    `id_Departure_Airport` INT NOT NULL,
     PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 2

-- 3
CREATE TABLE IF NOT EXISTS `Plane` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Производитель` VARCHAR(45) NOT NULL,
	`Загруженность` DECIMAL NOT NULL,
	`Состояние` VARCHAR(45) NOT NULL,
	`Тип` VARCHAR(45) NOT NULL,
	`Номер модели` VARCHAR(45) NOT NULL,
 	`id_Hangar` INT NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 4
CREATE TABLE IF NOT EXISTS `Passenger` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ФИО` VARCHAR(255) NOT NULL,
    `Паспортные данные` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
CREATE TABLE IF NOT EXISTS `Ticket` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Номер` VARCHAR(255) NOT NULL,
	`Стоимость` DECIMAL (20) NOT NULL,
    `Информация о Пассажире` INT NOT NULL,
	`Посадочное место` VARCHAR(5) NOT NULL,
    `id_Flight` INT NOT NULL,
	`id_Passenger` INT NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;

-- 5
CREATE TABLE IF NOT EXISTS `Hangar` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `Вместимость` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 6
CREATE TABLE IF NOT EXISTS `Repair_Station` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Вместимость` DECIMAL NOT NULL,
	`Функционал` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 7
CREATE TABLE IF NOT EXISTS `Aircraft_Mechanic` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `ФИО` VARCHAR(255) NOT NULL,
	`Должность` VARCHAR(45) NOT NULL,
	`Специализация` TINYTEXT NOT NULL,
	`Стаж` INT NOT NULL,
 	`id_Repair_Station` INT NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 8
CREATE TABLE IF NOT EXISTS `Aircraft_Mechanics` (
	`id_Plane` INT NOT NULL,
	`id_Aircraft_Mechanic` INT NOT NULL,
	PRIMARY KEY (`id_Plane`, `id_Aircraft_Mechanic`)

) engine InnoDB default charset= utf8;
-- 9
CREATE TABLE IF NOT EXISTS `Cargo` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Назначение` VARCHAR(45) NOT NULL,
	`Размер` VARCHAR(100) NOT NULL,
	`Вес` VARCHAR(12) NOT NULL,
	`Легальность` BOOLEAN,
    `Содержимое` TINYTEXT NOT NULL,
    `Хрупкость` BOOLEAN,
    `id_Flight` INT NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 10
CREATE TABLE IF NOT EXISTS `Luggage` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Назначение` VARCHAR(45) NOT NULL,
	`Размер` VARCHAR(100) NOT NULL,
	`Вес` VARCHAR(12) NOT NULL,
	`Легальность` BOOLEAN,
    `Содержимое` TINYTEXT NOT NULL,
    `Хрупкость` BOOLEAN,
    `id_Ticket` INT NOT NULL,
	PRIMARY KEY (`id`)
    ) engine InnoDB default charset= utf8;
    -- 11
CREATE TABLE IF NOT EXISTS `Breakdown` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Номер Рейса` VARCHAR(45) NOT NULL,
	`Что случилсоь` VARCHAR(150) NOT NULL,
	`Наличие пострадавших` BOOLEAN,
    `Поврежденные модули` TINYTEXT NOT NULL,
    `Критично для текущего рейса?` BOOLEAN,
    `id_Flight` INT NOT NULL,
	PRIMARY KEY (`id`)
   ) engine InnoDB default charset= utf8;
-- 12
CREATE TABLE IF NOT EXISTS `Airport` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Код` VARCHAR(3) NOT NULL,
	`Название` VARCHAR(255) NOT NULL,
	`Функционал` TINYTEXT NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 13
CREATE TABLE IF NOT EXISTS `Air_Marshal` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ФИО` VARCHAR(255) NOT NULL,
	`Звание` VARCHAR(60) NOT NULL,
	`Подготовка` TINYTEXT NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 14
CREATE TABLE IF NOT EXISTS `Pilot` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ФИО` VARCHAR(255) NOT NULL,
	`Стаж` DECIMAL NOT NULL,
	`Должность` VARCHAR(60) NOT NULL,
	`Звание` VARCHAR(60) NOT NULL,
	`Зарплата` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 15
CREATE TABLE IF NOT EXISTS `Flight_Attendant` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ФИО` VARCHAR(255) NOT NULL,
	`Пол` VARCHAR(60) NOT NULL,
	`Стаж` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
) engine InnoDB default charset= utf8;
-- 16
CREATE TABLE IF NOT EXISTS `Flight_Attendants` (
	`id_Flight_Attendant` INT NOT NULL,
    `id_Flight` INT NOT NULL,
	PRIMARY KEY (`id_Flight_Attendant`, `id_Flight`)
) engine InnoDB default charset= utf8;
-- 17
CREATE TABLE IF NOT EXISTS `Pilots` (
	`id_Pilot` INT NOT NULL AUTO_INCREMENT,
	`id_Flight` INT NOT NULL,
	PRIMARY KEY (`id_Pilot`, `id_Flight`)
) engine InnoDB default charset= utf8;

ALTER TABLE Ticket ADD FOREIGN KEY (id_Passenger) REFERENCES `Passenger` (id);

ALTER TABLE Ticket ADD FOREIGN KEY (id_Flight) REFERENCES `Flight` (id);

ALTER TABLE `Luggage` ADD FOREIGN KEY (id_Ticket) REFERENCES `Ticket` (id);

ALTER TABLE `Cargo` ADD FOREIGN KEY (id_Flight) REFERENCES `Flight` (id);

ALTER TABLE `Aircraft_Mechanic` ADD FOREIGN KEY (id_Repair_Station) REFERENCES `Repair_Station` (id);

ALTER TABLE `Aircraft_Mechanics` ADD FOREIGN KEY (id_Aircraft_Mechanic) REFERENCES `Aircraft_Mechanic` (id);

ALTER TABLE `Aircraft_Mechanics` ADD FOREIGN KEY (id_Plane) REFERENCES `id_Plane` (id);

ALTER TABLE `Plane` ADD FOREIGN KEY (id_Hangar) REFERENCES `Hangar` (id);

ALTER TABLE `Flight` ADD FOREIGN KEY  (id_Plane) REFERENCES `id_Plane` (id);
 
ALTER TABLE `Flight` ADD FOREIGN KEY (id_Air_Marshal) REFERENCES `Air_Marshal` (id);

ALTER TABLE `Flight` ADD FOREIGN KEY  (id_Arrival_Airport) REFERENCES `Airport` (id);

ALTER TABLE `Flight` ADD FOREIGN KEY  (id_Departure_Airport) REFERENCES `Airport` (id);

ALTER TABLE `Pilots` ADD FOREIGN KEY  (id_Pilot) REFERENCES `Pilot` (id);

ALTER TABLE `Pilots` ADD FOREIGN KEY  (id_Flight) REFERENCES `Flight` (id);

ALTER TABLE `Flight_Attendants` ADD FOREIGN KEY  (id_Flight) REFERENCES `Flight` (id);

ALTER TABLE `Flight_Attendants` ADD FOREIGN KEY  (id_Flight_Attendant) REFERENCES `Flight_Attendant` (id);

ALTER TABLE `Breakdown` ADD FOREIGN KEY  (id_Flight) REFERENCES `Flight` (id);


-- 1
REPLACE INTO Air_Marshal
VALUES
		(1,"Борис Хренпопадёшь Бритва","Майор","Курсы проф.подготовки, Курсы переговорщика, Война в Ираке"),
		(2,"Тимур Сергеевич Глазков.","Лейтенант","Курсы проф.подготовки, Курсы переговорщика"),
		(3,"Максим Олегович Басуда","Капитан","Курсы проф.подготовки, Курсы переговорщика, Операция №*****"),
		(4,"Медведев Аким Кириллович","Старший сержант","Курсы проф.подготовки, Курсы переговорщика"),
		(5,"Константинов Остап Максимович","Капитан","Курсы проф.подготовки, Курсы переговорщика"),
		(6,"Сысоев Платон Семёнович","Лейтенант","Курсы проф.подготовки, Курсы переговорщика, Курс оказания первой помощи"),
		(7,"Авдеев Ермак Николаевич","Капитан","Курсы проф.подготовки, Курсы переговорщика"),
		(8,"Кулагин Родион Тихонович","Сержант","Курсы проф.подготовки, Курсы переговорщика"),
		(9,"Панов Роберт Альбертович","Капитан","Курсы проф.подготовки, Курсы переговорщика"),
		(10,"Яковлев Натан Павлович","Сержант","Курсы проф.подготовки, Курсы переговорщика");
-- 2
REPLACE INTO Aircraft_Mechanic
VALUES
		(1,"Абрамов Роман Альбертович","Старший инженер-моторист","Обслуживание силовых установок","5",1),
		(2,"Рябов Матвей Антонович","Сварщик 1 разряда","Кузовные работы","15",1),
		(3,"Владимиров Герасим Васильевич","Электрик","Проводка","2",4),
        (4,"Харитонов Борис Яковович","Программист","Проверка ПО","5",4),
		(5,"Жуков Ростислав Яковович","Программист","Проверка ПО","4",4),
		(6,"Тихонова Ника Борисовна","Кабельщик","Проводка","6",8),
		(7,"Беспалов Ефрем Кимович","Маляр","Малярные работы","7",1),
		(8,"Быков Устин Семёнович","Моторист","Обслуживание силовых установок","10",10),
		(9,"Дмитриева Августа Сергеевна","Проверяющий","Контроль качества","8",7),
		(10,"Фёдоров Иосиф Мартынович","Техник по эксплуатации","Техосмотр","4",7);

-- 3
REPLACE INTO Airport
VALUES
		(1,"Аэропорт Внуково","Взлет/посадка малой, большой и правительственной авиации","VKO"),
		(2,"Аэропорт Париж — Шарль-де-Голль","Взлет/посадка малой, большой и правительственной авиации","CDG"),
		(3,"Международный аэропорт Лос-Анджелес","Взлет/посадка малой, большой и правительственной авиации","LAX"),
		(4,"Международный аэропорт «Чанги»","Взлет/посадка малой, большой и правительственной авиации","SIN"),
		(5,"Лондонский аэропорт Хиитроу","Взлет/посадка малой, большой и правительственной авиации","LHR"),
		(6,"Международный аэропорт Инчхон","Взлет/посадка малой, большой и правительственной авиации","ICN"),
		(7,"Международный аэропорт имени Джона Кеннеди","Взлет/посадка малой, большой и правительственной авиации","JFK"),
		(8,"Берлин-Бранденбург","Взлет/посадка малой, большой и правительственной авиации","BER"),
		(9,"Вацлав Гавел Аэропорт Прага","Взлет/посадка малой, большой и правительственной авиации","PRG"),
		(10,"Международный аэропорт Токио","Взлет/посадка малой, большой и правительственной авиации","HND");
        
-- 4
REPLACE INTO Breakdown
VALUES
		(1,"KL-905","Разрыв топливных магистралей в районе четвертого двигателя","0","1",2),
        (2,"SU6566","Отказ ИЛС","0","Электрика","1",1),
        (3,"KL-905","Отказ гидросистем","0","Гидравлика","1",2),
        (4,"KL-905","Чрезмерное обледенение","0","Фюзеляж","0",2),	
		(5,"SU320","Отказ третьего двигателя","0","Третий двигатель","0",3),		
        (6,"B28906","Ошибка выпуска оперения","0","Закрылки","1",4),
        (7,"RU-560","Попадание ракеты боевиков класса Земля-Воздух","1","Второй двигатель, топливный бак","1",5),
		(8,"OA910","Отказ автопилота","0","Электрика","0",6),
        (9,"BA31","Задымление салона","1","Система циркуляции воздуха","1",7),
        (10,"CA-585","Отказ ЛТЦ","0","Система ложных тепловых целей","0",9);
 -- 5
 REPLACE INTO Cargo
 VALUES
		(1,"Гражданское","80 контейнеров","80т","1","Товары с АлиЭкспресса","1",10),
		(2,"Гражданское","5 контейнеров","5т","1","Картины Пикассо","1",2),
        (3,"Гражданское","100 контейнеров","100т","1","Картошка","0",9),
        (4,"Военное","5 контейнеров","15т","0","Боеприпасы для артиллерии","1",5),
        (5,"Военное","1 контейнер","2т","1","Медикаменты","0",5),
        (6,"Военное","2 контейнера","100т","0","Три танка","1",5),
        (7,"Военное","1 контейнер","1т","1","Почта","0",5),
        (8,"Гражданское","10 контейнеров","20т","1","Коллекция автомобилей олигарха","1",2),
        (9,"Гражданское","2 контейнера","10т","1","Двигатели","1",9),
        (10,"Гражданское","1 контейнер","3т","1","Supermarine Spitfire Mk.V","1",2);
-- 6
 REPLACE INTO Flight
 VALUES
		(1,"SU6566","Пассажирский","15:55","19:00","1","1","1",2),
		(2,"KL-905","Грузовой","23:05","04:20","2","3","3",4),
        (3,"SU320","Пассажирский","22:00","08:45","3","6","5",6),
        (4,"B28906","Пассажирский","21:30","01:10","4","1","7",8),
        (5,"RU-560","Грузовой","00:20","07:26","5","2","10",9),
        (6,"OA910","Пассажирский","23:15","12:55","6","7","5",4),
        (7,"BA31","Пассажирский","18:40","13:40","8","7","7",2),
        (8,"V72259","Пассажирский","23:59","02:50","9","6","6",1),
        (9,"CA-585","Грузовой","01:50","09:10","10","8","2",7),
        (10,"6L-804","Грузовой","02:25","05:10","7","9","9",1);
        
        
 -- 7
 REPLACE INTO Flight_Attendant
 VALUES
		(1,"Высоцкий Владимир Семёнович","Мужской",7),
		(2,"Маяковский Владимир Владимирович","Мужской",1),
        (3,"Джилл Валентайн","Женский",5),
        (4,"Ада Вонг","Женский",7),
        (5,"Крис Редфилд","Мужской",10),
        (6,"Альсина Димитреску","Женский",95),
        (7,"Леон Скотт Кеннеди","Мужской",1),
        (8,"Карлос Оливейра","Мужской",3),
        (9,"Уильям Биркин","Мужской",15),
        (10,"Сергей Тиранович Владимир","Мужской",4);
 -- 8
 REPLACE INTO Hangar
 VALUES
		(1,1),
		(2,2),
        (3,3),
        (4,2),
        (5,4),
        (6,2),
        (7,1),
        (8,1),
        (9,1),
        (10,3);
 -- 9
 REPLACE INTO Luggage
 VALUES
		(1,"Гражданское","2 чемодана размера L","45кг","1","","1",10),
		(2,"Гражданское","1 чемодан размера S","7кг","1","Личные вещи","1",2),
        (3,"Гражданское","1 чемодан размера M","15кг","1","Личные вещи","0",3),
        (4,"Гражданское","1 чемодан размера S","5кг","1","Личные вещи","0",4),
        (5,"Гражданское","1 чемодан размера L","20кг","1","Личные вещи","1",9),
        (6,"???","Свёрток 20*20*40см","2кг","1","Партия героина","0",1),
        (7,"Гражданское","2 чемодана размера S","11кг","1","Личные вещи","0",5),
        (8,"Гражданское","1 чемодан размера M","9кг","1","Личные вещи","1",6),
        (9,"Гражданское","1 чемодан размера M","10кг","1","Личные вещи","1",7),
        (10,"Гражданское","Оружейный кейс","10кг","1","Две единицы гражданского нарезного длинноствольного оружия","1",8);
 -- 10
 REPLACE INTO Passenger
 VALUES
		(1,"Чернецкий Александр Афанасьевич","4982 577209"),
        (2,"Заварзин Георгий Тимофеевич","4507 355820"),
        (3,"Половцев Аркадий Савванович","4115 473744"),
        (4,"Юхтрица Наталия Ивановна","4968 229933"),
        (5,"Карачёв Яков Давидович","4556 600989"),
        (6,"Ярмоненко Данила Севастьянович","4131 874643"),
        (7,"Куцак Кузьма Филиппович","4315 649237"),
        (8,"Браславец Виктор Савванович","4734 985082"),
        (9,"Тетерева Ася Емельяновна","4117 116477"),
        (10,"Johnny Silverhand","2077 202023");
 -- 11
 REPLACE INTO Pilot
 VALUES
		(1,"Плотников Иван Николаевич","15","Captain","КВС","300000"),
		(2,"Жмышенко Валерий Альбертович","7","Senior First Officer","Второй Пилот","250000"),
        (3,"Михаил Петрович Девятаев","3","Cadet","Курсант с самостоятельным вылетом","50000"),
        (4,"Сабуро Сакаи","1","Trainee","Курсант без самостоятельного вылета","0"),
        (5,"Фомичёв Альберт Аркадьевич","2","Training Captain","КВС","350000"),
        (6,"Клэр Редфилд","5","Trainee","Курсант без самостоятельного вылета","0"),
        (7,"Кулаков Абрам Эльдарович","4","Cadet","Курсант с самостоятельным вылетом","70000"),
        (8,"Мышкин Антон Якунович","6","Second Officer","Второй Пилот","200000"),
        (9,"Архипов Семен Иринеевич","7","Captain","КВС","299000"),
        (10,"Артемьев Юрий Никитевич","10","Second Officer","Второй Пилот","150000");
 -- 12
 REPLACE INTO Plane
 VALUES
		(1,"Airbus","80","Идеальное","Пассажирский","A319",2),
		(2,"Boeing","95","Удовлетворительное","Грузовой","747-400F",3),
        (3,"Airbus","0","Хорошее","Грузовой","A300-600ST",5),
        (4,"Boeing","0","Неудовлетворительное","Пассажирский","737-MAX",1),
        (5,"ОАК","0","Ну такое","Пассажирский","МС-21",4),
        (6,"Туполев","70","Идеальное","Пассажирский","Ту-134",6),
        (7,"Туполев","86","Хорошее","Пассажирский","Ту-154",7),
        (8,"Lockheed","100","Идеальное","Грузовой","C-5 Galaxy",8),
        (9,"Airbus","50","Удовлетворительное","Грузовой","A400M Atlas",10),
        (10,"Kawasaki","0","Неудовлетворительное","Грузовой","C-2",9);
 -- 13
 REPLACE INTO Repair_Station
 VALUES
		(1,"5","Кузовной ремонт, малярные работы"),
		(2,"4","Замена жидкостей"),
        (3,"1","Ремонт силовых установок"),
        (4,"2","Электрика, IT отдел"),
        (5,"4","Симуляторные тесты"),
        (6,"3","Аэротруба, техосмотр, замена жидокстей"),
        (7,"2","Выдача допусков к полетам"),
        (8,"1","Электрика"),
        (9,"1","Обслуживание салона"),
        (10,"3","Ремонт силовых установок");
 -- 14
  REPLACE INTO Ticket
  VALUES
 		(1,"5559708491506","14856","Заварзин Георгий Тимофеевич","21h","2",10),
		(2,"1762140736267","77458","Половцев Аркадий Савванович","2b","3",2),
        (3,"2563512354113","60555","Юхтрица Наталия Ивановна","16e","4",1),
        (4,"1763526884113","6086","Чернецкий Александр Афанасьевич","11i","1",3),
        (5,"8455645456445","22145","Карачёв Яков Давидович","25g","5",6),
        (6,"2356782458742","21255","Ярмоненко Данила Севастьянович","40c","6",8),
        (7,"2453685214824","75575","Куцак Кузьма Филиппович","5c","7",4),
        (8,"9856324578524","8456","Браславец Виктор Савванович","12e","8",9),
        (9,"8754215487524","45664","Johnny Silverhand","8g","10",7),
        (10,"4556464564545","9548","Тетерева Ася Емельяновна","15f","9",5);