
create database crm;
use crm;

create table clients (
	 idClient Int auto_increment primary key,
     nameComplete VARCHAR(100)  not null,
     CPF CHAR(11) not null,
     dateBirth DATE not null,
     email VARCHAR(80) not null,
     phone CHAR(11) not null,
     registrationDate Date not null,
     constraint cpf_unique unique(CPF),
     constraint email_unique unique(email)
     );
     
create table products (

	idProduct INT auto_increment primary key,
    productName VARCHAR(100) not null,
    basePrice DECIMAL(10,2) not null,
    category VARCHAR(50),
    SKU CHAR(6) not null,
    constraint sku_unique unique(SKU)
);

create table address (

	idAddress INT auto_increment primary key,
    idClient int,
    street VARCHAR(80) not null,
    numberHouse CHAR(8) not null,
    complement VARCHAR(100),
    neighborhood VARCHAR(50) not null,
    city VARCHAR(50) not null,
    state CHAR(2) not null,
    cep CHAR(8),
    constraint fk_Address_Client foreign key (idClient) references clients (idClient)
    );
    
create table users (
	
    idUser INT auto_increment primary key,
    nameComplete VARCHAR(100) not null,
    email VARCHAR (80) not null,
    passwordUser VARCHAR(250) not null,
    position VARCHAR(50),
    constraint user_email_unique unique(email)
    
);

create table funnel_stages(

	idStage INT auto_increment primary key,
    stageName VARCHAR(50) not null,
    orderFunnel INT not null
);

create table business (
	
    idBusiness INT auto_increment primary key,
    idClient INT,
    idUser INT,
    idStage INT,
    creationDate DATE not null,
    closingDate DATE,
    estimatedValue DECIMAL(10,2) not null,
    constraint fk_business_client foreign key (idClient) references clients (idClient),
    constraint fk_business_users foreign key (idUser) references users (idUser),
    constraint fk_business_funnel foreign key (idStage) references funnel_stages(idStage)
);

create table business_items (
	idItems INT auto_increment primary key,
    idProduct INT,
    idBusiness INT,
    quantity INT,
    sellingPrice DECIMAL(10,2),
    constraint fk_business_items_id_product foreign key (idProduct) references products(idProduct),
    constraint fk_business_items_business foreign key (idBusiness) references business(idBusiness)
    
);

create table activities (

	idActivity INT auto_increment primary key,
    idClient INT,
    idUser INT,
    typeActivity ENUM('WhatsApp', 'Phone', 'Email', 'Visit') not null,
    descriptionActivity VARCHAR(200),
    dateTimeActivity DATETIME not null,
    constraint fk_activity_client foreign key (idClient) references clients(idClient),
    constraint fk_activity_user foreign key (idUser) references users(idUser)
);
    
    
show tables;
    
    
    
    
    
    
    
    


    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
     
     
     