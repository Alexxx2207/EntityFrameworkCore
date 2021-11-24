using Microsoft.EntityFrameworkCore;
using ServiceCodeFirstExercise.Data.Models;

namespace ServiceCodeFirstExercise.Data
{
    public class ServiceDbContext : DbContext
    {
        public ServiceDbContext()
        {

        }

        public ServiceDbContext(DbContextOptions options)
            : base(options) 
        {

        }

        public DbSet<Category> Categories { get; set; }

        public DbSet<Department> Departments { get; set; }

        public DbSet<Employee> Employees { get; set; }

        public DbSet<Report> Reports { get; set; }

        public DbSet<Status> Status { get; set; }

        public DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
                optionsBuilder.UseSqlServer(@"Server=.;Database=Service;Integrated Security = True");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Report>()
                .HasOne(x => x.Employee)
                .WithMany(x => x.Reports)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Report>()
                .HasOne(x => x.User)
                .WithMany(x => x.Reports)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Report>()
                .Property(x => x.CloseDate)
                .IsRequired(false);

            modelBuilder.Entity<User>()
                .Property(x => x.Age)
                .IsRequired(false);

            
        }
    }
}
