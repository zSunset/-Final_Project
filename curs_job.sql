-- База данных выполняет хранение данных интернет магазина в котором пользователь может по собственным предпочтениям собрать перснональный компьютер, в момент когда он собирает полностью все товары
-- в столбец total_cost вычисляется общая цена вложенных товаров, цена обновляется автоматически через триггеры которые я так же прикладываю к курсовой работе.





-- создать базу юзеров
-- создать базу в которой будет указан id пользователя который совершил сборку с конфигураиями и ценной за все комплектующее
-- создать базы с компликтующими обратить внимание на их совместимости


USE configurator;

-- пользователи которые зарегестрированны на сайте

CREATE TABLE configurator.users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	first_name varchar(40),
	last_name varchar(40),
    phone_number INT UNIQUE,
    mail varchar(40) unique,
	Total_For_Payment BIGINT UNSIGNED,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

CREATE TABLE configurator.Finished_Assembly(
	users_id BIGINT UNSIGNED NOT NULL, first_name varchar(40) NOT NULL,
	commodity_id_CPU_f BIGINT UNSIGNED NOT NULL, price_cpu BIGINT UNSIGNED NOT NULL,
    commodity_id_motherboard_f BIGINT UNSIGNED NOT NULL, price_motherboard BIGINT UNSIGNED NOT NULL,
    commodity_id_frame_f BIGINT UNSIGNED NOT NULL, price_frame BIGINT UNSIGNED NOT NULL,
    commodity_id_GPU_f BIGINT UNSIGNED NOT NULL, price_GPU BIGINT UNSIGNED NOT NULL,
    commodity_id_CPU_Cooling_f BIGINT UNSIGNED NOT NULL, price_CPU_Cooling BIGINT UNSIGNED NOT NULL,
    commodity_id_RAM_f BIGINT UNSIGNED NOT NULL, price_RAM BIGINT UNSIGNED NOT NULL,
    commodity_id_DATA_storage_f BIGINT UNSIGNED NOT NULL, price_DATA_storage BIGINT UNSIGNED NOT NULL,
    commodity_id_Power_Supply_f BIGINT UNSIGNED NOT NULL, price_Power_Supply BIGINT UNSIGNED NOT NULL,
    case_fans_id_f BIGINT UNSIGNED NOT NULL, price_case_fans_f BIGINT UNSIGNED NOT NULL,
    total_cost BIGINT UNSIGNED,

    FOREIGN KEY (users_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (commodity_id_CPU_f) REFERENCES `CPU`(commodity_id_CPU) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (commodity_id_motherboard_f) REFERENCES motherboard(commodity_id_motherboard) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (commodity_id_frame_f) REFERENCES frame(commodity_id_frame) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (commodity_id_GPU_f) REFERENCES GPU(commodity_id_GPU) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (commodity_id_CPU_Cooling_f) REFERENCES CPU_Cooling(commodity_id_CPU_Cooling) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (commodity_id_RAM_f) REFERENCES RAM(commodity_id_RAM) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (commodity_id_DATA_storage_f) REFERENCES DATA_storage(commodity_id_DATA_storage) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (commodity_id_Power_Supply_f) REFERENCES Power_Supply(commodity_id_Power_Supply) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (case_fans_id_f) REFERENCES case_fans(case_fans_id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE configurator.`CPU`(
	commodity_id_CPU SERIAL UNIQUE,
    title VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
    price_cpu INT UNSIGNED);

CREATE TABLE configurator.motherboard(
	commodity_id_motherboard SERIAL UNIQUE,
	title VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
	price_motherboard INT UNSIGNED);

CREATE TABLE configurator.frame(
	commodity_id_frame SERIAL UNIQUE,
    title VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
    price_frame INT UNSIGNED);

CREATE TABLE configurator.GPU(
	commodity_id_GPU SERIAL UNIQUE,
    title VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
    price_GPU INT UNSIGNED);

CREATE TABLE configurator.CPU_Cooling(
	commodity_id_CPU_Cooling SERIAL UNIQUE,
    title VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
    price_CPU_Cooling INT UNSIGNED);

CREATE TABLE configurator.RAM(
	commodity_id_RAM SERIAL UNIQUE,
    title VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
    price_RAM INT UNSIGNED);

CREATE TABLE configurator.DATA_storage(
	commodity_id_DATA_storage SERIAL UNIQUE,
    title VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
    price_DATA_storage INT UNSIGNED);

CREATE TABLE configurator.Power_Supply(
	commodity_id_Power_Supply SERIAL UNIQUE,
    title VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
    price_Power_Supply INT UNSIGNED);

CREATE TABLE configurator.case_fans(
	case_fans_id SERIAL UNIQUE,
    title VARCHAR(250) NOT NULL,
	`description` VARCHAR(250) NOT NULL,
    price_case_fans INT UNSIGNED);
