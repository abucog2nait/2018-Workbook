<Query Kind="Expression">
  <Connection>
    <ID>56378886-c0dd-446b-b833-c641a9473dc5</ID>
    <Persist>true</Persist>
    <Server>WA320-10</Server>
    <Database>WestWind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

from sale in Orders 
//where sael.OrderDate.Value.Month == 4
//	&& sale.OrderDate.Value.Year == 2018
where sale.OrderDate >= new DateTime(2018,04, 01)
	&& sale.OrderDate < new DateTime(2018, 5, 1)
select new 
{
	Company = sale.Customer.CompanyName,
	DateOrdered = sale.OrderDate,
	TimeToDelivery = sale.RequiredDate - sale.OrderDate
}