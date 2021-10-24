create database Order66;
use Order66;

-- 1	

CREATE TABLE IF NOT EXISTS `Flight` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Номер Рейса` VARCHAR(255) NOT NULL,
    `Тип Рейса` VARCHAR(255) NOT NULL,
    `Время отправки` VARCHAR(255) NOT NULL,
	`Время прибытия` VARCHAR(255) NOT NULL,
    `id_Air_Marshal` INT NOT NULL,
    `id_Plane` INT NOT NULL,
  
     PRIMARY KEY (`id`)
);
-- 2
CREATE TABLE IF NOT EXISTS `Plane` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Производитель` VARCHAR(45) NOT NULL,
	`Загруженность` DECIMAL NOT NULL,
	`Состояние` VARCHAR(45) NOT NULL,
	`Тип` VARCHAR(45) NOT NULL,
	`Номер модели` VARCHAR(45) NOT NULL,
 	`id_Hangar` INT NOT NULL,
	PRIMARY KEY (`id`)
);
-- 3
CREATE TABLE IF NOT EXISTS `Passenger` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ФИО` VARCHAR(255) NOT NULL,
    `Паспортные данные` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`)
);
-- 4
CREATE TABLE IF NOT EXISTS `Ticket` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Номер` VARCHAR(255) NOT NULL,
	`Стоимость` DECIMAL (20) NOT NULL,
    `Информация о Пассажире` VARCHAR(100) NOT NULL,
	`Посадочное место` VARCHAR(5) NOT NULL,
    `id_Flight` INT NOT NULL,
	`id_Passenger` INT NOT NULL,
	PRIMARY KEY (`id`)
);
-- 5
CREATE TABLE IF NOT EXISTS `Hangar` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `Вместимость` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
);
-- 6
CREATE TABLE IF NOT EXISTS `Repair_Station` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Вместимость` DECIMAL NOT NULL,
	`Функционал` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);
-- 7
CREATE TABLE IF NOT EXISTS `Aircraft_Mechanic` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `ФИО` VARCHAR(255) NOT NULL,
	`Должность` VARCHAR(45) NOT NULL,
	`Специализация` TINYTEXT NOT NULL,
	`Стаж` INT NOT NULL,
 	`id_Repair_Station` INT NOT NULL,
	PRIMARY KEY (`id`)
);
-- 8
CREATE TABLE IF NOT EXISTS `Aircraft_Mechanics` (
	`id_Plane` INT NOT NULL,
	`id_Aircraft_Mechanic` INT NOT NULL,
	PRIMARY KEY (`id_Plane`, `id_Aircraft_Mechanic`)

);
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
);
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
    );
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
   );
-- 12
CREATE TABLE IF NOT EXISTS `Airport` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Название` VARCHAR(255) NOT NULL,
	`Функционал` TINYTEXT NOT NULL,
    `Код` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
);
-- 13
CREATE TABLE IF NOT EXISTS `Air_Marshal` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ФИО` VARCHAR(255) NOT NULL,
	`Звание` VARCHAR(60) NOT NULL,
	`Подготовка` TINYTEXT NOT NULL,
	PRIMARY KEY (`id`)
);
-- 14
CREATE TABLE IF NOT EXISTS `Pilot` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ФИО` VARCHAR(255) NOT NULL,
	`Стаж` DECIMAL NOT NULL,
	`Должность` VARCHAR(60) NOT NULL,
	`Звание` VARCHAR(60) NOT NULL,
	`Зарплата` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
);
-- 15
CREATE TABLE IF NOT EXISTS `Flight_Attendant` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ФИО` VARCHAR(255) NOT NULL,
	`Пол` VARCHAR(60) NOT NULL,
	`Стаж` DECIMAL NOT NULL,
	PRIMARY KEY (`id`)
);
-- 16
CREATE TABLE IF NOT EXISTS `Flight_Attendants` (
	`id_Flight_Attendant` INT NOT NULL,
    `id_Flight` INT NOT NULL,
	PRIMARY KEY (`id_Flight_Attendant`, `id_Flight`)
);
-- 17
CREATE TABLE IF NOT EXISTS `Pilots` (
	`id_Pilot` INT NOT NULL AUTO_INCREMENT,
	`id_Flight` INT NOT NULL,
	PRIMARY KEY (`id_Pilot`, `id_Flight`)
);

