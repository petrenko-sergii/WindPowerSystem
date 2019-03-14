using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WindPowerSystem.ViewModels.AddressModels;
using Mapster;
using WindPowerSystem.Data;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WindPowerSystem.Controllers.AddressControllers
{
	[Route("api/[controller]")]
	public class TownController : Controller
	{
		#region Private Fields

		private ApplicationDbContext DbContext;

		#endregion

		#region Constructor

		public TownController(ApplicationDbContext context)
		{
			// Instantiate the ApplicationDbContext through DI
			DbContext = context;
		}

		#endregion Constructor

		// GET api/country/showtownsforcountry
		[HttpGet("ShowTownsForCountry/{countryId}")]
		public IActionResult ShowTownsForCountry(int countryId)
		{
			var towns = DbContext.Towns.Where(t => t.CountryId == countryId).ToArray();

			// output the result in JSON format
			return new JsonResult(
				towns.Adapt<TownViewModel[]>(),
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}
	}
}
