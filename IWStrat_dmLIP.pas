unit IWStrat_dmLIP;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  DBXCommon,
  IWCompListbox, WideStrings, Data.DBXFirebird, DbxDevartInterBase;

type
  TdmLIP = class(TDataModule)
    qLIPSizes: TSQLQuery;
    dspLIPSizes: TDataSetProvider;
    cdsLIPSizes: TClientDataSet;
    qLIPRatings: TSQLQuery;
    dspLIPRatings: TDataSetProvider;
    cdsLIPRatings: TClientDataSet;
    qLIPForms: TSQLQuery;
    dspLIPForms: TDataSetProvider;
    cdsLIPForms: TClientDataSet;
    dspRefFull: TDataSetProvider;
    cdsRefFull: TClientDataSet;
    cdsRefFullSOURCEDES: TBlobField;
    dsLIPSizes: TDataSource;
    dsLIPRatings: TDataSource;
    dsLIPForms: TDataSource;
    dsRefFull: TDataSource;
    qLIPs: TSQLQuery;
    dspLIPs: TDataSetProvider;
    cdsLIPs: TClientDataSet;
    dsLIPs: TDataSource;
    cdsRefFullREFNUM: TIntegerField;
    qValidFull: TSQLQuery;
    dspValidFull: TDataSetProvider;
    cdsValidFull: TClientDataSet;
    dsValidFull: TDataSource;
    qRep2: TSQLQuery;
    qRep3: TSQLQuery;
    qRep4: TSQLQuery;
    dsqRep2: TDataSource;
    dsqRep3: TDataSource;
    dsqRep4: TDataSource;
    cdsRep2: TClientDataSet;
    cdsRep3: TClientDataSet;
    cdsRep4: TClientDataSet;
    dsRep2: TDataSource;
    dsRep3: TDataSource;
    dsRep4: TDataSource;
    qLIPQ: TSQLQuery;
    dsqLIPQ: TDataSource;
    dspLIPQ: TDataSetProvider;
    dsLIPQ: TDataSource;
    qLIPParent: TSQLQuery;
    cdsLIPParent: TClientDataSet;
    dsLIPParent: TDataSource;
    qSubLIPs: TSQLQuery;
    cdsSubLIPs: TClientDataSet;
    dsSubLIPs: TDataSource;
    LIPQuery: TSQLQuery;
    dspLIPQuery: TDataSetProvider;
    cdsLIPQuery: TClientDataSet;
    dsLIPQuery: TDataSource;
    qLIPForm: TSQLQuery;
    cdsLIPForm: TClientDataSet;
    dsLIPForm: TDataSource;
    qLIPComposition: TSQLQuery;
    cdsLIPComposition: TClientDataSet;
    dsLIPComposition: TDataSource;
    LIPQueryRec: TSQLQuery;
    dspLIPQueryRec: TDataSetProvider;
    cdsLIPQueryRec: TClientDataSet;
    qLIPValid: TSQLQuery;
    cdsLIPValid: TClientDataSet;
    dsLIPValid: TDataSource;
    qLIPUnits: TSQLQuery;
    cdsLIPUnits: TClientDataSet;
    dsLIPUnits: TDataSource;
    cdsLIPSizesLIPSIZEID: TIntegerField;
    cdsLIPFormsLIPFORMID: TIntegerField;
    cdsLIPsLIPID: TIntegerField;
    cdsLIPQueryLIPID: TIntegerField;
    cdsLIPQueryLIPSIZEID: TIntegerField;
    cdsLIPQuerySPOTLATITUDE: TFloatField;
    cdsLIPQuerySPOTLONGITUDE: TFloatField;
    cdsLIPQueryMINPLOTAGE: TFloatField;
    cdsLIPQueryMAXPLOTAGE: TFloatField;
    qLIPRefs: TSQLQuery;
    cdsLIPRefs: TClientDataSet;
    dsLIPRefs: TDataSource;
    cdsLIPParentLIPID: TIntegerField;
    cdsLIPParentLIPPARENTID: TIntegerField;
    cdsSubLIPsLIPID: TIntegerField;
    cdsSubLIPsLIPPARENTID: TIntegerField;
    cdsLIPCompositionLIPID: TIntegerField;
    cdsLIPCompositionCOMPOSITIONID: TIntegerField;
    cdsLIPValidLIPID: TIntegerField;
    cdsLIPValidDATEDONE: TSQLTimeStampField;
    cdsLIPUnitsLIPID: TIntegerField;
    cdsLIPUnitsUNITID: TIntegerField;
    cdsLIPRefsLIPID: TIntegerField;
    cdsLIPRefsSOURCENUM: TIntegerField;
    cdsLIPRefsSOURCEYEAR: TSmallintField;
    cdsLIPQueryRecLIPID: TIntegerField;
    cdsLIPQueryLIPPARENTID: TIntegerField;
    qCompositions: TSQLQuery;
    dspCompositions: TDataSetProvider;
    cdsCompositions: TClientDataSet;
    dsCompositions: TDataSource;
    cdsCompositionsCOMPOSITIONID: TIntegerField;
    cdsValidFullLIPID: TIntegerField;
    cdsValidFullDATEDONE: TSQLTimeStampField;
    cdsValidFullCOMMENTS: TBlobField;
    cdsSubLIPsMINPLOTAGE: TFloatField;
    cdsSubLIPsMAXPLOTAGE: TFloatField;
    qLIPDescription: TSQLQuery;
    cdsLIPDescription: TClientDataSet;
    dsLIPDescription: TDataSource;
    cdsLIPDescriptionLIPID: TIntegerField;
    cdsLIPDescriptionDESCRIPTION: TBlobField;
    qContOceans: TSQLQuery;
    dspContOceans: TDataSetProvider;
    cdsContOceans: TClientDataSet;
    dsContOceans: TDataSource;
    cdsLIPsLIPPARENTID: TIntegerField;
    sqlcLIP: TSQLConnection;
    qUserLIPAccess: TSQLQuery;
    dspUserLIPAccess: TDataSetProvider;
    cdsUserLIPAccess: TClientDataSet;
    dsUserLIPAccess: TDataSource;
    cdsUserLIPAccessLIPID: TIntegerField;
    qLIPFor: TSQLQuery;
    cdsLIPFor: TClientDataSet;
    dsLIPFor: TDataSource;
    cdsLIPForLIPID: TIntegerField;
    qWhoFor: TSQLQuery;
    dspWhoFor: TDataSetProvider;
    cdsWhoFor: TClientDataSet;
    dsWhoFor: TDataSource;
    qDomainLIP: TSQLQuery;
    cdsDomainLIP: TClientDataSet;
    dsDomainLIP: TDataSource;
    cdsDomainLIPLIPID: TIntegerField;
    cdsDomainLIPDOMAINID: TIntegerField;
    cdsDomainLIPMINPLOTAGE: TFloatField;
    cdsDomainLIPMAXPLOTAGE: TFloatField;
    cdsDomainLIPLIPSIZEID: TIntegerField;
    cdsDomainLIPCONSTRAINTLEVELID: TSmallintField;
    cdsDomainLIPAREALEXTENT: TFloatField;
    cdsDomainLIPVOLUMEESTIMATE: TFloatField;
    cdsDomainLIPLIPPARENTID: TIntegerField;
    qInsertLink: TSQLQuery;
    cdsLIPQueryBARCODEAGE: TFloatField;
    qLIPMap: TSQLQuery;
    cdsLIPMap: TClientDataSet;
    dsLIPMap: TDataSource;
    qLIPCorrelative: TSQLQuery;
    cdsLIPCorrelative: TClientDataSet;
    dsLIPCorrelative: TDataSource;
    qLIPMapLIPID: TIntegerField;
    qLIPMapDISPLAYORDER: TIntegerField;
    qLIPMapGISINT: TIntegerField;
    qLIPCorrelativeLIPID: TIntegerField;
    qLIPCorrelativeCORRELATIVEID: TIntegerField;
    qLIPCorrelativeCOMMENTS: TBlobField;
    qLIPCorrelativeMINPLOTAGE: TFloatField;
    qLIPCorrelativeMAXPLOTAGE: TFloatField;
    cdsLIPMapLIPID: TIntegerField;
    cdsLIPMapDISPLAYORDER: TIntegerField;
    cdsLIPMapGISINT: TIntegerField;
    cdsLIPCorrelativeLIPID: TIntegerField;
    cdsLIPCorrelativeCORRELATIVEID: TIntegerField;
    cdsLIPCorrelativeCOMMENTS: TBlobField;
    cdsLIPCorrelativeMINPLOTAGE: TFloatField;
    cdsLIPCorrelativeMAXPLOTAGE: TFloatField;
    cdsLIPFormLIPID: TIntegerField;
    cdsLIPFormLIPFORMORDER: TIntegerField;
    cdsLIPFormLIPFORMID: TIntegerField;
    LIPQueryLIPID: TIntegerField;
    LIPQueryLIPSIZEID: TIntegerField;
    LIPQuerySPOTLATITUDE: TFloatField;
    LIPQuerySPOTLONGITUDE: TFloatField;
    LIPQueryMINPLOTAGE: TFloatField;
    LIPQueryMAXPLOTAGE: TFloatField;
    LIPQueryLIPPARENTID: TIntegerField;
    LIPQueryBARCODEAGE: TFloatField;
    qYesNo: TSQLQuery;
    dspYesNo: TDataSetProvider;
    cdsYesNo: TClientDataSet;
    dsYesNo: TDataSource;
    cdsLipQ: TClientDataSet;
    cdsLipQLIPID: TIntegerField;
    cdsLipQLIPSIZEID: TIntegerField;
    cdsLipQLIPPARENTID: TIntegerField;
    cdsLipQSPOTLATITUDE: TFloatField;
    cdsLipQSPOTLONGITUDE: TFloatField;
    cdsLipQMINPLOTAGE: TFloatField;
    cdsLipQMAXPLOTAGE: TFloatField;
    cdsLipQCONSTRAINTLEVELID: TSmallintField;
    cdsLipQBARCODEAGE: TFloatField;
    cdsLipQAREALEXTENT: TFloatField;
    cdsLipQVOLUMEESTIMATE: TFloatField;
    cdsLipQqLIPCorrelative: TDataSetField;
    cdsLipQqLIPMap: TDataSetField;
    cdsLipQqDomainLIP: TDataSetField;
    cdsLipQqLIPFor: TDataSetField;
    cdsLipQqLIPDescription: TDataSetField;
    cdsLipQqLIPRefs: TDataSetField;
    cdsLipQqLIPUnits: TDataSetField;
    cdsLipQqLIPValid: TDataSetField;
    cdsLipQqLIPComposition: TDataSetField;
    cdsLipQqLIPForm: TDataSetField;
    cdsLipQqSubLIPs: TDataSetField;
    cdsLipQqLIPParent: TDataSetField;
    cdsLIPUnitsAGEYEARS: TFloatField;
    qInsertLIP: TSQLQuery;
    qNewLIPName: TSQLQuery;
    dspNewLIPName: TDataSetProvider;
    cdsNewLIPName: TClientDataSet;
    dsNewLIPName: TDataSource;
    qDeleteLIP: TSQLQuery;
    cdsNewLIPNameLIPID: TIntegerField;
    cdsRep2LIPID: TIntegerField;
    cdsRep2LIPSIZEID: TIntegerField;
    cdsRep2SPOTLATITUDE: TFloatField;
    cdsRep2SPOTLONGITUDE: TFloatField;
    cdsRep2MINPLOTAGE: TFloatField;
    cdsRep2MAXPLOTAGE: TFloatField;
    cdsRep2LIPPARENTID: TIntegerField;
    cdsRep2AREALEXTENT: TFloatField;
    cdsRep2VOLUMEESTIMATE: TFloatField;
    cdsRep2BARCODEAGE: TFloatField;
    cdsRep2qRep3: TDataSetField;
    cdsRep3LIPID: TIntegerField;
    cdsRep3LIPSIZEID: TIntegerField;
    cdsRep3SPOTLATITUDE: TFloatField;
    cdsRep3SPOTLONGITUDE: TFloatField;
    cdsRep3MINPLOTAGE: TFloatField;
    cdsRep3MAXPLOTAGE: TFloatField;
    cdsRep3LIPPARENTID: TIntegerField;
    cdsRep3AREALEXTENT: TFloatField;
    cdsRep3VOLUMEESTIMATE: TFloatField;
    cdsRep3BARCODEAGE: TFloatField;
    cdsRep3qRep4: TDataSetField;
    cdsRep4LIPID: TIntegerField;
    cdsRep4LIPSIZEID: TIntegerField;
    cdsRep4SPOTLATITUDE: TFloatField;
    cdsRep4SPOTLONGITUDE: TFloatField;
    cdsRep4MINPLOTAGE: TFloatField;
    cdsRep4MAXPLOTAGE: TFloatField;
    cdsRep4LIPPARENTID: TIntegerField;
    cdsRep4AREALEXTENT: TFloatField;
    cdsRep4VOLUMEESTIMATE: TFloatField;
    cdsRep4BARCODEAGE: TFloatField;
    qRep1: TSQLQuery;
    dsqRep1: TDataSource;
    dspRep1: TDataSetProvider;
    cdsRep1: TClientDataSet;
    dsRep1: TDataSource;
    cdsRep1LIPID: TIntegerField;
    cdsRep1LIPSIZEID: TIntegerField;
    cdsRep1SPOTLATITUDE: TFloatField;
    cdsRep1SPOTLONGITUDE: TFloatField;
    cdsRep1MINPLOTAGE: TFloatField;
    cdsRep1MAXPLOTAGE: TFloatField;
    cdsRep1LIPPARENTID: TIntegerField;
    cdsRep1AREALEXTENT: TFloatField;
    cdsRep1VOLUMEESTIMATE: TFloatField;
    cdsRep1BARCODEAGE: TFloatField;
    cdsRep1qRep2: TDataSetField;
    SQLMonitor1: TSQLMonitor;
    cdsLIPSizesLIPSIZEDESCRIPTION: TWideStringField;
    cdsLIPRatingsLIPRATINGID: TWideStringField;
    cdsLIPRatingsLIPRATINGDESCRIPTION: TWideStringField;
    cdsLIPFormsLIPFORMTYPE: TWideStringField;
    cdsLIPsLIPNAME: TWideStringField;
    cdsLIPsLIPNAMELIPID: TWideStringField;
    cdsLIPsCONTINENTID: TWideStringField;
    cdsCompositionsDOMINANTCOMPOSITION: TWideStringField;
    cdsContOceansCONTOCEANID: TWideStringField;
    cdsContOceansCONTOCEAN: TWideStringField;
    cdsValidFullVALIDSTATUSID: TWideStringField;
    cdsValidFullDONEBY: TWideStringField;
    cdsWhoForWHOFORID: TWideStringField;
    cdsWhoForWHOFOR: TWideStringField;
    cdsWhoForOWNER: TWideStringField;
    cdsRep1LIPNAME: TWideStringField;
    cdsRep1LIPSIZEDESCRIPTION: TWideStringField;
    cdsRep1LIPHEADING: TWideStringField;
    cdsRep1LIPRATINGDESCRIPTION: TWideStringField;
    cdsRep1DOMINANTCOMPOSITION: TWideStringField;
    cdsRep1AGECONSTRAINTLEVEL: TWideStringField;
    cdsRep2LIPNAME: TWideStringField;
    cdsRep2LIPHEADING: TWideStringField;
    cdsRep2LIPSIZEDESCRIPTION: TWideStringField;
    cdsRep2LIPRATINGDESCRIPTION: TWideStringField;
    cdsRep2DOMINANTCOMPOSITION: TWideStringField;
    cdsRep2AGECONSTRAINTLEVEL: TWideStringField;
    cdsRep3LIPNAME: TWideStringField;
    cdsRep3LIPHEADING: TWideStringField;
    cdsRep3LIPSIZEDESCRIPTION: TWideStringField;
    cdsRep3LIPRATINGDESCRIPTION: TWideStringField;
    cdsRep3DOMINANTCOMPOSITION: TWideStringField;
    cdsRep3AGECONSTRAINTLEVEL: TWideStringField;
    cdsRep4LIPNAME: TWideStringField;
    cdsRep4LIPHEADING: TWideStringField;
    cdsRep4LIPSIZEDESCRIPTION: TWideStringField;
    cdsRep4LIPRATINGDESCRIPTION: TWideStringField;
    cdsRep4DOMINANTCOMPOSITION: TWideStringField;
    cdsRep4AGECONSTRAINTLEVEL: TWideStringField;
    cdsLipQLIPNAME: TWideStringField;
    cdsLipQLIPHEADING: TWideStringField;
    cdsLIPParentLIPNAME: TWideStringField;
    cdsSubLIPsLIPNAME: TWideStringField;
    cdsLipQCONTOCEANID: TWideStringField;
    cdsLipQLIPRATINGID: TWideStringField;
    cdsLipQCONTINENTID: TWideStringField;
    cdsLipQPLOTBARCODE: TWideStringField;
    cdsLIPFormLIPFORMTYPE: TWideStringField;
    cdsLIPValidVALIDSTATUSID: TWideStringField;
    cdsLIPValidDONEBY: TWideStringField;
    cdsLIPValidVALIDATIONSTATUS: TWideStringField;
    cdsLIPUnitsCOUNTRYID: TWideStringField;
    cdsLIPUnitsUNITNAME: TWideStringField;
    cdsLIPUnitsRANKID: TWideStringField;
    cdsLIPUnitsUNITRANK: TWideStringField;
    cdsLIPRefsSOURCESHORT: TWideStringField;
    cdsLIPForWHOFORID: TWideStringField;
    cdsLIPForNEEDSCHANGE: TWideStringField;
    cdsLIPForWHOFOR: TWideStringField;
    cdsLIPForOWNER: TWideStringField;
    cdsDomainLIPINC4CHTYN: TWideStringField;
    cdsDomainLIPCONTINENTID: TWideStringField;
    cdsDomainLIPLIPNAME: TWideStringField;
    cdsDomainLIPCONTOCEANID: TWideStringField;
    cdsDomainLIPLIPRATINGID: TWideStringField;
    cdsDomainLIPDOMAINNAME: TWideStringField;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    function GetCurrent_Date: variant;
    function GetCurrentDate: variant;
  public
    //procedure GetFormData2(var SQLMemoField : string);
    //procedure SetFormData2(SQLMemoField : string);
    procedure SubmitLIPQuery;
    procedure ConstructLIPQuery;
    procedure ConstructLIPReportQuery;
    procedure LIPQueryRecordCount;
    procedure DeleteRefRecord (var wasSuccessful : boolean);
    procedure InsertLIPDomainLink (var wasSuccessful : boolean);
    procedure InsertLIPUnitLink (var wasSuccessful : boolean);
    procedure AddLIP(NewContinentID : string;
                     var WasSuccessful : boolean);
  published
    property Current_Date: variant read GetCurrent_Date;
    property CurrentDate: variant read GetCurrentDate;
  end;

