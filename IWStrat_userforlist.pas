unit IWStrat_userforlist;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWHTMLControls,
  IWStrat_frTopBar;

type
  TISFUserForList = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel4: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwbEdit: TIWButton;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwbNew: TIWButton;
    iwbPublishUnits: TIWButton;
    TopBar: TISFTopBarStrat;
    iwbPublishLIPs: TIWButton;
    iwbPublishDeposits: TIWButton;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwDBgColumns0TitleClick(Sender: TObject);
    procedure iwbNewClick(Sender: TObject);
    procedure iwbPublishUnitsClick(Sender: TObject);
    procedure iwDBgColumns0Click(ASender: TObject; const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, IWStrat_dmopt, IWStrat_uMain;




procedure TISFUserForList.IWAppFormRender(Sender: TObject);
begin
  iwbEdit.Visible := UserSession.CanModify and (dmOpt.cdsForList.State in [dsBrowse]);
  iwbSaveChanges.Visible := UserSession.CanModify and (dmOpt.cdsForList.State in [dsEdit,dsInsert]);
  iwbCancelChanges.Visible := UserSession.CanModify and (dmOpt.cdsForList.State in [dsEdit,dsInsert]);
  iwbDelete.Visible := UserSession.CanModify and (dmOpt.cdsForList.State in [dsBrowse]);
  iwbReturn.Visible := (dmOpt.cdsForList.State in [dsBrowse]);
  iwbNew.Visible := UserSession.CanModify and (dmOpt.cdsForList.State in [dsBrowse]);
  iwbPublishUnits.Visible := UserSession.CanModify and (dmOpt.cdsForList.State in [dsBrowse]);
  iwbPublishLIPs.Visible := UserSession.CanModify and (dmOpt.cdsForList.State in [dsBrowse]);
  iwbPublishDeposits.Visible := UserSession.CanModify and (dmOpt.cdsForList.State in [dsBrowse]);
end;

procedure TISFUserForList.IWAppFormCreate(Sender: TObject);
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
end;

procedure TISFUserForList.iwbReturnClick(Sender: TObject);
begin
  dmOpt.cdsForList.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFUserForList.iwbSaveChangesClick(Sender: TObject);
begin
  try
    dmOpt.cdsForList.Post;
  except
  end;
  try
    dmOpt.cdsForList.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFUserForList.iwbNewClick(Sender: TObject);
begin
  //need to check for existing record with ID 'NEW' and delete
  //it before proceeding
  dmOpt.qChangeUserFor.Close;
  dmOpt.qChangeUserFor.SQL.Clear;
  dmOpt.qChangeUserFor.SQL.Add('DELETE FROM FORLIST');
  dmOpt.qChangeUserFor.SQL.Add('WHERE FORLIST.WHOFORID = '+''''+'NEW'+'''');
  dmOpt.qChangeUserFor.ExecSQL;
  try
    dmOpt.cdsForList.Append;
    dmOpt.cdsForListWHOFORID.AsString := 'NEW';
    dmOpt.cdsForListWHOFOR.AsString := 'NEW'+UserSession.UserID;
    dmOpt.cdsForListOWNER.AsString := UserSession.UserID;
    dmOpt.cdsForList.Post;
  except
    WebApplication.ShowMessage('Not able to add new record');
  end;
  //now need to edit this new record and change value for WHOFORID
  dmOpt.cdsForList.Locate('WHOFOR','NEW'+UserSession.UserID,[]);
end;

procedure TISFUserForList.iwbPublishUnitsClick(Sender: TObject);
var
  tmpWhoForID : string;
  WasSuccessful : boolean;
begin
  iwbPublishUnits.Confirmation := 'Are you sure you want to publish ALL unit records where WHOFORID = '+tmpWhoForID;
  tmpWhoForID := dmOpt.cdsForListWHOFORID.AsString;
  if (Sender=iwbPublishUnits) then dmOpt.PublishRecords(tmpWhoForID,'Units',WasSuccessful);
  if (Sender=iwbPublishLIPs) then dmOpt.PublishRecords(tmpWhoForID,'LIPs',WasSuccessful);
  if (Sender=iwbPublishDeposits) then dmOpt.PublishRecords(tmpWhoForID,'Deposits',WasSuccessful);
  if (not WasSuccessful) then WebApplication.ShowMessage('Not able to publish all associated records for '+tmpWhoForID);
end;

procedure TISFUserForList.iwDBgColumns0Click(ASender: TObject;
  const AValue: string);
begin
  dmOpt.cdsForList.Locate('WHOFORID',AValue,[]);
end;

procedure TISFUserForList.iwDBgColumns0TitleClick(Sender: TObject);
begin
  dmOpt.cdsForList.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFUserForList.iwlNextPageClick(Sender: TObject);
begin
  dmOpt.cdsForList.MoveBy(1*iwDBg.RowLimit);
end;

procedure TISFUserForList.iwlPrevPageClick(Sender: TObject);
begin
  dmOpt.cdsForList.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFUserForList.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmOpt.cdsForList.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFUserForList.iwbDeleteClick(Sender: TObject);
begin
  try
    dmOpt.cdsForList.Delete;
    dmOpt.cdsForList.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFUserForList.iwbEditClick(Sender: TObject);
begin
  dmOpt.cdsForList.Edit;
end;

end.
