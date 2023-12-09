CREATE TABLE Customer ( 
	ID INTEGER PRIMARY KEY, 
	name VARCHAR(100) NOT NULL, 
	contact_details VARCHAR(100) NOT NULL 
); 

CREATE TABLE Staff ( 
	ID INTEGER PRIMARY KEY, 
	role VARCHAR(100) NOT NULL, 
	post VARCHAR(100) NOT NULL, 
	qualification VARCHAR(100) NOT NULL, 
	personal_data VARCHAR(100) NOT NULL, 
	contact_details VARCHAR(100) NOT NULL, 
	deposit_id INTEGER, 
  	FOREIGN KEY (deposit_id) REFERENCES Deposit(ID) 
); 

CREATE TABLE Deposit ( 
	ID INTEGER PRIMARY KEY, 
	geographical_coordinates VARCHAR(100) NOT NULL, 
	field_volumes VARCHAR(100) NOT NULL, 
	resource_availability_assessment VARCHAR(100), 
	firm_id INTEGER, 
  	FOREIGN KEY (firm_id) REFERENCES Firm(ID) 
); 

CREATE TABLE Firm ( 
	ID INTEGER PRIMARY KEY, 
	Title VARCHAR(100) NOT NULL, 
	address VARCHAR(100) NOT NULL, 
	contact_details VARCHAR(100) NOT NULL, 
	deposit_id INTEGER, 
  	FOREIGN KEY (deposit_id) REFERENCES Deposit(ID) 
); 

CREATE TABLE Extraction ( 
	ID INTEGER PRIMARY KEY, 
	firm_id INTEGER NOT NULL, 
	deposit_id INTEGER NOT NULL, 
	FOREIGN KEY (firm_id) REFERENCES Firm(ID), 
	FOREIGN KEY (deposit_id) REFERENCES Deposit(ID) 
);

CREATE TABLE Order ( 
	ID INTEGER PRIMARY KEY, 
	id_customer INTEGER NOT NULL, 
  	resource_type VARCHAR(100) NOT NULL, 
  	volume VARCHAR(100) NOT NULL, 
  	destination VARCHAR(100) NOT NULL, 
  	FOREIGN KEY (id_customer) REFERENCES Customer(ID) 
); 

CREATE TABLE Resources ( 
	ID INTEGER PRIMARY KEY, 
	resource_type VARCHAR(100) NOT NULL, 
	classification VARCHAR(100) NOT NULL, 
	specification VARCHAR(100) NOT NULL, 
	order_id INTEGER, 
  	FOREIGN KEY (order_id) REFERENCES Order(ID) 
); 

CREATE TABLE Driver ( 
	ID INTEGER PRIMARY KEY, 
	name VARCHAR(100) NOT NULL, 
	contact_details VARCHAR(100) NOT NULL, 
	driver_license VARCHAR(100) NOT NULL, 
	work_experience VARCHAR(100) NOT NULL 
); 

CREATE TABLE Transport_vehicle ( 
	ID INTEGER PRIMARY KEY, 
	type_of_transport VARCHAR(100) NOT NULL, 
	state_number VARCHAR(100) NOT NULL, 
	specifications VARCHAR(100) NOT NULL, 
	order_id INTEGER, 
  	FOREIGN KEY (order_id) REFERENCES Order(ID) 
);

CREATE TABLE Order_driver ( 
	ID INTEGER PRIMARY KEY, 
	order_id INTEGER NOT NULL, 
	driver_id INTEGER NOT NULL, 
	FOREIGN KEY (order_id) REFERENCES Order(ID), 
	FOREIGN KEY (driver_id) REFERENCES Driver(ID) 
);

CREATE TABLE Schedule ( 
	ID INTEGER PRIMARY KEY, 
	id_order INTEGER NOT NULL, 
  	id_driver INTEGER NOT NULL, 
  	delivery_dates_and_times VARCHAR(100) NOT NULL, 
  	routes VARCHAR(100) NOT NULL, 
  	FOREIGN KEY (id_order) REFERENCES Order(ID), 
  	FOREIGN KEY (id_driver) REFERENCES Driver(ID) 
); 

CREATE TABLE Action_log ( 
	id INTEGER PRIMARY KEY, 
	date_and_time_of_action VARCHAR(100) NOT NULL, 
  	user VARCHAR(100) NOT NULL, 
  	action_details VARCHAR(100) NOT NULL, 
  	staff_id INTEGER, 
  	FOREIGN KEY (staff_id) REFERENCES Staff(ID) 
); 

CREATE TABLE Аuthorization_system ( 
	id INTEGER PRIMARY KEY UNIQUE, 
	login VARCHAR(100) NOT NULL, 
  	password VARCHAR(100) NOT NULL, 
  	available_permissions INTEGER, 
  	staff_id INTEGER, 
  	FOREIGN KEY (staff_id) REFERENCES Staff(ID) 
); 
