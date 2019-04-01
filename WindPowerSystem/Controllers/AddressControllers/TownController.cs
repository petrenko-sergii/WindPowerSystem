using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WindPowerSystem.ViewModels.AddressModels;
using Mapster;
using WindPowerSystem.Data;

namespace WindPowerSystem.Controllers.AddressControllers
{
	public class TownController : BaseApiController
	{
		#region Constructor

		public TownController(ApplicationDbContext context)
			: base(context) { }

		#endregion Constructor

		// GET api/country/showtownsforcountry
		[HttpGet("ShowTownsForCountry/{countryId}")]
		public IActionResult ShowTownsForCountry(int countryId)
		{
			var towns = DbContext.Towns.Where(t => t.CountryId == countryId).ToArray();

			return new JsonResult(towns.Adapt<TownViewModel[]>(),
				JsonSettings);
		}

		/// <summary>
		/// GET: api/town/gettownlist
		/// Retrieves a List of towns
		/// </summary>
		/// <returns>a List of towns</returns>
		[HttpGet("[action]")]
		public IActionResult GetTownList()
		{
			var towns = DbContext.Towns.OrderBy(t => t.Id).ToArray();

			return new JsonResult(
				towns.Adapt<TownViewModel[]>(),
				JsonSettings);
		}

		/// <summary>
		/// GET: api/town/{}id
		/// Retrieves the town with the given {id}
		/// </summary>
		/// <param name="id">The ID of an existing town</param>
		/// <returns>the town with the given {id}</returns>
		[HttpGet("{id}")]
		public IActionResult Get(int id)
		{
			var town = DbContext.Towns.Where(t => t.Id == id).FirstOrDefault();

			return new JsonResult(town.Adapt<CountryViewModel>(),
				JsonSettings);
		}
	}
}
