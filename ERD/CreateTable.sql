CREATE TABLE Category (Category ID integer GENERATED BY DEFAULT AS IDENTITY, Category Name varchar(50) NOT NULL, PRIMARY KEY ("Category ID"));
CREATE TABLE Client (ClientID varchar(50) NOT NULL, Password varchar(10) NOT NULL, ClientName varchar(30) NOT NULL, TeleNo integer NOT NULL, Address varchar(50) NOT NULL, Verified smallint NOT NULL, PRIMARY KEY (ClientID));
CREATE TABLE Gift (Gift ID integer GENERATED BY DEFAULT AS IDENTITY, Point integer NOT NULL, Gift Name varchar(50) NOT NULL, Description varchar(255), Order ID varchar(10) NOT NULL, PRIMARY KEY ("Gift ID"));
CREATE TABLE Order (Order ID varchar(10) NOT NULL, Total Amount integer NOT NULL, Order Date integer NOT NULL, Order Status char(10) NOT NULL, ClientID varchar(50) NOT NULL, PRIMARY KEY ("Order ID"));
CREATE TABLE Product (Product ID varchar(8) NOT NULL, Product Name varchar(50) NOT NULL, Price integer NOT NULL, Description varchar(255), Category ID integer NOT NULL, PRIMARY KEY ("Product ID"));
CREATE TABLE Product_Order (Quantity integer NOT NULL, Product ID varchar(8) NOT NULL, Order ID varchar(10) NOT NULL);
ALTER TABLE Product_Order ADD CONSTRAINT FK Product FOREIGN KEY ("Order ID") REFERENCES Order ("Order ID");
ALTER TABLE Product_Order ADD CONSTRAINT FK Product FOREIGN KEY ("Product ID") REFERENCES Product ("Product ID");
ALTER TABLE Order ADD CONSTRAINT FK Order FOREIGN KEY (ClientID) REFERENCES Client (ClientID);
ALTER TABLE Product ADD CONSTRAINT FK Product FOREIGN KEY ("Category ID") REFERENCES Category ("Category ID");
ALTER TABLE Gift ADD CONSTRAINT FK Gift FOREIGN KEY ("Order ID") REFERENCES Order ("Order ID");
