unit IWStrat_addLIPDomainlink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddLIPDomainLink = class(TIWAppForm)
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
  ServerController, IWStrat_dmLIP, IWStrat_LIPdetails, IWStrat_dm;




procedure TISFAddLIPDomainLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmLIP.cdsDomainLIP.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsDomainLIP.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsDomainLIP.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmLIP.cdsDomainLIP.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmLIP.cdsDomainLIP.State in [dsEdit]));
  iwDBlcbInc4Cht.Editable := (UserSession.CanModify and (dmLIP.cdsDomainLIP.State in [dsEdit]));
end;

procedure TISFAddLIPDomainLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmLIP.qYesNo.Close;
  dmLIP.cdsYesNo.Close;
  dmLIP.cdsYesNo.Open;
  dmStrat.qDomains.Close;
  dmStrat.qDomains.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsDomains.Close;
  dmStrat.cdsDomains.Open;
  dmLIP.cdsLIPQ.Close;
  dmLIP.cdsLIPQ.Open;
  dmLIP.cdsDomainLIP.Close;
  dmLIP.cdsDomainLIP.Open;
  //dmLIP.cdsDomainLIP.Edit;
end;

procedure TISFAddLIPDomainLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmLIP.cdsDomainLIP.Post;
    dmLIP.cdsDomainLIP.ApplyUpdates(0);
    dmLIP.cdsLIPQ.Close;
    dmLIP.cdsLIPQ.Open;
    dmLIP.cdsDomainLIP.Close;
    dmLIP.cdsDomainLIP.Open;
  end;
end;

procedure TISFAddLIPDomainLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmLIP.cdsDomainLIP.CancelUpdates;
  end;
end;

procedure TISFAddLIPDomainLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmLIP.cdsDomainLIP.Delete;
  dmLIP.cdsDomainLIP.ApplyUpdates(0);
end;

procedure TISFAddLIPDomainLink.iwbEditClick(Sender: TObject);
begin
  dmLIP.cdsDomainLIP.Edit;
end;

procedure TISFAddLIPDomainLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsDomains.Close;
  dmLIP.cdsYesNo.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLIPDetails.Create(WebApplication).Show;
end;

procedure TISFAddLIPDomainLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmLIP.InsertLIPDomainLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmLIP.cdsDomainLIP.Close;
    dmLIP.cdsDomainLIP.Open;
    dmLIP.cdsDomainLIP.Edit;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

end.
