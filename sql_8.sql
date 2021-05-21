--1. BLOK ANONIMOWY KTÓRY: ZNAJDZIE ŒREDNIA STAWKE WYNAGRODZENIA PRACOWNIKÓW + WYŒWIETLI SZCZEGÓ£Y PRACOWNIKÓW, 
-- KTÓRYCH STAWKA WYNAGRODZENIA JEST NI¯SZA NI¯ ŒREDNIA

USE AdventureWorks2019;
BEGIN
	SELECT AVG(HumanResources.EmployeePayHistory.Rate) AS Srednia_stawka
	FROM HumanResources.EmployeePayHistory;
	SELECT *
	FROM HumanResources.Employee
	JOIN HumanResources.EmployeePayHistory
	ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID
	WHERE HumanResources.EmployeePayHistory.Rate < (SELECT AVG(HumanResources.EmployeePayHistory.Rate) FROM HumanResources.EmployeePayHistory);
END;

--2. FUNKCJA, KTÓRA: ZWRÓCI DATE WYSY£KI OKREŒLONEGO ZAMÓWIENIA

CREATE OR ALTER FUNCTION dbo.DataZamowienia(@NrZamowienia int)
RETURNS date
AS
BEGIN
	DECLARE @czas date;
	SELECT @czas = Purchasing.PurchaseOrderHeader.ShipDate
	FROM Purchasing.PurchaseOrderHeader
	WHERE Purchasing.PurchaseOrderHeader.PurchaseOrderID = @NrZamowienia;
	RETURN @czas;
END;

SELECT AdventureWorks2019.dbo.DataZamowienia(1);


--3. PROCEDURA SK£ADOWANA, KTÓRA: JAKO PARAMETR PRZYJMUJE NAZWÊ PRODUKTU, 
-- A JAKO REZULTAT WYŒWIETLA JEGO IDENTYFIKATOR, NUMER I DOSTÊPNOŒÆ

--USE AdventureWorks2019;
--SELECT Production.Product.ProductID, Production.Product.ProductNumber, Production.Product.SellEndDate
--FROM Production.Product
--WHERE Production.Product.Name = 'Blade';


CREATE OR ALTER PROCEDURE dbo.Produkt(@Nazwa nvarchar(50))
AS
BEGIN
	SELECT Production.Product.ProductID, Production.Product.ProductNumber, Production.Product.SellEndDate
	FROM Production.Product
	WHERE Production.Product.Name = @Nazwa
END;

EXEC dbo.Produkt @Nazwa = 'Blade';

--4. FUNKCJA, KTÓRA: ZWRACA NUMER KARTY KREDYTOWEJ DLA KONKRETNEGO ZAMÓWIENIA

--USE AdventureWorks2019;
--SELECT Sales.CreditCard.CardNumber
--FROM Sales.CreditCard
--JOIN Sales.SalesOrderHeader
--ON Sales.CreditCard.CreditCardID = Sales.SalesOrderHeader.CreditCardID
--WHERE Sales.SalesOrderHeader.PurchaseOrderNumber = 'PO18473189620';


CREATE OR ALTER FUNCTION dbo.NumerKarty(@NrZamowienia nvarchar(25))
RETURNS nvarchar(25)
AS
BEGIN
	DECLARE @karta nvarchar(25);
	SELECT @karta = Sales.CreditCard.CardNumber
	FROM Sales.CreditCard
	JOIN Sales.SalesOrderHeader
	ON Sales.CreditCard.CreditCardID = Sales.SalesOrderHeader.CreditCardID
	WHERE Sales.SalesOrderHeader.PurchaseOrderNumber =  @NrZamowienia;
	RETURN @karta;
END;

SELECT AdventureWorks2019.dbo.NumerKarty('PO18473189620');

--5. PROCEDURA SK£ADOWANA, KTÓRA: JAKO PARAMETRY WEJŒCIOWE PRZYJMUJE 2 LICZBY, NUM1 I NUM2, 
-- A ZWRACA WYNIK ICH DZIELENIA. NUM 1 POWINNA ZAWSZE BYÆ WIEKSZA NI¯ WARTOŒÆ NUM2. 
-- JE¯ELI NUM1<NUM2 WYGENERUJ KOMUNIKAT O B£ÊDZIE "NIEW£AŒCIWIE ZDEFINIOWA£EŒ DANE WEJŒCIOWE"

CREATE OR ALTER PROCEDURE dbo.Dzielenie(@num1 float, @num2 float)
AS
BEGIN
	IF @num1 <= @num2
		PRINT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe';
	ELSE
		PRINT @num1 / @num2;	
END;

EXEC dbo.Dzielenie @num1 = 5, @num2 = 2;
EXEC dbo.Dzielenie @num1 = 1, @num2 = 20;

--6. PROCEDURA, KTÓRA: JAKO PARAMETR PRZYJMIE NATIONALIDNUMBER DANEJ OSOBY,
-- A ZWRÓCI STANOWISKO ORAZ LICZBÊ DNI URLOPOWYCH I CHOROBOWYCH

CREATE OR ALTER PROCEDURE dbo.Urlop(@NationalIDNumber nvarchar(15))
AS
BEGIN
	SELECT HumanResources.Employee.NationalIDNumber, HumanResources.Employee.JobTitle, HumanResources.Employee.VacationHours, HumanResources.Employee.SickLeaveHours
	FROM HumanResources.Employee
	WHERE HumanResources.Employee.NationalIDNumber = @NationalIDNumber		
END;

EXEC dbo.Urlop @NationalIDNumber = 112457891; 
EXEC dbo.Urlop @NationalIDNumber = 998320692;

--7. PROCEDURA BÊD¥CA KALKULATOREM WALUTOWYM. TABELA SALES.CURRENCY ORAZ SALES.CURRENCYRATE. 
-- PARAMETRY WEJŒCIOWE: KWOTA, WALUTY ORAZ DATA (CURRENCYRATEDATE). PRZYJMIJ, ¯E ZAWSZE JED¥ ZE STRON JEST DOLAR AMERYKAÑSKI (USD). 
-- ZAIMPLEMENTUJ KALKULACJÊ OBUSTRONN¥ 1400 USD -> PLN LUB PLN -> USD.

CREATE OR ALTER PROCEDURE dbo.Kantor(@Kwota money, @Waluta1 nchar(3), @Waluta2 nchar(3), @Data datetime)
AS
BEGIN
	DECLARE @kurs money;
	IF @Waluta1 != 'USD' AND @Waluta2 != 'USD'
		PRINT 'Jedn¹ ze stron musi byæ USD!'
	SELECT @kurs = Sales.CurrencyRate.AverageRate
	FROM Sales.CurrencyRate
	WHERE @Data = Sales.CurrencyRate.CurrencyRateDate AND @Waluta1 = Sales.CurrencyRate.FromCurrencyCode AND @Waluta2 = Sales.CurrencyRate.ToCurrencyCode;
	PRINT @Kwota * @kurs;
END;

EXEC dbo.Kantor @Kwota = 1000,  @Waluta1 = 'USD', @Waluta2 = 'EUR', @Data = '2011-05-31'; 
EXEC dbo.Kantor @Kwota = 1000,  @Waluta1 = 'PLN', @Waluta2 = 'EUR', @Data = '2011-05-31'; 
