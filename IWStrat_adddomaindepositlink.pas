unit IWStrat_adddomaindepositlink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddDomainDepositLink = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBlcbDomain: TIWDBLookupComboBox;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    IWDBEdit2: TIWDBEdit;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
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
  ServerController, IWStrat_dmD, IWStrat_depositdetails;


procedure TISFAddDomainDepositLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStratD.cdsDepositDomains.State in [dsBrowse]));
  iwbEdit.Visible := (UserSession.CanModify);
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStratD.cdsDepositDomains.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStratD.cdsDepositDomains.State in [dsEdit,dsInsert]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStratD.cdsDepositDomains.State in [dsBrowse]));
  iwDBlcbDomain.Editable := (UserSession.CanModify and (dmStratD.cdsDepositDomains.State in [dsEdit,dsInsert]));
end;

procedure TISFAddDomainDepositLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStratD.cdsDeposit.Close;
  dmStratD.cdsDeposit.Open;
  dmStratD.cdsDepositDomains.Close;
  dmStratD.cdsDepositDomains.Open;
  dmStratD.qDomains.Close;
  dmStratD.qDomains.ParamByName('CONTINENTID').AsString := dmStratD.cdsDepositCONTINENTID.AsString;
  dmStratD.cdsDomains.Close;
  dmStratD.cdsDomains.Open;
end;

procedure TISFAddDomainDepositLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStratD.cdsDepositDomains.Post;
    dmStratD.cdsDepositDomains.ApplyUpdates(0);
    dmStratD.cdsDeposit.Close;
    dmStratD.cdsDeposit.Open;
    dmStratD.cdsDepositDomains.Close;
    dmStratD.cdsDepositDomains.Open;
  end;
end;

procedure TISFAddDomainDepositLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStratD.cdsDepositDomains.CancelUpdates;
  end;
end;

procedure TISFAddDomainDepositLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStratD.cdsDepositDomains.Delete;
  dmStratD.cdsDepositDomains.ApplyUpdates(0);
end;

procedure TISFAddDomainDepositLink.iwbEditClick(Sender: TObject);
begin
  if not dmStratD.cdsDepositDomains.Active then dmStratD.cdsDepositDomains.Open;
  dmStratD.cdsDepositDomains.Edit;
end;

procedure TISFAddDomainDepositLink.iwbReturnClick(Sender: TObject);
begin
  dmStratD.cdsDomains.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDepositDetails.Create(WebApplication).Show;
end;

procedure TISFAddDomainDepositLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStratD.InsertDomainDepositLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmStratD.cdsDeposit.Close;
    dmStratD.cdsDeposit.Open;
    dmStratD.cdsDepositDomains.Close;
    dmStratD.cdsDepositDomains.Open;
    {}
  end
  else begin
    {}
    WebApplication.ShowMessage('Not able to insert new record');
  end;
end;

end.
