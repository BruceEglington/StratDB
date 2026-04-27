unit IWStrat_addeconomicfeaturelink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddEconomicFeatureLink = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBlcbDeposit: TIWDBLookupComboBox;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbOpen: TIWButton;
    TopBar: TISFTopBarStrat;
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
  ServerController, IWStrat_dm, IWStrat_domaindetails;


procedure TISFAddEconomicFeatureLink.OpenQuery;
begin
  dmStrat.cdsDomainDeposits.Close;
  dmStrat.cdsDomainDeposits.Open;
end;

procedure TISFAddEconomicFeatureLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsDomainDeposits.State in [dsBrowse]));
  iwbEdit.Visible := (UserSession.CanModify);
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainDeposits.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainDeposits.State in [dsEdit,dsInsert]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsDomainDeposits.State in [dsBrowse]));
  iwDBlcbDeposit.Editable := (UserSession.CanModify and (dmStrat.cdsDomainDeposits.State in [dsEdit,dsInsert]));
end;

procedure TISFAddEconomicFeatureLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  //dmStrat.cdsDomainQ.Close;
  //dmStrat.cdsDomainQ.Open;
  dmStrat.cdsDomainDeposits.Close;
  dmStrat.cdsDomainDeposits.Open;
  //dmStrat.cdsDomainDeposits.Edit;
  dmStrat.cdsDeposits.Open;
end;

procedure TISFAddEconomicFeatureLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsDomainDeposits.Post;
    dmStrat.cdsDomainDeposits.ApplyUpdates(0);
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
    dmStrat.cdsDomainDeposits.Close;
    dmStrat.cdsDomainDeposits.Open;
  end;
end;

procedure TISFAddEconomicFeatureLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsDomainDeposits.CancelUpdates;
  end;
end;

procedure TISFAddEconomicFeatureLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsDomainDeposits.Delete;
  dmStrat.cdsDomainDeposits.ApplyUpdates(0);
end;

procedure TISFAddEconomicFeatureLink.iwbEditClick(Sender: TObject);
begin
  if not dmStrat.cdsDomainDeposits.Active then dmStrat.cdsDomainDeposits.Open;
  dmStrat.cdsDomainDeposits.Edit;
end;

procedure TISFAddEconomicFeatureLink.iwbOpenClick(Sender: TObject);
begin
  OpenQuery;
end;

procedure TISFAddEconomicFeatureLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsDeposits.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDomainDetails.Create(WebApplication).Show;
end;

procedure TISFAddEconomicFeatureLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertEconomicfeatureLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
    dmStrat.cdsDomainDeposits.Close;
    dmStrat.cdsDomainDeposits.Open;
    {}
  end
  else begin
    {}
  end;
end;

end.
