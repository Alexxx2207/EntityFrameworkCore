using RealEstates.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstates.Services.Contracts
{
    public interface IPropertiesService
    {
        IEnumerable<SearchedPropertyDTO> SearchForProperty(decimal minPrice, decimal maxPrice,
                                                            int minfloor,
                                                            double minSize);
    }
}
