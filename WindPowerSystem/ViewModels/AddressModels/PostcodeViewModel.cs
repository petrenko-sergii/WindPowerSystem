using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace WindPowerSystem.ViewModels.AddressModels
{
	[JsonObject(MemberSerialization.OptOut)]
	public class PostcodeViewModel
	{
		#region Constructor

		public PostcodeViewModel()
		{
		}

		#endregion

		#region Properties

		public int Id { get; set; }
		public string Value { get; set; }

		#endregion
	}
}
