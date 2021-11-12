using AutoMapper;
using ProductShop.DTOs;
using ProductShop.Models;

namespace ProductShop
{
    public class ProductShopProfile : Profile
    {
        public ProductShopProfile()
        {
            this.CreateMap<JsonUser, User>();

            this.CreateMap<JsonProduct, Product>()
                .ForMember(x => x.SellerId, y => y.MapFrom(s => s.SellerId))
                .ForMember(x => x.BuyerId, y => y.MapFrom(s => s.BuyerId));

            this.CreateMap<JsonCategory, Category>();

            this.CreateMap<JsonCategoryProduct, CategoryProduct>()
                .ForMember(x => x.CategoryId, y => y.MapFrom(s => s.CategoryId))
                .ForMember(x => x.ProductId, y => y.MapFrom(s => s.ProductId));

            this.CreateMap<Product, ProductInRangeDTO>()
                .ForMember(x => x.Seller, y => y.MapFrom(s => s.Seller.FirstName + " " + s.Seller.LastName));

        }
    }
}
