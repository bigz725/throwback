START TRANSACTION;
BEGIN; 

create user throwback@localhost identified by 'throwback';

CREATE DATABASE throwback_dev;

CREATE DATABASE throwback_test;

CREATE DATABASE throwback_prod;

grant all privileges on throwback_dev.* to 'throwback'@'localhost';
grant all privileges on throwback_test.* to 'throwback'@'localhost';
grant all privileges on throwback_prod.* to 'throwback'@'localhost';

COMMIT;

