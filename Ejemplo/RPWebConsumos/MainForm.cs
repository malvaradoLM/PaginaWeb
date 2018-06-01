using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace RPSuiteServer
{
    public partial class MainForm : System.Windows.Forms.Form
    {

        public MainForm()
        {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            this.StartServer();
        }

        private void StartServer()
        {
            if (this.IsServerActive)
            {
                this.StopServer();
            }
            Engine.Instance.Start();
        }

        private void StopServer()
        {
            if (this.IsServerActive)
            {
                Engine.Instance.Dispose();
                //this.fEngine = null;
            }
        }

        // Properties
        public bool IsServerActive
        {
            get
            {
                return (Engine.Instance.Active);
            }
        }

        private void MainForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.StopServer();
        }
    }
}