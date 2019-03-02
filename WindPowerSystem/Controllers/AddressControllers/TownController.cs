using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WindPowerSystem.ViewModels.AddressModels;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WindPowerSystem.Controllers.AddressControllers
{
	[Route("api/[controller]")]
	public class TownController : Controller
	{
		public static List<TownViewModel> towns = new List<TownViewModel>();

		// GET api/country/showtownsforcountry
		[HttpGet("ShowTownsForCountry/{countryId}")]
		public IActionResult ShowTownsForCountry(int countryId)
		{
			towns.Clear();
			var foundTowns = new List<TownViewModel>();


			towns.Add(new TownViewModel() { Id = 1, Name = "Kolding", CountryId = 3 });
			towns.Add(new TownViewModel() { Id = 2, Name = "Odense", CountryId = 3 });
			towns.Add(new TownViewModel() { Id = 3, Name = "Viborg", CountryId = 3 });
			towns.Add(new TownViewModel() { Id = 4, Name = "Berlin", CountryId = 5 });
			towns.Add(new TownViewModel() { Id = 5, Name = "Hamburg", CountryId = 5 });
			towns.Add(new TownViewModel() { Id = 6, Name = "Munich", CountryId = 5 });

			for (int i = 0; i < towns.Count; i++)
			{
				if(towns[i].CountryId == countryId)
					foundTowns.Add(towns[i]);
			}

			// output the result in JSON format
			return new JsonResult(
				foundTowns,
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}
	}
}
