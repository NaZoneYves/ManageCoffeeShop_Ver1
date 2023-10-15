use dm5
go
-- Food
-- Table
-- FoodCategory
-- Account
-- Bill
-- BillInfo
CREATE TABLE TableCustomer
(
	IDTable INT IDENTITY PRIMARY KEY,
	NameTable NVARCHAR(100) NOT NULL DEFAULT N'Unnamed',
	StatusTable NVARCHAR(100) NOT NULL DEFAULT N'Was not occuiped' -- was occuiped || was not occuiped || was booked
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Noname',
	UserPassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	TypeOffUser INT NOT NULL DEFAULT 0 -- 1: admin && 0: staff
)

GO

CREATE TABLE FoodCategory
(
	IDFoodCategory nvarchar(100) PRIMARY KEY,
	NameFoodCategory NVARCHAR(100) NOT NULL DEFAULT N'Unnamed',
	PriceFood float not null
)
GO

CREATE TABLE Food
(
	IDFood nvarchar(100) PRIMARY KEY,
	NameFood NVARCHAR(100) NOT NULL DEFAULT N'Unnamed',
	IDFoodCategory nvarchar(100) NOT NULL

	FOREIGN KEY (IDFoodCategory) REFERENCES dbo.FoodCategory(IDFoodCategory)
)
GO

CREATE TABLE DrinkCategory
(
	IDDrinkCategory nvarchar(100) not null,
	NameDrinkCategory NVARCHAR(100) NOT NULL DEFAULT N'Unnamed',
	SizeOfDrink nvarchar(100) not null,
	Price float not null default 0

	primary key (IDDrinkCategory, SizeOfDrink)

)
GO

CREATE TABLE Drink
(
	IDDrink nvarchar(100) PRIMARY KEY,
	NameDrink NVARCHAR(100) NOT NULL DEFAULT N'Unnamed',
	IDDrinkCategory nvarchar(100) NOT NULL,
	SizeOfDrink nvarchar(100) not null,

	FOREIGN KEY (IDDrinkCategory, SizeOfDrink) REFERENCES dbo.DrinkCategory(IDDrinkCategory, SizeOfDrink)
)
GO

CREATE TABLE Bill
(
	IDBill INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	IDTable INT NOT NULL,
	StatusBill INT NOT NULL DEFAULT 0 -- 1: paid && 0: unpaid
	FOREIGN KEY (IdTable) REFERENCES dbo.TableCustomer(IDTable)
)
GO

CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	IDBill INT NOT NULL,
	IDFood nvarchar(100) NOT NULL,
	IDDrink nvarchar(100) NOT NULL,
	Quantity INT NOT NULL DEFAULT 0

	FOREIGN KEY (IDBill) REFERENCES dbo.Bill(IDBill),
	FOREIGN KEY (IDFood) REFERENCES dbo.Food(IDFood),
	FOREIGN KEY (IDDrink) REFERENCES dbo.Drink(IDDrink)
)
GO

CREATE TABLE Employee
(
	IDEmoloyee nvarchar(100) primary key,
	NameEmployee nvarchar(100) not null,
	PhoneEmployee nvarchar(100),
	GenderEmployee nvarchar(100),
	Position nvarchar(100)

	FOREIGN KEY (Position) REFERENCES dbo.Salary(Position)
)
go

CREATE TABLE Salary
(
	Position nvarchar(100) primary key,
	BaseSalary float not null
)
go
