using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WindPowerSystem.Data.Models;
using WindPowerSystem.Data.Models.AddressModels;

namespace WindPowerSystem.Data
{
	public class DbSeeder
	{
		#region Public Methods
		public static void Seed(
			ApplicationDbContext dbContext,
			RoleManager<IdentityRole> roleManager,
			UserManager<ApplicationUser> userManager
			)
		{
			// Create default Users (if there are none)
			if (!dbContext.Users.Any())
			{
				CreateUsers(dbContext, roleManager, userManager)
					.GetAwaiter()
					.GetResult();
			}

			// Create default Quizzes (if there are none) together with their set of Q&A
			if (!dbContext.Quizzes.Any()) CreateQuizzes(dbContext);

			// Create default TurbineTypes (if there are none)
			if (!dbContext.TurbineTypes.Any()) CreateTurbineTypes(dbContext);

			// Create default Turbines (if there are none)
			if (!dbContext.Turbines.Any()) CreateTurbines(dbContext);

			// Create default Shares (if there are none)
			if (!dbContext.Shares.Any()) CreateShares(dbContext);

			// Create default Countries (if there are none)
			if (!dbContext.Countries.Any()) CreateCountries(dbContext);

			// Create default Towns (if there are none)
			if (!dbContext.Towns.Any()) CreateTowns(dbContext);
		}

		#endregion

		#region Seed Methods

		private static async Task CreateUsers(
			ApplicationDbContext dbContext,
			RoleManager<IdentityRole> roleManager,
			UserManager<ApplicationUser> userManager)
		{
			// local variables
			DateTime createdDate = new DateTime(2016, 03, 01, 12, 30, 00);
			DateTime lastModifiedDate = DateTime.Now;

			string role_Administrator = "Administrator";
			string role_RegisteredUser = "RegisteredUser";

			//Create Roles (if they doesn't exist yet)
			if (!await roleManager.RoleExistsAsync(role_Administrator))
			{
				await roleManager.CreateAsync(new IdentityRole(role_Administrator));
			}

			if (!await roleManager.RoleExistsAsync(role_RegisteredUser))
			{
				await roleManager.CreateAsync(new IdentityRole(role_RegisteredUser));
			}

			// Create the "Admin" ApplicationUser account (if it doesn't exist already)
			var user_Admin = new ApplicationUser()
			{
				SecurityStamp = Guid.NewGuid().ToString(),
				UserName = "Admin",
				Email = "admin@testmakerfree.com",
				CreatedDate = createdDate,
				LastModifiedDate = lastModifiedDate
			};

			// Insert "Admin" into the Database and assign the "Administrator"
			//and "RegisteredUser" roles to him.
			if (await userManager.FindByNameAsync(user_Admin.UserName) == null)
			{
				await userManager.CreateAsync(user_Admin, "Pass4Admin");
				await userManager.AddToRoleAsync(user_Admin, role_RegisteredUser);
				await userManager.AddToRoleAsync(user_Admin, role_Administrator);
				// Remove Lockout and E-Mail confirmation.
				user_Admin.EmailConfirmed = true;
				user_Admin.LockoutEnabled = false;
			}

#if DEBUG
			// Create some sample registered user accounts (if they don't exist already)
			var user_Ryan = new ApplicationUser()
			{
				SecurityStamp = Guid.NewGuid().ToString(),
				UserName = "Ryan",
				Email = "ryan@testmakerfree.com",
				CreatedDate = createdDate,
				LastModifiedDate = lastModifiedDate
			};

			var user_Solice = new ApplicationUser()
			{
				SecurityStamp = Guid.NewGuid().ToString(),
				UserName = "Solice",
				Email = "solice@testmakerfree.com",
				CreatedDate = createdDate,
				LastModifiedDate = lastModifiedDate
			};

			var user_Vodan = new ApplicationUser()
			{
				SecurityStamp = Guid.NewGuid().ToString(),
				UserName = "Vodan",
				Email = "vodan@testmakerfree.com",
				CreatedDate = createdDate,
				LastModifiedDate = lastModifiedDate
			};

			// Insert sample registered users into the Database and also assign
			//the "Registered" role to him.
			if (await userManager.FindByNameAsync(user_Ryan.UserName) == null)
			{
				await userManager.CreateAsync(user_Ryan, "Pass4Ryan");
				await userManager.AddToRoleAsync(user_Ryan,
				role_RegisteredUser);
				// Remove Lockout and E-Mail confirmation.
				user_Ryan.EmailConfirmed = true;
				user_Ryan.LockoutEnabled = false;
			}
			if (await userManager.FindByNameAsync(user_Solice.UserName) ==
			null)
			{
				await userManager.CreateAsync(user_Solice, "Pass4Solice");
				await userManager.AddToRoleAsync(user_Solice,
				role_RegisteredUser);
				// Remove Lockout and E-Mail confirmation.
				user_Solice.EmailConfirmed = true;
				user_Solice.LockoutEnabled = false;
			}
			if (await userManager.FindByNameAsync(user_Vodan.UserName) == null)
			{
				await userManager.CreateAsync(user_Vodan, "Pass4Vodan");
				await userManager.AddToRoleAsync(user_Vodan,
				role_RegisteredUser);
				// Remove Lockout and E-Mail confirmation.
				user_Vodan.EmailConfirmed = true;
				user_Vodan.LockoutEnabled = false;
			}

#endif
			await dbContext.SaveChangesAsync();
		}

