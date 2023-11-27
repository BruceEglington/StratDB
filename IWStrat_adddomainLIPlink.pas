unit IWStrat_adddomainLIPlink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddDomainLIPLink = class(TIWAppForm)
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
    iwDBlcbInc4Cht: TIWDBLookupComboBox;
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




procedure TISFAddDomainLIPLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsDomainLIP.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainLIP.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainLIP.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsDomainLIP.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsDomainLIP.State in [dsEdit]));
  iwDBlcbInc4Cht.Editable := (UserSession.CanModify and (dmStrat.cdsDomainLIP.State in [dsEdit]));
end;

procedure TISFAddDomainLIPLink.IWAppFormCreate(Sender: TObject);
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
  dmStrat.cdsDomainLIP.Close;
  dmStrat.cdsDomainLIP.Open;
  //dmStrat.cdsDomainLIP.Edit;
  dmStrat.cdsDomains.Open;
  dmStrat.cdsYesNo.Open;
end;

procedure TISFAddDomainLIPLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsDomainLIP.Post;
    dmStrat.cdsDomainLIP.ApplyUpdates(0);
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsDomainLIP.Close;
    dmStrat.cdsDomainLIP.Open;
  end;
end;

procedure TISFAddDomainLIPLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsDomainLIP.CancelUpdates;
  end;
end;

procedure TISFAddDomainLIPLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsDomainLIP.Delete;
  dmStrat.cdsDomainLIP.ApplyUpdates(0);
end;

procedure TISFAddDomainLIPLink.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsDomainLIP.Edit;
end;

procedure TISFAddDomainLIPLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsDomains.Close;
  dmStrat.cdsYesNo.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetails.Create(WebApplication).Show;
end;

procedure TISFAddDomainLIPLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertDomainLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsDomainLIP.Close;
    dmStrat.cdsDomainLIP.Open;
    dmStrat.cdsDomainLIP.Edit;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

end.
