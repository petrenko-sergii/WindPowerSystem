using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace WindPowerSystem.ViewModels.AddressModels
{
	[JsonObject(MemberSerialization.OptOut)]
	public class StreetViewModel
	{

		#region Constructor

		public StreetViewModel()
		{
		}

		#endregion

		#region Properties

		public int Id { get; set; }
		public string Name { get; set; }
		public int TownId { get; set; }
		public int PostcodeId { get; set; }

		#endregion
	}
}
