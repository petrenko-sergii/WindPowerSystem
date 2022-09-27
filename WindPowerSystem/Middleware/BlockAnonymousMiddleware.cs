using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace WindPowerSystem.Middleware
{
	public class BlockAnonymousMiddleware : IMiddleware
	{
		public Task InvokeAsync(HttpContext context, RequestDelegate next)
		{
			if (!context.User.Identity.IsAuthenticated)
			{
				return context.ChallengeAsync();
			}

			return next(context);
		}
	}
}
