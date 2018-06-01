namespace RPSuiteServer
{
    partial class Engine
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.connectionManager = new RemObjects.DataAbstract.Server.ConnectionManager();
            this.message = new RemObjects.SDK.BinMessage();
            this.sessionManager = new RemObjects.SDK.Server.MemorySessionManager();
            this.serverChannel = new RemObjects.SDK.Server.IpHttpServerChannel();
            ((System.ComponentModel.ISupportInitialize)(this.serverChannel)).BeginInit();
            // 
            // message
            // 
            this.message.ContentType = "application/octet-stream";
            this.message.SerializerInstance = null;
            // 
            // sessionManager
            // 
            this.sessionManager.Timeout = 1800;
            // 
            // serverChannel
            // 
            this.serverChannel.Dispatchers.Add(new RemObjects.SDK.Server.MessageDispatcher("bin", this.message));
            // 
            // 
            // 
            this.serverChannel.HttpServer.Port = 9201;
            this.serverChannel.HttpServer.ServerName = "Remoting SDK for .NET HTTP Server";
            this.serverChannel.Port = 9201;
            this.serverChannel.SendClientAccessPolicyXml = RemObjects.SDK.Server.ClientAccessPolicyType.AllowNone;
            this.serverChannel.SendCrossOriginHeader = false;
            this.serverChannel.SslOptions.Certificate = null;
            this.serverChannel.SslOptions.TargetHostName = null;
            ((System.ComponentModel.ISupportInitialize)(this.serverChannel)).EndInit();

        }

        #endregion
        
        private RemObjects.DataAbstract.Server.ConnectionManager connectionManager;
        private RemObjects.SDK.BinMessage message;
        private RemObjects.SDK.Server.MemorySessionManager sessionManager;
        private RemObjects.SDK.Server.IpHttpServerChannel serverChannel;
    }
}
