CREATE TABLE `USERS` ( 
	`user_id` VarChar( 10 ) NOT NULL,
	`user_name` VarChar( 10 ) NOT NULL,
	PRIMARY KEY ( `user_id`, `user_name` ),
	CONSTRAINT `user_id` UNIQUE( `user_id`, `user_name` ) )
ENGINE = InnoDB;
