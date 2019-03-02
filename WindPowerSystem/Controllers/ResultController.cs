using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using WindPowerSystem.ViewModels;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WindPowerSystem.Controllers
{
	[Route("api/[controller]")]
	public class ResultController : Controller
	{
		// GET api/question/all
		[HttpGet("All/{quizId}")]
		public IActionResult All(int quizId)
		{
			var sampleResults = new List<ResultViewModel>();

			// add a first sample result
			sampleResults.Add(new ResultViewModel()
			{
				Id = 1,
				QuizId = quizId,
				Text = "What do you value most in your life?",
				CreatedDate = DateTime.Now,
				LastModifiedDate = DateTime.Now
			});

			// add a bunch of other sample results
			for (int i = 2; i <= 5; i++)
			{
				sampleResults.Add(new ResultViewModel()
				{
					Id = i,
					QuizId = quizId,
					Text = String.Format("Sample Question {0}", i),
					CreatedDate = DateTime.Now,
					LastModifiedDate = DateTime.Now
				});
			}

			// output the result in JSON format
			return new JsonResult(
				sampleResults,
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}

		#region RESTful conventions methods
		/// <summary>
		/// Retrieves the Result with the given {id}
		/// </summary>
		/// &lt;param name="id">The ID of an existing Result</param>
		/// <returns>the Result with the given {id}</returns>
		[HttpGet("{id}")]
		public IActionResult Get(int id)
		{
			return Content("Not implemented (yet)!");
		}

		/// <summary>
		/// Adds a new Result to the Database
		/// </summary>
		/// <param name="m">The ResultViewModel containing the data to insert</param>
		[HttpPut]
		public IActionResult Put(ResultViewModel m)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// Edit the Result with the given {id}
		/// </summary>
		/// <param name="m">The ResultViewModel containing the data to update</param>
		[HttpPost]
		public IActionResult Post(ResultViewModel m)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// Deletes the Result with the given {id} from the Database
		/// </summary>
		/// <param name="id">The ID of an existing Result</param>
		[HttpDelete("{id}")]
		public IActionResult Delete(int id)
		{
			throw new NotImplementedException();
		}
		#endregion
	}
}
