<Query Kind="Expression">
  <Connection>
    <ID>427b867e-be0d-4dfa-a844-3e8558a6934e</ID>
    <Server>.</Server>
    <Database>WestWind</Database>
  </Connection>
</Query>

// List all the customers grouped by country and region.
from row in Customers
group row by new // TODO: ClassName for key
{
	Nation = row.Address,
	row.Address
}
into CustomerGroups
select new
{
   Key = CustomerGroups.Key,
   Country = CustomerGroups.Key.Nation,
   Region = CustomerGroups.Key,
   Customers = from data in CustomerGroups
               select new
               {
                   Company = data.CompanyName,
                   City = data.Address
               }
}