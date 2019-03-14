using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WindPowerSystem.Data.Models.AddressModels
{
	public class Town
	{
		#region Constructor
		public Town()
		{

		}
		#endregion

		#region Properties
		[Key]
		[Required]
		public int Id { get; set; }

		[Required]
		public string Name { get; set; }

		[Required]
		public int CountryId { get; set; }

		#endregion

		#region Lazy-Load Properties

		/// <summary>
		/// The parent country.
		/// </summary>
		[ForeignKey("CountryId")]
		public virtual Country Country { get; set; }

		#endregion
	}
}
