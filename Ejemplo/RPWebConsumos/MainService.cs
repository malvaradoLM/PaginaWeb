using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.ServiceProcess;

namespace RPSuiteServer
{
    public partial class MainService : System.ServiceProcess.ServiceBase
    {
        #region Private fields
        private Engine fEngine;
        #endregion

        /// <summary>
        /// Set things in motion so your service can do its work.
        /// </summary>
        protected override void OnStart(string[] args)
        {
            base.OnStart(args);
            this.fEngine = new Engine();
            this.fEngine.Start();
        }

        /// <summary>
        /// Stop this service.
        /// </summary>
        protected override void OnStop()
        {
            base.OnStop();
            this.fEngine.Stop();
            this.fEngine.Dispose();
            this.fEngine = null;
        }

        protected override void OnPause()
        {
            base.OnPause();
            this.fEngine.Stop();
        }

        protected override void OnContinue()
        {
            base.OnContinue();
            this.fEngine.Start();
        }
    }
}
