using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WindPowerSystem.ViewModels
{
	[JsonObject(MemberSerialization.OptOut)]
	public class ShareViewModel
	{
		#region Constructor

		public ShareViewModel()
		{
			TurbineType = new TurbineTypeViewModel();
			Turbines = new List<TurbineViewModel>();
		}

		#endregion

		#region Properties

		public int Id { get; set; }
		public decimal Percent { get; set; }
		public decimal Price { get; set; }
		public int TurbineId { get; set; }

		public TurbineViewModel Turbine  { get; set; }

		public TurbineTypeViewModel TurbineType { get; set; }

		public List<TurbineViewModel> Turbines { get; set; }

		#endregion
	}
}
