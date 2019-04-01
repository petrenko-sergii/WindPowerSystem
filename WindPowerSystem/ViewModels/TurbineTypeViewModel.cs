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
		}

		#endregion

		#region Properties

		public int Id { get; set; }
		public string Model { get; set; }
		public float Capacity { get; set; }

		#endregion
	}
}