// Procs
  function dmLIP: TdmLIP;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  Variants, IWStrat_constants, usrIW_dm;

// Since we are threaded we cannot use global variables to store form / datamodule references
// so we store them in WebApplication.Data and we could reference that each time, but by creating
// a function like this our other code looks "normal" almost as if its referencing a global.
// This function is not necessary but it makes the code in the main form which references this
// datamodule a lot neater.
// Without this function every time we would reference this datamodule we would use:
//   TDataModule1(WebApplication.Data).Datamodule.<method / component>
// By creating this procedure it becomes:
//   TDataModule1.<method / component>
// Which is just like normal Delphi code.

function dmLIP: TdmLIP;
begin
  Result := TUserSession(WebApplication.Data).dmLIP;
end;


procedure TdmLIP.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('LIP Reconcile error - '+E.Message);
end;

function TdmLIP.GetCurrent_Date: variant;
begin
  Result:=dmUser.GetUTCDateTime;
end;

function TdmLIP.GetCurrentDate: variant;
begin
  Result:= double(dmUser.GetUTCDateTime); //Dates should be passed as numbers, and the corresponding cell in excel have Date format.
end;

{
procedure TdmLIP.GetFormData2(var SQLMemoField : string);
var
  V: Variant;
begin
  dmUser.UserInfo.Close;
  dmUser.UserInfo.ParamByName('USERID').AsString := UserSession.UserID;
  dmUser.UserInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.cdsUserInfo.Close;
  dmUser.cdsUserInfo.Open;
  //V := dmUser.cdsUserInfoSESSIONINFO.AsVariant;
  SQLMemoField := dmUser.cdsUserInfoSESSIONINFO.AsString;
  dmUser.cdsUserInfo.Close;
end;

procedure TdmLIP.SetFormData2(SQLMemoField : string);
begin
  dmUser.UserInfo.Close;
  dmUser.UserInfo.ParamByName('USERID').AsString := UserSession.UserID;
  dmUser.UserInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.cdsUserInfo.Close;
  dmUser.cdsUserInfo.Open;
  if (dmUser.cdsUserInfo.RecordCount = 0) then
  begin
    dmUser.cdsUserInfo.Append;
    dmUser.cdsUserInfoUSERID.AsString := UserSession.UserID;
    dmUser.cdsUserInfoSOFTWAREID.AsString := UserSession.ThisProgram;
    dmUser.cdsUserInfoLASTUSED.AsDateTime := TDateTime.NowUTC;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := SQLMemoField;
    dmUser.cdsUserInfo.Post;
  end else
  begin
    dmUser.cdsUserInfo.Edit;
    dmUser.cdsUserInfoLASTUSED.AsDateTime := TDateTime.NowUTC;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := SQLMemoField;
    dmUser.cdsUserInfo.Post;
  end;
  dmUser.cdsUserInfo.ApplyUpdates(0);
  dmUser.cdsUserInfo.Close;
end;
}

