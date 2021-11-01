using ServiceCodeFirstExercise.Data;
using System;

namespace ServiceCodeFirstExercise
{
    class Program
    {
        static void Main(string[] args)
        {
            var db = new ServiceDbContext();

            db.Database.EnsureDeleted();
            db.Database.EnsureCreated();
        }
    }
}
