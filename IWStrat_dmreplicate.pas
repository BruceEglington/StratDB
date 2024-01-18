unit IWStrat_dmreplicate;

interface

uses
  Forms,
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  System.Variants,
  IWCompListbox, WideStrings, DBXDevartInterBase,   midaslib,
  CcConf, CcMemDS, CcReplicator, CcProviders,
  CcInterbaseConn, CcDB, CcKeys,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, CcProvFireDAC,
  FireDAC.Phys.IBBase, FireDAC.Comp.Client, FireDAC.Phys.FBDef,
  FireDAC.Moni.Base, FireDAC.Moni.RemoteClient, FireDAC.VCLUI.Wait;

type
  TdmReplicate = class(TDataModule)
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    qLocalNodes: TSQLQuery;
    dspLocalNodes: TDataSetProvider;
    cdsLocalNodes: TClientDataSet;
    cdsLocalNodesNODENAME: TStringField;
    cdsLocalNodesNODETYPE: TStringField;
    cdsLocalNodesNODEDBNAME: TStringField;
    cdsLocalNodesNODEDBTYPE: TStringField;
    cdsLocalNodesNODEDBVERSION: TStringField;
    cdsLocalNodesNODEUSERLOGIN: TStringField;
    cdsLocalNodesNODEUSERPASSWORD: TStringField;
    dsLocalNodes: TDataSource;
    qRemoteNodes: TSQLQuery;
    dspRemoteNodes: TDataSetProvider;
    cdsRemoteNodes: TClientDataSet;
    cdsRemoteNodesNODENAME: TStringField;
    cdsRemoteNodesNODETYPE: TStringField;
    cdsRemoteNodesNODEDBNAME: TStringField;
    cdsRemoteNodesNODEDBTYPE: TStringField;
    cdsRemoteNodesNODEDBVERSION: TStringField;
    cdsRemoteNodesNODEUSERLOGIN: TStringField;
    cdsRemoteNodesNODEUSERPASSWORD: TStringField;
    dsRemoteNodes: TDataSource;
    sqlcStrat: TSQLConnection;
    qRPLusers: TSQLQuery;
    dspRPLusers: TDataSetProvider;
    cdsRPLusers: TClientDataSet;
    dsRPLusers: TDataSource;
    cdsRPLusersLOGIN: TStringField;
    cdsRPLusersPASSWRD: TStringField;
    cdsRPLusersLIBELLE: TStringField;
    cdsRPLusersCONDITION_VALUE: TStringField;
    CcConfigLocal: TCcConfig;
    CcConfigRemote: TCcConfig;
    cdsLocalNodesNODEDBSPECIFIC: TMemoField;
    cdsRemoteNodesNODEDBSPECIFIC: TMemoField;
    cdsRPLusersCONFIG_NAME: TStringField;
    FDConnectionLocal: TFDConnection;
    FDTransactionLocal: TFDTransaction;
    FDTransactionRemote: TFDTransaction;
    FDConnectionRemote: TFDConnection;
    CcConnectionFireDACLocal: TCcConnectionFireDAC;
    CcConnectionFireDACRemote: TCcConnectionFireDAC;
    cdsLocalNodesNODESERVER: TStringField;
    cdsLocalNodesNODEPATH: TStringField;
    cdsRemoteNodesNODESERVER: TStringField;
    cdsRemoteNodesNODEPATH: TStringField;
    SQLMonitor1: TSQLMonitor;
    CcReplicator1: TCcReplicator;
    CcReplicator2: TCcReplicator;
    procedure CcReplicator1ReplicationError(Sender: TObject; e: Exception;
      var CanContinue: Boolean);
    procedure CcReplicator1Exception(Sender: TObject; e: Exception);
    procedure CcReplicator1ReplicationResult(Sender: TObject);
    procedure CcReplicator1RowReplicated(Sender: TObject; TableName: string;
      Fields: TCcMemoryFields; QueryType: TCcQueryType);
    procedure CcReplicator1GenReplError(Sender: TObject; e: Exception;
      var CanContinue, SkipToRemote: Boolean);
    procedure CcReplicator2ReplicationError(Sender: TObject; e: Exception;
      var CanContinue, SkipToRemote: Boolean);
  private
    { Private declarations }
    function VariantToStr(v: Variant): String;
  public
    { Public declarations }
    procedure ReplicateChanges(TraceTypeID : string);
    procedure ReplicateFromStratDB(LocalNodeServer,LocalNodePath,
      LocalNodeName,LocalNodeCharSet,LocalNodeDBName,
      LocalNodeDBType,LocalNodeDBVersion,LocalNodeSQLDialect,LocalNodeUserLogin,
      LocalNodeUserPassword : string;
      RemoteNodeServer,RemoteNodePath,
      RemoteNodeName,RemoteNodeCharSet,RemoteNodeDBName,
      RemoteNodeDBType,RemoteNodeDBVersion,RemoteNodeSQLDialect,RemoteNodeUserLogin,
      RemoteNodeUserPassword,TraceTypeID : string);
    procedure GetServerFolder(URLString : string; var ServerString : string; var FolderString : string);
  end;

