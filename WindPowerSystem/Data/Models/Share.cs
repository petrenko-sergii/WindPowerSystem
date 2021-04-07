using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WindPowerSystem.Data.Models
{
	public class Share
	{
		#region Constructor
		public Share()
		{

		}
		#endregion

		#region Properties
		[Key]
		[Required]
		public int Id { get; set; }

		[Required]
		public decimal Percent { get; set; }

		[Required]
		public decimal Price { get; set; }

		[Required]
		public int TurbineId { get; set; }

		#endregion

		#region Lazy-Load Properties

		/// <summary>
		/// The parent turbine.
		/// </summary>
		[ForeignKey("TurbineId")]
		public virtual Turbine Turbine { get; set; }

		#endregion
	}
}
