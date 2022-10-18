using System.ComponentModel.DataAnnotations;

namespace WindPowerSystem.Data.Models
{
	public class Manufacturer
	{
		public Manufacturer()
		{

		}

		[Key]
		[Required]
		public int Id { get; set; }

		[Required]
		public string Name { get; set; }

		[Required]
		public string Email { get; set; }

		[Required]
		public string Phone { get; set; }

		[Required]
		public string Website { get; set; }
	}
}
