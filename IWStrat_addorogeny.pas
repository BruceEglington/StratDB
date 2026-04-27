unit IWStrat_addorogeny;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddOrogeny = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBnOrogenies: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    IWDBEdit2: TIWDBEdit;
    IWLabel3: TIWLabel;
    iwDBlcbContinent: TIWDBLookupComboBox;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwDBnOrogeniesInsert(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_details, usrIW_dm, IWStrat_orogenies;




procedure TISFAddOrogeny.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsOrogenies.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsOrogenies.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsOrogenies.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanDelete and (dmStrat.cdsOrogenies.State in [dsBrowse]));
  iwDBlcbContinent.Editable := (UserSession.CanModify and (dmStrat.cdsOrogenies.State in [dsEdit]));
end;

procedure TISFAddOrogeny.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.qOrogenies.Close;
  //dmStrat.qOrogenies.ParamByName('ContinentID').AsString := UserSession.ContinentValues;
  dmStrat.cdsOrogenies.Close;
  dmStrat.cdsOrogenies.Open;
  dmStrat.cdsOrogenies.Filter := 'Orogeny = '+''''+UserSession.ParameterChosen+'''';
  dmStrat.cdsOrogenies.Filtered := true;
  //dmUser.SetDeveloperData(dmStrat.qDomains.SQL.Text);
  dmStrat.qContinents.Close;
  dmStrat.cdsContinents.Close;
  dmStrat.cdsContinents.Open;
end;

procedure TISFAddOrogeny.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsOrogenies.Post;
    dmStrat.cdsOrogenies.ApplyUpdates(0);
    dmStrat.cdsOrogenies.Close;
    dmStrat.cdsOrogenies.Open;
    dmStrat.cdsOrogenies.Close;
    dmStrat.cdsOrogenies.Open;
    dmStrat.cdsOrogenies.Filtered := false;
  end;
end;

procedure TISFAddOrogeny.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsOrogenies.CancelUpdates;
  end;
end;

procedure TISFAddOrogeny.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsOrogenies.Delete;
  dmStrat.cdsOrogenies.ApplyUpdates(0);
end;

procedure TISFAddOrogeny.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsOrogenies.Edit;
end;

procedure TISFAddOrogeny.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsOrogenies.Close;
  dmStrat.cdsContinents.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFOrogenies.Create(WebApplication).Show;
end;

procedure TISFAddOrogeny.iwDBnOrogeniesInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertOrogeny(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsOrogenies.Close;
    dmStrat.cdsOrogenies.Open;
    dmStrat.cdsOrogenies.Edit;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new orogeny');
  end;
end;

end.
