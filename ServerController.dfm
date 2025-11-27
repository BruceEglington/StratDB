object IWServerController: TIWServerController
  AppName = 'StratDB'
  Description = 'StratDB database'
  DisplayName = 'StratDB'
  Port = 8091
  URLBase = '/StratDB/'
  Version = '16.1.8'
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
end
