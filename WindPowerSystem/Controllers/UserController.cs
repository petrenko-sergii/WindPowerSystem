using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WindPowerSystem.ViewModels;
using Mapster;
using WindPowerSystem.Data;
using WindPowerSystem.Data.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;

namespace WindPowerSystem.Controllers
{
	public class UserController : BaseApiController
	{
		#region Constructor
		public UserController(
			ApplicationDbContext context,
			RoleManager<IdentityRole> roleManager,
			UserManager<ApplicationUser> userManager,
			IConfiguration configuration
			)
			: base(context, roleManager, userManager, configuration) { }
		#endregion

		#region RESTful Conventions
		/// <summary>
		/// PUT: api/user
		/// </summary>
		/// <returns>Creates a new User and return it accordingly.</returns>
		[HttpPut()]
		public async Task<IActionResult> Put([FromBody]UserViewModel model)
		{
			// return a generic HTTP Status 500 (Server Error)
			// if the client payload is invalid.
			if (model == null) return new StatusCodeResult(500);

			// check if the Username/Email already exists
			ApplicationUser user = await UserManager.FindByNameAsync(model.UserName);
			if (user != null) return BadRequest("Username already exists");

			user = await UserManager.FindByEmailAsync(model.Email);
			if (user != null) return BadRequest("Email already exists.");

			if (!PasswordCheck.IsValidPassword(model.Password, UserManager.Options.Password)) return BadRequest("Password is too weak.");

			var now = DateTime.Now;

			// create a new Item with the client-sent json data
			user = new ApplicationUser()
			{
				SecurityStamp = Guid.NewGuid().ToString(),
				UserName = model.UserName,
				Email = model.Email,
				DisplayName = model.DisplayName,
				CreatedDate = now,
				LastModifiedDate = now
			};

			// Add the user to the Db with the choosen password
			await UserManager.CreateAsync(user, model.Password);

			// Assign the user to the 'RegisteredUser' role.
			await UserManager.AddToRoleAsync(user, "RegisteredUser");

			// Remove Lockout and E-Mail confirmation
			user.EmailConfirmed = true;
			user.LockoutEnabled = false;

			// persist the changes into the Database.
			DbContext.SaveChanges();

			// return the newly-created User to the client.
			return Json(user.Adapt<UserViewModel>(),
				JsonSettings);
		}
		#endregion
	}
}
