<Query Kind="Expression">
  <Connection>
    <ID>427b867e-be0d-4dfa-a844-3e8558a6934e</ID>
    <Server>.</Server>
    <Database>WestWind</Database>
  </Connection>
</Query>

// Practice questions - do each one in a separate LinqPad query.
/*

A) List all the customer company names for those with more than 5 orders.
B) Get a list of all the region names
C) Get a list of all the territory names
D) List all the regions and the number of territories in each region
E) List all the region and territory names in a "flat" list
F) List all the region and territory names as an "object graph"
   - use a nested query
G) List all the product names that contain the word "chef" in the name.
H) List all the discontinued products, specifying the product name and unit price.
I) List the company names of all Suppliers in North America (Canada, USA, Mexico)

*/
//A
from company in Customers 
where company.Orders.Count() > 5
select company.CompanyName 

//B
from place in Regions 
select place.RegionDescription

//C
from place in Territories
select place.TerritoryDescription

//D
from place in Regions
select new 
{
	Region = place.RegionDescription,
	TerritoryCount = place.Territories.Count()
}

//E
from place in Territories 
//where place.Region.RegionDescription.Contain("stern")
select new 
{
	Territory = place.TerritoryDescription,
	Region = place.Region.RegionDescription
}

//F
from place in Regions
select new 
{
	region = place.RegionDescription,
	Territories = from area in place.Territories
			      select area.TerritoryDescription
}

//G
from item in Products
where item.ProductName.Contains("chef")
select item.ProductName

//H
from item in Products 
where item.Discountinued
select new 
{
	name = item.ProductName
	Price = item.UnitPrice 
}

//I
from vendor in Suppliers
where vendor.Address.Country == "Canada"
	|| vendor.Address.Country == "USA"
	|| vendor.Address.Country == "Mexico"
where vendor.CompanyName