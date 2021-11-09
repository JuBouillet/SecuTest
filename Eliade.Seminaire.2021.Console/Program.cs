using System;
using Umbraco.Core.Cache;

namespace Eliade.Seminaire._2021.ConsoleApp
{
	class Program
	{

		static void Main(string[] args)
		{
			Umbraco.Core.Cache.AppCaches test = new();
			var test2 = test.RequestCache;
			string password = "Cec1E3tVr@imentP@sS3cure2";
			Console.WriteLine("Hello World!");
		}
	}
}
