object IWServerController: TIWServerController
  OldCreateOrder = False
  AppName = 'StratDB'
  ComInitialization = ciMultiThreaded
  Compression.Enabled = False
  Compression.Level = 6
  Description = 'StratDB Database'
  DisplayName = 'StratDB Database'
  Port = 8091
  SSLOptions.SSLVersion = SSLv3
  Version = '15.2.23'
  ExceptionLogger.Enabled = True
  SessionOptions.SessionTimeout = 30
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  Height = 310
  Width = 342
end
