using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using WindPowerSystem.ViewModels;
using Mapster;
using WindPowerSystem.Data;
using WindPowerSystem.Data.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Authorization;

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

		/// <summary>
		/// Adds a new Manufacturer to the Database
		/// </summary>
		/// <param name="model">TheManufacturerViewModel containing the data to insert</param>
		[HttpPost]
		[Authorize]
		public IActionResult Post([FromBody]ManufacturerViewModel model)
		{
			if (model == null) return new StatusCodeResult(500);

			var manufacturer = model.Adapt<Manufacturer>();

			DbContext.Manufacturers.Add(manufacturer);

			DbContext.SaveChanges();

			// return the newly-created Manufacturer to the client.
			return new JsonResult(manufacturer.Adapt<ManufacturerViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Edit the Manufacturer with the given {id}
		/// </summary>
		/// <param name="model">The ManufacturerViewModel containing the data to update</param>
		[HttpPut]
		[Authorize]
		public IActionResult Put([FromBody]ManufacturerViewModel model)
		{
			if (model == null) return new StatusCodeResult(500);

			var manufacturer = DbContext.Manufacturers.Where(t => t.Id == model.Id).FirstOrDefault();

			if (manufacturer == null)
			{
				return NotFound(new
				{
					Error = String.Format("Manufacturer ID {0} has not been found",
				model.Id)
				});
			}

			manufacturer.Name = model.Name;
			manufacturer.Website = model.Website;
			manufacturer.Phone = model.Phone;
			manufacturer.Email = model.Email;

			DbContext.SaveChanges();

			return new JsonResult(
				manufacturer.Adapt<ManufacturerViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Deletes the Manufacturer with the given {id} from the Database
		/// </summary>
		/// <param name="id">The ID of an existing Manufacturer</param>
		[HttpDelete("{id}")]
		[Authorize]
		public IActionResult Delete(int id)
		{
			var manufacturer = DbContext.Manufacturers.Where(i => i.Id == id)
				.FirstOrDefault();

			if (manufacturer == null)
			{
				return NotFound(new
				{
					Error = String.Format("Manufacturer ID {0} has not been found", id)
				});
			}

			DbContext.Manufacturers.Remove(manufacturer);
			DbContext.SaveChanges();

			return new NoContentResult();
		}
	}
}