ALTER TABLE `Ticket` ADD CONSTRAINT FOREIGN KEY (id_Passenger) REFERENCES `Passenger` (id);

ALTER TABLE `Ticket` ADD CONSTRAINT FOREIGN KEY (id_Flight) REFERENCES `Flight` (id);

ALTER TABLE `Luggage` ADD CONSTRAINT FOREIGN KEY (id_Ticket) REFERENCES `Ticket` (id);



ALTER TABLE `Aircraft_Mechanic` ADD CONSTRAINT FOREIGN KEY (id_Repair_Station) REFERENCES `Repair_Station` (id);

ALTER TABLE `Aircraft_Mechanics` ADD CONSTRAINT FOREIGN KEY (id_Aircraft_Mechanic) REFERENCES `Aircraft_Mechanic` (id);

ALTER TABLE `Aircraft_Mechanics` ADD CONSTRAINT FOREIGN KEY (id_Plane) REFERENCES `Plane` (id);

ALTER TABLE `Plane` ADD CONSTRAINT FOREIGN KEY (id_Hangar) REFERENCES `Hangar` (id);

ALTER TABLE `Flight` ADD CONSTRAINT FOREIGN KEY  (id_Plane) REFERENCES `Plane` (id);
 
ALTER TABLE `Flight` ADD CONSTRAINT FOREIGN KEY (id_Air_Marshal) REFERENCES `Air_Marshal` (id);

ALTER TABLE `Cargo` ADD CONSTRAINT FOREIGN KEY (id_Flight) REFERENCES `Flight` (id);

ALTER TABLE `Pilots` ADD CONSTRAINT FOREIGN KEY  (id_Pilot) REFERENCES `Pilot` (id);

ALTER TABLE `Pilots` ADD CONSTRAINT FOREIGN KEY  (id_Flight) REFERENCES `Flight` (id);

ALTER TABLE `Flight_Attendants` ADD CONSTRAINT FOREIGN KEY  (id_Flight) REFERENCES `Flight` (id);

ALTER TABLE `Flight_Attendants` ADD CONSTRAINT FOREIGN KEY  (id_Flight_Attendant) REFERENCES `Flight_Attendant` (id);

ALTER TABLE `Breakdown` ADD CONSTRAINT FOREIGN KEY  (id_Flight) REFERENCES `Flight` (id);

ALTER TABLE `Airport` MODIFY COLUMN `Код` varchar(200);

ALTER TABLE `Ticket` MODIFY COLUMN `Информация о Пассажире` varchar(200);


-- 1
REPLACE INTO Air_Marshal
VALUES
		(NULL,"Борис Хренпопадёшь Бритва","Майор","Курсы проф.подготовки, Курсы переговорщика, Война в Ираке"),
		(NULL,"Тимур Сергеевич Глазков.","Лейтенант","Курсы проф.подготовки, Курсы переговорщика"),
		(NULL,"Максим Олегович Басуда","Капитан","Курсы проф.подготовки, Курсы переговорщика, Операция №*****"),
		(NULL,"Медведев Аким Кириллович","Старший сержант","Курсы проф.подготовки, Курсы переговорщика"),
		(NULL,"Константинов Остап Максимович","Капитан","Курсы проф.подготовки, Курсы переговорщика"),
		(NULL,"Сысоев Платон Семёнович","Лейтенант","Курсы проф.подготовки, Курсы переговорщика, Курс оказания первой помощи"),
		(NULL,"Авдеев Ермак Николаевич","Капитан","Курсы проф.подготовки, Курсы переговорщика"),
		(NULL,"Кулагин Родион Тихонович","Сержант","Курсы проф.подготовки, Курсы переговорщика"),
		(NULL,"Панов Роберт Альбертович","Капитан","Курсы проф.подготовки, Курсы переговорщика"),
		(NULL,"Яковлев Натан Павлович","Сержант","Курсы проф.подготовки, Курсы переговорщика");
