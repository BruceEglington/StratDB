unit IWStrat_addgislink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddGISLink = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBlcbLink: TIWDBLookupComboBox;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    IWLabel3: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel4: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWMemo1: TIWMemo;
    IWLabel5: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    IWLabel6: TIWLabel;
    IWDBLookupComboBox1: TIWDBLookupComboBox;
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
  ServerController, IWStrat_dm, IWStrat_details;




procedure TISFAddGISLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsStratMaps.State in [dsBrowse]));
  iwbReturn.Visible := (dmStrat.cdsStratMaps.State in [dsBrowse]);
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsStratMaps.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsStratMaps.State in [dsEdit,dsInsert]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsStratMaps.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsStratMaps.State in [dsEdit,dsInsert]));
end;

procedure TISFAddGISLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.cdsUnitQ.Close;
  dmStrat.cdsUnitQ.Open;
  dmStrat.cdsStratMaps.Close;
  dmStrat.cdsStratMaps.Open;
  //dmStrat.cdsStratMaps.Edit;
  dmStrat.cdsMaps.Open;
  dmStrat.cdsYesNo.Open;
end;

procedure TISFAddGISLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsStratMaps.Post;
    dmStrat.cdsStratMaps.ApplyUpdates(0);
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsStratMaps.Close;
    dmStrat.cdsStratMaps.Open;
  end;
end;

procedure TISFAddGISLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsStratMaps.CancelUpdates;
  end;
end;

procedure TISFAddGISLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsStratMaps.Delete;
  dmStrat.cdsStratMaps.ApplyUpdates(0);
end;

procedure TISFAddGISLink.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsStratMaps.Edit;
end;

procedure TISFAddGISLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsMaps.Close;
  dmStrat.cdsYesNo.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetails.Create(WebApplication).Show;
end;

procedure TISFAddGISLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertGISLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsStratMaps.Close;
    dmStrat.cdsStratMaps.Open;
    {}
  end
  else begin
    {}
  end;
end;

end.
