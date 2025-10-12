object IWServerController: TIWServerController
  AppName = 'StratDB'
  ComInitialization = ciMultiThreaded
  Compression.Enabled = False
  Compression.Level = 6
  Description = 'StratDB Database'
  DisplayName = 'StratDB Database'
  Port = 8091
  SSLOptions.SSLVersion = SSLv3
  Version = '16.0.11'
  ExceptionLogger.Enabled = True
  SessionOptions.SessionTimeout = 30
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  OnBrowserCheck = IWServerControllerBaseBrowserCheck
  Height = 310
  Width = 342
end
