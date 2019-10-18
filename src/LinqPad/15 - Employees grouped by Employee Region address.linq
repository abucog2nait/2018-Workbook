<Query Kind="Expression">
  <Connection>
    <ID>22933144-7ce3-474d-884e-2fa3cc055d98</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>WestWind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

// Display the Employees, grouped by the region in which the employee lives. 
// Show the employee's first name, last name, and job title as separate properties 
// within each group.
from person in Employees
group person by person.Address.Region into EmployeeGroups
select new
{
    Region = EmployeeGroups.Key,
	Employee = from staff in EmployeeGroups
	           select new
               {
			       FirstName = staff.FirstName,
				   LastName = staff.LastName,
				   JobTitle = staff.JobTitle
               }
}