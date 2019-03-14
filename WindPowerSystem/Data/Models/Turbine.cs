using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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

		#endregion
	}
}
