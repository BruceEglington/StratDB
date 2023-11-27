unit IWStrat_addsucceedinglink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddSucceedingLink = class(TIWAppForm)
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
    iwDBlcbRelationship: TIWDBLookupComboBox;
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




procedure TISFAddSucceedingLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsSucceeding.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsSucceeding.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsSucceeding.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsSucceeding.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsSucceeding.State in [dsEdit]));
  iwDBlcbRelationship.Editable := (UserSession.CanModify and (dmStrat.cdsSucceeding.State in [dsEdit]));
end;

procedure TISFAddSucceedingLink.IWAppFormCreate(Sender: TObject);
var
  tmpUser : string;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.cdsUnitQ.Close;
  tmpUser := UserSession.UserID;
  dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dmStrat.qUnitQ.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qParent.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSubUnits.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSucceeding.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qPreceeding.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSynonyms.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qCorrelatives.ParamByName('USERID').AsString := tmpUser;
  dmStrat.cdsUnitQ.Open;
  dmStrat.cdsSucceeding.Close;
  dmStrat.cdsSucceeding.Open;
  //dmStrat.cdsSucceeding.Edit;
  //dmStrat.ConstructUnitAreaQuery;
  dmStrat.cdsUnits.Open;
  dmStrat.qStratRel.Close;
  dmStrat.qStratRel.ParamByName('RelPosID').AsString := 'S';
  dmStrat.cdsStratRel.Close;
  dmStrat.cdsStratRel.Open;
end;

procedure TISFAddSucceedingLink.iwbApplyUpdatesClick(Sender: TObject);
var
  tmpUser : string;
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsSucceeding.Post;
    dmStrat.cdsSucceeding.ApplyUpdates(0);
    dmStrat.cdsUnitQ.Close;
    tmpUser := UserSession.UserID;
    dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
    dmStrat.qUnitQ.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qParent.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qSubUnits.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qSucceeding.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qPreceeding.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qSynonyms.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qCorrelatives.ParamByName('USERID').AsString := tmpUser;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsSucceeding.Close;
    dmStrat.cdsSucceeding.Open;
  end;
end;

procedure TISFAddSucceedingLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsSucceeding.CancelUpdates;
  end;
end;

procedure TISFAddSucceedingLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsSucceeding.Delete;
  dmStrat.cdsSucceeding.ApplyUpdates(0);
end;

procedure TISFAddSucceedingLink.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsSucceeding.Edit;
end;

procedure TISFAddSucceedingLink.iwbInsertReverseLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertReverseSucceedingLink(WasSuccessful);
  if WasSuccessful then
  begin
    {}
  end
  else begin
    WebApplication.ShowMessage('Not able to insert reverse link record');
  end;
end;

procedure TISFAddSucceedingLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsUnits.Close;
  dmStrat.cdsStratRel.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetails.Create(WebApplication).Show;
end;

end.
