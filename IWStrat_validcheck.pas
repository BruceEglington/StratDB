unit IWStrat_validcheck;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar;

type
  TISFValidCheck = class(TIWAppForm)
    iwDBeID: TIWDBEdit;
    iwDBeStatus: TIWDBEdit;
    iwDBeDoneBy: TIWDBEdit;
    iwDBeDateDone: TIWDBEdit;
    iwDBmComments: TIWDBMemo;
    iwbSaveReturn: TIWButton;
    iwlID: TIWLabel;
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
  ServerController, IWStrat_dm, IWStrat_details, IWStrat_constants, IWStrat_dmD,
  IWStrat_depositdetails, usrIW_dm;




procedure TISFValidCheck.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  if ((UserSession.UnitSender = usDetails) or (UserSession.UnitSender = usDetailsEdit)) then
  begin
    dmStrat.cdsValidFull.Edit;
  end;
  if ((UserSession.UnitSender = usDeposits)) then
  begin
    dmStratD.cdsValidFull.Edit;
  end;
end;

procedure TISFValidCheck.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  iwbClearObjection.Visible := UserSession.CanValidate;
  if ((UserSession.UnitSender = usDetails) or (UserSession.UnitSender = usDetailsEdit)) then
  begin
    iwlID.Caption := 'Unit ID';
    iwDBeID.DataSource := dmStrat.dsValidFull;
    iwDBeID.DataField := 'UNITID';
    iwDBeStatus.DataSource := dmStrat.dsValidFull;
    iwDBeStatus.DataField := 'VALIDSTATUSID';
    iwDBeDoneBy.DataSource := dmStrat.dsValidFull;
    iwDBeDoneBy.DataField := 'DONEBY';
    iwDBeDateDone.DataSource := dmStrat.dsValidFull;
    iwDBeDateDone.DataField := 'DATEDONE';
    iwDBmComments.DataSource := dmStrat.dsValidFull;
    iwDBmComments.DataField := 'COMMENTS';
  end;
  if ((UserSession.UnitSender = usDeposits)) then
  begin
    iwlID.Caption := 'Deposit ID';
    iwDBeID.DataSource := dmStratD.dsValidFull;
    iwDBeID.DataField := 'SDBDEPOSITID';
    iwDBeStatus.DataSource := dmStratD.dsValidFull;
    iwDBeStatus.DataField := 'VALIDSTATUSID';
    iwDBeDoneBy.DataSource := dmStratD.dsValidFull;
    iwDBeDoneBy.DataField := 'DONEBY';
    iwDBeDateDone.DataSource := dmStratD.dsValidFull;
    iwDBeDateDone.DataField := 'DATEDONE';
    iwDBmComments.DataSource := dmStratD.dsValidFull;
    iwDBmComments.DataField := 'COMMENTS';
  end;
end;

procedure TISFValidCheck.iwbReturnClick(Sender: TObject);
begin
  if(Sender = iwbSaveReturn) then
  begin
    if ((UserSession.UnitSender = usDetails) or (UserSession.UnitSender = usDetailsEdit)) then
    begin
      dmStrat.cdsValidFull.Post;
      dmStrat.cdsValidFull.ApplyUpdates(0);
    end;
    if ((UserSession.UnitSender = usDeposits)) then
    begin
      dmStratD.cdsValidFull.Post;
      dmStratD.cdsValidFull.ApplyUpdates(0);
    end;
  end;
  if(Sender = iwbCancelReturn) then
  begin
    if ((UserSession.UnitSender = usDetails) or (UserSession.UnitSender = usDetailsEdit)) then
    begin
      dmStrat.cdsValidFull.Cancel;
      dmStrat.cdsValidFull.CancelUpdates;
    end;
    if ((UserSession.UnitSender = usDeposits)) then
    begin
      dmStratD.cdsValidFull.Cancel;
      dmStratD.cdsValidFull.CancelUpdates;
    end;
  end;
  if ((UserSession.UnitSender = usDetails) or (UserSession.UnitSender = usDetailsEdit)) then
  begin
    dmStrat.cdsValidFull.Filtered := false;
    dmStrat.cdsValidFull.Close;
  end;
  if ((UserSession.UnitSender = usDeposits)) then
  begin
    dmStratD.cdsValidFull.Filtered := false;
    dmStratD.cdsValidFull.Close;
  end;
  TIWAppForm(WebApplication.ActiveForm).Release;
  if ((UserSession.UnitSender = usDetails) or (UserSession.UnitSender = usDetailsEdit)) then
  begin
    TISFDetails.Create(WebApplication).Show;
  end;
  if ((UserSession.UnitSender = usDeposits)) then
  begin
    TISFDepositDetails.Create(WebApplication).Show;
  end;
