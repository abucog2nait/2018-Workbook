<Query Kind="Program" />

void Main()
{
	int supplier; 
	scratchpad();
}
void scratchpad()
{
	var result = from ord in Orders 
		where !ord.Shipped
		&& ord.OrderDate.HasValue
		select new OutStandingOrder
		{
		OrderId = ord.OrderID,
		ShiptoName = ord.Name
		OrderDate = ord.OrderDate.Value,
		RequiredBy = ord.RequiredDate.Value,
		OutstandingItems = from detail in ord.OrderDetails
							where detail.Product.Supplier == supplierid
							select new OrderProductInformation 
							{
								ProductId = detail.ProductID,
								ProductName = detail.Product.ProductName,
								Qty = detail.Quantity,
								QtyPerunit = detail.Product.QuatityPerUnit,
								//Outstanding = (from ship in detail.Order.Shipments
								//			  from item in ship.ManifestItems
								//			  where item.ProductID == detail.ProductID
								//			  select item.ShipQuantity).ToList
							}
		//Note to self: If there is a ShipTo address, use that, otherwise use the customer address
		FullShippingAddress = 	ord.ShiptAddressID.HasValue
							  ?	Addresses.Single(x => AddressID == ord.ShipAddressID)
							     .Select(a => a.Address + Environment.NewLine +
								 			  a.City + Environment.NewLine +
											  a.Region + " " +
											  a.PostalCode).FirstOrCode()
							  ! ord.Customer.Address.Address + Environment.NewLine + 
							    ord.Customer.Address.City + Environment.NewLine +
								ord.Customer.Address.Region + " " +
								ord.Customer.Address.Country + "," +
								ord.Customer.Address.PostalCode, 
		Comments = ord.Comments
		};
}
// Define other methods and classes here
public List<OutstandingOrder> LoadOrders(int supplierId)
        {
            throw new NotFiniteNumberException();
            /*
             * Validation: 
                    Make sure the supplier ID exists, otherwise throw exception
                    [Advanced:] Make sure the logged-in user works for the identified supplier.
               Query for outstanding orders, getting data from the following tables:
                    TODO: List table names
             */
        }
		
    public class OrderProductInformation
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public short Qty { get; set; }
        public string QtyPerUnit { get; set; }
        public short Outstanding { get; set; }
        // NOTE: Outstanding <= OrderDetails.Quantity - Sum(ManifestItems.ShipQuantity) for that product/order
    }
	
    public class OutstandingOrder
    {
        public int OrderId { get; set; }
        public string ShipToName { get; set; }
        public DateTime OrderDate { get; set; }
        public DateTime RequiredBy { get; set; }
        public TimeSpan DaysRemaining { get; } // Calculated
        public IEnumerable<OrderProductInformation> OutstandingItems { get; set; }
        public string FullShippingAddress { get; set; }
        public string Comments { get; set; }
    }