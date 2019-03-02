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
	public class AnswerController : Controller
	{
		// GET api/answer/all
		[HttpGet("All/{questionId}")]
		public IActionResult All(int questionId)
		{
			var sampleAnswers = new List<AnswerViewModel>();

			// add a first sample answer
			sampleAnswers.Add(new AnswerViewModel()
			{
				Id = 1,
				QuestionId = questionId,
				Text = "Friends and family",
				CreatedDate = DateTime.Now,
				LastModifiedDate = DateTime.Now
			});

			// add a bunch of other sample answers
			for (int i = 2; i <= 5; i++)
			{
				sampleAnswers.Add(new AnswerViewModel()
				{
					Id = i,
					QuestionId = questionId,
					Text = String.Format("Sample Answer {0}", i),
					CreatedDate = DateTime.Now,
					LastModifiedDate = DateTime.Now
				});
			}

			// output the result in JSON format
			return new JsonResult(
				sampleAnswers,
				new JsonSerializerSettings()
				{
					Formatting = Formatting.Indented
				});
		}

		#region RESTful conventions methods
		/// <summary>
		/// Retrieves the Answer with the given {id}
		/// </summary>
		/// &lt;param name="id">The ID of an existing Answer</param>
		/// <returns>the Answer with the given {id}</returns>
		[HttpGet("{id}")]
		public IActionResult Get(int id)
		{
			return Content("Not implemented (yet)!");
		}

		/// <summary>
		/// Adds a new Answer to the Database
		/// </summary>
	    /// <param name="m">The AnswerViewModel containing the data to insert</param>
		[HttpPut]
		public IActionResult Put(AnswerViewModel m)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// Edit the Answer with the given {id}
		/// </summary>
		/// <param name="m">The AnswerViewModel containing the data to update</param>
		[HttpPost]
		public IActionResult Post(AnswerViewModel m)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// Deletes the Answer with the given {id} from the Database
		/// </summary>
		/// <param name="id">The ID of an existing Answer</param>
		[HttpDelete("{id}")]
		public IActionResult Delete(int id)
		{
			throw new NotImplementedException();
		}
		#endregion
	}
}
