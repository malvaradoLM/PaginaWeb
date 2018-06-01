using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace RPSuiteServer
{
    public partial class Engine : Component
    {
        #region Constructors
        public Engine()
        {
            this.InitializeComponent();

            if  (!RemObjects.DataAbstract.Server.Configuration.Loaded)
                RemObjects.DataAbstract.Server.Configuration.Load();
            this.connectionManager.Load();
        }

        public Engine(IContainer container)
            : this()
        {
            if  (container != null)
                container.Add(this);
        }
        #endregion

        private static readonly Lazy<Engine> lazy = new Lazy<Engine>(() => new Engine());
        public static Engine Instance { get { return lazy.Value; } }

        #region Server Start/Stop
        public void Start()
        {
            this.serverChannel.Active = true;
        }

        public void Stop()
        {
            this.serverChannel.Active = false;
        }
        #endregion

        #region Properties
        public Boolean Active
        {
            get
            {
                return this.serverChannel.Active;
            }
        }

        public RemObjects.DataAbstract.Server.IAbstractConnection NewConnecion()
        {
            return connectionManager.AcquireConnection();
        }

        public RemObjects.SDK.Server.MemorySessionManager SessionManager
        {
            get
            {
                return this.sessionManager;
            }
        }
        #endregion
    }
}
