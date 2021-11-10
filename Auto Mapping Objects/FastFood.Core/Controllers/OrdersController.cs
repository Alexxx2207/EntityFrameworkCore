namespace FastFood.Core.Controllers
{
    using System;
    using System.Linq;
    using AutoMapper;
    using AutoMapper.QueryableExtensions;
    using Data;
    using FastFood.Models;
    using Microsoft.AspNetCore.Mvc;
    using ViewModels.Orders;

    public class OrdersController : Controller
    {
        private readonly FastFoodContext context;
        private readonly IMapper mapper;

        public OrdersController(FastFoodContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public IActionResult Create()
        {
            var viewOrder = new CreateOrderViewModel
            {
                Items = this.context.Items.Select(x => x.Name).ToList(),
                Employees = this.context.Employees.Select(x => x.Name).ToList(),
            };

            return this.View(viewOrder);
        }

        [HttpPost]
        public IActionResult Create(CreateOrderInputModel model)
        {
            var order = mapper.Map<Order>(model);

            order.OrderItems.Add(new OrderItem()
            {
                Item = this.context.Items.Where(i => i.Name == model.ItemName).FirstOrDefault(),
                Order = order
            });

            order.EmployeeId = this.context.Employees
                .Where(e => e.Name == model.EmployeeName)
                .Select(e => e.Id)
                .FirstOrDefault();

            this.context.Orders.Add(order);

            this.context.SaveChanges();

            return this.RedirectToAction("All", "Orders");
        }

        public IActionResult All()
        {
            var orders = this.context.Orders
                .ProjectTo<OrderAllViewModel>(mapper.ConfigurationProvider)
                .ToList();

            return this.View(orders);
        }
    }
}
