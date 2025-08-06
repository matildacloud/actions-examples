using System;

namespace SampleDotNetApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("=== Sample .NET Application ===");
            Console.WriteLine($"Application Version: {GetVersion()}");
            Console.WriteLine($"Current Time: {DateTime.Now}");
            Console.WriteLine($"Machine Name: {Environment.MachineName}");
            Console.WriteLine($"OS Version: {Environment.OSVersion}");
            Console.WriteLine($".NET Version: {Environment.Version}");
            
            if (args.Length > 0)
            {
                Console.WriteLine($"Arguments: {string.Join(", ", args)}");
            }
            
            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey();
        }
        
        static string GetVersion()
        {
            return "1.0.0";
        }
    }
} 