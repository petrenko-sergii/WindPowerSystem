using System;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using WindPowerSystem.Data;
using Mapster;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using WindPowerSystem.Data.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WindPowerSystem.Controllers
{
	[Route("api/[controller]")]
	public class BaseApiController : Controller
	{
		#region Constructor
		public BaseApiController(
			ApplicationDbContext context, 
			RoleManager<IdentityRole> roleManager,
			UserManager<ApplicationUser> userManager,
			IConfiguration configuration)
		{
			// Instantiate the ApplicationDbContext through DI
			DbContext = context;
			RoleManager = roleManager;
			UserManager = userManager;
			Configuration = configuration;

			// Instantiate a single JsonSerializerSettings object
			// that can be reused multiple times.
			JsonSettings = new JsonSerializerSettings()
			{
				Formatting = Formatting.Indented
			};

		}
		#endregion

		#region Shared Properties
		protected ApplicationDbContext DbContext { get; private set; }
		protected JsonSerializerSettings JsonSettings { get; private set; }

		protected RoleManager<IdentityRole> RoleManager { get; private set; }
		protected UserManager<ApplicationUser> UserManager { get; private set; }
		protected IConfiguration Configuration { get; private set; }
		#endregion
	}
}