end;

procedure TISFValidCheck.iwbClearObjectionClick(Sender: TObject);
var
  HasValidityRecord : boolean;
  tmpStr : string;
begin
  HasValidityRecord := false;
  if ((UserSession.UnitSender = usDetails) or (UserSession.UnitSender = usDetailsEdit)) then
  begin
    dmStrat.cdsValidFull.Filter := 'ValidStatusID='+''''+'Chckd'+'''';
    dmStrat.cdsValidFull.Filtered := true;
    tmpStr := '';
    if (dmStrat.cdsValidFull.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      tmpStr := dmStrat.cdsValidFullCOMMENTS.AsString;
      dmStrat.cdsValidFull.Delete;
    end;
    dmStrat.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStrat.cdsValidFull.Filtered := true;
    if (dmStrat.cdsValidFull.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      dmStrat.cdsValidFull.Edit;
      dmStrat.cdsValidFullVALIDSTATUSID.AsString := 'Chckd';
      {
      dmStrat.cdsValidFullDONEBY.AsString := UserSession.UserID;
      }
      dmStrat.cdsValidFullDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmStrat.cdsValidFullCOMMENTS.AsString := dmStrat.cdsValidFullCOMMENTS.AsString + chr(10) + chr(13) + tmpStr;
      dmStrat.cdsValidFull.Post;
    end;
    if (not HasValidityRecord) then
    begin
      dmStrat.cdsValidFull.Append;
      dmStrat.cdsValidFullUNITID.AsString := dmStrat.cdsUnitQUNITID.AsString;
      dmStrat.cdsValidFullVALIDSTATUSID.AsString := 'Chckd';
      dmStrat.cdsValidFullDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmStrat.cdsValidFullCOMMENTS.AsString := '';
      dmStrat.cdsValidFullDONEBY.AsString := UserSession.UserID;
      dmStrat.cdsValidFull.Post;
    end;
    try
      dmStrat.cdsValidFull.ApplyUpdates(0);
    except
      WebApplication.ShowMessage('Not able to update validation status');
    end;
    dmStrat.cdsValidFull.Filtered := false;
    dmStrat.cdsValidFull.Close;
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDetails.Create(WebApplication).Show;
  end;

  if ((UserSession.UnitSender = usDeposits)) then
  begin
    dmStratD.cdsValidFull.Filter := 'ValidStatusID='+''''+'Chckd'+'''';
    dmStratD.cdsValidFull.Filtered := true;
    tmpStr := '';
    if (dmStratD.cdsValidFull.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      tmpStr := dmStratD.cdsValidFullCOMMENTS.AsString;
      dmStratD.cdsValidFull.Delete;
    end;
    dmStratD.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStratD.cdsValidFull.Filtered := true;
    if (dmStratD.cdsValidFull.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      dmStratD.cdsValidFull.Edit;
      dmStratD.cdsValidFullVALIDSTATUSID.AsString := 'Chckd';
      {
      dmStratD.cdsValidFullDONEBY.AsString := UserSession.UserID;
      }
      dmStratD.cdsValidFullDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmStratD.cdsValidFullCOMMENTS.AsString := dmStratD.cdsValidFullCOMMENTS.AsString + chr(10) + chr(13) + tmpStr;
      dmStratD.cdsValidFull.Post;
    end;
    if (not HasValidityRecord) then
    begin
      dmStratD.cdsValidFull.Append;
      dmStratD.cdsValidFullSDBDEPOSITID.AsString := dmStratD.cdsDepositsSDBDEPOSITID.AsString;
      dmStratD.cdsValidFullVALIDSTATUSID.AsString := 'Chckd';
      dmStratD.cdsValidFullDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmStratD.cdsValidFullCOMMENTS.AsString := '';
      dmStratD.cdsValidFullDONEBY.AsString := UserSession.UserID;
      dmStratD.cdsValidFull.Post;
    end;
    try
      dmStratD.cdsValidFull.ApplyUpdates(0);
    except
      WebApplication.ShowMessage('Not able to update validation status');
    end;
    dmStratD.cdsValidFull.Filtered := false;
    dmStratD.cdsValidFull.Close;
    dmStratD.cdsDeposit.Close;
    dmStratD.cdsDeposit.Open;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDepositDetails.Create(WebApplication).Show;
  end;
end;

end.
