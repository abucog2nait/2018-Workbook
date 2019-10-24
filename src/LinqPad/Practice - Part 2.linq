<Query Kind="Expression">
  <Connection>
    <ID>d8601434-651c-4614-bcc3-fd77f5738ffb</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>WestWind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

// Practice questions - do each one in a separate LinqPad query.

// A) Group employees by region and show the results in this format:
/* ----------------------------------------------
 * | REGION        | EMPLOYEES                  |
 * ----------------------------------------------
 * | Eastern       | ------------------------   |
 * |               | | Nancy Devalio        |   |
 * |               | | Fred Flintstone      |   |
 * |               | | Bill Murray          |   |
 * |               | ------------------------   |
 * |---------------|----------------------------|
 * | ...           |                            |
 * 
from place in Territories
group place by place.Region.RegionDescription into bigPlace
select new
{
	Region = bigPlace.Key,
	Employees = (from terr in bigPlace
	            from emplTerr in terr.EmployeeTerritories
				select emplTerr.Employee.FirstName + " " + emplTerr.Employee.LastName).Distinct()
	 
}
 */
from place in Regions
select new
{
    Region = place.RegionDescription,
	Employees = (from area in place.Territories
	            from managedTerritory in area.EmployeeTerritories
				select managedTerritory.Employee.FirstName + " " + managedTerritory.Employee.LastName).Distinct()
}


// B) List all the Customers sorted by Company Name. Include the Customer's company name, contact name, and other contact information in the result.
from vendor in Customers
orderby vendor.CompanyName
select new 
{
	ComapanyName = vendor.CompanyName,
	Contact = new //Didn't really need an object here, but hey... 
	{
		Name = vendor.ContactName,
		Title = vendor.ContactTitle,
		Email = vendor.ContactEmail,
		Phone = vendor.ContactEmail,
		Fax = vendor.Fax
	}
}	

// C) List all the employees and sort the result in ascending order by last name, then first name. Show the employee's first and last name separately, along with the number of customer orders they have worked on.
from person in Employees
orderby person.LastName, person.FirstName
select new 
{
	person.FirstName,
	person.LastName,
	OrderCount = person.SalesRepOrders.Count()
}
// D) List all the employees and sort the result in ascending order by last name, then first name. Show the employee's first and last name separately, along with the number of customer orders they have worked on.

// E) Group all customers by city. Output the city name, aalong with the company name, contact name and title, and the phone number.
from buyer in Customers 
group buyer by buyer.City into cityvendors
select new 
{
	City = cityvendors.Key,
	Company = from company in cityvendors
			  select new 
			  {
			  	company.CompanyName,
				company.ContactName,
				company.ContactTitle,
				company.Phone
			  }
}
// F) List all the Suppliers, by Country
from vendor in Suppliers
group vendor by vendor.Country into supcon
select supcon 