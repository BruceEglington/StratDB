unit IWStrat_dm2;

interface

uses
  {$IFDEF Linux}QForms, {$ELSE}Forms, {$ENDIF}
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox;

type
  TdmStrat = class(TDataModule)
    Query1: TSQLQuery;
    dspQuery1: TDataSetProvider;
    cdsQuery1: TClientDataSet;
    dsQuery1: TDataSource;
    SQLMonitor1: TSQLMonitor;
    qContinents: TSQLQuery;
    qContinentsCONTINENTID: TStringField;
    qContinentsCONTINENT: TStringField;
    dspContinents: TDataSetProvider;
    cdsContinents: TClientDataSet;
    cdsContinentsCONTINENTID: TStringField;
    cdsContinentsCONTINENT: TStringField;
    qCountries: TSQLQuery;
    dspCountries: TDataSetProvider;
    cdsCountries: TClientDataSet;
    qUnits: TSQLQuery;
    dspUnits: TDataSetProvider;
    cdsUnits: TClientDataSet;
    qReferences: TSQLQuery;
    dspReferences: TDataSetProvider;
    cdsReferences: TClientDataSet;
    qValidationStatus: TSQLQuery;
    qValidationStatusVALIDSTATUSID: TStringField;
    qValidationStatusVALIDATIONSTATUS: TStringField;
    dspValidationStatus: TDataSetProvider;
    cdsValidationStatus: TClientDataSet;
    cdsValidationStatusVALIDSTATUSID: TStringField;
    cdsValidationStatusVALIDATIONSTATUS: TStringField;
    qRefDetail: TSQLQuery;
    qRefDetailSOURCEID: TStringField;
    qRefDetailSOURCEDES: TMemoField;
    dspRefDetail: TDataSetProvider;
    cdsRefDetail: TClientDataSet;
    cdsRefDetailSOURCEID: TStringField;
    cdsRefDetailSOURCEDES: TMemoField;
    dspRefFull: TDataSetProvider;
    cdsRefFull: TClientDataSet;
    cdsRefFullSOURCEID: TStringField;
    cdsRefFullSOURCEDES: TMemoField;
    dsContinents: TDataSource;
    dsCountries: TDataSource;
    dsUnits: TDataSource;
    dsReferences: TDataSource;
    dsValidationStatus: TDataSource;
    dsRefFull: TDataSource;
    dsRefDetail: TDataSource;
    qUnitCountry: TSQLQuery;
    dspUnitCountry: TDataSetProvider;
    cdsUnitCountry: TClientDataSet;
    dsUnitCountry: TDataSource;
    qUnitCountryUNITNAME: TStringField;
    qUnitCountryCOUNTRYABR: TStringField;
    cdsUnitCountryUNITNAME: TStringField;
    cdsUnitCountryCOUNTRYABR: TStringField;
    qYesNo: TSQLQuery;
    dspYesNo: TDataSetProvider;
    cdsYesNo: TClientDataSet;
    dsYesNo: TDataSource;
    qYesNoYESNOID: TStringField;
    qYesNoYESNO: TStringField;
    cdsYesNoYESNOID: TStringField;
    cdsYesNoYESNO: TStringField;
    cdsRefFullCONTINENTID: TStringField;
    qUsers: TSQLQuery;
    dspUsers: TDataSetProvider;
    cdsUsers: TClientDataSet;
    dsUsers: TDataSource;
    qRefDetailREFNUM: TIntegerField;
    cdsRefDetailREFNUM: TIntegerField;
    cdsRefFullREFNUM: TIntegerField;
    sqlcStrat: TSQLConnection;
    cdsUnitsUNITID: TIntegerField;
    cdsUnitsCOUNTRYID: TStringField;
    cdsUnitsUNITNAME: TStringField;
    cdsUnitsPARENTID: TIntegerField;
    cdsCountriesCOUNTRYID: TStringField;
    cdsCountriesCOUNTRY: TStringField;
    cdsCountriesCONTINENTID: TStringField;
    cdsCountriesCONTINENT: TStringField;
    cdsCountriesCOUNTRYHASRECORDS: TStringField;
    cdsQuery1UNITID: TIntegerField;
    cdsQuery1COUNTRYID: TStringField;
    cdsQuery1UNITNAME: TStringField;
    cdsQuery1PARENTID: TIntegerField;
    cdsQuery1MINAGE: TFloatField;
    cdsQuery1MAXAGE: TFloatField;
    cdsQuery1COUNTRY: TStringField;
    cdsReferencesSOURCENUM: TIntegerField;
    cdsReferencesSOURCESHORT: TStringField;
    cdsReferencesCONTINENTID: TStringField;
    cdsReferencesCONTINENT: TStringField;
    qReferencesSOURCENUM: TIntegerField;
    qReferencesSOURCESHORT: TStringField;
    qReferencesCONTINENTID: TStringField;
    qReferencesCONTINENT: TStringField;
    qUnitQ: TSQLQuery;
    cdsUnitQ: TClientDataSet;
    dspUnitQ: TDataSetProvider;
    dsqUnitQ: TDataSource;
    dsUnitQ: TDataSource;
    qParent: TSQLQuery;
    qSubUnits: TSQLQuery;
    cdsParent: TClientDataSet;
    cdsSubUnits: TClientDataSet;
    dsParent: TDataSource;
    dsSubUnits: TDataSource;
    Query1Rec: TSQLQuery;
    dspQuery1Rec: TDataSetProvider;
    cdsQuery1Rec: TClientDataSet;
    cdsQuery1RecUNITID: TIntegerField;
    qUsersUSERID: TStringField;
    cdsUsersUSERID: TStringField;
    cdsUnitsRANKID: TStringField;
    cdsQuery1RANKID: TStringField;
    cdsQuery1UNITRANK: TStringField;
    qSucceeding: TSQLQuery;
    cdsSucceeding: TClientDataSet;
    dsSucceeding: TDataSource;
    qPreceeding: TSQLQuery;
    cdsPreceeding: TClientDataSet;
    dsPreceeding: TDataSource;
    cdsRefs: TClientDataSet;
    dsRefs: TDataSource;
    qValid: TSQLQuery;
    cdsValid: TClientDataSet;
    dsValid: TDataSource;
    qRefs: TSQLQuery;
    cdsUnitQUNITID: TIntegerField;
    cdsUnitQUNITNAME: TStringField;
    cdsUnitQPARENTID: TIntegerField;
    cdsUnitQMINAGE: TFloatField;
    cdsUnitQMAXAGE: TFloatField;
    cdsUnitQDESCRIPTION: TMemoField;
    cdsUnitQCOUNTRY: TStringField;
    cdsUnitQUNITRANK: TStringField;
    cdsUnitQqSubUnits: TDataSetField;
    cdsUnitQqParent: TDataSetField;
    cdsParentUNITID: TIntegerField;
    cdsParentUNITNAME: TStringField;
    cdsParentPARENTID: TIntegerField;
    cdsParentRANKID: TStringField;
    cdsParentMINAGE: TFloatField;
    cdsParentMAXAGE: TFloatField;
    cdsParentUNITRANK: TStringField;
    cdsSubUnitsUNITID: TIntegerField;
    cdsSubUnitsUNITNAME: TStringField;
    cdsSubUnitsPARENTID: TIntegerField;
    cdsSubUnitsRANKID: TStringField;
    cdsSubUnitsMINAGE: TFloatField;
    cdsSubUnitsMAXAGE: TFloatField;
    cdsSubUnitsUNITRANK: TStringField;
    cdsRefsUNITID: TIntegerField;
    cdsRefsSOURCENUM: TIntegerField;
    cdsRefsSOURCENUM_1: TIntegerField;
    cdsRefsSOURCESHORT: TStringField;
    cdsRefsSOURCEYEAR: TSmallintField;
    cdsUnitQqValid: TDataSetField;
    cdsUnitQqPreceeding: TDataSetField;
    cdsUnitQqRefs: TDataSetField;
    cdsUnitQqSucceeding: TDataSetField;
    cdsValidUNITID: TIntegerField;
    cdsValidVALIDSTATUSID: TStringField;
    cdsValidDATEDONE: TSQLTimeStampField;
    cdsValidDONEBY: TStringField;
    cdsValidVALIDSTATUSID_1: TStringField;
    cdsValidVALIDATIONSTATUS: TStringField;
    cdsPreceedingUNITID: TIntegerField;
    cdsPreceedingUNITNAME: TStringField;
    cdsPreceedingPARENTID: TIntegerField;
    cdsPreceedingRANKID: TStringField;
    cdsPreceedingMINAGE: TFloatField;
    cdsPreceedingMAXAGE: TFloatField;
    cdsPreceedingUNITRANK: TStringField;
    cdsPreceedingUNITID_1: TIntegerField;
    cdsPreceedingPRECEDEDBY: TIntegerField;
    cdsPreceedingPREREL: TStringField;
    cdsPreceedingRELATIONSHIPID: TStringField;
    cdsPreceedingRELPOSID: TStringField;
    cdsPreceedingRELATIONSHIP: TStringField;
    cdsSucceedingUNITID: TIntegerField;
    cdsSucceedingUNITNAME: TStringField;
    cdsSucceedingPARENTID: TIntegerField;
    cdsSucceedingRANKID: TStringField;
    cdsSucceedingMINAGE: TFloatField;
    cdsSucceedingMAXAGE: TFloatField;
    cdsSucceedingUNITRANK: TStringField;
    cdsSucceedingUNITID_1: TIntegerField;
    cdsSucceedingSUCCEEDEDBY: TIntegerField;
    cdsSucceedingSUCREL: TStringField;
    cdsSucceedingRELATIONSHIPID: TStringField;
    cdsSucceedingRELPOSID: TStringField;
    cdsSucceedingRELATIONSHIP: TStringField;
    qRecords: TSQLQuery;
    cdsRecords: TClientDataSet;
    dsRecords: TDataSource;
    qSynonyms: TSQLQuery;
    qCorrelatives: TSQLQuery;
    qUnitPeriods: TSQLQuery;
    cdsSynonyms: TClientDataSet;
    cdsCorrelatives: TClientDataSet;
    cdsUnitPeriods: TClientDataSet;
    dsSynonyms: TDataSource;
    dsCorrelatives: TDataSource;
    dsUnitPeriods: TDataSource;
    cdsUnitQAGEYEARS: TFloatField;
    cdsUnitQqCorrelatives: TDataSetField;
    cdsUnitQqSynonyms: TDataSetField;
    cdsSubUnitsAGEYEARS: TFloatField;
    cdsSucceedingAGEYEARS: TFloatField;
    cdsPreceedingAGEYEARS: TFloatField;
    cdsSynonymsUNITID: TIntegerField;
    cdsSynonymsSYNONYMID: TIntegerField;
    cdsSynonymsCOMMENTS: TMemoField;
    cdsSynonymsUNITNAME: TStringField;
    cdsSynonymsUNITRANK: TStringField;
    cdsCorrelativesUNITID: TIntegerField;
    cdsCorrelativesCORRELATIVEID: TIntegerField;
    cdsCorrelativesCOMMENTS: TMemoField;
    cdsCorrelativesUNITNAME: TStringField;
    cdsCorrelativesUNITRANK: TStringField;
    cdsCorrelativesCOUNTRY: TStringField;
    cdsUnitsAGEYEARS: TFloatField;
    cdsQuery1AGEYEARS: TFloatField;
    cdsUnitQAPPROVALSTATUS: TStringField;
    cdsUnitQqRecords: TDataSetField;
    cdsSynonymsAPPROVALSTATUS: TStringField;
    qUnitQUNITID: TIntegerField;
    qUnitQUNITNAME: TStringField;
    qUnitQPARENTID: TIntegerField;
    qUnitQRANKID: TStringField;
    qUnitQMINAGE: TFloatField;
    qUnitQMAXAGE: TFloatField;
    qUnitQAGEYEARS: TFloatField;
    qUnitQDESCRIPTION: TMemoField;
    qUnitQCOUNTRYID: TStringField;
    qUnitQCOUNTRYID_1: TStringField;
    qUnitQCOUNTRY: TStringField;
    qUnitQUNITRANK: TStringField;
    qUnitQAPPROVALSTATUS: TStringField;
    qUnitQAPPROVALID: TStringField;
    qUnitQAPPROVALID_1: TStringField;
    qValidFull: TSQLQuery;
    dspValidFull: TDataSetProvider;
    cdsValidFull: TClientDataSet;
    dsValidFull: TDataSource;
    cdsValidFullUNITID: TIntegerField;
    cdsValidFullVALIDSTATUSID: TStringField;
    cdsValidFullDATEDONE: TSQLTimeStampField;
    cdsValidFullDONEBY: TStringField;
    cdsValidFullCOMMENTS: TMemoField;
    qValidUNITID: TIntegerField;
    qValidVALIDSTATUSID: TStringField;
    qValidDATEDONE: TSQLTimeStampField;
    qValidDONEBY: TStringField;
    qValidVALIDSTATUSID_1: TStringField;
    qValidVALIDATIONSTATUS: TStringField;
    cdsQuery1APPROVALSTATUS: TStringField;
    qMaps: TSQLQuery;
    dspMaps: TDataSetProvider;
    cdsMaps: TClientDataSet;
    dsMaps: TDataSource;
    cdsMapsMAPID: TStringField;
    cdsMapsMAPNAME: TStringField;
    qStratMaps: TSQLQuery;
    cdsStratMaps: TClientDataSet;
    dsStratMaps: TDataSource;
    cdsStratMapsUNITID: TIntegerField;
    cdsStratMapsMAPID: TStringField;
    cdsStratMapsGISID: TIntegerField;
    cdsStratMapsMAPNAME: TStringField;
    qStratMapsUNITID: TIntegerField;
    qStratMapsMAPID: TStringField;
    qStratMapsGISID: TIntegerField;
    qStratMapsMAPID_1: TStringField;
    qStratMapsMAPNAME: TStringField;
    cdsStratMapsMAPID_1: TStringField;
    cdsUnitQqStratMaps: TDataSetField;
    qUnitQAGEUNITS: TStringField;
    cdsUnitQAGEUNITS: TStringField;
    cdsQuery1AGEUNITS: TStringField;
    cdsMapsSHAPEFILENAME: TStringField;
    qStratDomain: TSQLQuery;
    cdsStratDomain: TClientDataSet;
    dsStratDomain: TDataSource;
    qStratDomainUNITID: TIntegerField;
    qStratDomainDOMAINID: TStringField;
    qStratDomainDOMAINID_1: TStringField;
    qStratDomainDOMAINNAME: TStringField;
    cdsUnitQqStratDomain: TDataSetField;
    cdsStratDomainUNITID: TIntegerField;
    cdsStratDomainDOMAINID: TStringField;
    cdsStratDomainDOMAINID_1: TStringField;
    cdsStratDomainDOMAINNAME: TStringField;
    qDomains: TSQLQuery;
    dspDomains: TDataSetProvider;
    cdsDomains: TClientDataSet;
    dsDomains: TDataSource;
    cdsDomainsDOMAINID: TStringField;
    cdsDomainsDOMAINNAME: TStringField;
    cdsDomainsCOUNTRYID: TStringField;
    qStratDomainCOUNTRYID: TStringField;
    qStratDomainCOUNTRYID_1: TStringField;
    qStratDomainCOUNTRY: TStringField;
    cdsStratDomainCOUNTRYID: TStringField;
    cdsStratDomainCOUNTRYID_1: TStringField;
    cdsStratDomainCOUNTRY: TStringField;
    qRefsUNITID: TIntegerField;
    qRefsSOURCENUM: TIntegerField;
    qRefsSOURCENUM_1: TIntegerField;
    qRefsSOURCESHORT: TStringField;
    qRefsSOURCEYEAR: TSmallintField;
    qStratRef: TSQLQuery;
    qDeleteStratDomain: TSQLQuery;
    cdsUnitQCOUNTRYID: TStringField;
    cdsUnitQRANKID: TStringField;
    qLinkedApplications: TSQLQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    cdsLinkedApplications: TClientDataSet;
    IntegerField2: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    dsLinkedApplications: TDataSource;
    cdsUnitQqLinkedApplications: TDataSetField;
    SQLQuery1: TSQLQuery;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
  public
    procedure GetFormData;
    procedure SetFormData;
    procedure ConstructUnitAreaQuery;
    procedure SubmitContAreaQuery;
    procedure SubmitQuery1;
    procedure ConstructQuery;
    procedure SubmitNewRecord2(var WasSuccessful : boolean);
    procedure Query1RecordCount;
    procedure DeleteRefRecord (var wasSuccessful : boolean);
    procedure DeleteDomainRecord (var wasSuccessful : boolean);
  end;