// Procs
  function dmReplicate: TdmReplicate;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  system.threading,
  usrIW_dm;


function dmReplicate: TdmReplicate;
begin
  Result := TUserSession(WebApplication.Data).dmReplicate;
end;

function TdmReplicate.VariantToStr(v: Variant): String;
begin
  if VarIsNull(v) or VarIsClear(v) then
    Result := '<null>'
  else
    Result := v;
end;

procedure TdmReplicate.CcReplicator1Exception(Sender: TObject; e: Exception);
var
  errmsg : string;
begin
  errmsg := SysErrorMessage(GetLastError);
  dmUser.SetDeveloperData('SysErrorMessage '+errmsg);
end;

procedure TdmReplicate.CcReplicator1GenReplError(Sender: TObject; e: Exception;
  var CanContinue, SkipToRemote: Boolean);
begin
    dmUser.SetDeveloperData('Error synchronizing the primary keys!' + e.Message);
    CanContinue := false;
end;

procedure TdmReplicate.CcReplicator1ReplicationError(Sender: TObject;
  e: Exception; var CanContinue: Boolean);
begin
  CanContinue := true;
end;

procedure TdmReplicate.CcReplicator1ReplicationResult(Sender: TObject);
begin
	dmUser.SetDeveloperData('Replication finished : '
		+ IntToStr(CcReplicator1.LastResult.RowsReplicated) + ' rows replicated, '
		+ IntToStr(CcReplicator1.LastResult.RowsConflicted) + ' conflicts, '
		+ IntToStr(CcReplicator1.LastResult.RowsErrors) + ' rows with errors');
end;

procedure TdmReplicate.CcReplicator2ReplicationError(Sender: TObject;
  e: Exception; var CanContinue, SkipToRemote: Boolean);
begin
  dmUser.SetDeveloperData('Replication error: ' + e.Message);
  CanContinue := true;
end;

procedure TdmReplicate.CcReplicator1RowReplicated(Sender: TObject;
  TableName: string; Fields: TCcMemoryFields; QueryType: TCcQueryType);
var
	i: Integer;
	primaryKeys: String;
begin
	//This event is fired after the current row has been successfully replicated
	//The Fields parameter contains the full list of fields that were replicated
	//along with their values
  //
	//This event is often useful for logging the replication process
	//Here's an example of how to extract information about the current row
	//in order to display it in the log :
  //
	//The TCcReplicator.Log property contains all the information about the row being
	//replicated (taken from RPL$LOG). You can use this property from within any of
	//the event handlers that are fired during replication.
	//You can find more information about this table by looking at the class documentation of TCcLog.
  //
	//The TCcLog.Keys property contains the list of primary key fields with their values
	//These values are extracted from the RPL$LOG.PRIMARY_KEY_VALUES field,
	//but since primary keys may be composed of several fields (multi-segment PKs),
	//the RPL$LOG.PRIMARY_KEY_VALUES field contains the values of all the PK fields
	//bunched together. The TCcLog.Keys property parses this field value in order to give easy access
	//to the list of PK fields with their values
	//Get the list of PK fields with their names and values, separated by commas

	for i:=0 to CcReplicator1.Log.Keys.Count-1 do begin
		if primaryKeys <> '' then
			primaryKeys := primaryKeys + ', ';
		primaryKeys := primaryKeys + CcReplicator1.Log.Keys[I].KeyName + ' = ' + VariantToStr(CcReplicator1.Log.Keys[I].KeyValue);
	end;
	//Add this information to the log
  dmUser.SetDeveloperData('Row replicated successfully : table "' + TableName + '" (' + PrimaryKeys + ')');