procedure TdmLIP.SubmitLIPQuery;
begin
  dmLIP.LIPQuery.Close;
  ConstructLIPQuery;
  dmLIP.LIPQuery.ParamByName('USERID').AsString := UserSession.UserID;
  //UserSession.SQLMemoField.Text := dmLIP.LIPQuery.SQL.Text;
  //dmUser.SetDeveloperData('LIPQuery');
  //dmUser.SetDeveloperData(dmLIP.LIPQuery.SQL.Text);
  dmUser.SetFormData2(dmLIP.LIPQuery.SQL.Text);
end;

procedure TdmLIP.ConstructLIPQuery;
var
  i, iCode : integer;
  tempStr : string;
  FromDate, ToDate : double;
begin
  dmLIP.cdsLIPQuery.Close;
  dmLIP.LIPQuery.Close;
  dmLIP.LIPQuery.SQL.Clear;
  dmLIP.LIPQuery.SQL.Add('SELECT DISTINCT LIPS.LIPID, LIPS.LIPNAME,');
  tempStr := '   LIPS.LIPNAME || '+''''+'   ('+''''+' || LIPS.LIPID || '+''''+') '+''''+' AS LIPNAMELIPID, ';
  dmLIP.LIPQuery.SQL.Add(tempStr);
  dmLIP.LIPQuery.SQL.Add('LIPS.LIPSIZEID, LIPS.LIPPARENTID,LIPS.CONTINENTID, ');
  dmLIP.LIPQuery.SQL.Add('LIPS.SPOTLATITUDE, ');
  dmLIP.LIPQuery.SQL.Add('LIPS.SPOTLONGITUDE, LIPS.CONTOCEANID, ');
  dmLIP.LIPQuery.SQL.Add('LIPS.MINPLOTAGE,  LIPS.MAXPLOTAGE, ');
  dmLIP.LIPQuery.SQL.Add('LIPS.AREALEXTENT,LIPS.VOLUMEESTIMATE,');
  dmLIP.LIPQuery.SQL.Add('LIPSIZES.LIPSIZEDESCRIPTION,LIPS.BARCODEAGE,LIPS.PLOTBARCODE');
  dmLIP.LIPQuery.SQL.Add('from LIPS, LIPSIZES, USERSWHOFOR, LIPFOR');
  if (UserSession.IncludeLIPValues
      or UserSession.IncludeSizeValues
      or UserSession.IncludeRatingValues
      or UserSession.IncludeDomainValues
      or UserSession.IncludeContOceanValues
      or UserSession.IncludeMorphologyValues
      or UserSession.IncludeReferenceValues
      or UserSession.IncludeUsersWhoForValues
      or UserSession.IncludeValidationValues) then
  begin
    if ((UserSession.IncludeSizeValues) and (UserSession.SizeValues.Count=0)) then UserSession.IncludeSizeValues := false;
    if ((UserSession.IncludeLIPValues) and (UserSession.LIPValues.Count=0)) then UserSession.IncludeLIPValues := false;
    if ((UserSession.IncludeRatingValues) and (UserSession.RatingValues.Count=0)) then UserSession.IncludeRatingValues := false;
    if ((UserSession.IncludeMorphologyValues) and (UserSession.MorphologyValues.Count=0)) then UserSession.IncludeMorphologyValues := false;
    if ((UserSession.IncludeContOceanValues) and (UserSession.ContOceanValues.Count=0)) then UserSession.IncludeContOceanValues := false;
    if ((UserSession.IncludeValidationValues) and (UserSession.ValidationValues.Count=0)) then UserSession.IncludeValidationValues := false;
    if ((UserSession.IncludeDomainValues) and (UserSession.DomainValues.Count=0)) then UserSession.IncludeDomainValues := false;
    if ((UserSession.IncludeReferenceValues) and (UserSession.ReferenceValues.Count=0)) then UserSession.IncludeReferenceValues := false;
    if ((UserSession.IncludeUsersWhoForValues) and (UserSession.UsersWhoForValues.Count=0)) then UserSession.IncludeUsersWhoForValues := false;
  end else
  begin
    //
  end;
  if (UserSession.IncludeLIPValues
      or UserSession.IncludeDateFromValue
      or UserSession.IncludeDateToValue
      or UserSession.IncludeSizeValues
      or UserSession.IncludeRatingValues
      or UserSession.IncludeValidationValues
      or UserSession.IncludeContOceanValues
      or UserSession.IncludeReferenceValues
      or UserSession.IncludeUsersWhoForValues
      or UserSession.IncludeMorphologyValues
      or UserSession.IncludeDomainValues) then
  begin
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,FromDate,iCode);
      UserSession.DateFromField := '0.0';
      if (iCode = 0) then UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,ToDate,iCode);
      UserSession.DateToField := '0.0';
      if (iCode = 0) then UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end;
    if UserSession.IncludeMorphologyValues then
    begin
      dmLIP.LIPQuery.SQL.Add(',LIPFORM ');
    end;
    if UserSession.IncludeDomainValues then
    begin
      dmLIP.LIPQuery.SQL.Add(',LIPDOMAIN ');
    end;
    if UserSession.IncludeReferenceValues then
    begin
      dmLIP.LIPQuery.SQL.Add(',LIPREFS ');
    end;
    if UserSession.IncludeValidationValues then
    begin
      dmLIP.LIPQuery.SQL.Add(',LIPVALID ');
    end;
    if UserSession.IncludeContOceanValues then
    begin
      dmLIP.LIPQuery.SQL.Add(',CONTOCEANS ');
    end;
    dmLIP.LIPQuery.SQL.Add('WHERE USERSWHOFOR.USERID=:UserID ');
    dmLIP.LIPQuery.SQL.Add('AND USERSWHOFOR.WHOFORID=LIPFOR.WHOFORID ');
    dmLIP.LIPQuery.SQL.Add('AND LIPFOR.LIPID=LIPS.LIPID ');
    dmLIP.LIPQuery.SQL.Add('AND LIPS.LIPSIZEID=LIPSIZES.LIPSIZEID ');
    //mLIP.LIPQuery.SQL.Add('and LIPS.LIPTYPEID=LIPTYPES.LIPTYPEID ');
    //if (UserSession.ThisProgram = 'IGCP509') then dmLIP.LIPQuery.SQL.Add('AND APPLICLINK.APPLICATIONID = 2 ');
    //if (UserSession.ThisProgram = 'StratDB') then dmLIP.LIPQuery.SQL.Add('AND APPLICLINK.APPLICATIONID = 1 ');
    if UserSession.IncludeMorphologyValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND LIPS.LIPID = LIPFORM.LIPID ');
    end;
    if UserSession.IncludeDomainValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND LIPS.LIPID = LIPDOMAIN.LIPID ');
    end;
    if UserSession.IncludeReferenceValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND LIPS.LIPID = LIPREFS.LIPID ');
    end;
    if UserSession.IncludeValidationValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND LIPS.LIPID = LIPVALID.LIPID ');
    end;
    if UserSession.IncludeContOceanValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND LIPS.CONTOCEANID = CONTOCEANS.CONTOCEANID ');
    end;
    if not UserSession.IncludeAllParentIDs then
    begin
      dmLIP.LIPQuery.SQL.Add('AND LIPS.LIPPARENTID = 0 ');
    end;
    //lips
    if UserSession.IncludeLIPValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.LIPValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.LIPID = '+''''+UserSession.LIPValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.LIPValues.Count > 1) then
      begin
        for i := 2 to UserSession.LIPValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPS.LIPID = '+''''+UserSession.LIPValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    //sizes
    if UserSession.IncludeSizeValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.SizeValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.LIPSIZEID = '+''''+UserSession.SizeValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.SizeValues.Count > 1) then
      begin
        for i := 2 to UserSession.SizeValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPS.LIPSIZEID = '+''''+UserSession.SizeValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    //LIP ratings
    if UserSession.IncludeRatingValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.RatingValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.LIPRATINGID = '+''''+UserSession.RatingValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.RatingValues.Count > 1) then
      begin
        for i := 2 to UserSession.RatingValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPS.LIPRATINGID = '+''''+UserSession.RatingValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    //LIP morphologies
    if UserSession.IncludeMorphologyValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.MorphologyValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPFORM.LIPFORMID = '+''''+UserSession.MorphologyValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.MorphologyValues.Count > 1) then
      begin
        for i := 2 to UserSession.MorphologyValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPFORM.LIPFORMID = '+''''+UserSession.MorphologyValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    //LIP domains
    if UserSession.IncludeDomainValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.DomainValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPDOMAIN.DOMAINID = '+''''+UserSession.DomainValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.DomainValues.Count > 1) then
      begin
        for i := 2 to UserSession.DomainValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPDOMAIN.DOMAINID = '+''''+UserSession.DomainValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    //LIP refs
    if UserSession.IncludeReferenceValues then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.ReferenceValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPREFS.SOURCENUM = '+''''+UserSession.ReferenceValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.ReferenceValues.Count > 1) then
      begin
        for i := 2 to UserSession.ReferenceValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPREFS.SOURCENUM = '+''''+UserSession.ReferenceValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    //validation status
    if (UserSession.IncludeValidationValues) then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.ValidationValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.ValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.ValidationValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    //continental or oceanic
    if (UserSession.IncludeContOceanValues) then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.ContOceanValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.CONTOCEANID = '+''''+UserSession.ContOceanValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.ValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.ValidationValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPS.CONTOCEANID = '+''''+UserSession.ContOceanValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    //regions
    if (UserSession.IncludeContinentValues) then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.ContinentValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.CONTINENTID = '+''''+UserSession.ContinentValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.ContinentValues.Count > 1) then
      begin
        for i := 2 to UserSession.ContinentValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPS.CONTINENTID = '+''''+UserSession.ContinentValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    //who for
    if (UserSession.IncludeUsersWhoForValues) then
    begin
      dmLIP.LIPQuery.SQL.Add('AND ');
      if ((UserSession.UsersWhoForValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.LIPQuery.SQL.Add(tempStr);
      end;
      tempStr := 'LIPFOR.WHOFORID = '+''''+UserSession.UsersWhoForValues[0]+'''';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      if (UserSession.UsersWhoForValues.Count > 1) then
      begin
        for i := 2 to UserSession.UsersWhoForValues.Count do
        begin
          dmLIP.LIPQuery.SQL.Add('OR ');
          tempStr := 'LIPFOR.WHOFORID = '+''''+UserSession.UsersWhoForValues[i-1]+'''';
          dmLIP.LIPQuery.SQL.Add(tempStr);
        end;
        dmLIP.LIPQuery.SQL.Add(') ');
      end;
    end;
    if UserSession.IncludeDateFromValue then
    begin
      tempStr := 'AND ';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      tempStr := 'LIPS.MINPLOTAGE >= '+UserSession.DateFromField;
      dmLIP.LIPQuery.SQL.Add(tempStr);
    end;
    if UserSession.IncludeDateToValue then
    begin
      tempStr := 'AND ';
      dmLIP.LIPQuery.SQL.Add(tempStr);
      tempStr := 'LIPS.MAXPLOTAGE <= '+ UserSession.DateToField;
      dmLIP.LIPQuery.SQL.Add(tempStr);
    end;
    if (UserSession.OrderByValue = '0') then
    begin
      dmLIP.LIPQuery.SQL.Add('ORDER by LIPS.LIPNAME, LIPS.LIPID');
    end;
    if (UserSession.OrderByValue = '1') then
    begin
      dmLIP.LIPQuery.SQL.Add('ORDER by LIPS.LIPID');
    end;
    if (UserSession.OrderByValue = '2') then
    begin
      dmLIP.LIPQuery.SQL.Add('ORDER by LIPS.LIPPARENTID, LIPS.LIPID');
    end;
  end;
end;

procedure TdmLIP.ConstructLIPReportQuery;
var
  i : integer;
  tempStr : string;
begin
  dmLIP.cdsRep1.Close;
  dmLIP.qRep1.Close;
  dmLIP.qRep1.SQL.Clear;
  dmLIP.qRep1.SQL.Add('SELECT DISTINCT LIPS.LIPID, LIPS.LIPNAME,');
  dmLIP.qRep1.SQL.Add('LIPS.LIPSIZEID, LIPS.LIPPARENTID, LIPS.CONTINENTID, ');
  dmLIP.qRep1.SQL.Add('LIPS.SPOTLATITUDE, ');
  dmLIP.qRep1.SQL.Add('LIPS.SPOTLONGITUDE, LIPS.CONTOCEANID, ');
  dmLIP.qRep1.SQL.Add('LIPS.MINPLOTAGE,  LIPS.MAXPLOTAGE, ');
  dmLIP.qRep1.SQL.Add('LIPS.AREALEXTENT,LIPS.VOLUMEESTIMATE,LIPS.BARCODEAGE,');
  dmLIP.qRep1.SQL.Add('LIPSIZES.LIPSIZEDESCRIPTION,LIPS.PLOTBARCODE,');
  dmLIP.qRep1.SQL.Add('LIPRATINGS.LIPRATINGDESCRIPTION,');
  dmLIP.qRep1.SQL.Add('DOMINANTCOMPOSITION.DOMINANTCOMPOSITION,');
  dmLIP.qRep1.SQL.Add('CONSTRAINTS.AGECONSTRAINTLEVEL,LIPS.LIPHEADING');
  dmLIP.qRep1.SQL.Add('from LIPS, LIPSIZES,LIPRATINGS,CONSTRAINTS,LIPCOMPOSITIONS,DOMINANTCOMPOSITION,');
  dmLIP.qRep1.SQL.Add('  USERSWHOFOR,LIPFOR');
  if (UserSession.IncludeLIPValues
      or UserSession.IncludeDateFromValue
      or UserSession.IncludeDateToValue
      or UserSession.IncludeSizeValues
      or UserSession.IncludeRatingValues
      or UserSession.IncludeValidationValues
      or UserSession.IncludeContOceanValues
      or UserSession.IncludeReferenceValues
      or UserSession.IncludeUsersWhoForValues
      or UserSession.IncludeMorphologyValues
      or UserSession.IncludeDomainValues) then
  begin
    if UserSession.IncludeMorphologyValues then
    begin
      dmLIP.qRep1.SQL.Add(',LIPFORM ');
    end;
    if UserSession.IncludeDomainValues then
    begin
      dmLIP.qRep1.SQL.Add(',LIPDOMAIN ');
    end;
    if UserSession.IncludeReferenceValues then
    begin
      dmLIP.qRep1.SQL.Add(',LIPREFS ');
    end;
    if UserSession.IncludeValidationValues then
    begin
      dmLIP.qRep1.SQL.Add(',LIPVALID ');
    end;
    if UserSession.IncludeContOceanValues then
    begin
      dmLIP.qRep1.SQL.Add(',CONTOCEANS ');
    end;
    dmLIP.qRep1.SQL.Add('WHERE USERSWHOFOR.USERID=:UserID ');
    dmLIP.qRep1.SQL.Add('AND USERSWHOFOR.WHOFORID=LIPFOR.WHOFORID ');
    dmLIP.qRep1.SQL.Add('AND LIPFOR.LIPID=LIPS.LIPID ');
    dmLIP.qRep1.SQL.Add('AND LIPS.LIPSIZEID=LIPSIZES.LIPSIZEID ');
    dmLIP.qRep1.SQL.Add('AND LIPS.LIPID=LIPCOMPOSITIONS.LIPID ');
    dmLIP.qRep1.SQL.Add('AND LIPCOMPOSITIONS.COMPOSITIONID=DOMINANTCOMPOSITION.COMPOSITIONID ');
    dmLIP.qRep1.SQL.Add('AND LIPS.LIPRATINGID=LIPRATINGS.LIPRATINGID ');
    dmLIP.qRep1.SQL.Add('AND LIPS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELID ');
    if UserSession.IncludeMorphologyValues then
    begin
      dmLIP.qRep1.SQL.Add('AND LIPS.LIPID = LIPFORM.LIPID ');
    end;
    if UserSession.IncludeDomainValues then
    begin
      dmLIP.qRep1.SQL.Add('AND LIPS.LIPID = LIPDOMAIN.LIPID ');
    end;
    if UserSession.IncludeReferenceValues then
    begin
      dmLIP.qRep1.SQL.Add('AND LIPS.LIPID = LIPREFS.LIPID ');
    end;
    if UserSession.IncludeValidationValues then
    begin
      dmLIP.qRep1.SQL.Add('AND LIPS.LIPID = LIPVALID.LIPID ');
    end;
    if UserSession.IncludeContOceanValues then
    begin
      dmLIP.qRep1.SQL.Add('AND LIPS.CONTOCEANID = CONTOCEANS.CONTOCEANID ');
    end;
    if not UserSession.IncludeAllParentIDs then
    begin
      dmLIP.qRep1.SQL.Add('AND LIPS.LIPPARENTID = 0 ');
    end;
    //lips
    if UserSession.IncludeLIPValues then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.LIPValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.LIPID = '+''''+UserSession.LIPValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.LIPValues.Count > 1) then
      begin
        for i := 2 to UserSession.LIPValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPS.LIPID = '+''''+UserSession.LIPValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    //sizes
    if UserSession.IncludeSizeValues then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.SizeValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.LIPSIZEID = '+''''+UserSession.SizeValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.SizeValues.Count > 1) then
      begin
        for i := 2 to UserSession.SizeValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPS.LIPSIZEID = '+''''+UserSession.SizeValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    //LIP ratings
    if UserSession.IncludeRatingValues then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.RatingValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.LIPRATINGID = '+''''+UserSession.RatingValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.RatingValues.Count > 1) then
      begin
        for i := 2 to UserSession.RatingValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPS.LIPRATINGID = '+''''+UserSession.RatingValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    //LIP morphologies
    if UserSession.IncludeMorphologyValues then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.MorphologyValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPFORM.LIPFORMID = '+''''+UserSession.MorphologyValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.MorphologyValues.Count > 1) then
      begin
        for i := 2 to UserSession.MorphologyValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPFORM.LIPFORMID = '+''''+UserSession.MorphologyValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    //LIP domains
    if UserSession.IncludeDomainValues then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.DomainValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPDOMAIN.DOMAINID = '+''''+UserSession.DomainValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.DomainValues.Count > 1) then
      begin
        for i := 2 to UserSession.DomainValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPDOMAIN.DOMAINID = '+''''+UserSession.DomainValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    //LIP refs
    if UserSession.IncludeReferenceValues then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.ReferenceValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPREFS.SOURCENUM = '+''''+UserSession.ReferenceValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.ReferenceValues.Count > 1) then
      begin
        for i := 2 to UserSession.ReferenceValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPREFS.SOURCENUM = '+''''+UserSession.ReferenceValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    //validation status
    if (UserSession.IncludeValidationValues) then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.ValidationValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.ValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.ValidationValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    //continental or oceanic
    if (UserSession.IncludeContOceanValues) then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.ContOceanValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.CONTOCEANID = '+''''+UserSession.ContOceanValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.ValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.ValidationValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPS.CONTOCEANID = '+''''+UserSession.ContOceanValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    //who for
    if (UserSession.IncludeUsersWhoForValues) then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.UsersWhoForValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPFOR.WHOFORID = '+''''+UserSession.UsersWhoForValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.UsersWhoForValues.Count > 1) then
      begin
        for i := 2 to UserSession.UsersWhoForValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPFOR.WHOFORID = '+''''+UserSession.UsersWhoForValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    //regions
    if (UserSession.IncludeContinentValues) then
    begin
      dmLIP.qRep1.SQL.Add('AND ');
      if ((UserSession.ContinentValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmLIP.qRep1.SQL.Add(tempStr);
      end;
      tempStr := 'LIPS.CONTINENTID = '+''''+UserSession.ContinentValues[0]+'''';
      dmLIP.qRep1.SQL.Add(tempStr);
      if (UserSession.ContinentValues.Count > 1) then
      begin
        for i := 2 to UserSession.ContinentValues.Count do
        begin
          dmLIP.qRep1.SQL.Add('OR ');
          tempStr := 'LIPS.CONTINENTID = '+''''+UserSession.ContinentValues[i-1]+'''';
          dmLIP.qRep1.SQL.Add(tempStr);
        end;
        dmLIP.qRep1.SQL.Add(') ');
      end;
    end;
    if UserSession.IncludeDateFromValue then
    begin
      tempStr := 'AND ';
      dmLIP.qRep1.SQL.Add(tempStr);
      tempStr := 'LIPS.MINPLOTAGE >= '+UserSession.DateFromField;
      dmLIP.qRep1.SQL.Add(tempStr);
    end;
    if UserSession.IncludeDateToValue then
    begin
      tempStr := 'AND ';
      dmLIP.qRep1.SQL.Add(tempStr);
      tempStr := 'LIPS.MAXPLOTAGE <= '+ UserSession.DateToField;
      dmLIP.qRep1.SQL.Add(tempStr);
    end;
    if (UserSession.OrderByValue = '0') then
    begin
      dmLIP.qRep1.SQL.Add('ORDER by LIPS.LIPNAME, LIPS.LIPID');
    end;
    if (UserSession.OrderByValue = '1') then
    begin
      dmLIP.qRep1.SQL.Add('ORDER by LIPS.LIPID');
    end;
    if (UserSession.OrderByValue = '2') then
    begin
      dmLIP.qRep1.SQL.Add('ORDER by LIPS.LIPPARENTID, LIPS.LIPID');
    end;
  end;
end;

procedure TdmLIP.LIPQueryRecordCount;
var
  nRec : integer;
  i : integer;
begin
    UserSession.NumRecordsFound := 0;
    with dmLIP do
    begin
      LIPQueryRec.Close;
      cdsLIPQueryRec.Close;
      LIPQueryRec.SQL.Text := dmLIP.LIPQuery.SQL.Text;
      LIPQueryRec.ParamByName('USERID').AsString := UserSession.UserID;
      cdsLIPQueryRec.Open;
    end;
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmLIP.cdsLIPQueryRec.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmLIP.cdsLIPQueryRec.Delete;
        end;
      end;
    end;
  try
    UserSession.NumRecordsFound := dmLIP.cdsLIPQueryRec.RecordCount;
  finally
    dmLIP.cdsLIPQueryRec.Close;
  end;
end;

procedure TdmLIP.DeleteRefRecord (var wasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  {
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteRef start';
  try
    dmLIP.qLIPRef.ParamByName('LIPID').AsInteger := dmLIP.cdsRefsUNITID.AsInteger;
    dmLIP.qLIPRef.ParamByName('SourceNum').AsInteger := dmLIP.cdsRefsSOURCENUM.AsInteger;
    //if not dmLIP.sqlcLIP.InTransaction then
    //begin
      TD := dmLIP.sqlcLIP.BeginTransaction(TDBXIsolations.ReadCommitted);
      TD.TransactionID := 1;
      TD.IsolationLevel := xilREADCOMMITTED;
      dmLIP.sqlcLIP.StartTransaction(TD);
      try
        dmLIP.qLIPRef.ExecSQL(false);
        dmLIP.sqlcLIP.CommitFreeAndNil(TD); //on success, commit the changes;
      except
        dmLIP.sqlcLIP.RollbackFreeAndNil(TD); //on failure, undo the changes;
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
  }
end;

procedure TdmLIP.InsertLIPDomainLink (var wasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertLIPDomainLink start';
  try
    dmLIP.qInsertLink.Close;
    dmLIP.qInsertLink.SQL.Clear;
    dmLIP.qInsertLink.SQL.Add('INSERT INTO LIPDOMAIN');
    dmLIP.qInsertLink.SQL.Add('(LIPID, DomainID, Inc4ChtYN)');
    dmLIP.qInsertLink.SQL.Add('Values (:LIPID, :DomainID, :Inc4ChtYN)');
    dmLIP.qInsertLink.ParamByName('LIPID').AsInteger := dmLIP.cdsLIPQLIPID.AsInteger;
    dmLIP.qInsertLink.ParamByName('DomainID').AsInteger := 0;
    dmLIP.qInsertLink.ParamByName('Inc4ChtYN').AsString := 'Y';
    //if not dmLIP.sqlcLIP.InTransaction then
    //begin
      TD := dmLIP.sqlcLIP.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmLIP.qInsertLink.ExecSQL(false);
        dmLIP.sqlcLIP.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmLIP.sqlcLIP.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmLIP.InsertLIPUnitLink (var wasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertStratUnitLink start';
  try
    dmLIP.qInsertLink.Close;
    dmLIP.qInsertLink.SQL.Clear;
    dmLIP.qInsertLink.SQL.Add('INSERT INTO STRATLIP');
    dmLIP.qInsertLink.SQL.Add('(UnitID, LIPID)');
    dmLIP.qInsertLink.SQL.Add('Values (:UnitID, :LIPID)');
    dmLIP.qInsertLink.ParamByName('UnitID').AsInteger := 0;
    dmLIP.qInsertLink.ParamByName('LIPID').AsInteger := dmLIP.cdsLIPQLIPID.AsInteger;
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmLIP.qInsertLink.SQL.Text);
    end;
    //if not dmLIP.sqlcLIP.InTransaction then
    //begin
      TD := dmLIP.sqlcLIP.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmLIP.qInsertLink.ExecSQL(false);
        dmLIP.sqlcLIP.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmLIP.sqlcLIP.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmLIP.AddLIP(NewContinentID : string;
                           var WasSuccessful : boolean);
var
  tmpLIPID : integer;
  tmpLIPName : string;
  TD, TD2 : TDBXTransaction;
begin
  tmpLIPName := 'NEW'+UserSession.UserID;
  WasSuccessful := true;
  try
    dmLIP.qDeleteLIP.Close;
    dmLIP.qDeleteLIP.SQL.Clear;
    dmLIP.qDeleteLIP.SQL.Add('DELETE FROM LIPS');
    dmLIP.qDeleteLIP.SQL.Add('WHERE LIPS.LIPNAME = '+''''+tmpLIPName+'''');
    //if not dmLIP.sqlcLIP.InTransaction then
    //begin
      TD := dmLIP.sqlcLIP.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmLIP.qDeleteLIP.ExecSQL(false);
        dmLIP.sqlcLIP.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmLIP.sqlcLIP.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
    dmLIP.qInsertLIP.Close;
    dmLIP.qInsertLIP.SQL.Clear;
    dmLIP.qInsertLIP.SQL.Add('INSERT INTO LIPS');
    dmLIP.qInsertLIP.SQL.Add('(ContinentID, LIPName, LIPParentID)');
    dmLIP.qInsertLIP.SQL.Add('Values ('+''''+NewContinentID+''''+','+''''+tmpLIPName+''''+','+'0'+')');
    //if not dmLIP.sqlcLIP.InTransaction then
    //begin
      TD := dmLIP.sqlcLIP.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmLIP.qInsertLIP.ExecSQL(false);
        dmLIP.sqlcLIP.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmLIP.sqlcLIP.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
    tmpLIPID := 0;
    if WasSuccessful then
    begin
      dmLIP.qNewLIPName.Close;
      dmLIP.qNewLIPName.ParamByName('NewLIPName').AsString := tmpLIPName;
      dmLIP.cdsNewLIPName.Close;
      dmLIP.cdsNewLIPName.Open;
      tmpLIPID := dmLIP.cdsNewLIPNameLIPID.AsInteger;
    end else
    begin
      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData('Insert new LIP was not successful for '+tmpLIPName);
      end;
    end;
    if WasSuccessful then
    begin
      dmLIP.qInsertLIP.Close;
      dmLIP.qInsertLIP.SQL.Clear;
      dmLIP.qInsertLIP.SQL.Add('INSERT INTO LIPFOR');
      dmLIP.qInsertLIP.SQL.Add('(LIPID, WHOFORID)');
      dmLIP.qInsertLIP.SQL.Add('Values ('+IntToStr(tmpLIPID)+','+''''+'PUBL'+''''+')');
      //if not dmLIP.sqlcLIP.InTransaction then
      //begin
        TD := dmLIP.sqlcLIP.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmLIP.qInsertLIP.ExecSQL(false);
          dmLIP.sqlcLIP.CommitFreeAndNil(TD); {on success, commit the changes};
        except
          dmLIP.sqlcLIP.RollbackFreeAndNil(TD); {on failure, undo the changes};
          WasSuccessful := false;
        end;
      //end;
    end;
    //update NeedsChange value so that replication occurs properly
    try
      TD2 := dmLIP.sqlcLIP.BeginTransaction(TDBXIsolations.ReadCommitted);
      //first do so for new record in LIPs
      dmLIP.qInsertLIP.Close;
      dmLIP.qInsertLIP.SQL.Clear;
      dmLIP.qInsertLIP.SQL.Add('UPDATE LIPS');
      dmLIP.qInsertLIP.SQL.Add('SET LIPS.NEEDSCHANGE = '+QuotedStr('N'));
      dmLIP.qInsertLIP.SQL.Add('WHERE LIPS.LIPID = :LIPID');
      dmLIP.qInsertLIP.ParamByName('LIPID').AsInteger := tmpLIPID;
      dmLIP.qInsertLIP.ExecSQL(false);
      //then do so for all new LIPFor records for this new LIPID
      dmLIP.qInsertLIP.Close;
      dmLIP.qInsertLIP.SQL.Clear;
      dmLIP.qInsertLIP.SQL.Add('UPDATE LIPFOR');
      dmLIP.qInsertLIP.SQL.Add('SET LIPFOR.NEEDSCHANGE = '+QuotedStr('N'));
      dmLIP.qInsertLIP.SQL.Add('WHERE LIPFOR.LIPID = :LIPID');
      dmLIP.qInsertLIP.ParamByName('LIPID').AsInteger := tmpLIPID;
      dmLIP.qInsertLIP.ExecSQL(false);
      dmLIP.sqlcLIP.CommitFreeAndNil(TD2); {on success, commit the changes};
    except
      dmLIP.sqlcLIP.RollbackFreeAndNil(TD2); {on failure, undo the changes};
    end;
  except
  end;
end;

end.
