using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace WindPowerSystem.Middleware
{
	public class SecurityHeadersMiddleware : IMiddleware
	{
		public Task InvokeAsync(HttpContext context, RequestDelegate next)
		{
			AddCrossOriginPolicyHeaders(context);
			AddStrictTransportSecurityHeaderIfHttps(context);
			AddContentTypeOptionsHeader(context);
			AddFrameOptionsHeader(context);

			return next(context);
		}

		private static void AddCrossOriginPolicyHeaders(HttpContext context)
		{
			context.Response.Headers.Add("Cross-Origin-Embedder-Policy", "require-corp");
			context.Response.Headers.Add("Cross-Origin-Opener-Policy", "same-origin");
			context.Response.Headers.Add("Cross-Origin-Resource-Policy", "same-origin");
		}

		private static void AddStrictTransportSecurityHeaderIfHttps(HttpContext context)
		{
			if (!context.Request.IsHttps)
			{
				return;
			}

			context.Response.Headers.Add("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
		}

		private static void AddContentTypeOptionsHeader(HttpContext context)
		{
			context.Response.Headers.Add("X-Content-Type-Options", "nosniff");
		}

		private static void AddFrameOptionsHeader(HttpContext context)
		{
			context.Response.Headers.Add("X-Frame-Options", "SAMEORIGIN"); 
		}
	}
}
