using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace WindPowerSystem.ViewModels
{
	[JsonObject(MemberSerialization.OptOut)]
	public class TurbineViewModel
	{
		#region Constructor

		public TurbineViewModel()
		{
		}

		#endregion

		#region Properties

		public int Id { get; set; }
		public string SerialNumber { get; set; }

		#endregion
	}
}
