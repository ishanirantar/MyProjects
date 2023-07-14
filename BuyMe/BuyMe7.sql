CREATE DATABASE BuyMe7;
USE BuyMe7;


CREATE TABLE USERS (

	username           VARCHAR(20)   NOT NULL,
    user_password      VARCHAR(30)   NOT NULL,
    email              VARCHAR(50)   NOT NULL,


PRIMARY KEY (username, user_password, email));

 
INSERT INTO USERS
VALUES      ('in97','maxipup1','in97@gmail.com'),
			('ns1224','yahoo32','ns1224@gmail.com'), 
            ('ykp15','dragon4170','ykp15@gmail.com'), 
            ('ew123','project7','ew123@gmail.com'), 
            ('nn335','maxipup2','nn335@gmail.com'), 
            ('sim123','simcity','sim123@gmail.com');
     
INSERT INTO USERS
VALUES		('avig123','bananas','avig123@gmail.com'),
            ('cody123','imadog','cody123@yahoo.com'),
            ('bhxvin123','tiktok','bhxvin123@aol.com'),
            ('om123','raga3','om123@gmail.com'),
            ('eshan123','sapa4','eshan123@aol.com'),
            ('tej123','kappa5','tej123@gmail.com'),
            ('nav123','sigma7','nav123@gmail.com');
            
SELECT * FROM USERS;

CREATE TABLE CUSTOMERREP(
	crepusername           VARCHAR(20)   NOT NULL,
    creppassword			VARCHAR(30) NOT NULL,
    crepemail 				VARCHAR(50)	NOT NULL,
    
 PRIMARY KEY(crepusername), 
 FOREIGN KEY (crepusername) REFERENCES USERS(username));
 
    
INSERT INTO CUSTOMERREP
VALUES 		('ns1224','yahoo32','ns1224@gmail.com');
            
            
SELECT * FROM CUSTOMERREP;
 
 CREATE TABLE ADMIN_USER(
	adminusername           VARCHAR(20)   NOT NULL,
	adminpassword		VARCHAR(20)   NOT NULL,
    
 PRIMARY KEY(adminusername), 
 FOREIGN KEY (adminusername) REFERENCES USERS(username) );

 
INSERT INTO ADMIN_USER
VALUES		('sim123','simcity');

SELECT * FROM ADMIN_USER;



CREATE TABLE FOOTWEAR_ITEMS (

	footwear_item_id    INT              NOT NULL AUTO_INCREMENT,
    shoe_type 			VARCHAR(40)  	 NOT NULL,
    size                float           NOT NULL,
	item_condition     	VARCHAR(40)  	 NOT NULL,
    style 				VARCHAR(30)		NOT NULL,
    initial_price		float 			 NOT NULL,
    brand 				VARCHAR(30)		 NOT NULL,
    title 				VARCHAR(75) 	NOT NULL,
    sold                tinyint,

PRIMARY KEY (footwear_item_id));
ALTER TABLE FOOTWEAR_ITEMS AUTO_INCREMENT=1000;

select * from footwear_items;

SELECT footwear_item_id,initial_price  FROM FOOTWEAR_ITEMS;

INSERT INTO FOOTWEAR_ITEMS (shoe_type,size,item_condition,style,initial_price,brand,title,sold)
VALUES      ('sneakers',9,'New','athletic',16.00,'Adidas','Yeezy 350 V2 Tailight',false),
			('sandals',8.5,'Slightly Used','casual',36.00,'Converse','Platform Chuck Taylor',true),
            ('boots',6,'Slightly Used','casual',51.00,'Sperry','Leather Boat Shoe',true),
			('boots',10.5,'New','fancy',51.00,'Doc Martens','Platform Black Kylie Boots',false),
            ('sandals',5,'New','fancy',35.00,'Uggs','Chestnut Ugg Tasman Slippers',true),
			('sneakers',6,'Very Used','athletic',101.00,'Reebok','Club C 85 Sneaker',false),
			('sneakers',6,'New','athletic',89.00,'Vans','Old Skool',false),
            ('boots',8,'New','fancy',61.00,'Hunter','Rain Boots',false),
            ('sandals',9,'Slightly Used','casual',51.00,'Converse','Barely Worn White Chuck Taylor',false),
            ('sandals',5,'Very Used','casual',76.00,'Under Armour','Steph Curry SC30',true),
            ('sneakers',6,'Slightly Used','casual',20.00,'Reebok','Club C Double White and Black Shoes',true),
            ('sneakers',9,'Slightly Used','athletic',17.00,'Nike','Air Force 1',false),
            ('sneakers',9,'Slightly Used','athletic',16.00,'Converse','Converse Run Star Hi Sneakers',false),
            ('sneakers',9,'Very Used','athletic',20.00,'Adidas','Adidas Stan Smith',false),
            ('sneakers',9,'New','athletic',19.00,'Adidas','Adidas Ultraboost',false),
            ('boots',9,'New','fancy',51.00,'Sperry','Rosefish Boat Shoe',false),
             ('boots',6,'New','fancy',40.00,'Uggs','Knee High Black Ugg Boots',false),
              ('boots',6,'New','casual',61.00,'Sperry','Leeward Boat Shoe',false),
			('sandals',8,'New','fancy','26.00','Converse','Converse All Star White High Tops',false),
			('sandals',7,'Slightly Used','casual','55.00','Sperry','Crest Vibe Leather Sneaker',false),
			('sandals',6,'Very Used','fancy','41.00','Uggs','Black Ugg Tasman Slipper',false),
			('sandals',9,'New','athletic','22.00','Converse','Chuck Taylor All Star Low Top',false);
