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

namespace WindPowerSystem.Controllers
{
	[Route("api/[controller]")]
	public class CountryController : Controller
	{
		#region Private Fields

		private ApplicationDbContext DbContext;

		#endregion

		#region Constructor

		public CountryController(ApplicationDbContext context)
		{
			// Instantiate the ApplicationDbContext through DI
			DbContext = context;
		}

		#endregion Constructor

		/// <summary>
		/// GET: api/country/getrandomcountry
		/// Retrieves a random country
		/// </summary>
		/// <returns>a random country</returns>
		[HttpGet("[action]")]
		public IActionResult GetRandomCountry()
		{
			var countries = DbContext.Countries.OrderBy(c => c.Id).ToArray();

			var rnd = new Random();
			int i = rnd.Next(1, countries.Length);

			// output the result in JSON format
			return new JsonResult(
				countries[--i].Adapt<CountryViewModel>(),
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}

		/// <summary>
		/// GET: api/country/getcountrylist
		/// Retrieves a List of countries
		/// </summary>
		/// <returns>a List of countries</returns>
		[HttpGet("[action]")]
		public IActionResult GetCountryList()
		{
			var countries = DbContext.Countries.OrderBy(c => c.Id).ToArray();
			

			// output the result in JSON format
			return new JsonResult(
				countries.Adapt<CountryViewModel[]>(),
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}

		#region RESTful conventions methods

		/// <summary>
		/// GET: api/country/{}id
		/// Retrieves the Country with the given {id}
		/// </summary>
		/// <param name="id">The ID of an existing Country</param>
		/// <returns>the Country with the given {id}</returns>
		[HttpGet("{id}")]
		public IActionResult Get(int id)
		{
			var country = DbContext.Countries.Where(c => c.Id == id).FirstOrDefault();

			// output the result in JSON format
			return new JsonResult( country.Adapt<CountryViewModel>(),
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}

		/// <summary>
		/// Adds a new Country to the Database
		/// </summary>
		/// <param name="m">The CountryViewModel containing the data to insert</param>
		[HttpPut]
		public IActionResult Put(CountryViewModel m)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// Edit the Country with the given {id}
		/// </summary>
		/// <param name="m">The CountryViewModel containing the data to update</param>
		[HttpPost]
		public IActionResult Post(CountryViewModel m)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// Deletes the Country with the given {id} from the Database
		/// </summary>
		/// <param name="id">The ID of an existing Country</param>
		[HttpDelete("{id}")]
		public IActionResult Delete(int id)
		{
			throw new NotImplementedException();
		}

		#endregion
	}
}
