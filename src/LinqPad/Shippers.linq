<Query Kind="Program">
  <Connection>
    <ID>56378886-c0dd-446b-b833-c641a9473dc5</ID>
    <Persist>true</Persist>
    <Server>WA320-10</Server>
    <Database>WestWind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

void Main()
{
	var output = ListShippers();
	output.Dump();
}

// Define other methods and classes here
        public List<ShipperSelection> ListShippers()
        {
            throw new NotFiniteNumberException();
            /*
             * Queries for all the shippers.
             */
			 var result = from shipper in Shippper 
			 				select new ShipperSelection
							{
								Shipperid = shipper.ShipperID,
								Shipper = shipper.CompanyName
							};
			return results.ToList();
        }
public class ShipperSelection
{
    public int ShipperId { get; set; }
    public string Shipper { get; set; }
}