using System;
using System.Linq;
using Mapster;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using WindPowerSystem.Data;
using WindPowerSystem.Data.Models;
using WindPowerSystem.ViewModels;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WindPowerSystem.Controllers
{
	public class TurbineTypeController : BaseApiController
	{

		#region Constructor

		public TurbineTypeController(
			ApplicationDbContext context,
			RoleManager<IdentityRole> roleManager,
			UserManager<ApplicationUser> userManager,
			IConfiguration configuration
			)
			: base(context, roleManager, userManager, configuration) { }

		#endregion Constructor

		/// <summary>
		/// GET: api/turbinetype/getturbinetypelist
		/// Retrieves a List of turbine types
		/// </summary>
		/// <returns>a List of turbine types</returns>
		[HttpGet("[action]")]
		public IActionResult GetTurbineTypeList()
		{
			var turbineTypes = DbContext.TurbineTypes.OrderBy(t => t.Id).ToArray();

			// output the result in JSON format
			return new JsonResult(
				turbineTypes.Adapt<TurbineTypeViewModel[]>(),
				JsonSettings);
		}

		/// <summary>
		/// GET: api/turbinetype/{}id
		/// Retrieves the turbine type with the given {id}
		/// </summary>
		/// <param name="id">The ID of an existing turbine type</param>
		/// <returns>the turbine type with the given {id}</returns>
		[HttpGet("{id}")]
		public IActionResult Get(int id)
		{
			var turbineType = DbContext.TurbineTypes.Where(t => t.Id == id).FirstOrDefault();

			if (turbineType == null)
			{
				return NotFound(new
				{
					Error = String.Format("TurbineType ID {0} has not been found", id)
				});
			}

			return new JsonResult(turbineType.Adapt<TurbineTypeViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Adds a new TurbineType to the Database
		/// </summary>
		/// <param name="model">The TurbineTypeViewModel containing the data to insert</param>
		[HttpPut]
		[Authorize]
		public IActionResult Put([FromBody]TurbineTypeViewModel model)
		{
			if (model == null) return new StatusCodeResult(500);

			var turbineType = model.Adapt<TurbineType>();

			DbContext.TurbineTypes.Add(turbineType);

			DbContext.SaveChanges();

			// return the newly-created TurbineType to the client.
			return new JsonResult(turbineType.Adapt<TurbineTypeViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Edit the TurbineType with the given {id}
		/// </summary>
		/// <param name="model">The TurbineTypeViewModel containing the data to update</param>
		[HttpPost]
		[Authorize]
		public IActionResult Post([FromBody]TurbineTypeViewModel model)
		{
			if (model == null) return new StatusCodeResult(500);

			var turbineType = DbContext.TurbineTypes.Where(t => t.Id == model.Id).FirstOrDefault();

			if (turbineType == null)
			{
				return NotFound(new
				{
					Error = String.Format("TurbineType ID {0} has not been found",
				model.Id)
				});
			}

			turbineType.Model = model.Model;
			turbineType.Capacity = model.Capacity;

			DbContext.SaveChanges();

			return new JsonResult(
				turbineType.Adapt<TurbineTypeViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Deletes the TurbineType with the given {id} from the Database
		/// </summary>
		/// <param name="id">The ID of an existing TurbineType</param>
		[HttpDelete("{id}")]
		[Authorize]
		public IActionResult Delete(int id)
		{
			var turbineType = DbContext.TurbineTypes.Where(i => i.Id == id)
				.FirstOrDefault();

			if (turbineType == null)
			{
				return NotFound(new
				{
					Error = String.Format("TurbineType ID {0} has not been found", id)
				});
			}

			DbContext.TurbineTypes.Remove(turbineType);
			DbContext.SaveChanges();

			return new NoContentResult();
		}
	}
}
