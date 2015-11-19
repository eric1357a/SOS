/*Insert Category Sample Records*/
INSERT INTO APP.CATEGORY ("Category Name") 
	VALUES ('School Stationery');
INSERT INTO APP.CATEGORY ("Category Name") 
	VALUES ('Notebook & Daybook');
INSERT INTO APP.CATEGORY ("Category Name") 
	VALUES ('Writing Instrument');
INSERT INTO APP.CATEGORY ("Category Name") 
	VALUES ('File & Folders');
INSERT INTO APP.CATEGORY ("Category Name") 
	VALUES ('Others');

/*Insert Client Sample Records*/
INSERT INTO APP.CLIENT (CLIENTID, PASSWORD, CLIENTNAME, TELENO, ADDRESS, VERIFIED) 
	VALUES ('10001', '12345678', 'Vault Boy', 23382338, 'Vault 101', 1);
INSERT INTO APP.CLIENT (CLIENTID, PASSWORD, CLIENTNAME, TELENO, ADDRESS, VERIFIED) 
	VALUES ('10002', '87654321', 'Steven', 23800000, 'Vault 111', 1);
INSERT INTO APP.CLIENT (CLIENTID, PASSWORD, CLIENTNAME, TELENO, ADDRESS, VERIFIED) 
	VALUES ('10003', '65498741', 'Eric', 24681357, 'Vault 111', 1);
INSERT INTO APP.CLIENT (CLIENTID, PASSWORD, CLIENTNAME, TELENO, ADDRESS, VERIFIED) 
	VALUES ('10004', '65489468', 'Carlyle', 36696940, 'Vault 111', 1);
INSERT INTO APP.CLIENT (CLIENTID, PASSWORD, CLIENTNAME, TELENO, ADDRESS, VERIFIED) 
	VALUES ('10005', '98765432', 'Cedric', 36996336, 'Vault 111', 0);

/*Insert Order Sample Records*/
INSERT INTO APP."Order" ("Order ID", "Total Amount", "Order Date", "Order Status", CLIENTID)
	VALUES ('1001', 8964, '2015-11-08', 'Shipping', '10001');
INSERT INTO APP."Order" ("Order ID", "Total Amount", "Order Date", "Order Status", CLIENTID) 
	VALUES ('1002', 4689, '2015-11-15', 'Picked-up', '10002');
INSERT INTO APP."Order" ("Order ID", "Total Amount", "Order Date", "Order Status", CLIENTID) 
	VALUES ('1003', 20, '2015-11-16', 'Cancelled', '10003');
	
/*Insert Order Sample Records*/
INSERT INTO APP.GIFT (POINT, "Gift Name", DESCRIPTION, "Order ID") 
	VALUES (100, 'Free Pen', 'Redeem a free limited edition pen', '2001');
	
/*Insert Order Sample Records*/
INSERT INTO APP.PRODUCT ("Product ID", "Product Name", PRICE, DESCRIPTION, "Category ID") 
	VALUES ('10001', 'Fountain Pen', 1200, 'A simple fountain pen', 3);
INSERT INTO APP.PRODUCT ("Product ID", "Product Name", PRICE, DESCRIPTION, "Category ID") 
	VALUES ('10002', 'Pen', 10, 'A simple pen ( 10 pcs / pack )', 1);
INSERT INTO APP.PRODUCT ("Product ID", "Product Name", PRICE, DESCRIPTION, "Category ID") 
	VALUES ('10003', 'Water Proof Notebook', 500, 'Notebook come with waterproof function', 2);
INSERT INTO APP.PRODUCT ("Product ID", "Product Name", PRICE, DESCRIPTION, "Category ID") 
	VALUES ('10004', 'Folder', 20, '10 layers folder , come with 10 colors', 4);
INSERT INTO APP.PRODUCT ("Product ID", "Product Name", PRICE, DESCRIPTION, "Category ID") 
	VALUES ('10005', 'Vault Boy Bobble Head Figure Toy', 111, 'You want what I mean', 5);

/*Insert PRODUCT_ORDER Sample Records*/
INSERT INTO APP.PRODUCT_ORDER (QUANTITY, "Product ID", "Order ID") 
	VALUES (10, '10001', '1001');
INSERT INTO APP.PRODUCT_ORDER (QUANTITY, "Product ID", "Order ID") 
	VALUES (20, '10002', '1003');
INSERT INTO APP.PRODUCT_ORDER (QUANTITY, "Product ID", "Order ID") 
	VALUES (64, '10005', '1002');


