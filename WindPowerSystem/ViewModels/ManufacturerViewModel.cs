using Newtonsoft.Json;

namespace WindPowerSystem.ViewModels
{
	[JsonObject(MemberSerialization.OptOut)]
	public class ManufacturerViewModel
	{
		public ManufacturerViewModel()
		{

		}

		public int Id { get; set; }
		public string Name { get; set; }
		public string Email { get; set; }
		public string Phone { get; set; }
		public string Website { get; set; }
	}
}
