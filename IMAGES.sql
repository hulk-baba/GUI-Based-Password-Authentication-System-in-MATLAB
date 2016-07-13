CREATE TABLE `IMAGES` ( 
	`image_id` TinyInt( 3 ) NOT NULL DEFAULT '0',
	`image_name` VarChar( 50 ) NOT NULL,
	`image_path` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `image_id` ),
	CONSTRAINT `unique` UNIQUE( `image_id` ) )
ENGINE = InnoDB;
