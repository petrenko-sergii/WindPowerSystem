using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using WindPowerSystem.Data.Models;
using WindPowerSystem.Data.Models.AddressModels;

namespace WindPowerSystem.Data
{
	public class ApplicationDbContext : DbContext
	{
		#region Constructor
		public ApplicationDbContext(DbContextOptions options) : base(options)
		{
		}
		#endregion Constructor

		#region Methods
		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			base.OnModelCreating(modelBuilder);

			modelBuilder.Entity<ApplicationUser>().ToTable("Users");
			modelBuilder.Entity<ApplicationUser>().HasMany(u => u.Quizzes).WithOne(i => i.User);

			modelBuilder.Entity<Quiz>().ToTable("Quizzes");
			modelBuilder.Entity<Quiz>().Property(i => i.Id).ValueGeneratedOnAdd();
			modelBuilder.Entity<Quiz>().HasOne(i => i.User).WithMany(u => u.Quizzes);
			modelBuilder.Entity<Quiz>().HasMany(i => i.Questions).WithOne(c => c.Quiz);

			modelBuilder.Entity<Question>().ToTable("Questions");
			modelBuilder.Entity<Question>().Property(i => i.Id).ValueGeneratedOnAdd();
			modelBuilder.Entity<Question>().HasOne(i => i.Quiz).WithMany(u => u.Questions);
			modelBuilder.Entity<Question>().HasMany(i => i.Answers).WithOne(c => c.Question);

			modelBuilder.Entity<Answer>().ToTable("Answers");
			modelBuilder.Entity<Answer>().Property(i => i.Id).ValueGeneratedOnAdd();
			modelBuilder.Entity<Answer>().HasOne(i => i.Question).WithMany(u => u.Answers);

			modelBuilder.Entity<Result>().ToTable("Results");
			modelBuilder.Entity<Result>().Property(i => i.Id).ValueGeneratedOnAdd();
			modelBuilder.Entity<Result>().HasOne(i => i.Quiz).WithMany(u => u.Results);

			modelBuilder.Entity<TurbineType>().ToTable("TurbineType");
			modelBuilder.Entity<TurbineType>().Property(i => i.Id).ValueGeneratedOnAdd();
			modelBuilder.Entity<TurbineType>().HasMany(i => i.Turbines).WithOne(c => c.TurbineType);

			modelBuilder.Entity<Turbine>().ToTable("Turbine");
			modelBuilder.Entity<Turbine>().Property(i => i.Id).ValueGeneratedOnAdd();
			modelBuilder.Entity<Turbine>().HasOne(i => i.TurbineType).WithMany(u => u.Turbines);
			modelBuilder.Entity<Turbine>().HasMany(i => i.Shares).WithOne(c => c.Turbine);

			modelBuilder.Entity<Share>().ToTable("StockShare");
			modelBuilder.Entity<Share>().Property(i => i.Id).ValueGeneratedOnAdd();
			modelBuilder.Entity<Share>().HasOne(i => i.Turbine).WithMany(u => u.Shares);

			modelBuilder.Entity<Country>().ToTable("Country");
			modelBuilder.Entity<Country>().Property(i => i.Id).ValueGeneratedOnAdd();
			modelBuilder.Entity<Country>().HasMany(i => i.Towns).WithOne(c => c.Country);

			modelBuilder.Entity<Town>().ToTable("Town");
			modelBuilder.Entity<Town>().Property(i => i.Id).ValueGeneratedOnAdd();
			modelBuilder.Entity<Town>().HasOne(i => i.Country).WithMany(u => u.Towns);
		}
		#endregion Methods

		#region Properties
		public DbSet<ApplicationUser> Users { get; set; }
		public DbSet<Quiz> Quizzes { get; set; }
		public DbSet<Question> Questions { get; set; }
		public DbSet<Answer> Answers { get; set; }
		public DbSet<Result> Results { get; set; }

		public DbSet<TurbineType> TurbineTypes { get; set; }
		public DbSet<Turbine> Turbines { get; set; }
		public DbSet<Share> Shares { get; set; }
		public DbSet<Country> Countries { get; set; }
		public DbSet<Town> Towns { get; set; }

		#endregion Properties
	}
}