end;

procedure TdmReplicate.GetServerFolder(URLString : string; var ServerString : string; var FolderString : string);
var
  ColonPos : integer;
begin
  ColonPos := Pos(URLString,':');
  ServerString := Copy(URLString,1,ColonPos-1);
  FolderString := Copy(URLString,ColonPos+1,Length(URLString));
  //dmUser.SetDeveloperData();
end;

procedure TdmReplicate.ReplicateChanges(TraceTypeID : string);
var
  LocalNodeServer,LocalNodePath,
  LocalNodeName,LocalNodeCharSet,
  LocalNodeDBName,LocalNodeDBType,LocalNodeDBVersion,LocalNodeSQLDialect,
  LocalNodeUserLogin,LocalNodeUserPassword : string;
  RemoteNodeServer,RemoteNodePath,
  RemoteNodeName,RemoteNodeCharSet,RemoteNodeDBName,
  RemoteNodeDBType,RemoteNodeDBVersion,RemoteNodeSQLDialect,RemoteNodeUserLogin,
  RemoteNodeUserPassword : string;
  i : integer;
  Cnt : integer;
  LocalTmpStringList, RemoteTmpStringList : TStringList;
  LocalNodeURL : string;
  RemoteNodeURL : string;
begin
  CcReplicator1.Disconnect;
  CcConnectionFireDACRemote.Disconnect;
  CcConnectionFireDACLocal.Disconnect;
  //CcConnectionFireDACRemote.Disconnect;
  //CcConnectionFireDACLocal.Disconnect;
  dmUser.SetDeveloperData('Get RemoteNode details');
  dmReplicate.qRemoteNodes.Close;
  dmReplicate.cdsRemoteNodes.Close;
  dmReplicate.cdsRemoteNodes.Open;
  RemoteNodeName := dmReplicate.cdsRemoteNodesNODENAME.AsString;
  RemoteNodeServer := dmReplicate.cdsRemoteNodesNODESERVER.AsString;
  RemoteNodePath := dmReplicate.cdsRemoteNodesNODEPATH.AsString;
  RemoteNodeDBName := RemoteNodeServer+':'+RemoteNodePath;
  RemoteNodeDBType := dmReplicate.cdsRemoteNodesNODEDBTYPE.AsString;
  RemoteNodeDBVersion := dmReplicate.cdsRemoteNodesNODEDBVERSION.AsString;
  RemoteNodeUserLogin := dmReplicate.cdsRemoteNodesNODEUSERLOGIN.AsString;
  RemoteNodeUserPassword := dmReplicate.cdsRemoteNodesNODEUSERPASSWORD.AsString;
  RemoteTmpStringList := TStringList.Create;
  try
    RemoteTmpStringList.Clear;
    RemoteTmpStringList.Text := dmReplicate.cdsRemoteNodesNODEDBSPECIFIC.AsString;
    RemoteNodeCharSet := RemoteTmpStringList.Values['CHARSET'];
    RemoteNodeSQLDialect := RemoteTmpStringList.Values['SQLDIALECT'];
  finally
    RemoteTmpStringList.Free;
  end;
  dmReplicate.cdsRemoteNodes.Close;
  dmUser.SetDeveloperData('Replicate from StratDB remote node');
  dmUser.SetDeveloperData(RemoteNodePath);

  dmUser.SetDeveloperData(RemoteNodeName);
  dmUser.SetDeveloperData(RemoteNodeCharSet);
  dmUser.SetDeveloperData(RemoteNodeServer);
  dmUser.SetDeveloperData(RemoteNodeDBName);
  dmUser.SetDeveloperData(RemoteNodeDBType);
  dmUser.SetDeveloperData(RemoteNodeDBVersion);
  dmUser.SetDeveloperData(RemoteNodeSQLDialect);
  dmUser.SetDeveloperData(RemoteNodeUserLogin);
  dmUser.SetDeveloperData(RemoteNodeUserPassword);

  dmUser.SetDeveloperData('Get LocalNode details');
  dmReplicate.cdsLocalNodes.Close;
  dmReplicate.qLocalNodes.Close;
  dmReplicate.cdsLocalNodes.Open;
  Cnt := dmReplicate.cdsLocalNodes.RecordCount;
  dmUser.SetDeveloperData('Count of local nodes = '+IntToStr(Cnt));
  LocalTmpStringList := TStringList.Create;
  try
    for i := 1 to Cnt do
    begin
      LocalNodePath := dmReplicate.cdsLocalNodesNODEPATH.AsString;
      LocalNodeName := dmReplicate.cdsLocalNodesNODENAME.AsString;
      LocalNodeServer := dmReplicate.cdsLocalNodesNODESERVER.AsString;
      LocalNodePath := dmReplicate.cdsLocalNodesNODEPATH.AsString;
      LocalNodeDBName := LocalNodeServer+':'+LocalNodePath;
      LocalNodeDBType := dmReplicate.cdsLocalNodesNODEDBTYPE.AsString;
      LocalNodeDBVersion := dmReplicate.cdsLocalNodesNODEDBVERSION.AsString;
      LocalNodeUserLogin := dmReplicate.cdsLocalNodesNODEUSERLOGIN.AsString;
      LocalNodeUserPassword := dmReplicate.cdsLocalNodesNODEUSERPASSWORD.AsString;
      LocalTmpStringList.Clear;
      LocalTmpStringList.Text := dmReplicate.cdsLocalNodesNODEDBSPECIFIC.AsString;
      LocalNodeCharSet := LocalTmpStringList.Values['CHARSET'];
      LocalNodeSQLDialect := LocalTmpStringList.Values['SQLDIALECT'];
      dmUser.SetDeveloperData('Replicate to node '+IntToStr(i));
      dmUser.SetDeveloperData(LocalNodePath);
      dmUser.SetDeveloperData(LocalNodeCharSet);

      dmUser.SetDeveloperData(LocalNodeName);
      dmUser.SetDeveloperData(LocalNodeCharSet);
      dmUser.SetDeveloperData(LocalNodeServer);
      dmUser.SetDeveloperData(LocalNodeDBName);
      dmUser.SetDeveloperData(LocalNodeDBType);
      dmUser.SetDeveloperData(LocalNodeDBVersion);
      dmUser.SetDeveloperData(LocalNodeSQLDialect);
      dmUser.SetDeveloperData(LocalNodeUserLogin);
      dmUser.SetDeveloperData(LocalNodeUserPassword);

      try
          dmReplicate.ReplicateFromStratDB(LocalNodeServer,LocalNodePath,
            LocalNodeName,LocalNodeCharSet,
            LocalNodeDBName,LocalNodeDBType,LocalNodeDBVersion,LocalNodeSQLDialect,
            LocalNodeUserLogin,LocalNodeUserPassword,
            RemoteNodeServer,RemoteNodePath,
            RemoteNodeName,RemoteNodeCharSet,RemoteNodeDBName,
            RemoteNodeDBType,RemoteNodeDBVersion,RemoteNodeSQLDialect,RemoteNodeUserLogin,
            RemoteNodeUserPassword,TraceTypeID);
      except
      end;
      dmReplicate.cdsLocalNodes.Next;
    end;
  finally
    LocalTmpStringList.Free;
  end;
  CcConnectionFireDACRemote.Disconnect;
  CcConnectionFireDACLocal.Disconnect;
  dmReplicate.cdsLocalNodes.Close;
  dmReplicate.cdsRemoteNodes.Close;
