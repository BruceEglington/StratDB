object IWServerController: TIWServerController
  OnCreate = IWServerControllerBaseCreate
  AppName = 'MyApp'
  Compression.Enabled = False
  Compression.Level = 6
  Description = 'My IntraWeb Application'
  DisplayName = 'IntraWeb (VCL for the Web) Application'
  Port = 8091
  SSLOptions.SSLVersion = SSLv3
  Version = '16.1.8'
  Height = 310
  Width = 342
end
