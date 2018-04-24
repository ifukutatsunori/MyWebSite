create table t_user(id int(11) NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY
,login_id varchar(255)  NOT NULL UNIQUE
,name varchar(20)  NOT NULL
,birth_date DATE NOT NULL
,password varchar(255) NOT NULL
,address varchar(255) NOT NULL
,phone_number varchar(20) UNIQUE NOT NULL
,postal_code varchar(20) NOT NULL
,mail_address varchar(20) UNIQUE NOT NULL
,create_date DATETIME NOT NULL
 );

