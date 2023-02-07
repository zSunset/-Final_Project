use configurator;

DELIMITER //

CREATE TRIGGER total_price_insert BEFORE INSERT ON Finished_Assembly
FOR EACH ROW
BEGIN

	SET NEW.total_cost = NEW.price_cpu + NEW.price_motherboard + 
    NEW.price_frame + NEW.price_GPU + NEW.price_CPU_Cooling + 
    NEW.price_RAM + NEW.price_DATA_storage + NEW.price_Power_Supply + 
    NEW.price_case_fans_f;



END //



CREATE TRIGGER total_price_update BEFORE UPDATE ON Finished_Assembly
FOR EACH ROW
BEGIN

	SET NEW.total_cost = NEW.price_cpu + NEW.price_motherboard + 
    NEW.price_frame + NEW.price_GPU + NEW.price_CPU_Cooling + 
    NEW.price_RAM + NEW.price_DATA_storage + NEW.price_Power_Supply + 
    NEW.price_case_fans_f;



END //

DROP TRIGGER total_price;