		private static void CreateQuizzes(ApplicationDbContext dbContext)
		{
			// local variables
			DateTime createdDate = new DateTime(2017, 08, 08, 12, 30, 00);
			DateTime lastModifiedDate = DateTime.Now;

			// retrieve the admin user, which we'll use as default author.
			var authorId = dbContext.Users
				.Where(u => u.UserName == "Admin")
				.FirstOrDefault()
				.Id;

#if DEBUG
			// create 47 sample quizzes with auto-generated data
			// (including questions, answers & results)
			var num = 47;
			for (int i = 1; i <= num; i++)
			{
				CreateSampleQuiz(
					dbContext,
					i,
					authorId,
					num - i,
					3,
					3,
					3,
					createdDate.AddDays(-num));
			}
#endif

			// create 3 more quizzes with better descriptive data
			// (we'll add the questions, answers & results later on)
			EntityEntry<Quiz> e1 = dbContext.Quizzes.Add(new Quiz()
			{
				UserId = authorId,
				Title = "Are you more Light or Dark side of the Force?",
				Description = "Star Wars personality test",
				Text = @"Choose wisely you must, young padawan: " +
						"this test will prove if your will is strong enough " +
						"to adhere to the principles of the light side of the Force " +
						"or if you're fated to embrace the dark side. " +
						"No  you want to become a true JEDI, you can't possibly miss this!",
				ViewCount = 2343,
				CreatedDate = createdDate,
				LastModifiedDate = lastModifiedDate
			});

			EntityEntry<Quiz> e2 = dbContext.Quizzes.Add(new Quiz()
			{
				UserId = authorId,
				Title = "GenX, GenY or Genz?",
				Description = "Find out what decade most represents you",
				Text = @"Do you feel confortable in your generation? " +
						"What year should you have been born in?" +
						"Here's a bunch of questions that will help you to find out!",
				ViewCount = 4180,
				CreatedDate = createdDate,
				LastModifiedDate = lastModifiedDate
			});

			EntityEntry<Quiz> e3 = dbContext.Quizzes.Add(new Quiz()
			{
				UserId = authorId,
				Title = "Which Shingeki No Kyojin character are you?",
				Description = "Attack On Titan personality test",
				Text = @"Do you relentlessly seek revenge like Eren? " +
						"Are you willing to put your like on the stake to protect your friends like Mikasa? " +
						"Would you trust your fighting skills like Levi " +
						"or rely on your strategies and tactics like Arwin? " +
						"Unveil your true self with this Attack On Titan personality test!",
				ViewCount = 5203,
				CreatedDate = createdDate,
				LastModifiedDate = lastModifiedDate
			});

			// persist the changes on the Database
			dbContext.SaveChanges();
		}
		#endregion

		#region Utility Methods
		/// <summary>
		/// Creates a sample quiz and add it to the Database
		/// together with a sample set of questions, answers & results.
		/// </summary>
		/// <param name="userId">the author ID</param>
		/// <param name="id">the quiz ID</param>
		/// <param name="createdDate">the quiz CreatedDate</param>
		private static void CreateSampleQuiz(
			ApplicationDbContext dbContext,
			int num,
			string authorId,
			int viewCount,
			int numberOfQuestions,
			int numberOfAnswersPerQuestion,
			int numberOfResults,
			DateTime createdDate)
		{
			var quiz = new Quiz()
			{
				UserId = authorId,
				Title = String.Format("Quiz {0} Title", num),
				Description = String.Format("This is a sample description for quiz {0}.", num),
				Text = "This is a sample quiz created by the DbSeeder class for testing purposes. " +
						"All the questions, answers & results are auto-generated as well.",
				ViewCount = viewCount,
				CreatedDate = createdDate,
				LastModifiedDate = createdDate
			};
			dbContext.Quizzes.Add(quiz);
			dbContext.SaveChanges();

			for (int i = 0; i < numberOfQuestions; i++)
			{
				var question = new Question()
				{
					QuizId = quiz.Id,
					Text = "This is a sample question created by the DbSeeder class for testing purposes. " +
						"All the child answers are auto-generated as well.",
					CreatedDate = createdDate,
					LastModifiedDate = createdDate
				};
				dbContext.Questions.Add(question);
				dbContext.SaveChanges();

				for (int i2 = 0; i2 < numberOfAnswersPerQuestion; i2++)
				{
					var e2 = dbContext.Answers.Add(new Answer()
					{
						QuestionId = question.Id,
						Text = "This is a sample answer created by the DbSeeder class for testing purposes. ",
						Value = i2,
						CreatedDate = createdDate,
						LastModifiedDate = createdDate
					});
				}
			}

			for (int i = 0; i < numberOfResults; i++)
			{
				dbContext.Results.Add(new Result()
				{
					QuizId = quiz.Id,
					Text = "This is a sample result created by the DbSeeder class for testing purposes. ",
					MinValue = 0,
					// max value should be equal to answers number * max answer value
					MaxValue = numberOfAnswersPerQuestion * 2,
					CreatedDate = createdDate,
					LastModifiedDate = createdDate
				});
			}
			dbContext.SaveChanges();
		}

