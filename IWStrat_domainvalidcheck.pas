unit IWStrat_domainvalidcheck;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar;

type
  TISFDomainValidCheck = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    IWDBEdit5: TIWDBEdit;
    IWDBMemo1: TIWDBMemo;
    iwbSaveReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    iwbCancelReturn: TIWButton;
    rectLeft: TIWRectangle;
    iwbClearObjection: TIWButton;
    IWLabel6: TIWLabel;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbClearObjectionClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_domaindetails, usrIW_dm;




procedure TISFDomainValidCheck.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.cdsDomainValidFull.Edit;
end;

procedure TISFDomainValidCheck.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  iwbClearObjection.Visible := UserSession.CanValidate;
end;

procedure TISFDomainValidCheck.iwbReturnClick(Sender: TObject);
begin
  if(Sender = iwbSaveReturn) then
  begin
    dmStrat.cdsDomainValidFull.Post;
    dmStrat.cdsDomainValidFull.ApplyUpdates(0);
  end;
  if(Sender = iwbCancelReturn) then
  begin
    dmStrat.cdsDomainValidFull.Cancel;
    dmStrat.cdsDomainValidFull.CancelUpdates;
  end;
  dmStrat.cdsDomainValidFull.Filtered := false;
  dmStrat.cdsDomainValidFull.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDomainDetails.Create(WebApplication).Show;
end;

procedure TISFDomainValidCheck.iwbClearObjectionClick(Sender: TObject);
var
  HasValidityRecord : boolean;
  tmpStr : string;
begin
  HasValidityRecord := false;
  dmStrat.cdsDomainValidFull.Filter := 'ValidStatusID='+''''+'Chckd'+'''';
  dmStrat.cdsDomainValidFull.Filtered := true;
  tmpStr := '';
  if (dmStrat.cdsDomainValidFull.RecordCount = 1) then
  begin
    HasValidityRecord := true;
    tmpStr := dmStrat.cdsDomainValidFullCOMMENTS.AsString;
    dmStrat.cdsDomainValidFull.Delete;
  end;
  dmStrat.cdsDomainValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
  dmStrat.cdsDomainValidFull.Filtered := true;
  if (dmStrat.cdsDomainValidFull.RecordCount = 1) then
  begin
    HasValidityRecord := true;
    dmStrat.cdsDomainValidFull.Edit;
    dmStrat.cdsDomainValidFullVALIDSTATUSID.AsString := 'Chckd';
    {
    dmStrat.cdsDomainValidFullDONEBY.AsString := UserSession.UserID;
    }
    dmStrat.cdsDomainValidFullDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmStrat.cdsDomainValidFullCOMMENTS.AsString := dmStrat.cdsDomainValidFullCOMMENTS.AsString + chr(10) + chr(13) + tmpStr;
    dmStrat.cdsDomainValidFull.Post;
  end;
  if (not HasValidityRecord) then
  begin
    dmStrat.cdsDomainValidFull.Append;
    dmStrat.cdsDomainValidFullDOMAINID.AsString := dmStrat.cdsDomainQDOMAINID.AsString;
    dmStrat.cdsDomainValidFullVALIDSTATUSID.AsString := 'Chckd';
    dmStrat.cdsDomainValidFullDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmStrat.cdsDomainValidFullDONEBY.AsString := UserSession.UserID;
    dmStrat.cdsDomainValidFull.Post;
  end;
  try
    dmStrat.cdsDomainValidFull.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update validation status');
  end;
  dmStrat.cdsDomainValidFull.Filtered := false;
  dmStrat.cdsDomainValidFull.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDomainDetails.Create(WebApplication).Show;
end;

end.
