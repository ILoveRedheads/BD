-- create database MishinaZhaba;
use MishinaZhaba;

-- 1	
CREATE TABLE IF NOT EXISTS `сlient` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`fullname` VARCHAR(255) NOT NULL,
    `mobile_phone` VARCHAR(255) NOT NULL,
     PRIMARY KEY (`id`)
);
-- 2
CREATE TABLE IF NOT EXISTS `action` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`amount` VARCHAR (100) NOT NULL,
	`account_subject_id` INT NOT NULL,
	`invoice_object_id` INT NOT NULL,
	`id_type_of_action` INT NOT NULL,
	`id_oficce` INT NOT NULL,
	PRIMARY KEY (`id`)
);
-- 3
CREATE TABLE IF NOT EXISTS `department` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`staff` VARCHAR(45) NOT NULL,
	`id_oficce` INT NOT NULL,
 	`id_type_of_department` INT NOT NULL,
	PRIMARY KEY (`id`)
);
-- 4
CREATE TABLE IF NOT EXISTS `office` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`address` VARCHAR(45) NOT NULL,
    `oficce_contacts_details` VARCHAR(45) NOT NULL,
    `central` BOOLEAN,
	PRIMARY KEY (`id`)
);
-- 5
CREATE TABLE IF NOT EXISTS `petition` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`request_number` VARCHAR(45) NOT NULL,
 	`text` VARCHAR(100) NOT NULL,
	`id_oficce` INT NOT NULL,
	`id_client` INT NOT NULL,
	`id_specialist` INT NOT NULL,
	PRIMARY KEY (`id`)
);
-- 6
CREATE TABLE IF NOT EXISTS `product` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`description` VARCHAR(45) NOT NULL,
	`connection_date` VARCHAR(100) NOT NULL,
	`id_product` INT NOT NULL,
	PRIMARY KEY (`id`)
);
-- 7
CREATE TABLE IF NOT EXISTS `product_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`id`)
);
-- 8
CREATE TABLE IF NOT EXISTS `service` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`description` VARCHAR(45) NOT NULL,
	`name` VARCHAR(100) NOT NULL,
	`terms` INT NOT NULL,
	PRIMARY KEY (`id`)
);
-- 9
CREATE TABLE IF NOT EXISTS `specialist` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`contact_details` VARCHAR(45) NOT NULL,
	`work_experience` VARCHAR(100) NOT NULL,
	`id_department` INT NOT NULL,
	`post` VARCHAR (45) NOT NULL,
	`salary` int (255) NOT NULL,
	PRIMARY KEY (`id`)
);
-- 10
CREATE TABLE IF NOT EXISTS `action_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`description` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`id`)
);
-- 11
CREATE TABLE IF NOT EXISTS `department_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NOT NULL,
	`description` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`id`)
);


ALTER TABLE `action` ADD CONSTRAINT  FOREIGN KEY (id_oficce) REFERENCES `office` (id);

ALTER TABLE `action` ADD CONSTRAINT FOREIGN KEY (account_subject_id) REFERENCES `product` (id);

ALTER TABLE `action` ADD CONSTRAINT FOREIGN KEY (invoice_object_id) REFERENCES `product` (id);

ALTER TABLE `action` ADD CONSTRAINT FOREIGN KEY (id_type_of_action) REFERENCES `action_type` (id);

ALTER TABLE department ADD CONSTRAINT FOREIGN KEY (id_oficce) REFERENCES `office` (id);

ALTER TABLE department ADD CONSTRAINT FOREIGN KEY (id_type_of_department) REFERENCES `department_type` (id);

ALTER TABLE petition ADD CONSTRAINT FOREIGN KEY (id_oficce) REFERENCES `office` (id);

ALTER TABLE petition ADD CONSTRAINT FOREIGN KEY (id_client) REFERENCES `сlient` (id);

ALTER TABLE petition ADD CONSTRAINT FOREIGN KEY  (id_specialist) REFERENCES `specialist` (id);
 
ALTER TABLE product ADD CONSTRAINT FOREIGN KEY  (id_product) REFERENCES `product` (id);



ALTER TABLE service ADD CONSTRAINT FOREIGN KEY  (id_specialist) REFERENCES `specialist` (id);

ALTER TABLE specialist ADD CONSTRAINT FOREIGN KEY  (id_department) REFERENCES `department` (id);

-- moda rename
ALTER TABLE `action` RENAME `deistvie`;
ALTER TABLE `department` RENAME `dpt`;
RENAME TABLE `petition` TO `pt`;

-- moda alter
ALTER TABLE `service` ADD COLUMN `id_specialist` INT NOT NULL;
ALTER TABLE `specialist` ADD `Age` NVARCHAR(50) NULL;
ALTER TABLE `specialist` DROP COLUMN `Age`;
ALTER TABLE `specialist` ADD CHECK (`salary` > 25000);
ALTER TABLE `product` DROP COLUMN `connection_date`;
ALTER TABLE `сlient` DROP COLUMN `fullname`;
ALTER TABLE `action` DROP COLUMN `amount`;

-- moda DROP
-- DROP DATABASE IF EXISTS MishinaZhaba;
-- DROP TABLE IF EXISTS `action_type`CASCADE |




-- 1
REPLACE INTO сlient
VALUES
		(1,"Меркушов М.С.","+79053918793"),
		(2,"Андреев А.А.","+79053918793"),
		(3,"Иванов А.А,","+79053918793"),
		(4,"Сидоров И.И.","+79053918793"),
		(5,"Костренко А.А.","+79053918793"),
		(6,"Кравченко Ю.Ю.","+79053918793"),
		(7,"Еремин Е.Е,","+79053918793"),
		(8,"Шуриков Б.А.","+79053918793"),
		(9,"Пятаков Д.С.","+79053918793"),
		(10,"Кривова Е.В.","+79053918793");
-- 2
REPLACE INTO product_type
VALUES
		(1,"Дебетовая"),
		(2,"Зарплатная"),
		(3,"Вклад"),
		(4,"Пенсионная"),
		(5,"Электронная"),
		(6,"Овердрафтовая"),
		(7,"С кредитным лимитом"),
		(8,"Счет"),
		(9,"Кредитная"),
		(10,"Предоплаченная карта");

-- 3
REPLACE INTO product
VALUES
		(1,"VISA Card","24.02.2021",1),
		(2,"VISA Card","24.02.2021",2),
		(3,"VISA Card","25.02.2021",3),
		(4,"VISA Card","25.02.2021",4),
		(5,"VISA Card","25.02.2021",5),
		(6,"VISA Card","25.02.2021",6),
		(7,"VISA Card","26.02.2021",7),
		(8,"VISA Card","26.02.2021",8),
		(9,"VISA Card","26.02.2021",9),
		(10,"VISA Card","26.02.2021",10);
        
-- 4 
REPLACE INTO department_type
VALUES
		(1,"Валютный", "Работа с валютой"),
		(2,"Кредитный", "Работа с кредитами"),
		(3,"Ценных бумаг", "Работа с ценными бумагами"),
		(4,"Депозитный", "Работа с депозитами"),
		(5,"Безопасности", "Работа с безопасностью"),
		(6,"Трансотдел",  "Работа с транзакциями"),
		(7,"Расчетный", "Работа с расчётами"),
		(8,"Кассовых операций" , "Работа с кассой" ),
		(9,"Операционный", "Работа с операциями"),
		(10,"Бухучета", "Работа с бухгалтерией");
        
-- 5 
REPLACE INTO office
VALUES
		(1,"Ленина,22","62-32-22",0),
		(2,"Пушкина,10","62-32-22",0),
		(3,"Пролетарская,22","62-32-22",0),
		(4,"Героев Сталинграда, 11","62-32-22",0),
		(5,"Удмурсткаая, 7","62-32-22",0),
		(6,"Коммунистическая,6","62-32-22",1),
		(7,"7 Гвардеской,4","62-32-22",1),
		(8,"8 Воздушной армии,52","62-32-22",1),
		(9,"Невская, 8","62-32-22",1),
		(10,"Хорошева,2","62-32-22",0);
        
-- 6
REPLACE INTO department
VALUES
		(1,"3 человека",1,1),
		(2,"23 человека",2,2),
		(3,"4 человека",3,3),
		(4,"15 человек",4,4),
		(5,"9 человек",5,5),
		(6,"1 человек",6,6),
		(7,"5 человек",7,7),
		(8,"2 человека",8,8),
		(9,"20 человек",9,9),
		(10,"7 человек",10,10);
        
-- 7
REPLACE INTO specialist
VALUES
		(1,"+79053918793","3 года",1, "Специалист отдела", 10000),
		(2,"+79153918793","3 года",2,"Специалист отдела", 40000),
		(3,"+79273918793","2 года",3,"Специалист отдела", 60000),
		(4,"+79373918793","4 года",4,"Специалист отдела", 110000),
		(5,"+79053918086","3 года",5,"Старший аналитик", 10000),
		(6,"+79053918121","3 года",6,"Специалист отдела", 10000),
		(7,"+79053918796","3 года",7,"Начальник", 120000),
		(8,"+79053918373","3 года",8,"Стажёр", 25000),
		(9,"+7905391875","3 года",9, "Стажер", 30000),
		(10,"+79053918793","3 года",10,"Начальник", 220000);
        
-- 8
REPLACE INTO petition
VALUES
		(1,"1122а","Нахамили",1,1,1),
		(2,"1110а","Не обслужили",2,2,2),
		(3,"2222а","Без маски не пускают",3,3,3),
		(4,"2211а","Отклонение заявления",4,4,4),
		(5,"М7","Не берут трубку",5,5,5),
		(6,"В6","Проблемы с моб.банком",6,6,6),
		(7,"7У4","Долг по кредиту",7,7,7),
		(8,"852а","Проблемы с коллекторами",8,8,8),
		(9,"Б8","Отказ в кредите",9,9,9),
		(10,"Д2","Погашение долга",10,10,10);
        
-- 9
REPLACE INTO action_type
VALUES
		(1,"Перевод из приложения"),
		(2,"Открытие брокерского счета в отделении"),
		(3,"Снятие из банкомата №2"),
		(4,"Перевод клиенту другого банка в приложении"),
		(5,"Открытие счета на Андреева А.А."),
		(6,"Внесение наличных через терминал"),
		(7,"Погашение кредита через оплату оператору"),
		(8,"Закрытие счет -Без установленных причин"),
		(9,"Перевыпуск карты - утеря носителя"),
		(10,"Смена банковского номера - утеря сим - карты");
        
-- 10
REPLACE INTO service
VALUES
		(1,"Информация о расходах", "В течение дня", 1,1),
		(2,"Информация о расходах","В течение дня", 2,2),
		(3,"Информация о расходах", "В течение дня", 3,3),
		(4,"Информация о расходах", "В течение дня", 4,4),
		(5,"Информация о расходах", "В течение дня", 5,5),
		(6,"Информация о расходах",  "В течение дня", 6,6),
		(7,"Информация о расходах", "В течение дня", 7,7),
		(8,"Информация о расходах" ,"В течение дня", 8,8),
		(9,"Информация о расходах", "В течение дня", 9, 9),
		(10,"Информация о расходах", "В течение дня", 10,10);
        
-- 11
REPLACE INTO action
VALUES
		(1,"Перевод","Сумма: 400р",1,1,1,1),
		(2,"Открытие брокерского счета","0 рублей",2,2,2,2),
		(3,"Снятие","2000 рублей",3,3,3,3),
		(4,"Перевод клиенту другого банка","2100 рублей",4,4,4,4),
		(5,"Открытие счета","5000 рублей",5,5,5,5),
		(6,"Внесение наличных","400 рублей",6,6,6,6),
		(7,"Погашение кредита","На 72 000 рублей",7,7,7,7),
		(8,"Закрытие счета","0 рублей",8,8,8,8),
		(9,"Перевыпуск карты","0 рублей",9,9,9,9),
		(10,"Смена банковского номера","0 рублей",10,10,10,10);