// Procs
  function dmStrat: TdmStrat;

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

function dmStrat: TdmStrat;
begin
  Result := TUserSession(WebApplication.Data).dmStrat;
end;


procedure TdmStrat.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

procedure TdmStrat.GetFormData;
var
  V: Variant;
begin
  dmUser.UserInfo.Close;
  dmUser.UserInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
  dmUser.UserInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.cdsUserInfo.Close;
  dmUser.cdsUserInfo.Open;
  V := dmUser.cdsUserInfoSESSIONINFO.AsVariant;
  dmUser.cdsUserInfo.Close;
end;

procedure TdmStrat.SetFormData;
begin
  dmUser.UserInfo.Close;
  dmUser.UserInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
  dmUser.UserInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.cdsUserInfo.Close;
  dmUser.cdsUserInfo.Open;
  if (dmUser.cdsUserInfo.RecordCount = 0) then
  begin
    dmUser.cdsUserInfo.Append;
    dmUser.cdsUserInfoUSERNAMEID.AsString := UserSession.UserID;
    dmUser.cdsUserInfoSOFTWAREID.AsString := UserSession.ThisProgram;
    dmUser.cdsUserInfoLASTUSED.AsDateTime := Now;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := UserSession.SQLMemoField.Text;
    dmUser.cdsUserInfo.Post;
  end else
  begin
    dmUser.cdsUserInfo.Edit;
    dmUser.cdsUserInfoLASTUSED.AsDateTime := Now;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := UserSession.SQLMemoField.Text;
    dmUser.cdsUserInfo.Post;
  end;
  dmUser.cdsUserInfo.ApplyUpdates(0);
  dmUser.cdsUserInfo.Close;
