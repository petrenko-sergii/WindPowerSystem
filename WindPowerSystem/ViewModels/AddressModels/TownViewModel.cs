using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WindPowerSystem.ViewModels.AddressModels
{
	[JsonObject(MemberSerialization.OptOut)]
	public class TownViewModel
	{
		#region Constructor

		public TownViewModel()
		{
		}

		#endregion

		#region Properties

		public int Id { get; set; }
		public string Name { get; set; }
		public int CountryId { get; set; }

		#endregion
	}
}
