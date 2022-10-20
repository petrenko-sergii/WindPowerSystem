using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WindPowerSystem.ViewModels
{
	[JsonObject(MemberSerialization.OptOut)]
	public class TurbineTypeViewModel
	{
		#region Constructor

		public TurbineTypeViewModel()
		{
			Manufacturers = new List<ManufacturerViewModel>();
		}

		#endregion

		#region Properties

		public int Id { get; set; }
		public string Model { get; set; }
		public float Capacity { get; set; }
		public int ManufacturerId { get; set; }

		public ManufacturerViewModel Manufacturer { get; set; }

		public List<ManufacturerViewModel> Manufacturers { get; set; }

		#endregion
	}
}
