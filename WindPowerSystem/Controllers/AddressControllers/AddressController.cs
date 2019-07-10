using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WindPowerSystem.ViewModels.AddressModels;
using Mapster;
using WindPowerSystem.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using WindPowerSystem.Data.Models;

namespace WindPowerSystem.Controllers.AddressControllers
{
	public class AddressController : BaseApiController
	{
		#region Constructor

		public AddressController(
			ApplicationDbContext context,
			RoleManager<IdentityRole> roleManager,
			UserManager<ApplicationUser> userManager,
			IConfiguration configuration
			)
			: base(context, roleManager, userManager, configuration) { }

		#endregion Constructor

		/// <summary>
		/// GET: api/address/getcountrylist
		/// Retrieves a List of countries
		/// </summary>
		/// <returns>a List of countries</returns>
		[HttpGet("[action]")]
		public IActionResult GetCountryList()
		{
			var countries = DbContext.Countries.OrderBy(c => c.Id).ToArray();

			return new JsonResult(
				countries.Adapt<CountryViewModel[]>(),
				JsonSettings);
		}

		// GET api/address/gettownsforcountry
		[HttpGet("GetTownsForCountry/{countryId}")]
		public IActionResult GetTownsForCountry(int countryId)
		{
			var towns = DbContext.Towns.Where(t => t.CountryId == countryId).ToArray();

			return new JsonResult(towns.Adapt<TownViewModel[]>(),
				JsonSettings);
		}
	}
}