end;

procedure TdmStrat.ConstructUnitAreaQuery;
var
  i : integer;
  tempStr : string;
begin
  {UnitAreas}
  dmStrat.qUnits.Close;
  dmStrat.qUnits.SQL.Clear;
  dmStrat.qUnits.SQL.Add('SELECT DISTINCT STRATUNITS.UNITID, STRATUNITS.UNITNAME, ');
  dmStrat.qUnits.SQL.Add('   STRATUNITS.COUNTRYID, STRATUNITS.PARENTID,');
  dmStrat.qUnits.SQL.Add('   STRATUNITS.RANKID, STRATUNITS.AGEYEARS,');
  dmStrat.qUnits.SQL.Add('   APPLICLINK.UNITID, APPLICLINK.APPLICATIONID');
  dmStrat.qUnits.SQL.Add('FROM STRATUNITS,COUNTRIES,CONTINENTS,APPLICLINK');
  dmStrat.qUnits.SQL.Add('WHERE CONTINENTS.CONTINENTID = COUNTRIES.CONTINENTID');
  dmStrat.qUnits.SQL.Add('AND COUNTRIES.COUNTRYID = STRATUNITS.COUNTRYID');
  dmStrat.qUnits.SQL.Add('AND STRATUNITS.UNITID = APPLICLINK.UNITID');
  tempStr := 'AND STRATUNITS.APPROVALID <> '+''''+'HS'+'''';
  dmStrat.qUnits.SQL.Add(tempStr);
  tempStr := 'AND STRATUNITS.APPROVALID <> '+''''+'NA'+'''';
  dmStrat.qUnits.SQL.Add(tempStr);
  if not UserSession.IncludeSeams then
  begin
    tempStr := 'AND STRATUNITS.RANKID <> '+''''+'SEAM'+'''';
    dmStrat.qUnits.SQL.Add(tempStr);
    tempStr := 'AND STRATUNITS.RANKID <> '+''''+'REEF'+'''';
    dmStrat.qUnits.SQL.Add(tempStr);
  end;
  if (UserSession.ThisProgram = 'IGCP509') then dmStrat.qUnits.SQL.Add('AND APPLICLINK.APPLICATIONID = 2 ');
  if (UserSession.ThisProgram = 'StratDB') then dmStrat.qUnits.SQL.Add('AND APPLICLINK.APPLICATIONID = 1 ');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeAreaValues and (UserSession.AreaValues.Count=0)) then
  begin
    UserSession.IncludeAreaValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qUnits.SQL.Add('AND ( CONTINENTS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qUnits.SQL.Add('OR CONTINENTS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qUnits.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeAreaValues) then
  begin
    dmStrat.qUnits.SQL.Add('AND ( STRATUNITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmStrat.qUnits.SQL.Add('OR STRATUNITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qUnits.SQL.Add(' ) ');
  end;
  dmStrat.qUnits.SQL.Add('ORDER BY STRATUNITS.UNITNAME, STRATUNITS.UNITID');
  {References}
  dmStrat.qReferences.Close;
  dmStrat.qReferences.SQL.Clear;
  dmStrat.qReferences.SQL.Add('SELECT DISTINCT SOURCELIST.SOURCENUM, SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,');
  dmStrat.qReferences.SQL.Add('  CONTINENTS.CONTINENT');
  dmStrat.qReferences.SQL.Add('FROM SOURCELIST,CONTINENTS');
  dmStrat.qReferences.SQL.Add('WHERE CONTINENTS.CONTINENTID = SOURCELIST.CONTINENTID');
  dmStrat.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT >= :FirstReference');
  dmStrat.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT<= :LastReference');
  dmStrat.qReferences.SQL.Add('AND ( SOURCELIST.CONTINENTID = '+''''+ValueForUndefinedCONTINENTID+'''');
  if (UserSession.IncludeContinentValues) then
  begin
    if (UserSession.ContinentValues.Count > 0) then
    begin
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qReferences.SQL.Add('OR SOURCELIST.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
  end;
  dmStrat.qReferences.SQL.Add(' ) ');
end;

procedure TdmStrat.SubmitContAreaQuery;
begin
  ConstructUnitAreaQuery;
  UserSession.SQLMemoField.Text := dmStrat.qUnits.SQL.Text;
  dmUser.SetFormData;
end;

procedure TdmStrat.SubmitQuery1;
begin
  ConstructQuery;
  UserSession.SQLMemoField.Text := dmStrat.Query1.SQL.Text;
  dmUser.SetFormData;
end;

procedure TdmStrat.ConstructQuery;
var
  i, itmp, iCode : integer;
  tempStr : string;
  tmp : double;
  FromDate, ToDate : double;
begin
  dmStrat.cdsQuery1.Close;
  dmStrat.Query1.Close;
  dmStrat.Query1.SQL.Clear;
  dmStrat.Query1.SQL.Add('select DISTINCT STRATUNITS.UNITID,STRATUNITS.COUNTRYID, STRATUNITS.UNITNAME, STRATUNITS.PARENTID, ');
  dmStrat.Query1.SQL.Add('STRATUNITS.RANKID, STRATUNITS.AGEYEARS, STRATUNITS.MINAGE, ');
  dmStrat.Query1.SQL.Add('STRATUNITS.MAXAGE, STRATUNITS.AGEUNITS, RANKS.UNITRANK, COUNTRIES.COUNTRY, ');
  dmStrat.Query1.SQL.Add('APPROVALSTATUS.APPROVALID, APPROVALSTATUS.APPROVALSTATUS, ');
  dmStrat.Query1.SQL.Add('APPLICLINK.UNITID, APPLICLINK.APPLICATIONID');
  dmStrat.Query1.SQL.Add('from STRATUNITS, COUNTRIES, RANKS, APPROVALSTATUS, APPLICLINK');
  if (UserSession.IncludeAreaValues
      or UserSession.IncludeContinentValues
      or UserSession.IncludeUnitValues
      or UserSession.IncludeReferenceValues
      or UserSession.IncludeValidationValues
      or UserSession.IncludeDateFromValue
      or UserSession.IncludeDateToValue) then
  begin
    if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count=0)) then UserSession.IncludeContinentValues := false;
    if ((UserSession.IncludeAreaValues) and (UserSession.AreaValues.Count=0)) then UserSession.IncludeAreaValues := false;
    if ((UserSession.IncludeReferenceValues) and (UserSession.ReferenceValues.Count=0)) then UserSession.IncludeReferenceValues := false;
    if ((UserSession.IncludeValidationValues) and (UserSession.ValidationValues.Count=0)) then UserSession.IncludeValidationValues := false;
    if UserSession.IncludeDateFromValue then
    begin
      if (UserSession.DateFromField = '') then UserSession.IncludeDateFromValue := false;
    end;
    if UserSession.IncludeDateToValue then
    begin
      if (UserSession.DateToField = '') then UserSession.IncludeDateToValue := false;
    end;
  end else
  begin
    {}
  end;
  if (UserSession.IncludeAreaValues
      or UserSession.IncludeContinentValues
      or UserSession.IncludeUnitValues
      or UserSession.IncludeReferenceValues
      or UserSession.IncludeValidationValues
      or UserSession.IncludeDateFromValue
      or UserSession.IncludeDateToValue) then
  begin
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,FromDate,iCode);
      UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,ToDate,iCode);
      UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end;
    if UserSession.IncludeValidationValues then
    begin
      dmStrat.Query1.SQL.Add(',STRATVALID ');
    end;
    dmStrat.Query1.SQL.Add('WHERE STRATUNITS.COUNTRYID = COUNTRIES.COUNTRYID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.RANKID = RANKS.RANKID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID = APPLICLINK.UNITID ');
    if (UserSession.ThisProgram = 'IGCP509') then dmStrat.Query1.SQL.Add('AND APPLICLINK.APPLICATIONID = 2 ');
    if (UserSession.ThisProgram = 'StratDB') then dmStrat.Query1.SQL.Add('AND APPLICLINK.APPLICATIONID = 1 ');
    if UserSession.IncludeValidationValues then
    begin
      dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID = STRATVALID.UNITID ');
    end;
    {continent}
    if UserSession.IncludeContinentValues then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.ContinentValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.ContinentValues.Count > 1) then
      begin
        for i := 2 to UserSession.ContinentValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    {area}
    if UserSession.IncludeAreaValues then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.AreaValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'STRATUNITS.COUNTRYID = '+''''+UserSession.AreaValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.AreaValues.Count > 1) then
      begin
        for i := 2 to UserSession.AreaValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'STRATUNITS.COUNTRYID = '+''''+UserSession.AreaValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    {unit}
    if UserSession.IncludeUnitValues then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.UnitValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'STRATUNITS.UNITNAME = '+''''+UserSession.UnitValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.UnitValues.Count > 1) then
      begin
        for i := 2 to UserSession.UnitValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'STRATUNITS.UNITNAME = '+''''+UserSession.UnitValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    if UserSession.IncludeDateFromValue then
    begin
      tempStr := 'AND ';
      dmStrat.Query1.SQL.Add(tempStr);
      tempStr := 'STRATUNITS.MINAGE > '+UserSession.DateFromField;
      dmStrat.Query1.SQL.Add(tempStr);
    end;
    if UserSession.IncludeDateToValue then
    begin
      tempStr := 'AND ';
      dmStrat.Query1.SQL.Add(tempStr);
      tempStr := 'STRATUNITS.MAXAGE <= '+ UserSession.DateToField;
      dmStrat.Query1.SQL.Add(tempStr);
    end;
    {reference}
    if UserSession.IncludeReferenceValues then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.ReferenceValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'SOURCELIST.SOURCESHORT = '+''''+UserSession.ReferenceValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.ReferenceValues.Count > 1) then
      begin
        for i := 2 to UserSession.ReferenceValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'SOURCELIST.SOURCESHORT = '+''''+UserSession.ReferenceValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    {validation status}
    if (UserSession.IncludeValidationValues) then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.ValidationValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'STRATVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.ValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.ValidationValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'STRATVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    tempStr := 'AND STRATUNITS.APPROVALID <> '+''''+'HS'+'''';
    dmStrat.Query1.SQL.Add(tempStr);
    tempStr := 'AND STRATUNITS.APPROVALID <> '+''''+'NA'+'''';
    dmStrat.Query1.SQL.Add(tempStr);
    if (UserSession.OrderByValue = '0') then
    begin
      dmStrat.Query1.SQL.Add('ORDER by STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME,STRATUNITS.AGEYEARS');
    end;
    if (UserSession.OrderByValue = '1') then
    begin
      dmStrat.Query1.SQL.Add('ORDER by STRATUNITS.UNITID');
    end;
    if (UserSession.OrderByValue = '2') then
    begin
      dmStrat.Query1.SQL.Add('ORDER by STRATUNITS.AGEYEARS,STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME');
    end;
    if (UserSession.OrderByValue = '3') then
    begin
      dmStrat.Query1.SQL.Add('ORDER by STRATUNITS.PARENTID');
    end;
  end;
