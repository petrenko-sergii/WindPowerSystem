﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WindPowerSystem.ViewModels;
using Mapster;
using WindPowerSystem.Data;
using WindPowerSystem.Data.Models;

namespace WindPowerSystem.Controllers
{
	public class ShareController : BaseApiController
	{
		#region Constructor

		public ShareController(ApplicationDbContext context)
		: base(context) { }

		#endregion Constructor

		// GET api/share/showsharesforturbine
		[HttpGet("ShowSharesForTurbine/{turbineId}")]
		public IActionResult ShowSharesForTurbine(int turbineId)
		{
			var shares = DbContext.Shares.Where(s => s.TurbineId == turbineId).ToArray();

			return new JsonResult(
				shares.Adapt<ShareViewModel[]>(),
				JsonSettings);
		}

		/// <summary>
		/// GET: api/share/showallshares
		/// Retrieves a List of shares
		/// </summary>
		/// <returns>a List of shares</returns>
		[HttpGet("[action]")]
		public IActionResult ShowAllShares()
		{
			var shares = DbContext.Shares.OrderBy(s => s.Id).ToArray();

			return new JsonResult(
				shares.Adapt<ShareViewModel[]>(),
				JsonSettings);
		}

		/// <summary>
		/// GET: api/share/{}id
		/// Retrieves the share with the given {id}
		/// </summary>
		/// <param name="id">The ID of an existing share</param>
		/// <returns>the share with the given {id}</returns>
		[HttpGet("{id}")]
		public IActionResult Get(int id)
		{
			var share = DbContext.Shares.Where(s => s.Id == id).FirstOrDefault();

			if (share == null)
			{
				return NotFound(new
				{
					Error = String.Format("Stockshare ID {0} has not been found", id)
				});
			}

			return new JsonResult(share.Adapt<ShareViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Adds a new Share to the Database
		/// </summary>
		/// <param name="model">The ShareViewModel containing the data to insert</param>
		[HttpPut]
		public IActionResult Put([FromBody]ShareViewModel model)
		{
			if (model == null) return new StatusCodeResult(500);

			var share = model.Adapt<Share>();

			DbContext.Shares.Add(share);
			DbContext.SaveChanges();

			return new JsonResult(
				share.Adapt<ShareViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Edit the Share with the given {id}
		/// </summary>
		/// <param name="model">The ShareViewModel containing the data to update</param>
		[HttpPost]
		public IActionResult Post([FromBody]ShareViewModel model)
		{
			if (model == null) return new StatusCodeResult(500);

			var share = DbContext.Shares.Where(s => s.Id ==
						model.Id).FirstOrDefault();

			if (share == null) return NotFound(new
			{
				Error = String.Format("Stockshare ID {0} has not been found", model.Id)
			});

			share.Percent = model.Percent;
			share.Price = model.Price;
			share.TurbineId = model.TurbineId;

			DbContext.SaveChanges();

			return new JsonResult(
				share.Adapt<ShareViewModel>(),
				JsonSettings);
		}

		/// <summary>
		/// Deletes the Share with the given {id} from the Database
		/// </summary>
		/// <param name="id">The ID of an existing Share</param>
		[HttpDelete("{id}")]
		public IActionResult Delete(int id)
		{
			var share = DbContext.Shares.Where(i => i.Id == id)
				.FirstOrDefault();

			if (share == null) return NotFound(new
			{
				Error = String.Format("Stockshare ID {0} has not been found", id)
			});

			DbContext.Shares.Remove(share);
			DbContext.SaveChanges();

			return new NoContentResult();
		}
	}
}