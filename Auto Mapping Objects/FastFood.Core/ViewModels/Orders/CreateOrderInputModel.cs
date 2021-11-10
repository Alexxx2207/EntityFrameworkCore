namespace FastFood.Core.ViewModels.Orders
{
    public class CreateOrderInputModel
    {
        public string Customer { get; set; }

        public string ItemName { get; set; }

        public string EmployeeName { get; set; }

        public int Quantity { get; set; }
    }
}
