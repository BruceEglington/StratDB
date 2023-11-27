unit IWStrat_dmopt;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  DBXCommon,
  IWCompListbox, WideStrings, Data.DBXFirebird, DbxDevartInterBase;

type
  TdmOpt = class(TDataModule)
    dsOpt: TDataSource;
    qOpt: TSQLQuery;
    cdsOpt: TClientDataSet;
    dsQOpt: TDataSource;
    dspOpt: TDataSetProvider;
    qOptUSERID: TStringField;
    qOptLINKTODATEVIEW: TStringField;
    cdsOptUSERID: TStringField;
    cdsOptLINKTODATEVIEW: TStringField;
    qOptAll: TSQLQuery;
    dsqOptAll: TDataSource;
    dspOptAll: TDataSetProvider;
    cdsOptAll: TClientDataSet;
    dsOptAll: TDataSource;
    qOptAllUSERID: TStringField;
    qOptAllLINKTODATEVIEW: TStringField;
    qOptAllINCLUDESEAMS: TStringField;
    qOptINCLUDESEAMS: TStringField;
    cdsOptINCLUDESEAMS: TStringField;
    cdsOptAllUSERID: TStringField;
    cdsOptAllLINKTODATEVIEW: TStringField;
    cdsOptAllINCLUDESEAMS: TStringField;
    sqlcStrat: TSQLConnection;
    qUserFor: TSQLQuery;
    dspUserFor: TDataSetProvider;
    cdsUserFor: TClientDataSet;
    dsUserFor: TDataSource;
    qChangeUserFor: TSQLQuery;
    qForList: TSQLQuery;
    dspForList: TDataSetProvider;
    cdsForList: TClientDataSet;
    dsForList: TDataSource;
    cdsForListWHOFORID: TStringField;
    cdsForListWHOFOR: TStringField;
    cdsForListOWNER: TStringField;
    qUserForWHOFORID: TStringField;
    qUserForUSERID: TStringField;
    cdsUserForWHOFORID: TStringField;
    cdsUserForUSERID: TStringField;
    qUserForWHOFOR: TStringField;
    cdsUserForWHOFOR: TStringField;
    SQLMonitor1: TSQLMonitor;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetUserOptions;
    procedure SetUserOptions;
    procedure PublishRecords(tempWhoForID : string; PublishWhat : string;
                         var WasSuccessful : boolean);
    procedure InsertUserFor(tWhoForID : string; tUserID : string;
                        var WasSuccessful : boolean);
  end;

// Procs
  function dmOpt: TdmOpt;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController, usrIW_dm;


function dmOpt: TdmOpt;
begin
  Result := TUserSession(WebApplication.Data).dmOpt;
end;

procedure TdmOpt.GetUserOptions;
var
  i : integer;
begin
  dmOpt.qOpt.Close;
  dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOpt.Close;
  dmOpt.cdsOpt.Open;
  if (dmOpt.cdsOpt.RecordCount > 0) then
  begin
    {record exists for this user. Read values from database and update UserSession}
    //dmOpt.qOpt.Close;
    //dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    //dmOpt.cdsOpt.Close;
    //dmOpt.cdsOpt.Open;
    {record exists for this user. Read values from database and update UserSession}
    if  (dmOpt.cdsOptLINKTODATEVIEW.AsString = 'Y')
      then UserSession.LinkToDateView := true
      else UserSession.LinkToDateView := false;
    if  (dmOpt.cdsOptINCLUDESEAMS.AsString = 'Y')
      then UserSession.IncludeSeams := true
      else UserSession.IncludeSeams := false;
  end else
  begin
    {no record exists for this user. Create default values for UserSession}
    UserSession.LinkToDateView := false;
  end;
  dmOpt.cdsOpt.Close;
end;


procedure TdmOpt.SetUserOptions;
var
  i, j, iCount : integer;
  IsNewUser : boolean;
begin
  dmOpt.qOpt.Close;
  dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOpt.Close;
  try
    IsNewUser := false;
    dmOpt.cdsOpt.Open;
    if (dmOpt.cdsOpt.RecordCount = 0) then IsNewUser := true;
  except
    IsNewUser := true;
  end;
  if (IsNewUser) then
  begin
    {no record exists for this user. Create records}
    dmOpt.cdsOptAll.Close;
    dmOpt.cdsOptAll.Open;
    try
      dmOpt.cdsOptAllLinkToDateView.AsString := 'N';
      dmOpt.cdsOptAllINCLUDESEAMS.AsString := 'N';
      dmOpt.cdsOptAll.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for OptAll');
    end;
    dmOpt.cdsOptAll.Close;
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
  end;
  if (dmOpt.cdsOpt.RecordCount > 0) then
  begin
    {record exists for this user. Update values from UserSession}
    //dmOpt.qOpt.Close;
    //dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    //dmOpt.cdsOpt.Close;
    //dmOpt.cdsOpt.Open;
    dmOpt.cdsOpt.Edit;
    if (UserSession.LinkToDateView) then dmOpt.cdsOptLINKTODATEVIEW.AsString := 'Y'
                                    else dmOpt.cdsOptLINKTODATEVIEW.AsString := 'N';
    if (UserSession.IncludeSeams) then dmOpt.cdsOptINCLUDESEAMS.AsString := 'Y'
                                    else dmOpt.cdsOptINCLUDESEAMS.AsString := 'N';
    dmOpt.cdsOpt.Post;
    dmOpt.cdsOpt.ApplyUpdates(-1);
  end else
  begin
    {no record exists for this user. Create records and update values from UserSession}
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    dmOpt.cdsOpt.Append;
    dmOpt.cdsOptUSERID.AsString := UserSession.UserID;
    dmOpt.cdsOptLINKTODATEVIEW.AsString := 'N';
    dmOpt.cdsOptINCLUDESEAMS.AsString := 'N';
    dmOpt.cdsOpt.Post;
    dmOpt.cdsOpt.ApplyUpdates(-1);
  end;