end;


procedure TdmStrat.SubmitNewRecord2(var WasSuccessful : boolean);
const
  zero = 0;
begin
end;

procedure TdmStrat.Query1RecordCount;
var
  nRec : integer;
  i : integer;
begin
    UserSession.NumRecordsFound := 0;
    with dmStrat do
    begin
      Query1Rec.Close;
      cdsQuery1Rec.Close;
      Query1Rec.SQL.Text := dmStrat.Query1.SQL.Text;
      cdsQuery1Rec.Open;
    end;
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmStrat.cdsQuery1Rec.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmStrat.cdsQuery1Rec.Delete;
        end;
      end;
    end;
  try
    UserSession.NumRecordsFound := dmStrat.cdsQuery1Rec.RecordCount;
  finally
    dmStrat.cdsQuery1Rec.Close;
  end;
end;

procedure TdmStrat.DeleteRefRecord (var wasSuccessful : boolean);
var
  TD: TTransactionDesc;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteRef start';
  try
    dmStrat.qStratRef.ParamByName('UnitID').AsInteger := dmStrat.cdsRefsUNITID.AsInteger;
    dmStrat.qStratRef.ParamByName('SourceNum').AsInteger := dmStrat.cdsRefsSOURCENUM.AsInteger;
    if not dmStrat.sqlcStrat.InTransaction then
    begin
      TD.TransactionID := 1;
      TD.IsolationLevel := xilREADCOMMITTED;
      dmStrat.sqlcStrat.StartTransaction(TD);
      try
        dmStrat.qStratRef.ExecSQL(false);
        dmStrat.sqlcStrat.Commit(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.Rollback(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    end;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.DeleteDomainRecord (var wasSuccessful : boolean);
var
  TD: TTransactionDesc;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteDomain start';
  try
    dmStrat.qDeleteStratDomain.ParamByName('UnitID').AsInteger := dmStrat.cdsStratDomainUNITID.AsInteger;
    dmStrat.qStratRef.ParamByName('DomainID').AsString := dmStrat.cdsStratDomainDOMAINID.AsString;
    if not dmStrat.sqlcStrat.InTransaction then
    begin
      TD.TransactionID := 1;
      TD.IsolationLevel := xilREADCOMMITTED;
      dmStrat.sqlcStrat.StartTransaction(TD);
      try
        dmStrat.qStratRef.ExecSQL(false);
        dmStrat.sqlcStrat.Commit(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.Rollback(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    end;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

end.
