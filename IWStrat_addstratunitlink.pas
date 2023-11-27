unit IWStrat_addstratunitlink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddStratUnitLink = class(TIWAppForm)
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
    IWButton1: TIWButton;
    IWLabel3: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure IWButton1Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_domaindetails;




procedure TISFAddStratUnitLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsDomainUnits.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainUnits.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainUnits.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsDomainUnits.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsDomainUnits.State in [dsEdit]));
end;

procedure TISFAddStratUnitLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
//  dmStrat.cdsDomainQ.Close;
//  dmStrat.cdsDomainQ.Open;
  dmStrat.cdsDomainUnits.Close;
  dmStrat.cdsDomainUnits.Open;
  //dmStrat.cdsDomainUnits.Edit;
  dmStrat.cdsUnits.Open;
  iwButton1.Visible := UserSession.IsDeveloper;
end;

procedure TISFAddStratUnitLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsDomainUnits.Post;
    dmStrat.cdsDomainUnits.ApplyUpdates(0);
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
    dmStrat.cdsDomainUnits.Close;
    dmStrat.cdsDomainUnits.Open;
  end;
end;

procedure TISFAddStratUnitLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsDomainUnits.CancelUpdates;
  end;
end;

procedure TISFAddStratUnitLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsDomainUnits.Delete;
  dmStrat.cdsDomainUnits.ApplyUpdates(0);
end;

procedure TISFAddStratUnitLink.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsDomainUnits.Edit;
end;

procedure TISFAddStratUnitLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsDomains.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDomainDetails.Create(WebApplication).Show;
end;

procedure TISFAddStratUnitLink.IWButton1Click(Sender: TObject);
begin
  dmStrat.cdsDomainUnits.Open;
end;

end.