-- 2

 REPLACE INTO Repair_Station
 VALUES
		(NULL,"5","Кузовной ремонт, малярные работы"),
		(NULL,"4","Замена жидкостей"),
        (NULL,"1","Ремонт силовых установок"),
        (NULL,"2","Электрика, IT отдел"),
        (NULL,"4","Симуляторные тесты"),
        (NULL,"3","Аэротруба, техосмотр, замена жидокстей"),
        (NULL,"2","Выдача допусков к полетам"),
        (NULL,"1","Электрика"),
        (NULL,"1","Обслуживание салона"),
        (NULL,"3","Ремонт силовых установок");
-- 3 

REPLACE INTO Aircraft_Mechanic
VALUES
		(NULL,"Абрамов Роман Альбертович","Старший инженер-моторист","Обслуживание силовых установок",5,1),
		(NULL,"Рябов Матвей Антонович","Сварщик 1 разряда","Кузовные работы",15,1),
		(NULL,"Владимиров Герасим Васильевич","Электрик","Проводка",2,4),
        (NULL,"Харитонов Борис Яковович","Программист","Проверка ПО",5,4),
		(NULL,"Жуков Ростислав Яковович","Программист","Проверка ПО",4,4),
		(NULL,"Тихонова Ника Борисовна","Кабельщик","Проводка",6,8),
		(NULL,"Беспалов Ефрем Кимович","Маляр","Малярные работы",7,1),
		(NULL,"Быков Устин Семёнович","Моторист","Обслуживание силовых установок",10,10),
		(NULL,"Дмитриева Августа Сергеевна","Проверяющий","Контроль качества",8,7),
		(NULL,"Фёдоров Иосиф Мартынович","Техник по эксплуатации","Техосмотр",4,7);

-- 4

REPLACE INTO Hangar
 VALUES
		(NULL,1),
		(NULL,2),
        (NULL,3),
        (NULL,2),
        (NULL,4),
        (NULL,2),
        (NULL,1),
        (NULL,1),
        (NULL,1),
        (NULL,3);
-- 5

 REPLACE INTO Plane
 VALUES
		(NULL,"Airbus","80","Идеальное","Пассажирский","A319",2),
		(NULL,"Boeing","95","Удовлетворительное","Грузовой","747-400F",3),
        (NULL,"Airbus","0","Хорошее","Грузовой","A300-600ST",5),
        (NULL,"Boeing","0","Неудовлетворительное","Пассажирский","737-MAX",1),
        (NULL,"ОАК","0","Ну такое","Пассажирский","МС-21",4),
        (NULL,"Туполев","70","Идеальное","Пассажирский","Ту-134",6),
        (NULL,"Туполев","86","Хорошее","Пассажирский","Ту-154",7),
        (NULL,"Lockheed","100","Идеальное","Грузовой","C-5 Galaxy",8),
        (NULL,"Airbus","50","Удовлетворительное","Грузовой","A400M Atlas",10),
        (NULL,"Kawasaki","0","Неудовлетворительное","Грузовой","C-2",9);
-- 6

REPLACE INTO Flight_Attendant
 VALUES
		(NULL,"Высоцкий Владимир Семёнович","Мужской",7),
		(NULL,"Маяковский Владимир Владимирович","Мужской",1),
        (NULL,"Джилл Валентайн","Женский",5),
        (NULL,"Ада Вонг","Женский",7),
        (NULL,"Крис Редфилд","Мужской",10),
        (NULL,"Альсина Димитреску","Женский",95),
        (NULL,"Леон Скотт Кеннеди","Мужской",1),
        (NULL,"Карлос Оливейра","Мужской",3),
        (NULL,"Уильям Биркин","Мужской",15),
        (NULL,"Сергей Тиранович Владимир","Мужской",4);
