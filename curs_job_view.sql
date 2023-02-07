use configurator;

CREATE VIEW `order` AS SELECT i.id, i.first_name, fin.grand_total
FROM configurator.users i
JOIN configurator.Finished_Assembly fin on i.id = fin.users_id
WHERE fin.users_id > 0;





CREATE VIEW phone_number as select first_name, last_name, phone_number
from configurator.users
where phone_number LIKE '8988%';