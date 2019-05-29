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
	public class StreetController : Controller
	{
		public static List<StreetViewModel> streets = new List<StreetViewModel>();

		// GET api/street/getstreetsfortown
		[HttpGet("GetStreetsForTown/{townId}")]
		public IActionResult GetStreetsForTown(int townId)
		{
			streets.Clear();
			var foundStreets = new List<StreetViewModel>();

			streets.Add(new StreetViewModel() { Id = 1, Name = "Haderslevvej", TownId = 4, PostcodeId = 4});
			streets.Add(new StreetViewModel() { Id = 2, Name = "Ndr Ringvej", TownId = 4, PostcodeId = 4});
			streets.Add(new StreetViewModel() { Id = 3, Name = "Sdr Ringvej", TownId = 4, PostcodeId = 4});
			streets.Add(new StreetViewModel() { Id = 4, Name = "Middelfartvej", TownId = 5, PostcodeId = 3});
			streets.Add(new StreetViewModel() { Id = 5, Name = "Roesskovsvej", TownId = 5, PostcodeId = 3});

			streets.Add(new StreetViewModel() { Id = 6, Name = "Friedrichstrasse", TownId = 7 });
			streets.Add(new StreetViewModel() { Id = 7, Name = "Kurfürstendamm", TownId = 7 });
			streets.Add(new StreetViewModel() { Id = 8, Name = "Potsdamer Platz", TownId = 7});

			for (int i = 0; i < streets.Count; i++)
			{
				if (streets[i].TownId == townId)
					foundStreets.Add(streets[i]);
			}

			// output the result in JSON format
			return new JsonResult(
				foundStreets,
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}
	}
}