-- 7

 REPLACE INTO Pilot
 VALUES
		(NULL,"Плотников Иван Николаевич","15","Captain","КВС","300000"),
		(NULL,"Жмышенко Валерий Альбертович","7","Senior First Officer","Второй Пилот","250000"),
        (NULL,"Михаил Петрович Девятаев","3","Cadet","Курсант с самостоятельным вылетом","50000"),
        (NULL,"Сабуро Сакаи","1","Trainee","Курсант без самостоятельного вылета","0"),
        (NULL,"Фомичёв Альберт Аркадьевич","2","Training Captain","КВС","350000"),
        (NULL,"Клэр Редфилд","5","Trainee","Курсант без самостоятельного вылета","0"),
        (NULL,"Кулаков Абрам Эльдарович","4","Cadet","Курсант с самостоятельным вылетом","70000"),
        (NULL,"Мышкин Антон Якунович","6","Second Officer","Второй Пилот","200000"),
        (NULL,"Архипов Семен Иринеевич","7","Captain","КВС","299000"),
        (NULL,"Артемьев Юрий Никитевич","10","Second Officer","Второй Пилот","150000");
-- 8


REPLACE INTO Airport
VALUES
		(NULL,"Аэропорт Внуково","Взлет/посадка малой, большой и правительственной авиации","VKO"),
		(NULL,"Аэропорт Париж — Шарль-де-Голль","Взлет/посадка малой, большой и правительственной авиации","CDG"),
		(NULL,"Международный аэропорт Лос-Анджелес","Взлет/посадка малой, большой и правительственной авиации","LAX"),
		(NULL,"Международный аэропорт «Чанги»","Взлет/посадка малой, большой и правительственной авиации","SIN"),
		(NULL,"Лондонский аэропорт Хиитроу","Взлет/посадка малой, большой и правительственной авиации","LHR"),
		(NULL,"Международный аэропорт Инчхон","Взлет/посадка малой, большой и правительственной авиации","ICN"),
		(NULL,"Международный аэропорт имени Джона Кеннеди","Взлет/посадка малой, большой и правительственной авиации","JFK"),
		(NULL,"Берлин-Бранденбург","Взлет/посадка малой, большой и правительственной авиации","BER"),
		(NULL,"Вацлав Гавел Аэропорт Прага","Взлет/посадка малой, большой и правительственной авиации","PRG"),
		(NULL,"Международный аэропорт Токио","Взлет/посадка малой, большой и правительственной авиации","HND");
        
-- 9

 REPLACE INTO Flight
 VALUES
		(NULL,"SU6566","Пассажирский","15:55","19:00",1,1),
		(NULL,"KL-905","Грузовой","23:05","04:20",2,3),
        (NULL,"SU320","Пассажирский","22:00","08:45",3,6),
        (NULL,"B28906","Пассажирский","21:30","01:10",4,1),
        (NULL,"RU-560","Грузовой","00:20","07:26",5,2),
        (NULL,"OA910","Пассажирский","23:15","12:55",6,7),
        (NULL,"BA31","Пассажирский","18:40","13:40",8,7),
        (NULL,"V72259","Пассажирский","23:59","02:50",9,6),
        (NULL,"CA-585","Грузовой","01:50","09:10",10,8),
        (NULL,"6L-804","Грузовой","02:25","05:10",7,9);
-- 10

REPLACE INTO Cargo
 VALUES
		(NULL,"Гражданское","80 контейнеров","80т",1,"Товары с АлиЭкспресса",1,1),
		(NULL,"Гражданское","5 контейнеров","5т",1,"Картины Пикассо",1,2),
        (NULL,"Гражданское","100 контейнеров","100т",1,"Картошка",0,3),
        (NULL,"Военное","5 контейнеров","15т",0,"Боеприпасы для артиллерии",1,4),
        (NULL,"Военное","1 контейнер","2т",1,"Медикаменты",0,5),
        (NULL,"Военное","2 контейнера","100т",0,"Три танка",1,6),
        (NULL,"Военное","1 контейнер","1т",1,"Почта",0,7),
        (NULL,"Гражданское","10 контейнеров","20т",1,"Коллекция автомобилей олигарха",1,8),
        (NULL,"Гражданское","2 контейнера","10т",1,"Двигатели",1,9),
        (NULL,"Гражданское","1 контейнер","3т",1,"Supermarine Spitfire Mk.V",1,10); 
