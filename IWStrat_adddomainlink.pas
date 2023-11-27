unit IWStrat_adddomainlink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddDomainLink = class(TIWAppForm)
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
  ServerController, IWStrat_dm, IWStrat_details, usrIW_dm;




procedure TISFAddDomainLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsStratDomain.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsStratDomain.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsStratDomain.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsStratDomain.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsStratDomain.State in [dsEdit]));
  iwDBlcbInc4Cht.Editable := (UserSession.CanModify and (dmStrat.cdsStratDomain.State in [dsEdit]));
end;

procedure TISFAddDomainLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.qUnitQ.Close;
  dmStrat.qUnitQ.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.qUnitQ.ParamByName('UnitID').AsString := UserSession.ParameterChosen;
  dmStrat.cdsUnitQ.Close;
  dmStrat.cdsUnitQ.Open;
  dmStrat.qStratDomain.Close;
  //dmStrat.qStratDomain.ParamByName('UnitID').AsString := UserSession.ParameterChosen;
  //dmUser.SetDeveloperData(dmStrat.qStratDomain.SQL.Text);
  dmStrat.cdsStratDomain.Close;
  dmStrat.cdsStratDomain.Open;
  //dmUser.SetDeveloperData(dmStrat.qDomains.SQL.Text);
  dmStrat.qDomains.Close;
  dmStrat.qDomains.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsDomains.Close;
  dmStrat.cdsDomains.Open;
  dmStrat.cdsYesNo.Open;
end;

procedure TISFAddDomainLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsStratDomain.Post;
    dmStrat.cdsStratDomain.ApplyUpdates(0);
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsStratDomain.Close;
    dmStrat.cdsStratDomain.Open;
  end;
end;

procedure TISFAddDomainLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsStratDomain.CancelUpdates;
  end;
end;

procedure TISFAddDomainLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsStratDomain.Delete;
  dmStrat.cdsStratDomain.ApplyUpdates(0);
end;

procedure TISFAddDomainLink.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsStratDomain.Edit;
end;

procedure TISFAddDomainLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsDomains.Close;
  dmStrat.cdsYesNo.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetails.Create(WebApplication).Show;
end;

procedure TISFAddDomainLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertDomainLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsStratDomain.Close;
    dmStrat.cdsStratDomain.Open;
    dmStrat.cdsStratDomain.Edit;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

end.
