using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WindPowerSystem.ViewModels;
using Mapster;
using WindPowerSystem.Data;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WindPowerSystem.Controllers
{
	[Route("api/[controller]")]
	public class TurbineController : Controller
	{
		#region Private Fields

		private ApplicationDbContext DbContext;

		#endregion

		#region Constructor

		public TurbineController(ApplicationDbContext context)
		{
			// Instantiate the ApplicationDbContext through DI
			DbContext = context;
		}

		#endregion Constructor

		/// <summary>
		/// GET: api/turbine/getturbinelist
		/// Retrieves a List of turbines
		/// </summary>
		/// <returns>a List of turbines</returns>
		[HttpGet("[action]")]
		public IActionResult GetTurbineList()
		{
			var turbines = DbContext.Turbines.OrderBy(t => t.Id).ToArray();

			// output the result in JSON format
			return new JsonResult(
				turbines.Adapt<TurbineViewModel[]>(),
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}

		#region RESTful conventions methods

		/// <summary>
		/// GET: api/turbine/{}id
		/// Retrieves the Turbine with the given {id}
		/// </summary>
		/// <param name="id">The ID of an existing Turbine</param>
		/// <returns>the Turbine with the given {id}</returns>
		[HttpGet("{id}")]
		public IActionResult Get(int id)
		{
			var turbine = DbContext.Turbines.Where(i => i.Id ==id).FirstOrDefault();

			return new JsonResult( turbine.Adapt<TurbineViewModel>(), new JsonSerializerSettings()
			{
				Formatting = Formatting.Indented
			});
		}

		/// <summary>
		/// Adds a new Turbine to the Database
		/// </summary>
		/// <param name="m">The TurbineViewModel containing the data to insert</param>
		[HttpPut]
		public IActionResult Put(TurbineViewModel m)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// Edit the Turbine with the given {id}
		/// </summary>
		/// <param name="m">The TurbineViewModel containing the data to update</param>
		[HttpPost]
		public IActionResult Post(TurbineViewModel m)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// Deletes the Turbine with the given {id} from the Database
		/// </summary>
		/// <param name="id">The ID of an existing Turbine</param>
		[HttpDelete("{id}")]
		public IActionResult Delete(int id)
		{
			throw new NotImplementedException();
		}

		#endregion
	}
}
