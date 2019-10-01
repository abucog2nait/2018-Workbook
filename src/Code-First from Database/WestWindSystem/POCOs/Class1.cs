using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WestWindSystem.POCOs
{

    public class SupplierSumary
    {
        public string Company { get; set; }
        public string Caegory { get; set; }
        public string Phone { get; set; }
        public IEnumerable<SupplierProduct> Products { get; set; }
    }
}
