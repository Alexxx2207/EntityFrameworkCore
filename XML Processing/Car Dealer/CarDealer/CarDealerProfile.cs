using AutoMapper;
using CarDealer.DTOs;
using CarDealer.Models;
using System.Linq;

namespace CarDealer
{
    public class CarDealerProfile : Profile
    {
        public CarDealerProfile()
        {
            this.CreateMap<Car, CarsWithDistanceDTO>();
            this.CreateMap<Car, BMWCarsDTO>();
        }
    }
}
