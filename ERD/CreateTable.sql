CREATE TABLE Admins (
  Username varchar(20) NOT NULL, 
  Password varchar(20) NOT NULL, 
  PRIMARY KEY (Username));
CREATE TABLE Categories (
  CatNo   integer GENERATED BY DEFAULT AS IDENTITY, 
  CatName varchar(20) NOT NULL, 
  PRIMARY KEY (CatNo));
CREATE TABLE Clients (
  ClientID integer GENERATED BY DEFAULT AS IDENTITY, 
  Password varchar(20) NOT NULL, 
  FullName varchar(20) NOT NULL, 
  Phone    integer NOT NULL, 
  Address  varchar(50) NOT NULL, 
  Verified boolean NOT NULL, 
  Bonus    integer NOT NULL, 
  PRIMARY KEY (ClientID));
CREATE TABLE Gifts (
  GiftNo      integer GENERATED BY DEFAULT AS IDENTITY, 
  Point       integer NOT NULL, 
  GiftName        varchar(20) NOT NULL, 
  Description varchar(255), 
  PRIMARY KEY (GiftNo));
CREATE TABLE Orders (
  OrdNo    integer GENERATED BY DEFAULT AS IDENTITY, 
  Amount   integer NOT NULL, 
  Time     bigint NOT NULL, 
  Status   varchar(10) NOT NULL, 
  ClientID integer NOT NULL, 
  PRIMARY KEY (OrdNo));
CREATE TABLE Products (
  ProdNo      integer GENERATED BY DEFAULT AS IDENTITY, 
  ProdName    varchar(20) NOT NULL, 
  Price       integer NOT NULL, 
  Description varchar(255), 
  CatNo       integer NOT NULL, 
  Brand       varchar(20) NOT NULL, 
  Picture     varchar(255) NOT NULL, 
  PRIMARY KEY (ProdNo));
CREATE TABLE Products_Orders (
  Quantity integer NOT NULL, 
  ProdNo   integer NOT NULL, 
  OrdNo    integer NOT NULL);
ALTER TABLE Products_Orders ADD CONSTRAINT FKProducts_O391648 FOREIGN KEY (OrdNo) REFERENCES Orders (OrdNo);
ALTER TABLE Products_Orders ADD CONSTRAINT FKProducts_O628035 FOREIGN KEY (ProdNo) REFERENCES Products (ProdNo);
ALTER TABLE Orders ADD CONSTRAINT FKOrders526427 FOREIGN KEY (ClientID) REFERENCES Clients (ClientID);
ALTER TABLE Products ADD CONSTRAINT FKProducts345512 FOREIGN KEY (CatNo) REFERENCES Categories (CatNo);
