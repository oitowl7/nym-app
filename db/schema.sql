CREATE DATABASE s2lugpg6wdxixion;

USE s2lugpg6wdxixion; 

CREATE TABLE users (
    firstname VARCHAR (225) NOT NULL,
    lastname VARCHAR (225) NOT NULL,
    birthday date,
    email VARCHAR (225),
    phone INT (10),
    city VARCHAR (225),
    state VARCHAR (225),
    zip INT (5),
    created_at datetime,
    facebook_id BIGINT,
    PRIMARY KEY (facebook_id)
);
 

CREATE TABLE Tasklist (
	taskid INT NOT NULL auto_increment,
    text VARCHAR (225) NOT NULL,
    complete BOOLEAN NOT NULL,
    dueby BIGINT,
    chore_price INT,
    houseid INT NOT NULL,
    userid BIGINT NOT NULL,
    PRIMARY KEY (taskid),
    INDEX user_id (userid),
	FOREIGN KEY (userid)
		REFERENCES users(facebook_id)
        ON DELETE CASCADE,
	INDEX house_id (houseid),
    FOREIGN KEY (houseid)
		REFERENCES house(houseid)
        ON DELETE CASCADE
);
    
CREATE TABLE Inventory (
	inventoryid INT NOT NULL auto_increment,
    inventorytext VARCHAR (225),
    PRIMARY KEY (inventoryid),
    houseid INT NOT NULL,
    INDEX house_id (houseid),
    FOREIGN KEY (houseid)
		REFERENCES house(houseid)
        ON DELETE CASCADE
);

CREATE TABLE HouseholdStatus (
	householdid INT NOT NULL auto_increment,
    statustext VARCHAR (225),
    status BOOLEAN,
    houseid INT NOT NULL,
    PRIMARY KEY (householdid),
    INDEX house_id (houseid),
    FOREIGN KEY (houseid)
		REFERENCES house(houseid)
        ON DELETE CASCADE
);

CREATE TABLE sessions (
	GUID INT NOT NULL,
    expiration DATETIME,
    PRIMARY KEY (GUID)
);

CREATE TABLE house (
	houseid INT NOT NULL auto_increment,
	password VARCHAR (16),
	PRIMARY KEY (houseid)
);

CREATE TABLE houseuserrelationship (
	house_id INT NOT NULL,
    user_id INT NOT NULL,
    INDEX userid (user_id),
	FOREIGN KEY (user_id)
		REFERENCES users(id)
        ON DELETE CASCADE,
	INDEX houseid (house_id),
	FOREIGN KEY (house_id)
		REFERENCES house(houseid)
        ON DELETE CASCADE
);
    
ALTER TABLE house 
ADD house_name VARCHAR(225);

ALTER TABLE users
MODIFY facebook_id BIGINT;

ALTER TABLE Tasklist 
ADD chore_price INT;

ALTER TABLE users
ADD billing_address1 VARCHAR (50),
ADD billing_address2 VARCHAR (50),
ADD last_four_ssn int (4);
ALTER Table users
MODIFY phone VARCHAR(10);
ALTER Table users
MODIFY created_at BIGINT;
ALTER Table Tasklist
MODIFY dueby BIGINT; 

DROP TABLE houseuserrelationship;
CREATE TABLE houseuserrelationship (
	facebook_id BIGINT,
	house_name VARCHAR(225),
    PRIMARY KEY (facebook_id, house_name)
); 

ALTER TABLE Tasklist
DROP userassigned;
DROP TABLE users;
DROP TABLE Tasklist;
ALTER TABLE Tasklist
ADD house_name VARCHAR (225);
ALTER TABLE users
ADD money_owed int;
ALTER TABLE Tasklist
ADD frequency VARCHAR (225);


