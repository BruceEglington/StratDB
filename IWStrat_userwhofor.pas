unit IWStrat_userwhofor;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWHTMLControls,
  IWStrat_frTopBar;

type
  TISFUserWhoFor = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel4: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwbEdit: TIWButton;
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwbNew: TIWButton;
    iwDBlcbWhoFor: TIWDBLookupComboBox;
    TopBar: TISFTopBarStrat;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwDBgColumns0TitleClick(Sender: TObject);
    procedure iwbNewClick(Sender: TObject);
    procedure iwDBgColumns0Click(ASender: TObject; const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, IWStrat_dmopt, IWStrat_uMain;




procedure TISFUserWhoFor.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsBrowse]);
  iwbReturn.Visible := (dmOpt.cdsUserFor.State in [dsBrowse]);
  iwbNew.Visible := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsBrowse]);
  iwDBlcbWhoFor.Editable := UserSession.CanModify and (dmOpt.cdsUserFor.State in [dsEdit]);
end;

procedure TISFUserWhoFor.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //iwbDelete.Visible := UserSession.CanDelete;
  //iwDBNavigator1.Visible := UserSession.CanModifyPlus;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmOpt.qForList.Close;
  dmOpt.qForList.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsForList.Close;
  dmOpt.cdsForList.Open;
  dmOpt.qUserFor.Close;
  dmOpt.qUserFor.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsUserFor.Close;
  dmOpt.cdsUserFor.Open;
end;

procedure TISFUserWhoFor.iwbReturnClick(Sender: TObject);
begin
  dmOpt.cdsUserFor.Close;
  dmOpt.cdsForList.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFUserWhoFor.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserFor.Post;
  except
  end;
  try
    dmOpt.cdsUserFor.ApplyUpdates(0);
    //dmOpt.cdsUserFor.Close;
    //dmOpt.cdsUserFor.Open;
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFUserWhoFor.iwbNewClick(Sender: TObject);
var
  tmpWhoForID : string;
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  //find current whofor group
  tmpWhoForID := dmOpt.cdsUserForWHOFORID.AsString;
  //need to check for existing record with ID 'NEW' and delete
  //it before proceeding
  dmOpt.qChangeUserFor.Close;
  dmOpt.qChangeUserFor.SQL.Clear;
  dmOpt.qChangeUserFor.SQL.Add('DELETE FROM USERSWHOFOR');
  dmOpt.qChangeUserFor.SQL.Add('WHERE USERSWHOFOR.WHOFORID = '+''''+tmpWhoForID+'''');
  dmOpt.qChangeUserFor.SQL.Add('AND USERSWHOFOR.USERID = '+''''+'Nobody'+'''');
  dmOpt.qChangeUserFor.ExecSQL;
  //WebApplication.ShowMessage('Inserting new record for '+tmpWhoForID);
  dmOpt.InsertUserFor(tmpWhoForID,'Nobody',WasSuccessful);
  if not WasSuccessful then WebApplication.ShowMessage('Not able to add new record');
  dmOpt.cdsUserFor.Close;
  dmOpt.cdsUserFor.Open;
  dmOpt.cdsUserFor.Locate('USERID','Nobody',[]);
end;

procedure TISFUserWhoFor.iwDBgColumns0Click(ASender: TObject;
  const AValue: string);
begin
  dmOpt.cdsUserFor.Locate('WHOFORID',AValue,[]);
end;

procedure TISFUserWhoFor.iwDBgColumns0TitleClick(Sender: TObject);
begin
  dmOpt.cdsUserFor.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFUserWhoFor.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserFor.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFUserWhoFor.iwbDeleteClick(Sender: TObject);
begin
  try
    dmOpt.cdsUserFor.Delete;
    dmOpt.cdsUserFor.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFUserWhoFor.iwbEditClick(Sender: TObject);
begin
  dmOpt.cdsUserFor.Edit;
end;

end.
