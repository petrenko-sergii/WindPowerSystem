using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WindPowerSystem.ViewModels.AddressModels;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WindPowerSystem.Controllers
{
	[Route("api/[controller]")]
	public class CountryController : Controller
	{
		private static string[] Countries = new[]
		{
			"Austria", "Belgium", "Denmark", "Finland", "Germany", "France", "Netherlands"
		};

		/// <summary>
		/// GET: api/country/getrandomcountry
		/// Retrieves a random country
		/// </summary>
		/// <returns>a random country</returns>
		[HttpGet("[action]")]
		public IActionResult GetRandomCountry()
		{
			var countryList = new List<CountryViewModel>();

			int i;
			var rnd = new Random();
			i = rnd.Next(1, Countries.Length);

			countryList.Add(new CountryViewModel()
			{
				Id = i,
				Name = Countries[--i]
			});

			// output the result in JSON format
			return new JsonResult(
				countryList,
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
			var countryList = new List<CountryViewModel>();
			int listLength = Countries.Length;

			for (int i = 0, j = 1; i < listLength; i++, j++)
			{
				countryList.Add(new CountryViewModel()
				{
					Id = j,
					Name = Countries[i]
				});
			}

			// output the result in JSON format
			return new JsonResult(
				countryList,
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}
	}
}
