--Write a query to return all category names with their descriptions from the Categories table.
select CategoryName 
from Categories

--Write a query to return the contact name, customer id, company name and city name of all Customers in London
select CompanyName, CustomerID, ContactName, City
from Customers
where City = 'London'

--Write a query to return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
select * 
from Suppliers
where ContactTitle in ('Sales Representative', 'Marketing Manager') AND fax IS NOT NULL

--Write a query to return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Dec 31, 1997 and with freight under 100 units.
select CustomerID
from Orders
where RequiredDate between '1997-01-01' and '1997-12-31' AND Freight < 100

--Write a query to return a list of company names and contact names of all customers from Mexico, Sweden and Germany.
select CompanyName, ContactName 
from Customers
where Country in ('Mexico','Sweden','Germany')

--Write a query to return a count of the number of discontinued products in the Products table.
select COUNT (Discontinued) 
from Products	

--Write a query to return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
select CategoryName, Description
from Categories
where CategoryName like 'Co%'

--Write a query to return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.
select CompanyName, City, Country, PostalCode
from Suppliers
where Address like '%rue%'
order by CompanyName

--Write a query to return the product id and the quantity ordered for each product labelled as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order.
select ProductID, Quantity as 'Quantity Purchased'
from [Order Details]
order by [Quantity Purchased] desc

--Write a query to return the company name, address, city, postal code and country of all customers with orders that shipped using Speedy Express, along with the date that the order was made.
select CompanyName, Address, City, PostalCode, Country, OrderDate
from Customers
inner join Orders
on Customers.CustomerID=Orders.CustomerID
where ShipVia = 1

--Write a query to return a list of Suppliers containing company name, contact name, contact title and region description.
select CompanyName, ContactName, ContactName, Region
from Suppliers
where Region IS NOT NULL

--Write a query to return all product names from the Products table that are condiments.
select ProductName
from Products
where CategoryID = 2

--Write a query to return a list of customer names who have no orders in the Orders table.
select ContactName
from Customers
left join Orders 
On Orders.CustomerID = Customers.CustomerID
where Orders.CustomerID is NULL

--Write a query to add a shipper named 'Amazon' to the Shippers table using SQL.
Insert into Shippers(CompanyName)
Values ('Amazon')

--Write a query to change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
Update Shippers
Set CompanyName = ('Amazon Prime Shipping')
where CompanyName = ('Amazon')

--Write a query to return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
select Shippers.CompanyName, FORMAT(ROUND(sum(Orders.Freight),0),'C') AS FreightTotals
from Orders
Left Join Shippers
On Orders.ShipVia = Shippers.ShipperID
Group By CompanyName;

--Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
select LastName + ',' + FirstName AS DisplayName
from Employees

--Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
Insert Into Customers(CustomerID, CompanyName, ContactName) 
	values ('DESCA', 'Dreu Company', 'Dreu Stepanik')
Insert Into Orders (CustomerID, ShipName) 
	values ('DESCA', 'Grandmas Boysenberry Spread')

--Write a query to remove yourself and your order from the database.
delete from Customers
	where CustomerID = 'DESCA'
delete from Orders
	where CustomerID = 'DESCA'

--Write a query to return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.
select ProductName, UnitsInStock + UnitsOnOrder AS TotalUnits
from Products
where UnitsInStock > 100