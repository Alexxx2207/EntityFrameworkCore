using RealEstates.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstates.Services.Contracts
{
    public interface ITagService
    {
        void AddTags();

        void SetTagsToProperties();
    }
}