		private static void CreateTurbineTypes(ApplicationDbContext dbContext)
		{
			var typeV = new TurbineType() { Model = "V39/600", Capacity = 600 };
			var typeSG = new TurbineType() { Model = "SG 2.1-114", Capacity = 1140 };
			var typeN = new TurbineType() { Model = "N43", Capacity = 800 };
			var typeE = new TurbineType() { Model = "E-44", Capacity = 900 };

			// Insert turbine types into the Database
			dbContext.TurbineTypes.AddRange(typeV, typeSG, typeN, typeE);

			dbContext.SaveChanges();
		}

		private static void CreateTurbines(ApplicationDbContext dbContext)
		{
			var turbineV = new Turbine() { SerialNumber = "V52/850/2014-dk/kol-863", TurbineTypeId = 1 };
			var turbineSG = new Turbine() { SerialNumber = "SG2.1-114/2013-dk/kol-605", TurbineTypeId = 2 };
			var turbineN = new Turbine() { SerialNumber = "N43/2011-dk/kol-536", TurbineTypeId = 3 };
			var turbineE = new Turbine() { SerialNumber = "E-44/2016-dk/kol-221" , TurbineTypeId = 4 };

			// Insert turbines into the Database
			dbContext.Turbines.AddRange(turbineV, turbineSG, turbineN, turbineE);

			dbContext.SaveChanges();
		}

		private static void CreateShares(ApplicationDbContext dbContext)
		{
			var share1 = new Share() { Percent = 40, Price = 40000, TurbineId = 1 };
			var share2 = new Share() { Percent = 25, Price = 25000, TurbineId = 1 };
			var share3 = new Share() { Percent = 35, Price = 35000, TurbineId = 1 };

			var share4 = new Share() { Percent = 35, Price = 70000, TurbineId = 2 };
			var share5 = new Share() { Percent = 65, Price = 130000, TurbineId = 2};

			var share6 = new Share() { Percent = 20, Price = 20000, TurbineId = 3 };
			var share7 = new Share() { Percent = 20, Price = 20000, TurbineId = 3 };
			var share8 = new Share() { Percent = 60, Price = 60000, TurbineId = 3 };

			var share9 = new Share() { Percent = 50, Price = 35000, TurbineId = 4 };
			var share10 = new Share() { Percent = 50, Price = 35000, TurbineId = 4 };

			// Insert shares into the Database
			dbContext.Shares.AddRange(share1, share2, share3, share4, share5,
				share6, share7, share8, share9, share10);

			dbContext.SaveChanges();
		}

		private static void CreateCountries(ApplicationDbContext dbContext)
		{
			string[] countries = new[]
			{
				"Austria", "Belgium", "Denmark", "Finland", "Germany", "France", "Netherlands"
			};

			int count = countries.Length;

			for (int i = 0; i < count; i++)
				dbContext.Countries.Add(new Country() { Name = countries[i] });

			dbContext.SaveChanges();
		}

		private static void CreateTowns(ApplicationDbContext dbContext)
		{
			string[] danishTowns = new[] { "Aarhus", "Copenhagen", "Esbjerg", "Kolding", "Odense", "Viborg" };
			string[] germanTowns = new[] { "Berlin", "Hamburg", "Munich" };

			int countDk = danishTowns.Length;
			int countDe = germanTowns.Length;

			for (int i = 0; i < countDk; i++)
				dbContext.Towns.Add(new Town() { Name = danishTowns[i], CountryId = 3 });

			for (int i = 0; i < countDe; i++)
				dbContext.Towns.Add(new Town() { Name = germanTowns[i], CountryId = 5 });

			dbContext.SaveChanges();
		}

		#endregion
	}
}
