﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WindPowerSystem.Data.Models
{
	public class Turbine
	{
		#region Constructor

		public Turbine()
		{

		}

		#endregion

		#region Properties

		[Key]
		[Required]
		public int Id { get; set; }

		[Required]
		public string SerialNumber { get; set; }

		[Required]
		public int TurbineTypeId { get; set; }

		#endregion

		#region Lazy-Load Properties

		/// <summary>
		/// The parent turbine type.
		/// </summary>
		[ForeignKey("TurbineTypeId")]
		public virtual TurbineType TurbineType { get; set; }

		/// <summary>
		/// A list containing all the shares related to this turbine.
		/// </summary>
		public virtual List<Share> Shares { get; set; }

		#endregion
	}
}
