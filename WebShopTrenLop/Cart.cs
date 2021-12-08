using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebShopTrenLop
{
    public class Cart
    {
        public Product product { get; set; }
        public int quantity { get; set; }
        public Cart()
        {
            product = new Product();
        }
        public override bool Equals(object obj)
        {
            Cart c = (Cart)obj;
            return this.product.Pid.Equals(c.product.Pid);
        }
    }
}