unit IWStrat_addcommoditylink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddCommodityLink = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    TopBar: TISFTopBarStrat;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbOpen: TIWButton;
    IWLabel3: TIWLabel;
    IWDBLabel1: TIWDBLabel;
    IWLabel5: TIWLabel;
    iwDBeGrade: TIWDBEdit;
    IWLabel6: TIWLabel;
    iwDBlcbGradeUnit: TIWDBLookupComboBox;
    iwDBlcbCommodity: TIWDBLookupComboBox;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwDBnLinkInsert(Sender: TObject);
    procedure iwbOpenClick(Sender: TObject);
  public
    procedure OpenQuery;
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dmD, IWStrat_depositdetails;


procedure TISFAddCommodityLink.OpenQuery;
begin
  dmStratD.qTest.Close;
  dmStratD.cdsTest.Close;
  dmStratD.cdsTest.Open;
  //dmStratD.qDeposit.Close;
  //dmStratD.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.RecordChosen;
  //dmStratD.cdsDeposit.Close;
  //dmStratD.cdsDeposit.Open;
  dmStratD.qDepositCommoditiesOnly.Close;
  dmStratD.qDepositCommoditiesOnly.ParamByName('SDBDEPOSITID').AsString := UserSession.RecordChosen;
  dmStratD.cdsDepositCommoditiesOnly.Close;
  dmStratD.cdsDepositCommoditiesOnly.Open;
end;

procedure TISFAddCommodityLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStratD.cdsDepositCommoditiesOnly.State in [dsBrowse]));
  iwbEdit.Visible := (UserSession.CanModify);
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStratD.cdsDepositCommoditiesOnly.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStratD.cdsDepositCommoditiesOnly.State in [dsEdit,dsInsert]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStratD.cdsDepositCommoditiesOnly.State in [dsBrowse]));
  //iwDBlcbCommodity.Editable := true;
  iwDBlcbCommodity.Editable := (UserSession.CanModify and (dmStratD.cdsDepositCommoditiesOnly.State in [dsEdit,dsInsert]));
  iwDBlcbGradeUnit.Editable := (UserSession.CanModify and (dmStratD.cdsDepositCommoditiesOnly.State in [dsEdit,dsInsert]));
  //iwDBeOrder.Editable := (UserSession.CanModify and (dmStratD.cdsDepositCommoditiesOnly.State in [dsEdit]));
  iwDBeGrade.Editable := (UserSession.CanModify and (dmStratD.cdsDepositCommoditiesOnly.State in [dsEdit]));
end;

procedure TISFAddCommodityLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStratD.qTest.Close;
  dmStratD.cdsTest.Close;
  dmStratD.cdsTest.Open;
  dmStratD.qGradeUnits.Close;
  dmStratD.cdsGradeUnits.Close;
  dmStratD.cdsGradeUnits.Open;
  //dmStratD.cdsDeposit.Close;
  //dmStratD.cdsDeposit.Open;
  //dmStratD.qDeposit.Close;
  //dmStratD.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.RecordChosen;
  //dmStratD.cdsDeposit.Close;
  dmStratD.qDepositCommoditiesOnly.Close;
  dmStratD.qDepositCommoditiesOnly.ParamByName('SDBDEPOSITID').AsString := UserSession.RecordChosen;
  dmStratD.cdsDepositCommoditiesOnly.Close;
  //dmStratD.cdsDeposit.Open;
  dmStratD.cdsDepositCommoditiesOnly.Open;
end;

procedure TISFAddCommodityLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStratD.cdsDepositCommoditiesOnly.Post;
    dmStratD.cdsDepositCommoditiesOnly.ApplyUpdates(0);
    //dmStratD.cdsDeposit.Post;
    //dmStratD.cdsDeposit.ApplyUpdates(0);
    //dmStratD.cdsDeposit.Close;
    //dmStratD.cdsDeposit.Open;
    dmStratD.cdsDepositCommoditiesOnly.Close;
    dmStratD.cdsDepositCommoditiesOnly.Open;
  end;
end;

procedure TISFAddCommodityLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStratD.cdsDepositCommoditiesOnly.CancelUpdates;
  end;
end;

procedure TISFAddCommodityLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStratD.cdsDepositCommoditiesOnly.Delete;
  dmStratD.cdsDepositCommoditiesOnly.ApplyUpdates(0);
end;

procedure TISFAddCommodityLink.iwbEditClick(Sender: TObject);
begin
  //if not dmStratD.cdsDepositCommoditiesOnly.Active then dmStratD.cdsDepositCommoditiesOnly.Open;
  dmStratD.cdsDepositCommoditiesOnly.Edit;
end;

procedure TISFAddCommodityLink.iwbOpenClick(Sender: TObject);
begin
  OpenQuery;
  //iwDBlcbCommodity.Editable := true;
end;

procedure TISFAddCommodityLink.iwbReturnClick(Sender: TObject);
begin
  //dmStratD.cdsDeposits.Close;
  dmStratD.cdsDepositCommoditiesOnly.Close;
  dmStratD.cdsGradeUnits.Close;
  dmStratD.cdsTest.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDepositDetails.Create(WebApplication).Show;
end;

procedure TISFAddCommodityLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStratD.InsertDepositCommodityLink(WasSuccessful);
  if WasSuccessful then
  begin
    //dmStratD.cdsDeposit.Close;
    //dmStratD.cdsDeposit.Open;
    dmStratD.cdsDepositCommoditiesOnly.Close;
    dmStratD.cdsDepositCommoditiesOnly.Open;
    {}
  end
  else begin
    {}
  end;
end;

end.
