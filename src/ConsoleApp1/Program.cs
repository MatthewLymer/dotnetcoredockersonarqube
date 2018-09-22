using System;

namespace ConsoleApp1
{
    internal static class Program
    {
        public static void Main(string[] args)
        {
            if (args.Length > 0)
            {
                var firstArg = args[0];

                if (firstArg == null || firstArg.Equals(""))
                {
                    // TODO: update exception
                    throw new Exception($"This is bad code: {firstArg.Length}");
                }
            }

            Console.WriteLine("Hello World!");
        }
    }
}
