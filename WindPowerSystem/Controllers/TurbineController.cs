using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WindPowerSystem.ViewModels;
using Mapster;
using WindPowerSystem.Data;
using WindPowerSystem.Data.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Authorization;

namespace WindPowerSystem.Controllers
{
	public class TurbineController : BaseApiController
	{
		#region Constructor

		public TurbineController(
			ApplicationDbContext context,
			RoleManager<IdentityRole> roleManager,
			UserManager<ApplicationUser> userManager,
			IConfiguration configuration
			)
			: base(context, roleManager, userManager, configuration) { }

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

			foreach (var t in turbines)
				t.TurbineType = DbContext.TurbineTypes.Where(x => x.Id == t.TurbineTypeId).FirstOrDefault();

			return new JsonResult(turbines.Adapt<TurbineViewModel[]>(), JsonSettings);
		}

		/// <summary>
		/// GET: api/turbine/getturbinetypelist
		/// Retrieves a List of turbine types
		/// </summary>
		/// <returns>a List of turbine types</returns>
		[HttpGet("[action]")]
		public IActionResult GetTurbineTypeList()
		{
			var turbineModel = new TurbineViewModel();
			var turbineTypes = DbContext.TurbineTypes.OrderBy(t => t.Id).ToArray();

			foreach (var t in turbineTypes)
				turbineModel.TurbineTypes.Add(t.Adapt<TurbineTypeViewModel>());

			return new JsonResult(turbineModel, JsonSettings);
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

			if (turbine == null)
			{
				return NotFound(new
				{
					Error = String.Format("Turbine ID {0} has not been found", id)
				});
			}

			var turbineModel = turbine.Adapt<TurbineViewModel>();
			var turbineTypes = DbContext.TurbineTypes.ToList();

			foreach (var t in turbineTypes)
				turbineModel.TurbineTypes.Add(t.Adapt<TurbineTypeViewModel>());

			turbineModel.TurbineType = turbineTypes.
				Where(i => i.Id == turbineModel.TurbineTypeId).FirstOrDefault().
				Adapt<TurbineTypeViewModel>();

			return new JsonResult(turbineModel, JsonSettings);
		}

		/// <summary>
		/// Adds a new Turbine to the Database
		/// </summary>
		/// <param name="model">The TurbineViewModel containing the data to insert</param>
		[HttpPut]
		[Authorize]
		public IActionResult Put([FromBody]TurbineViewModel model)
		{
			if (model == null) return new StatusCodeResult(500);

			var turbine = model.Adapt<Turbine>();

			DbContext.Turbines.Add(turbine);
			DbContext.SaveChanges();

			return new JsonResult(
				turbine.Adapt<TurbineViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Edit the Turbine with the given {id}
		/// </summary>
		/// <param name="model">The TurbineViewModel containing the data to update</param>
		[HttpPost]
		[Authorize]
		public IActionResult Post([FromBody]TurbineViewModel model)
		{
			if (model == null) return new StatusCodeResult(500);

			var turbine = DbContext.Turbines.Where(t => t.Id ==
						model.Id).FirstOrDefault();

			if (turbine == null) return NotFound(new
			{
				Error = String.Format("Turbine ID {0} has not been found", model.Id)
			});

			turbine.SerialNumber = model.SerialNumber;
			turbine.TurbineTypeId = model.TurbineTypeId;

			DbContext.SaveChanges();

			return new JsonResult(
				turbine.Adapt<TurbineViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Deletes the Turbine with the given {id} from the Database
		/// </summary>
		/// <param name="id">The ID of an existing Turbine</param>
		[HttpDelete("{id}")]
		[Authorize]
		public IActionResult Delete(int id)
		{
			var turbine = DbContext.Turbines.Where(i => i.Id == id)
				.FirstOrDefault();

			if (turbine == null) return NotFound(new
			{
				Error = String.Format("Turbine ID {0} has not been found", id)
			});

			DbContext.Turbines.Remove(turbine);
			DbContext.SaveChanges();

			return new NoContentResult();
		}

		#endregion
	}
}
