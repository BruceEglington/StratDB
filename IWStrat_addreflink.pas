unit IWStrat_addreflink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddRefLink = class(TIWAppForm)
    iwDBeID: TIWDBEdit;
    iwbReturn: TIWButton;
    iwlID: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBlcbLink: TIWDBLookupComboBox;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwDBnLinkInsert(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_details, IWStrat_dmD, IWStrat_constants,
  IWStrat_depositdetails;




procedure TISFAddRefLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  if (UserSession.UnitSender = usDetails) then
  begin
    iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsRefs.State in [dsBrowse]));
    iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsRefs.State in [dsEdit,dsInsert]));
    iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsRefs.State in [dsEdit,dsInsert]));
    iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsRefs.State in [dsBrowse]));
    iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsRefs.State in [dsEdit,dsInsert]));
  end;
  if (UserSession.UnitSender = usDeposits) then
  begin
    iwbEdit.Visible := (UserSession.CanModify and (dmStratD.cdsRefs.State in [dsBrowse]));
    iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStratD.cdsRefs.State in [dsEdit,dsInsert]));
    iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStratD.cdsRefs.State in [dsEdit,dsInsert]));
    iwbDeleteLink.Visible := (UserSession.CanModify and (dmStratD.cdsRefs.State in [dsBrowse]));
    iwDBlcbLink.Editable := (UserSession.CanModify and (dmStratD.cdsRefs.State in [dsEdit,dsInsert]));
  end;
end;

procedure TISFAddRefLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  if (UserSession.UnitSender = usDetails) then
  begin
    iwlID.Caption := 'Unit ID';
    iwDBeID.DataSource := dmStrat.dsRefs;
    iwDBeID.DataField := 'UNITID';
    iwDBlcbLink.DataSource := dmStrat.dsRefs;
    iwDBlcbLink.DataField := 'SOURCENUM';
    iwDBnLink.DataSource := dmStrat.dsRefs;
    iwDBgLink.DataSource := dmStrat.dsRefs;
  end;
  if (UserSession.UnitSender = usDeposits) then
  begin
    iwlID.Caption := 'Deposit ID';
    iwDBeID.DataSource := dmStratD.dsRefs;
    iwDBeID.DataField := 'SDBDEPOSITID';
    iwDBlcbLink.DataSource := dmStratD.dsRefs;
    iwDBlcbLink.DataField := 'SOURCENUM';
    iwDBnLink.DataSource := dmStratD.dsRefs;
    iwDBgLink.DataSource := dmStratD.dsRefs;
  end;
  if (UserSession.UnitSender = usDetails) then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsRefs.Close;
    dmStrat.cdsRefs.Open;
  end;
  if (UserSession.UnitSender = usDeposits) then
  begin
    dmStratD.cdsDepositQuery.Close;
    dmStratD.cdsDepositQuery.Open;
    dmStratD.cdsRefs.Close;
    dmStratD.cdsRefs.Open;
  end;
  dmStrat.qReferences.Close;
  dmStrat.qReferences.ParamByName('FIRSTREFERENCE').AsString := 'A';
  dmStrat.qReferences.ParamByName('LASTREFERENCE').AsString := 'zz';
  dmStrat.cdsReferences.Close;
  dmStrat.cdsReferences.Open;
end;

procedure TISFAddRefLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    if (UserSession.UnitSender = usDetails) then
    begin
      dmStrat.cdsRefs.Post;
      dmStrat.cdsRefs.ApplyUpdates(0);
      dmStrat.cdsUnitQ.Close;
      dmStrat.cdsUnitQ.Open;
      dmStrat.cdsRefs.Close;
      dmStrat.cdsRefs.Open;
    end;
    if (UserSession.UnitSender = usDeposits) then
    begin
      dmStratD.cdsRefs.Post;
      dmStratD.cdsRefs.ApplyUpdates(0);
      dmStratD.cdsDepositQuery.Close;
      dmStratD.cdsDepositQuery.Open;
      dmStratD.cdsRefs.Close;
      dmStratD.cdsRefs.Open;
    end;
  end;
end;

procedure TISFAddRefLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    if (UserSession.UnitSender = usDetails) then
    begin
      dmStrat.cdsRefs.CancelUpdates;
    end;
    if (UserSession.UnitSender = usDeposits) then
    begin
      dmStratD.cdsRefs.CancelUpdates;
    end;
  end;
end;

procedure TISFAddRefLink.iwbDeleteLinkClick(Sender: TObject);
begin
  if (UserSession.UnitSender = usDetails) then
  begin
    dmStrat.cdsRefs.Delete;
    dmStrat.cdsRefs.ApplyUpdates(0);
  end;
  if (UserSession.UnitSender = usDeposits) then
  begin
    dmStratD.cdsRefs.Delete;
    dmStratD.cdsRefs.ApplyUpdates(0);
  end;
end;

procedure TISFAddRefLink.iwbEditClick(Sender: TObject);
begin
  if (UserSession.UnitSender = usDetails) then
  begin
    dmStrat.cdsRefs.Edit;
  end;
  if (UserSession.UnitSender = usDeposits) then
  begin
    dmStratD.cdsRefs.Edit;
  end;
end;

procedure TISFAddRefLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsReferences.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  if (UserSession.UnitSender = usDetails) then
  begin
    TISFDetails.Create(WebApplication).Show;
  end;
  if (UserSession.UnitSender = usDeposits) then
  begin
    TISFDepositDetails.Create(WebApplication).Show;
  end;
end;

procedure TISFAddRefLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  if (UserSession.UnitSender = usDetails) then
  begin
    dmStrat.InsertReferenceLink(WasSuccessful);
    if WasSuccessful then
    begin
      dmStrat.cdsUnitQ.Close;
      dmStrat.cdsUnitQ.Open;
      dmStrat.cdsRefs.Close;
      dmStrat.cdsRefs.Open;
    end
    else begin
    end;
  end;
  if (UserSession.UnitSender = usDeposits) then
  begin
    dmStratD.InsertReferenceLink(WasSuccessful);
    if WasSuccessful then
    begin
      dmStratD.cdsDepositQuery.Close;
      dmStratD.cdsDepositQuery.Open;
      dmStratD.cdsRefs.Close;
      dmStratD.cdsRefs.Open;
    end
    else begin
    end;
  end;
end;

end.


