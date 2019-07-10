﻿using Newtonsoft.Json;

namespace WindPowerSystem.ViewModels
{
	[JsonObject(MemberSerialization.OptOut)]
	public class TokenResponseViewModel
	{
		#region Constructor
		public TokenResponseViewModel()
		{

		}
		#endregion

		#region Properties
		public string token { get; set; }
		public int expiration { get; set; }
		#endregion
	}
}
