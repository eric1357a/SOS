/*Insert Category Sample Records*/
INSERT INTO APP.CATEGORY ("NAME") 
	VALUES ('School Stationery')
INSERT INTO APP.CATEGORY ("NAME") 
	VALUES ('Notebook & Daybook')
INSERT INTO APP.CATEGORY ("NAME") 
	VALUES ('Writing Instrument')
INSERT INTO APP.CATEGORY ("NAME") 
	VALUES ('File & Folders')
INSERT INTO APP.CATEGORY ("NAME") 
	VALUES ('Others')


/*Insert Client Sample Records*/
INSERT INTO APP.CLIENT (PASSWORD, "NAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('12345678', 'Vault Boy', 23382338, 'Vault 101', 1, 3000)
INSERT INTO APP.CLIENT (PASSWORD, "NAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('87654321', 'Steven', 23800000, 'Vault 111', 1, 1000)
INSERT INTO APP.CLIENT (PASSWORD, "NAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('65498741', 'Eric', 24681357, 'Vault 111', 1, 1333)
INSERT INTO APP.CLIENT (PASSWORD, "NAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('65489468', 'Carlyle', 36696940, 'Vault 111', 1, 1234)
INSERT INTO APP.CLIENT (PASSWORD, "NAME", PHONE, ADDRESS, VERIFIED, BONUS) 
	VALUES ('98765432', 'Cedric', 36996336, 'Vault 111', 0, 0)


/*Insert Order Sample Records*/
INSERT INTO APP."Order" (AMOUNT, "TIME", STATUS, CLIENTID) 
	VALUES (8964, 20151108, 'Shipping', 1)
INSERT INTO APP."Order" (AMOUNT, "TIME", STATUS, CLIENTID) 
	VALUES (4689, 20151115, 'Picked-up', 2)
INSERT INTO APP."Order" (AMOUNT, "TIME", STATUS, CLIENTID) 
	VALUES (20, 20151116, 'Cancelled', 3)
	
/*Insert Gift Sample Records*/
INSERT INTO APP.GIFT (POINT, "NAME", DESCRIPTION) 
	VALUES (100, 'Free Pen', 'Redeem a free limited edition pen')

	
/*Insert Product Sample Records*/
INSERT INTO APP.PRODUCT ("NAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Fountain Pen', 1200, 'A simple fountain pen', 3, 'Parker')
INSERT INTO APP.PRODUCT ("NAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Pen', 10, 'A simple pen ( 10 pcs / pack )', 1, 'Seven')
INSERT INTO APP.PRODUCT ("NAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Water Proof Notebook', 500, 'Notebook come with waterproof function', 2, 'Samsung')
INSERT INTO APP.PRODUCT ("NAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Folder', 20, '10 layers folder , come with 10 colors', 4, 'Simple')
INSERT INTO APP.PRODUCT ("NAME", PRICE, DESCRIPTION, CATNO, BRAND) 
	VALUES ('Vault Boy', 111, 'You want what I mean', 5, 'Vault-Tec')

/*Insert PRODUCT_ORDER Sample Records*/
INSERT INTO APP.PRODUCT_ORDER (QUANTITY, PRODNO, ORDNO) 
	VALUES (20, 1, 1);
INSERT INTO APP.PRODUCT_ORDER (QUANTITY, PRODNO, ORDNO) 
	VALUES (10, 2, 3);
INSERT INTO APP.PRODUCT_ORDER (QUANTITY, PRODNO, ORDNO) 
	VALUES (64, 3, 3);

/*Insert Admin Sample Records*/
INSERT INTO APP."ADMIN" (PASSWORD) 
	VALUES ('abc123')


