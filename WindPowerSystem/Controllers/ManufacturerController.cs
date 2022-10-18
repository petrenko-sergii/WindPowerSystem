using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using WindPowerSystem.ViewModels;
using Mapster;
using WindPowerSystem.Data;
using WindPowerSystem.Data.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;

namespace WindPowerSystem.Controllers
{
	public class ManufacturerController : BaseApiController
	{
		#region Constructor

		public ManufacturerController(
			ApplicationDbContext context,
			RoleManager<IdentityRole> roleManager,
			UserManager<ApplicationUser> userManager,
			IConfiguration configuration
			)
			: base(context, roleManager, userManager, configuration) { }

		#endregion Constructor

		/// <summary>
		/// GET: api/manufacturer
		/// Retrieves a List of manufacturers
		/// </summary>
		/// <returns>a List of manufacturers</returns>
		[HttpGet]
		public IActionResult GetManufacturerList()
		{
			var manufacturers = DbContext.Manufacturers.OrderBy(t => t.Id).ToArray();

			return new JsonResult(manufacturers.Adapt<ManufacturerViewModel[]>(), JsonSettings);
		}

		/// <summary>
		/// GET: api/manufacturer/{id}
		/// Retrieves the manufacturer with the given {id}
		/// </summary>
		/// <param name="id">The ID of an existing Manufacturer</param>
		/// <returns>the manufacturer with the given {id}</returns>
		[HttpGet("{id}")]
		public IActionResult Get(int id)
		{
			var manufacturer = DbContext.Manufacturers.Where(i => i.Id == id).FirstOrDefault();

			if (manufacturer == null)
			{
				return NotFound(new
				{
					Error = String.Format("Manufacturer ID {0} has not been found", id)
				});
			}

			var manufacturerModel = manufacturer.Adapt<ManufacturerViewModel>();

			return new JsonResult(manufacturerModel, JsonSettings);
		}
	}
}
