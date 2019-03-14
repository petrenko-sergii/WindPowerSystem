using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WindPowerSystem.Data.Models.AddressModels
{
	public class Country
	{
		#region Constructor

		public Country()
		{

		}

		#endregion


		#region Properties

		[Key]
		[Required]
		public int Id { get; set; }

		[Required]
		public string Name { get; set; }

		#endregion

		#region Lazy-Load Properties

		/// <summary>
		/// A list containing all the towns related to this country.
		/// </summary>
		public virtual List<Town> Towns { get; set; }

		#endregion
	}
}
