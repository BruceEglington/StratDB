unit IWStrat_addprecedinglink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddPrecedingLink = class(TIWAppForm)
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
  ServerController, IWStrat_dm, IWStrat_details, usrIW_dm;




procedure TISFAddPrecedingLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsPreceeding.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsPreceeding.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsPreceeding.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsPreceeding.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsPreceeding.State in [dsEdit]));
  iwDBlcbRelationship.Editable := (UserSession.CanModify and (dmStrat.cdsPreceeding.State in [dsEdit]));
end;

procedure TISFAddPrecedingLink.IWAppFormCreate(Sender: TObject);
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
  dmStrat.cdsPreceeding.Close;
  dmStrat.cdsPreceeding.Open;
  //dmStrat.cdsPreceeding.Edit;
  //dmStrat.ConstructUnitAreaQuery;
  dmStrat.cdsUnits.Open;
  dmStrat.qStratRel.Close;
  dmStrat.qStratRel.ParamByName('RelPosID').AsString := 'P';
  dmStrat.cdsStratRel.Close;
  dmStrat.cdsStratRel.Open;
end;

procedure TISFAddPrecedingLink.iwbApplyUpdatesClick(Sender: TObject);
var
  tmpUser : string;
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsPreceeding.Post;
    dmStrat.cdsPreceeding.ApplyUpdates(0);
    dmStrat.cdsUnitQ.Close;
    dmStrat.qUnitQ.Close;
    tmpUser := UserSession.UserID;
    dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('before UnitQ ParamByName UserID');
    end;
    dmStrat.qUnitQ.ParamByName('USERID').AsString := tmpUser;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('before qParent ParamByName UserID');
    end;
    dmStrat.qParent.ParamByName('USERID').AsString := tmpUser;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('before qSubUnits ParamByName UserID');
    end;
    dmStrat.qSubUnits.ParamByName('USERID').AsString := tmpUser;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('before qSucceeding ParamByName UserID');
    end;
    dmStrat.qSucceeding.ParamByName('USERID').AsString := tmpUser;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('before qPreceeding ParamByName UserID');
    end;
    dmStrat.qPreceeding.ParamByName('USERID').AsString := tmpUser;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('before qSynonyms ParamByName UserID');
    end;
    dmStrat.qSynonyms.ParamByName('USERID').AsString := tmpUser;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('before qCorrelatives ParamByName UserID');
    end;
    dmStrat.qCorrelatives.ParamByName('USERID').AsString := tmpUser;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('before cdsUnitQ open');
    end;
    dmStrat.cdsUnitQ.Open;
    dmStrat.cdsPreceeding.Close;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('before cdsPreceeding open');
    end;
    dmStrat.cdsPreceeding.Open;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData('after cdsPreceeding open');
    end;
  end;
end;

procedure TISFAddPrecedingLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsPreceeding.CancelUpdates;
  end;
end;

procedure TISFAddPrecedingLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsPreceeding.Delete;
  dmStrat.cdsPreceeding.ApplyUpdates(0);
end;

procedure TISFAddPrecedingLink.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsPreceeding.Edit;
end;

procedure TISFAddPrecedingLink.iwbInsertReverseLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertReversePrecedingLink(WasSuccessful);
  if WasSuccessful then
  begin
    {}
  end
  else begin
    WebApplication.ShowMessage('Not able to insert reverse link record');
  end;
end;

procedure TISFAddPrecedingLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsUnits.Close;
  dmStrat.cdsStratRel.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetails.Create(WebApplication).Show;
end;

end.
