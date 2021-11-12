using System;
using System.Collections.Generic;
using System.Text;
using AutoMapper;
using CarDealer.DTO;
using CarDealer.Models;

namespace CarDealer
{
    public class CarDealerProfile : Profile
    {
        public CarDealerProfile()
        {
            this.CreateMap<JsonSuppliers, Supplier>();
            this.CreateMap<JsonParts, Part>();
            this.CreateMap<JsonCustomers, Customer>();
            this.CreateMap<JsonSales, Sale>();
        }
    }
}
