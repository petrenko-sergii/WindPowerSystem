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
	public class PostcodeController : Controller
	{
		private static string[] Postcodes = new[]
		{
			"2500", "5000", "5200", "6000", "7100"
		};

		/// <summary>
		/// GET: api/postcode/getpostcodelist
		/// Retrieves a List of postcodes
		/// </summary>
		/// <returns>a List of postcodes</returns>
		[HttpGet("[action]")]
		public IActionResult GetPostcodeList()
		{
			var postcodeList = new List<PostcodeViewModel>();
			int listLength = Postcodes.Length;

			for (int i = 0, j = 1; i < listLength; i++, j++)
			{
				postcodeList.Add(new PostcodeViewModel()
				{
					Id = j,
					Value = Postcodes[i]
				});
			}

			// output the result in JSON format
			return new JsonResult(
				postcodeList,
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}
	}
}