-- 11

REPLACE INTO Breakdown
VALUES
		(NULL,"KL-905","Разрыв топливных магистралей в районе четвертого двигателя",1,"Топливная система",1,2),
        (NULL,"SU6566","Отказ ИЛС","0","Электрика",0,1),
        (NULL,"KL-905","Отказ гидросистем",0,"Гидравлика",1,2),
        (NULL,"KL-905","Чрезмерное обледенение",0,"Фюзеляж",1,2),	
		(NULL,"SU320","Отказ третьего двигателя",0,"Третий двигатель",0,3),		
        (NULL,"B28906","Ошибка выпуска оперения",0,"Закрылки",1,4),
        (NULL,"RU-560","Попадание ракеты боевиков класса Земля-Воздух",1,"Второй двигатель, топливный бак",1,5),
		(NULL,"OA910","Отказ автопилота",0,"Электрика",0,6),
        (NULL,"BA31","Задымление салона",1,"Система циркуляции воздуха",1,7),
        (NULL,"CA-585","Отказ ЛТЦ",0,"Система ложных тепловых целей",0,9); 
-- 12

REPLACE INTO Passenger
 VALUES
		(NULL,"Чернецкий Александр Афанасьевич","4982 577209"),
        (NULL,"Заварзин Георгий Тимофеевич","4507 355820"),
        (NULL,"Половцев Аркадий Савванович","4115 473744"),
        (NULL,"Юхтрица Наталия Ивановна","4968 229933"),
        (NULL,"Карачёв Яков Давидович","4556 600989"),
        (NULL,"Ярмоненко Данила Севастьянович","4131 874643"),
        (NULL,"Куцак Кузьма Филиппович","4315 649237"),
        (NULL,"Браславец Виктор Савванович","4734 985082"),
        (NULL,"Тетерева Ася Емельяновна","4117 116477"),
        (NULL,"Johnny Silverhand","2077 202023");
-- 13

REPLACE INTO Ticket
  VALUES
 		(NULL,"5559708491506","14856","Заварзин Георгий Тимофеевич","21h","2",10),
		(NULL,"1762140736267","77458","Половцев Аркадий Савванович","2b","3",2),
        (NULL,"2563512354113","60555","Юхтрица Наталия Ивановна","16e","4",1),
        (NULL,"1763526884113","6086","Чернецкий Александр Афанасьевич","11i","1",3),
        (NULL,"8455645456445","22145","Карачёв Яков Давидович","25g","5",6),
        (NULL,"2356782458742","21255","Ярмоненко Данила Севастьянович","40c","6",8),
        (NULL,"2453685214824","75575","Куцак Кузьма Филиппович","5c","7",4),
        (NULL,"9856324578524","8456","Браславец Виктор Савванович","12e","8",9),
        (NULL,"8754215487524","45664","Johnny Silverhand","8g","10",7),
        (NULL,"4556464564545","9548","Тетерева Ася Емельяновна","15f","9",5);
-- 14

REPLACE INTO Luggage
 VALUES
		(NULL,"Гражданское","2 чемодана размера L","45кг","1","","1",10),
		(NULL,"Гражданское","1 чемодан размера S","7кг","1","Личные вещи","1",2),
        (NULL,"Гражданское","1 чемодан размера M","15кг","1","Личные вещи","0",3),
        (NULL,"Гражданское","1 чемодан размера S","5кг","1","Личные вещи","0",4),
        (NULL,"Гражданское","1 чемодан размера L","20кг","1","Личные вещи","1",9),
        (NULL,"???","Свёрток 20*20*40см","2кг","1","Партия героина","0",1),
        (NULL,"Гражданское","2 чемодана размера S","11кг","1","Личные вещи","0",5),
        (NULL,"Гражданское","1 чемодан размера M","9кг","1","Личные вещи","1",6),
        (NULL,"Гражданское","1 чемодан размера M","10кг","1","Личные вещи","1",7),
        (NULL,"Гражданское","Оружейный кейс","10кг","1","Две единицы гражданского нарезного длинноствольного оружия","1",8);
  
        