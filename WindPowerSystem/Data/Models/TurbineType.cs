using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace WindPowerSystem.Data.Models
{
	public class TurbineType
	{
		#region Constructor

		public TurbineType()
		{

		}

		#endregion

		#region Properties

		[Key]
		[Required]
		public int Id { get; set; }

		[Required]
		public string Model { get; set; }

		[Required]
		public float Capacity { get; set; }

		#region Lazy-Load Properties

		/// <summary>
		/// A list containing all the turbines related to this turbine type.
		/// </summary>
		public virtual List<Turbine> Turbines { get; set; }

		#endregion

		#endregion
	}
}
