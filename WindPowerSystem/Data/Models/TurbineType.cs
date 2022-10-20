using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WindPowerSystem.Data.Models
{
	public class TurbineType
	{
		public TurbineType()
		{

		}

		#region Properties

		[Key]
		[Required]
		public int Id { get; set; }

		[Required]
		public string Model { get; set; }

		[Required]
		public float Capacity { get; set; }

		[Required]
		public int ManufacturerId { get; set; }

		[ForeignKey("ManufacturerId")]
		public virtual Manufacturer Manufacturer { get; set; }

		/// <summary>
		/// A list containing all the turbines related to this turbine type.
		/// </summary>
		public virtual List<Turbine> Turbines { get; set; }
		
		#endregion
	}
}
