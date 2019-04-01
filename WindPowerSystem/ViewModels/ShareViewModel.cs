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
		}

		#endregion

		#region Properties

		public int Id { get; set; }
		public decimal Percent { get; set; }
		public decimal Price { get; set; }
		public int TurbineId { get; set; }

		#endregion
	}
}
