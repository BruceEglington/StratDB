unit IWStrat_addsynonymlink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddSynonymLink = class(TIWAppForm)
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
    IWLabel3: TIWLabel;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwbInsertReverseLinkClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_details;




procedure TISFAddSynonymLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsSynonyms.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsSynonyms.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsSynonyms.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsSynonyms.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsSynonyms.State in [dsEdit]));
end;

procedure TISFAddSynonymLink.IWAppFormCreate(Sender: TObject);
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
  dmStrat.cdsSynonyms.Close;
  dmStrat.cdsSynonyms.Open;
  //dmStrat.cdsSynonyms.Edit;
  dmStrat.cdsUnits.Open;
end;

procedure TISFAddSynonymLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsSynonyms.Post;
    dmStrat.cdsSynonyms.ApplyUpdates(0);
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsSynonyms.Close;
    dmStrat.cdsSynonyms.Open;
  end;
end;

procedure TISFAddSynonymLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsSynonyms.CancelUpdates;
  end;
end;

procedure TISFAddSynonymLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsSynonyms.Delete;
  dmStrat.cdsSynonyms.ApplyUpdates(0);
end;

procedure TISFAddSynonymLink.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsSynonyms.Edit;
end;

procedure TISFAddSynonymLink.iwbInsertReverseLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertReverseSynonymLink(WasSuccessful);
  if WasSuccessful then
  begin
    {}
  end
  else begin
    WebApplication.ShowMessage('Not able to insert reverse link record');
  end;
end;

procedure TISFAddSynonymLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsUnits.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetails.Create(WebApplication).Show;
end;

end.
