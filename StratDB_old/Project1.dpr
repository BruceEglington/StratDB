program Project1;

uses
  FastMM4,
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  IWStart,
  Unit1 in 'C:\Users\bre255\Documents\Embarcadero\Studio\Projects\Project1\Unit1.pas' {IWForm1: TIWAppForm},
  ServerController in 'C:\Users\bre255\Documents\Embarcadero\Studio\Projects\Project1\ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'C:\Users\bre255\Documents\Embarcadero\Studio\Projects\Project1\UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
