CREATE TABLE `PASSWORDS` ( 
	`password_id` Int( 25 ) NOT NULL,
	`user_id` VarChar( 25 ) NOT NULL,
	`image_set` Int( 11 ) NOT NULL,
	`xactual` BigInt( 20 ) NOT NULL,
	`yactual` BigInt( 20 ) NOT NULL,
	PRIMARY KEY ( `password_id`, `user_id` ) )
ENGINE = InnoDB;
CREATE INDEX `user_id` USING BTREE ON `PASSWORDS`( `user_id` );

