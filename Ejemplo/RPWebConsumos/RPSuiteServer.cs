using System;
using System.ServiceProcess;
using System.Windows.Forms;
using RemObjects.SDK.Server;

namespace RPSuiteServer
{
    class RPSuiteServer : ApplicationServer
    {
        private Engine fConsoleEngine;

        protected override String Identifier
        {
            get
            {
                return "60b33012-f38f-40c5-aa12-217daba99bc1";
            }
        }

        protected override String ServiceName
        {
            get
            {
                return "RPSuite Service";
            }
        }

        protected override String ApplicationName
        {
            get
            {
                return "RPSuiteServer";
            }
        }

        protected override void RunAsConsoleApplication()
        {
            this.fConsoleEngine = new Engine();
            this.fConsoleEngine.Start();
        }

        protected override void ShutdownAsConsoleApplication()
        {
            this.fConsoleEngine.Stop();
            this.fConsoleEngine.Dispose();
        }

        protected override void RunAsWindowsService()
        {
            ServiceBase.Run(new MainService());
        }

        protected override void RunAsWindowsApplication()
        {
            Application.EnableVisualStyles();
            Application.Run(new MainForm());
        }
    }
}