/* --------------------------------------------------------------------------------------------- */
            
CREATE TABLE ALERTS (
	alertID					int			NOT NULL AUTO_INCREMENT, 
	alert_message		Varchar(400)	Not NULL,
	footwear_item_id    	INT 	    NOT NULL,
    alert_username		varchar(20)  NOT NULL,
    

PRIMARY KEY (alertID), 
FOREIGN KEY (footwear_item_id) REFERENCES FOOTWEAR_ITEMS(footwear_item_id),
FOREIGN KEY (alert_username) REFERENCES USERS(username) );


Select * from alerts;

ALTER TABLE Alerts
ADD CONSTRAINT alert_username
    FOREIGN KEY (alert_username)
    REFERENCES Users (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    

/* --------------------------------------------------------------------------------------------- */

CREATE TABLE Auctions (
	footwear_sells_id		int				Not Null	AUTO_INCREMENT,
	auction_id				int				Not NULL,
    auction_user			varchar(20)		NOT NULL,
	starting_date			date			Not Null,
	closing_date         	datetime    		NOT NULL,
    initial_price_sells		float     	    , 

Foreign key(footwear_sells_id) references footwear_items(footwear_item_id),
Foreign key(auction_user) references USERS(username),
PRIMARY KEY (auction_id));
ALTER TABLE Auctions AUTO_INCREMENT=1000;

select * from auctions;


INSERT INTO Auctions (auction_id, auction_user,starting_date, closing_date, initial_price_sells)
VALUES      (3844, 'tej123', '2022-02-19','2022-04-26 13:10:01',16.00),
			(9880, 'eshan123','2022-02-03','2022-04-17 21:30:45',36.00),
            (9683, 'nav123','2022-01-31','2022-02-28 20:14:08',51.00),
			(1606, 'nav123','2022-03-02','2022-05-20 23:25:10',51.00),
            (8451, 'tej123','2022-03-11','2022-04-07 14:19:18',35.00),
			(8260, 'cody123','2022-02-23','2022-05-28 23:22:10',101.00),
			(0978, 'cody123', '2022-01-26','2022-05-09 20:34:50',89.00),
            (3892, 'eshan123','2022-03-05','2022-05-01 18:19:08',61.00),
            (1010, 'nav123', '2022-04-15','2022-04-29 14:15:13',51.00),
            (1005, 'tej123','2022-02-20','2022-04-16 12:17:19',76.00),
            (1004, 'nav123','2022-04-06','2022-04-21 13:18:05',20.00),
            (9479, 'nav123','2022-04-29','2022-05-28 10:14:08',17.00),
            (1738, 'nav123','2022-03-02','2022-05-20 23:25:10',16.00),
            (5684, 'tej123','2022-03-11','2022-06-07 14:19:18',20.00),
            (1678, 'cody123','2022-02-23','2022-05-28 22:22:10',19.00),
            (8293, 'cody123','2022-03-26','2022-05-20 20:39:50',51.00),
            (5784, 'eshan123','2022-03-17','2022-05-21 12:19:18',40.00),
            (3782, 'nav123','2022-04-19','2022-04-29 07:15:13',61.00),
            (2903, 'nav123','2022-04-03','2022-05-05 08:12:19',26.00),
            (9876, 'tej123','2022-03-20','2022-07-16 16:14:19',55.00),
            (6495, 'tej123','2022-04-07','2022-05-16 18:10:12',41.00),
            (4792, 'tej123','2022-04-09','2022-05-26 19:20:18',22.00);
            


       
          

ALTER TABLE Auctions
ADD CONSTRAINT auction_user
    FOREIGN KEY (auction_user)
    REFERENCES Users (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
/* --------------------------------------------------------------------------------------------- */
CREATE TABLE QUESTIONS (

    question_id 		 int     NOT NULL auto_increment,
    q_username 		    VARCHAR(20)   NOT NULL,
    question            VARCHAR(100) NOT NULL,
    answer              VARCHAR(100) NOT NULL,

PRIMARY KEY (question_id),
FOREIGN KEY (q_username) REFERENCES USERS(username) );
ALTER TABLE QUESTIONS AUTO_INCREMENT=10;
/* --------------------------------------------------------------------------------------------- */

INSERT INTO QUESTIONS (q_username, question, answer)
VALUE ('in97', 'How can I list an item for sale?', 'Click the sell button on the home page, then input the item information and click submit'),
	('ns1224','How do I make an alert?','Customer representative will answer soon'), 
	('ykp15','How do I bid on an item?','Customer represntative will answer as soon as possible'), 
	('ew123','How does an automatic bid work?','Customer representative will answer soon'), 
	('nn335','How do I delete a bid?','Only a customer representative can delete a bid'), 
	('sim123','Where is the alert page?','The alert page is found on the home page');
    
    ALTER TABLE Questions
ADD CONSTRAINT q_username
    FOREIGN KEY (q_username)
    REFERENCES Users (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
/* --------------------------------------------------------------------------------------------- */

CREATE TABLE BIDS (
    bid_username 		    VARCHAR(20)  NOT NULL,
	bid_footwear_item_id    INT 	     NOT NULL,
    bid_amount			double			 Not Null,
	isAutomatic			int	         NOT NULL,
	upper_limit 		DOUBLE 		,
    bid_increment       DOUBLE      ,
    
PRIMARY KEY (bid_username, bid_amount),
FOREIGN KEY (bid_username) REFERENCES USERS(username), 
FOREIGN KEY (bid_footwear_item_id) REFERENCES FOOTWEAR_ITEMS(footwear_item_id));



INSERT INTO BIDS (bid_username, bid_footwear_item_id, bid_amount, isAutomatic)
VALUES      ('in97', 1001, 37.00,0),
			('bhxvin123', 1001,49.20 , 0),
            ('ns1224', 1005, 111.11 ,0),
			('in97', 1004,40.50,0),
            ('avig123', 1002,75.00, 0),
            ('nn335', 1009,83.20 ,0),
            ('nn335', 1001, 60.50,0),
            ('nn335', 1005, 75.00,0),
            ('nn335', 1005, 90.10,0),
            ('in97',1005,100.50,0),
            ('tej123',1005,95.80,0);
            
select * from bids;

ALTER TABLE Bids
ADD CONSTRAINT bid_username
    FOREIGN KEY (bid_username)
    REFERENCES Users (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
SELECT bid_username, bid_amount FROM bids WHERE bid_amount = (SELECT Max(bid_amount) FROM bids WHERE bid_footwear_item_id =1005) ORDER BY bid_amount ASC;

create table wishlist(
	wishlist_id 		 int     NOT NULL auto_increment,
	wishlistUser		varchar(20)	Not null,
	shoe_type 			VARCHAR(40)  	 NOT NULL,
    size                float           NOT NULL,
    brand 				VARCHAR(30)		 NOT NULL,
    primary key(wishlist_id),
    foreign key(wishlistUser) references Users(username));
    
    select * from wishlist;
    


ALTER TABLE WISHLIST
ADD CONSTRAINT wishlistUser
    FOREIGN KEY (wishlistUser)
    REFERENCES USERS(username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

   
    
    
CREATE TABLE WINNER (

    w_username 		    VARCHAR(20)   NOT NULL,
    w_amount            DOUBLE        NOT NULL,
    w_auction_id			INT 		  NOT NULL,
    w_footwear_id			INT 		NOT NULL,
    status_winner        INT,        

PRIMARY KEY (w_auction_id),
FOREIGN KEY(w_auction_id) REFERENCES AUCTIONS(auction_id),
FOREIGN KEY(w_footwear_id) REFERENCES footwear_items(footwear_item_id),
FOREIGN KEY(w_username) REFERENCES USERS(username) );

INSERT INTO WINNER(w_username,w_amount,w_auction_id,w_footwear_id,status_winner)
VALUES ('nn335','60.5','9880','1001','1'),
		('nn335','83.2','1005','1009','1'),
        ('in97','40.50','8451','1004','1'),
        ('avig123','75','9683','1002','1');

select * from winner;

ALTER TABLE WINNER
ADD CONSTRAINT w_username
    FOREIGN KEY (w_username)
    REFERENCES Users (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
ALTER TABLE WINNER
ADD CONSTRAINT w_auction_id
    FOREIGN KEY (w_auction_id)
    REFERENCES AUCTIONS(auction_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

select * from winner;

SELECT w_username FROM winner where w_footwear_id= 1011 And status_winner!=0;


Select distinct f.title, au.closing_date, w.w_username, w.w_amount, w.status_winner 
FROM footwear_items f, auctions au, winner w 
where f.footwear_item_id = au.footwear_sells_id 
And w.w_footwear_id = f.footwear_item_id 
And au.footwear_sells_id= w.w_footwear_id 
order by au.closing_date
