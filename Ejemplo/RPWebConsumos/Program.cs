using System;


namespace RPSuiteServer
{
    static class Program
    {
        [STAThread]
        public static void Main(String[] args)
        {
            new RPSuiteServer().Run(args);
        }
    }
}