end;


procedure TdmOpt.PublishRecords(tempWhoForID : string; PublishWhat : string;
                                var WasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  WasSuccessful := true;
  try
    UserSession.WhereAmI := 'Start Publish records';
    dmOpt.qChangeUserFor.Close;
    dmOpt.qChangeUserFor.SQL.Clear;
    if (PublishWhat = 'Units') then
    begin
      dmOpt.qChangeUserFor.SQL.Add('UPDATE UNITFOR');
      dmOpt.qChangeUserFor.SQL.Add('SET UNITFOR.WHOFORID='+''''+'PUBL'+'''');
      dmOpt.qChangeUserFor.SQL.Add('WHERE UNITFOR.WHOFORID='+''''+tempWhoForID+'''');
    end;
    if (PublishWhat = 'LIPs') then
    begin
      dmOpt.qChangeUserFor.SQL.Add('UPDATE LIPFOR');
      dmOpt.qChangeUserFor.SQL.Add('SET LIPFOR.WHOFORID='+''''+'PUBL'+'''');
      dmOpt.qChangeUserFor.SQL.Add('WHERE LIPFOR.WHOFORID='+''''+tempWhoForID+'''');
    end;
    if (PublishWhat = 'Deposits') then
    begin
      dmOpt.qChangeUserFor.SQL.Add('UPDATE DEPOSITFOR');
      dmOpt.qChangeUserFor.SQL.Add('SET DEPOSITFOR.WHOFORID='+''''+'PUBL'+'''');
      dmOpt.qChangeUserFor.SQL.Add('WHERE DEPOSITFOR.WHOFORID='+''''+tempWhoForID+'''');
    end;
    if (PublishWhat = 'Domains') then
    begin
      dmOpt.qChangeUserFor.SQL.Add('UPDATE DOMAINFOR');
      dmOpt.qChangeUserFor.SQL.Add('SET DOMAINFOR.WHOFORID='+''''+'PUBL'+'''');
      dmOpt.qChangeUserFor.SQL.Add('WHERE DOMAINFOR.WHOFORID='+''''+tempWhoForID+'''');
    end;
    dmOpt.qChangeUserFor.Close;
    //if not dmOpt.sqlcStrat.InTransaction then
    //begin
      TD := dmOpt.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmOpt.qChangeUserFor.ExecSQL(false);
        dmOpt.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        WasSuccessful := true;
      except
        WasSuccessful := false;
        dmOpt.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
      end;
    //end;
  except
  end;
end;

procedure TdmOpt.InsertUserFor(tWhoForID : string; tUserID : string;
                                var WasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  WasSuccessful := false;
  try
    UserSession.WhereAmI := 'Start InsertUserWhoFor';
    dmOpt.qChangeUserFor.Close;
    dmOpt.qChangeUserFor.SQL.Clear;
    dmOpt.qChangeUserFor.SQL.Add('INSERT INTO USERSWHOFOR');
    dmOpt.qChangeUserFor.SQL.Add('(USERID, WHOFORID)');
    dmOpt.qChangeUserFor.SQL.Add('Values (:USERID, :WhoForID)');
    //dmUser.SetDeveloperData('UserID = '+tUserID);
    //dmUser.SetDeveloperData('WhoForID = '+tWhoForID);
    //dmUser.SetDeveloperData('dmOpt.qChangeUserFor.SQL.Text');
    //dmUser.SetDeveloperData(dmOpt.qChangeUserFor.SQL.Text);
    dmOpt.qChangeUserFor.ParamByName('USERID').AsString := tUserID;
    dmOpt.qChangeUserFor.ParamByName('WhoForID').AsString := tWhoForID;
    dmOpt.qChangeUserFor.Close;
    //if not dmOpt.sqlcStrat.InTransaction then
    //begin
      TD := dmOpt.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmOpt.qChangeUserFor.ExecSQL(false);
        dmOpt.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        WasSuccessful := true;
      except
        dmOpt.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
      end;
    //end;
  except
  end;
end;


end.
