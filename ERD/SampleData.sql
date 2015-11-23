/*Insert Category Sample Records*/
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('School Stationery');
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Notebook & Daybook');
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Writing Instrument');
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('File & Folders');
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Others');


/*Insert Client Sample Records*/
INSERT INTO APP.CLIENTS (PASSWORD, "FULLNAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('pas', 'Vault Boy', 23382338, 'Vault 101', true, 3000);
INSERT INTO APP.CLIENTS (PASSWORD, "FULLNAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('pas', 'Steven', 23800000, 'Vault 111', true, 1000);
INSERT INTO APP.CLIENTS (PASSWORD, "FULLNAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('pas', 'Eric', 24681357, 'Vault 111', true, 1333);
INSERT INTO APP.CLIENTS (PASSWORD, "FULLNAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('pas', 'Carlyle', 36696940, 'Vault 111', true, 1234);
INSERT INTO APP.CLIENTS (PASSWORD, "FULLNAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('pas', 'Cedric', 36996336, 'Vault 111', false, 0);


/*Insert Order Sample Records*/
INSERT INTO APP.Orders (AMOUNT, "TIME", STATUS, CLIENTID) 
	VALUES (8964, 20151108, 'Shipping', 1);
INSERT INTO APP.Orders (AMOUNT, "TIME", STATUS, CLIENTID) 
	VALUES (4689, 20151115, 'Picked-up', 2);
INSERT INTO APP.Orders (AMOUNT, "TIME", STATUS, CLIENTID) 
	VALUES (20, 20151116, 'Cancelled', 3);
	
/*Insert Gift Sample Records*/
INSERT INTO APP.GIFTS (POINT, "GIFTNAME", DESCRIPTION) 
	VALUES (100, 'Free Pen', 'Redeem a free limited edition pen');

	
/*Insert Product Sample Records*/
INSERT INTO APP.PRODUCTS ("PRODNAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Fountain Pen', 1200, 'A simple fountain pen', 3, 'Parker');
INSERT INTO APP.PRODUCTS ("PRODNAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Pen', 10, 'A simple pen ( 10 pcs / pack )', 1, 'Seven');
INSERT INTO APP.PRODUCTS ("PRODNAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Water Proof Notebook', 500, 'Notebook come with waterproof function', 2, 'Samsung');
INSERT INTO APP.PRODUCTS ("PRODNAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Folder', 20, '10 layers folder , come with 10 colors', 4, 'Simple');
INSERT INTO APP.PRODUCTS ("PRODNAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Vault Boy', 111, 'You want what I mean', 5, 'Vault-Tec');

/*Insert PRODUCT_ORDER Sample Records*/
INSERT INTO APP.PRODUCTS_ORDERS (QUANTITY, PRODNO, ORDNO) 
	VALUES (20, 1, 1);
INSERT INTO APP.PRODUCTS_ORDERS (QUANTITY, PRODNO, ORDNO) 
	VALUES (10, 2, 3);
INSERT INTO APP.PRODUCTS_ORDERS (QUANTITY, PRODNO, ORDNO) 
	VALUES (64, 3, 3);

/*Insert Admin Sample Records*/
INSERT INTO APP.ADMINS (USERNAME, PASSWORD) 
	VALUES ('admin', 'pas');