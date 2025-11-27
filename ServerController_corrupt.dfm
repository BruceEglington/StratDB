object IWServerController: TIWServerController
  AppName = 'StratDB'
  ComInitialization = ciMultiThreaded
  Compression.Enabled = False
  Compression.Level = 6
  Description = 'StratDB Database'
  DisplayName = 'StratDB Database'
  Port = 8091
  SSLOptions.SSLVersion = SSLv3
  Version = '16.1.6'
  ExceptionLogger.Enabled = True
  SessionOptions.SessionTimeout = 30
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  OnBrowserCheck = IWServerControllerBaseBrowserCheck
  Height = 400
  Width = 500
  ClientHeight = 400
  ClientWidth = 500
end