end;

procedure TdmReplicate.ReplicateFromStratDB(LocalNodeServer,LocalNodePath,
  LocalNodeName,LocalNodeCharSet,
  LocalNodeDBName,LocalNodeDBType,LocalNodeDBVersion,LocalNodeSQLDialect,
  LocalNodeUserLogin,LocalNodeUserPassword : string;
  RemoteNodeServer,RemoteNodePath,
  RemoteNodeName,RemoteNodeCharSet,RemoteNodeDBName,
  RemoteNodeDBType,RemoteNodeDBVersion,RemoteNodeSQLDialect,RemoteNodeUserLogin,
  RemoteNodeUserPassword,TraceTypeID : string);
var
  LocalNodeURL,
  RemoteNodeURL : string;
begin
  //for use with Intraweb, Replicator needs to have the
  //AutoCommit CommitType set to ctNone and AutoReplicate disabled (Enabled = false)
  //otherwise TTimer will cause an error at runtime which will prevent replication.
  //
  //For future, dmReplicate should probably have a dbExpress TDatabaseConnection
  //added and the queries for LocalNodes and RemoteNodes should be in this
  //datamodule, along with the CcReplicator and CcConnections. No matter that
  //the CopyCat components use IBX and other aspects use dbExpress.
  //
  //data get replicated from the 'Remote' node to the various 'Local' nodes
  //

  //ccReplicator1.AutoCommit.CommitType := ctNone;
  //GetServerFolder(RemoteNodeDBName,RemoteNodeServer,RemoteNodeFolder);
  //GetServerFolder(LocalNodeDBName,LocalNodeServer,LocalNodeFolder);

 	//The databases must both be disconnected before starting replication with the
	//TCcReplicator.Replicate method. The Replicate method connects to the databases
	//automatically, and then initializes some parameters that are important
	//for replication to function correctly.
  CcConfigLocal.Connection.Disconnect;
	CcConfigRemote.Connection.Disconnect;
	CcConnectionFireDACLocal.Disconnect;
	CcConnectionFireDACRemote.Disconnect;
  dmReplicate.FDConnectionLocal.Connected := false;
  dmReplicate.FDConnectionRemote.Connected := false;
  //be sure to clear the CopyCat ConnectionParams because one is stepping
  //through multiple nodes.
  //This might be a temporary fix while Jonathan Neve checks the logic
  //within CopyCat to see whether this could be built in to the replication
  //code of CopyCat

  CcConnectionFireDACLocal.ConnectionParams.Clear;
  CcConnectionFireDACRemote.ConnectionParams.Clear;
  dmReplicate.CcReplicator1.TraceEvents := ttNoTrace;
  if (TraceTypeID = 'ttNoTrace') then dmReplicate.CcReplicator1.TraceEvents := ttNoTrace;
  if (TraceTypeID = 'ttLocalOnly') then dmReplicate.CcReplicator1.TraceEvents := ttLocalOnly;
  if (TraceTypeID = 'ttRemoteOnly') then dmReplicate.CcReplicator1.TraceEvents := ttRemoteOnly;
  if (TraceTypeID = 'ttEachSeparately') then dmReplicate.CcReplicator1.TraceEvents := ttEachSeparately;
  if (TraceTypeID = 'ttBothTogether') then dmReplicate.CcReplicator1.TraceEvents := ttBothTogether;
  ccReplicator1.Direction := sdRemoteToLocal;
  //ccReplicator1.AutoCommit.CommitType := ctNone;

  FDConnectionRemote.Params.Clear;
  ccConnectionFireDACRemote.DBType := RemoteNodeDBType;
  ccConnectionFireDACRemote.DBVersion := RemoteNodeDBVersion;
  FDConnectionRemote.Params.Add('Server='+RemoteNodeServer);
  FDConnectionRemote.Params.Add('Database='+RemoteNodePath);
  FDConnectionRemote.Params.Add('CharacterSet='+RemoteNodeCharSet);
  FDConnectionRemote.Params.Add('DriverID='+RemoteNodeDBVersion);
  FDConnectionRemote.Params.Add('Password='+RemoteNodeUserPassword);
  FDConnectionRemote.Params.Add('User_Name='+RemoteNodeUserLogin);
  FDConnectionRemote.Params.Add('SQLDialect='+RemoteNodeSQLDialect);

  FDConnectionLocal.Params.Clear;
  ccConnectionFireDACLocal.DBType := LocalNodeDBType;
  ccConnectionFireDACLocal.DBVersion := LocalNodeDBVersion;
  FDConnectionLocal.Params.Add('Server='+LocalNodeServer);
  FDConnectionLocal.Params.Add('Database='+LocalNodePath);
  FDConnectionLocal.Params.Add('CharacterSet='+LocalNodeCharSet);
  FDConnectionLocal.Params.Add('DriverID='+LocalNodeDBVersion);
  FDConnectionLocal.Params.Add('Password='+LocalNodeUserPassword);
  FDConnectionLocal.Params.Add('User_Name='+LocalNodeUserLogin);
  FDConnectionLocal.Params.Add('SQLDialect='+LocalNodeSQLDialect);
  //FDConnectionLocal.ConnectionName := LocalNodeName;
  //FDConnectionRemote.ConnectionName := RemoteNodeName;
  CcReplicator1.Nodes.RemoteNode.Connection := CcConnectionFireDACRemote;
  CcReplicator1.Nodes.LocalNode.Connection := CcConnectionFireDACLocal;
  CcReplicator1.Nodes.LocalNode.Name := LocalNodeName;
  CcReplicator1.Nodes.RemoteNode.Name := RemoteNodeName;

  FDConnectionRemote.Connected := true;
  FDConnectionLocal.Connected := true;

  //write some stuff to developer table in database
  //to check what values are being used

  dmUser.SetDeveloperData('LocalNode');
  dmUser.SetDeveloperData(ccReplicator1.Nodes.LocalNode.Name);
  dmUser.SetDeveloperData(ccReplicator1.Nodes.LocalNode.Connection.DBName);
  dmUser.SetDeveloperData(ccReplicator1.Nodes.LocalNode.Connection.DBType);
  dmUser.SetDeveloperData(ccReplicator1.Nodes.LocalNode.Connection.DBVersion);
  dmUser.SetDeveloperData('DriverID = '+FDConnectionLocal.Params.DriverID);
  dmUser.SetDeveloperData('Database = '+FDConnectionLocal.Params.Database);
  dmUser.SetDeveloperData('DriverName = '+CcConnectionFireDACLocal.FDConnection.DriverName);
  dmUser.SetDeveloperData('RemoteNode');
  dmUser.SetDeveloperData(ccReplicator1.Nodes.RemoteNode.Name);
  dmUser.SetDeveloperData(ccReplicator1.Nodes.RemoteNode.Connection.DBName);
  dmUser.SetDeveloperData(ccReplicator1.Nodes.RemoteNode.Connection.DBType);
  dmUser.SetDeveloperData(ccReplicator1.Nodes.RemoteNode.Connection.DBVersion);
  dmUser.SetDeveloperData('DriverID = '+FDConnectionRemote.Params.DriverID);
  dmUser.SetDeveloperData('Database = '+FDConnectionRemote.Params.Database);
  dmUser.SetDeveloperData('DriverName = '+CcConnectionFireDACRemote.FDConnection.DriverName);
  dmUser.SetDeveloperData('before ccReplicator1.Replicate');

	//The databases must both be disconnected before starting replication with the
	//TCcReplicator.Replicate method. The Replicate method connects to the databases
	//automatically, and then initializes some parameters that are important
	//for replication to function correctly.
  FDConnectionRemote.Connected := true;
  FDConnectionLocal.Connected := true;

  CcConfigLocal.Connection.Disconnect;
	CcConfigRemote.Connection.Disconnect;
	CcConnectionFireDACLocal.Disconnect;
	CcConnectionFireDACRemote.Disconnect;

  CcConnectionFireDACLocal.ConnectionParams.Clear;
  CcConnectionFireDACRemote.ConnectionParams.Clear;
  CcReplicator1.TableMapping.Clear;

  dmReplicate.CcReplicator1.HarmonizeFields := false;
  dmReplicate.CcReplicator1.ReplicateOnlyChangedFields := false;
  CcConnectionFireDACLocal.Disconnect;
  CcConnectionFireDACRemote.Disconnect;
  CcConnectionFireDACLocal.ConnectionParams.Clear;
  CcConnectionFireDACRemote.ConnectionParams.Clear;
  dmReplicate.CcReplicator1.TableMapping.Clear;

  //now do the replication
  CcReplicator1.Replicate;
  dmUser.SetDeveloperData('after ccReplicator1.Replicate');
end;


end.