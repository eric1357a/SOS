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
	VALUES ('Office Supplies');
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Account Supplies');	
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Office Equipment');	
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Consumable');	
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Computer Accessories');
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Drawing & Art Set');
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Mapping Supplies');
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Photography & Optics');
INSERT INTO APP.CATEGORIES ("CATNAME") 
	VALUES ('Toys');
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
	VALUES (8964, 20151108, 'process', 1);
INSERT INTO APP.Orders (AMOUNT, "TIME", STATUS, CLIENTID) 
	VALUES (4689, 20151115, 'cancel', 2);
INSERT INTO APP.Orders (AMOUNT, "TIME", STATUS, CLIENTID) 
	VALUES (20, 20151116, 'delivered', 3);
INSERT INTO APP.Orders (AMOUNT, "TIME", STATUS, CLIENTID) 
	VALUES (20, 20151115, 'picked-up', 4);
	
/*Insert Gift Sample Records*/
INSERT INTO APP.GIFTS (POINT, "GIFTNAME", DESCRIPTION) 
	VALUES (100, 'Free Pen', 'Redeem a free limited edition pen');

	
/*Insert Product Sample Records*/
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Fountain Pen', 1200, 'A simple fountain pen', 3, 'Pelikan', 'https://na.cx/i/w83FkW.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Pen', 10, 'A simple pen ( 10 pcs / pack )', 1, 'Bic', 'https://na.cx/i/RNiqN5.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Water Proof Notebook', 500, 'Notebook come with waterproof function', 2, 'iWoot', 'https://na.cx/i/rwKd9Y.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Folder', 20, '10 layers folder , come with 10 colors', 4, 'Simple', 'https://na.cx/i/Sj3zT3.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Vault Boy', 111, 'Vault Boy by Vault-Tec', 13, 'Vault-Tec', 'https://na.cx/i/63S898.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Ink', 50, 'Ink for fountain pen', 8, 'Parker', 'https://na.cx/i/JF641X.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Mouse Pad', 200, 'Mouse pad for mouse', 9, 'Mouse-Tec', 'https://na.cx/i/Q08SJE.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Golden Frame', 1110, 'Gold Frame For pictures', 10, 'Vault-Tec', 'https://na.cx/i/9e16F5.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Metal Ruler', 10, 'For measurement', 11, 'Ruler-Tec', 'https://na.cx/i/EC7545.png');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Album', 200, 'For stocking photos', 12, 'Album-Tec', 'https://na.cx/i/227SbZ.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Calculator', 111, 'For calculation', 5, 'Calc-Tec', 'https://na.cx/i/mPv094.png');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Stamper', 33, 'To stamp things', 6, 'Stamp-Tec', 'https://na.cx/i/D6u295.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Stapler', 10, 'Blue in color', 1, 'Stapler-Tec', 'https://na.cx/i/8VHC96.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('A5 notebook', 10, 'A5 sizes', 2, 'Write-Tec', 'https://na.cx/i/5xEKGc.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Ink Pad', 35, 'Ink Pad come with 3 colors', 8, 'Max', 'https://na.cx/i/cn645U.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Plastic Ruler', 5, 'A simple ruler', 11, 'Max', 'https://na.cx/i/5N4647.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Water Gun', 150, 'A simple water gun', 13, 'Powerpowerful', 'https://na.cx/i/0UkNAJ.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Key Chain', 10, 'A simple key chain', 14, 'Chain-Tec', 'https://na.cx/i/A75k4c.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Dictionary', 369, 'English Dictionary', 1, 'Oxford', 'https://na.cx/i/EN880D.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Pen', 1000, 'A luxury pen ', 3, 'Montblanc', 'https://na.cx/i/x096c8.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Compass', 10, 'A simple compass', 11, 'Compass-Tec', 'https://na.cx/i/5W97Bm.gif');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Film Roll', 200, '35 mm color film', 12, 'Kodak', 'https://na.cx/i/z166Ln.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Projector', 2500, 'A simple projector', 14, 'Pro-Tec', 'https://na.cx/i/Cak0M0.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Tape', 20, 'A simple tape ( 10 pcs / pack )', 1, 'Max', 'https://na.cx/i/S9W3o2.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Fountain Pen', 2200, 'A luxury fountain pen', 3, 'Breguet ', 'https://na.cx/i/9N7131.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Correction Pen', 20, 'A simple correction pen ( 10 pcs / pack )', 1, 'Pilot', 'https://na.cx/i/48afco.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Water Proof Notebook', 500, 'Notebook come with waterproof function', 2, 'iWoot', 'https://na.cx/i/rwKd9Y.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Folder', 20, '10 layers folder , come with 10 colors', 4, 'Simple', 'https://na.cx/i/Sj3zT3.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Vault Boy', 111, 'Vault Boy by Vault-Tec', 13, 'Vault-Tec', 'https://na.cx/i/63S898.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Repositional Notes', 35, 'A simple repositional notes', 8, 'Post-it®', 'https://na.cx/i/42HY84.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Mouse Pad', 200, 'Mouse pad for mouse', 9, 'Mouse-Tec', 'https://na.cx/i/Q08SJE.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Golden Frame', 1110, 'Gold Frame For pictures', 10, 'Vault-Tec', 'https://na.cx/i/9e16F5.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Wooden Ruler', 12, 'For measurement', 11, 'Ruler-Tec', 'https://na.cx/i/A4USQg.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Album', 200, 'For stocking photos', 12, 'Album-Tec', 'https://na.cx/i/227SbZ.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Calculator', 111, 'For calculation', 5, 'Calc-Tec', 'https://na.cx/i/mPv094.png');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Stamper', 33, 'To stamp things', 6, 'Stamp-Tec', 'https://na.cx/i/D6u295.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Stapler', 10, 'Red in color', 1, 'Stapler-Tec', 'https://na.cx/i/05NGKG.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('A5 notebook', 10, 'A5 sizes', 2, 'Write-Tec', 'https://na.cx/i/5xEKGc.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES (' Metal Drawing Pins', 52, '100pcs Thumb Tacks Metal Drawing Pins Capped Headed', 11, 'deli', 'https://na.cx/i/Y7gP48.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Rope', 55, '3/4 inch', 11, 'Rope-Tec', 'https://na.cx/i/90pL32.jpg');
INSERT INTO APP.PRODUCTS (PRODNAME, PRICE, DESCRIPTION, CATNO, BRAND, PICTURE) 
	VALUES ('Tape', 10, 'A simple tape ( 10 pcs / pack )', 1, 'Max', 'https://na.cx/i/S9W3o2.jpg');


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
