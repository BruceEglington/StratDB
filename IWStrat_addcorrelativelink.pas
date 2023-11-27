unit IWStrat_addcorrelativelink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddCorrelativeLink = class(TIWAppForm)
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
    iwbInsertReverseLink: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwbInsertReverseLinkClick(Sender: TObject);
    procedure iwDBnLinkInsert(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_details;




procedure TISFAddCorrelativeLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsCorrelatives.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsCorrelatives.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsCorrelatives.State in [dsEdit,dsInsert]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsCorrelatives.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsCorrelatives.State in [dsEdit,dsInsert]));
end;

procedure TISFAddCorrelativeLink.IWAppFormCreate(Sender: TObject);
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
  dmStrat.cdsCorrelatives.Close;
  dmStrat.cdsCorrelatives.Open;
  //dmStrat.cdsCorrelatives.Edit;
  dmStrat.cdsUnits.Open;
end;

procedure TISFAddCorrelativeLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsCorrelatives.Post;
    dmStrat.cdsCorrelatives.ApplyUpdates(0);
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsCorrelatives.Close;
    dmStrat.cdsCorrelatives.Open;
  end;
end;

procedure TISFAddCorrelativeLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsCorrelatives.CancelUpdates;
  end;
end;

procedure TISFAddCorrelativeLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsCorrelatives.Delete;
  dmStrat.cdsCorrelatives.ApplyUpdates(0);
end;

procedure TISFAddCorrelativeLink.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsCorrelatives.Edit;
end;

procedure TISFAddCorrelativeLink.iwbInsertReverseLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertReverseCorrelativeLink(WasSuccessful);
  if WasSuccessful then
  begin
    {}
  end
  else begin
    WebApplication.ShowMessage('Not able to insert reverse link record');
  end;
end;

procedure TISFAddCorrelativeLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsUnits.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetails.Create(WebApplication).Show;
end;

procedure TISFAddCorrelativeLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertCorrelativeLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsCorrelatives.Close;
    dmStrat.cdsCorrelatives.Open;
    {}
  end
  else begin
    {}
  end;
end;

end.
