using System.Drawing;
using System.Collections;
using System.Windows.Forms;
using System.ComponentModel;

namespace RPSuiteServer
{
    public partial class MainForm : System.Windows.Forms.Form
    {
        #region Windows Form Designer
        #region Windows Form Designer Fields

        private RemObjects.DataAbstract.PoweredByButton poweredByButton;
        #endregion

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.poweredByButton = new RemObjects.DataAbstract.PoweredByButton();
            this.SuspendLayout();
            // 
            // poweredByButton
            // 
            this.poweredByButton.ApplicationType = RemObjects.SDK.ApplicationType.Server;
            this.poweredByButton.Cursor = System.Windows.Forms.Cursors.Hand;
            this.poweredByButton.Location = new System.Drawing.Point(40, 8);
            this.poweredByButton.Name = "poweredByButton";
            this.poweredByButton.Size = new System.Drawing.Size(212, 48);
            this.poweredByButton.TabIndex = 0;
            // 
            // MainForm
            // 
            this.ClientSize = new System.Drawing.Size(292, 69);
            this.Controls.Add(this.poweredByButton);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "MainForm";
            this.Text = "RPRedcoServer 1.0";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.MainForm_FormClosed);
            this.ResumeLayout(false);

        }
        #endregion
        #endregion
    }
}
