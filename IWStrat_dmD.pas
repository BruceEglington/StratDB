unit IWStrat_dmD;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  DBXCommon,
  IWCompListbox, WideStrings, Data.DBXFirebird, DbxDevartInterBase;

type
  TdmStratD = class(TDataModule)
    qDeposits: TSQLQuery;
    dspDeposits: TDataSetProvider;
    cdsDeposits: TClientDataSet;
    dsDeposits: TDataSource;
    dsDeposit: TDataSource;
    dsqDeposit: TDataSource;
    qDepositDomains: TSQLQuery;
    dsDepositDomains: TDataSource;
    qDomains: TSQLQuery;
    dspDomains: TDataSetProvider;
    cdsDomains: TClientDataSet;
    dsDomains: TDataSource;
    cdsDomainsDOMAINID: TIntegerField;
    cdsDomainsCONTINENTID: TWideStringField;
    cdsDomainsDOMAINNAME: TWideStringField;
    cdsDomainsSPOTLATITUDE: TFloatField;
    cdsDomainsSPOTLONGITUDE: TFloatField;
    qNewDeposit: TSQLQuery;
    qClans: TSQLQuery;
    dspClans: TDataSetProvider;
    cdsClans: TClientDataSet;
    dsClans: TDataSource;
    qDRep1: TSQLQuery;
    dsqDRep1: TDataSource;
    dspDRep1: TDataSetProvider;
    cdsDRep1: TClientDataSet;
    dsDRep1: TDataSource;
    qOtherDatabases: TSQLQuery;
    dspOtherDatabases: TDataSetProvider;
    cdsOtherDatabases: TClientDataSet;
    dsOtherDatabases: TDataSource;
    cdsDomainsDOMAINPARENTID: TIntegerField;
    cdsDomainsDOMAINTYPEID: TWideStringField;
    qContinents: TSQLQuery;
    qContinentsCONTINENTID: TWideStringField;
    qContinentsCONTINENT: TWideStringField;
    qContinentsDEFAULTDOMAINID: TIntegerField;
    dsContinents: TDataSource;
    cdsContinents: TClientDataSet;
    dspContinents: TDataSetProvider;
    cdsContinentsCONTINENTID: TWideStringField;
    cdsContinentsCONTINENT: TWideStringField;
    cdsContinentsDEFAULTDOMAINID: TIntegerField;
    qDomainsAll: TSQLQuery;
    dspDomainsAll: TDataSetProvider;
    cdsDomainsAll: TClientDataSet;
    dsDomainsAll: TDataSource;
    cdsDomainsAllDOMAINID: TIntegerField;
    cdsDomainsAllCONTINENTID: TWideStringField;
    cdsDomainsAllDOMAINNAME: TWideStringField;
    cdsDomainsAllDOMAINPARENTID: TIntegerField;
    cdsDomainsAllDOMAINTYPEID: TWideStringField;
    cdsDomainsMINPLOTAGE: TFloatField;
    cdsDomainsMAXPLOTAGE: TFloatField;
    cdsDepositsSDBDEPOSITID: TIntegerField;
    cdsDepositsDEPOSITCLANID: TIntegerField;
    cdsDepositsCOUNTRYID: TWideStringField;
    cdsDepositsDEPOSITNAME: TWideStringField;
    cdsClansDEPOSITCLANID: TIntegerField;
    cdsClansDEPOSITCLAN: TWideStringField;
    cdsOtherDatabasesDATBASEID: TIntegerField;
    cdsOtherDatabasesDATABASENAME: TWideStringField;
    cdsOtherDatabasesDESCRIPTION: TBlobField;
    qDepositCommodities: TSQLQuery;
    dsDepositCommodities: TDataSource;
    qDepositCommoditiesSBDEPOSITID: TIntegerField;
    qDepositCommoditiesCOMMODITYID: TWideStringField;
    qDepositCommoditiesCOMMODITY: TWideStringField;
    qDepositDomainsSBDEPOSITID: TIntegerField;
    qDepositDomainsDOMAINID: TIntegerField;
    qDepositDomainsDOMAINNAME: TWideStringField;
    qDepositDomainsCONTINENTID: TWideStringField;
    DepositQuery: TSQLQuery;
    dspDepositQuery: TDataSetProvider;
    cdsDepositQuery: TClientDataSet;
    dsDepositQuery: TDataSource;
    qCountryContinents: TSQLQuery;
    dspCountryContinents: TDataSetProvider;
    cdsCountryContinents: TClientDataSet;
    dsCountryContinents: TDataSource;
    qCountryContinentsCOUNTRYID: TWideStringField;
    qCountryContinentsCOUNTRY: TWideStringField;
    qCountryContinentsCONTINENTID: TWideStringField;
    cdsCountryContinentsCOUNTRYID: TWideStringField;
    cdsCountryContinentsCOUNTRY: TWideStringField;
    cdsCountryContinentsCONTINENTID: TWideStringField;
    DepositQueryRec: TSQLQuery;
    dspDepositQueryRec: TDataSetProvider;
    cdsDepositQueryRec: TClientDataSet;
    cdsDepositQueryRecSDBDEPOSITID: TIntegerField;
    cdsDepositQuerySDBDEPOSITID: TIntegerField;
    cdsDepositQueryCOUNTRYID: TWideStringField;
    cdsDepositQueryDEPOSITNAME: TWideStringField;
    cdsDepositQueryDEPOSITCLAN: TWideStringField;
    cdsDepositQueryDEPLONGITUDE: TFloatField;
    cdsDepositQueryDEPLATITUDE: TFloatField;
    cdsDepositQueryAPPROXAGE: TFloatField;
    cdsDepositQueryAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDepositQueryDATABASENAME: TWideStringField;
    cdsDRep1SDBDEPOSITID: TIntegerField;
    cdsDRep1COUNTRYID: TWideStringField;
    cdsDRep1DEPOSITNAME: TWideStringField;
    cdsDRep1DEPOSITCLAN: TWideStringField;
    cdsDRep1DEPLONGITUDE: TFloatField;
    cdsDRep1DEPLATITUDE: TFloatField;
    cdsDRep1APPROXAGE: TFloatField;
    cdsDRep1APPROXAGEUNCERTAINTY: TFloatField;
    cdsDRep1DATABASENAME: TWideStringField;
    qUnitCountry: TSQLQuery;
    qUnitCountryUNITNAME: TWideStringField;
    qUnitCountryCOUNTRYID: TWideStringField;
    dspUnitCountry: TDataSetProvider;
    cdsUnitCountry: TClientDataSet;
    cdsUnitCountryUNITNAME: TWideStringField;
    cdsUnitCountryCOUNTRYID: TWideStringField;
    dsUnitCountry: TDataSource;
    qUnitCountryUNITID: TIntegerField;
    cdsUnitCountryUNITID: TIntegerField;
    qHostUnitAge: TSQLQuery;
    dsHostUnitAge: TDataSource;
    qHostUnitAgeMINAGE: TFloatField;
    qHostUnitAgeMAXAGE: TFloatField;
    qDeleteDomainLink: TSQLQuery;
    qDefaultDomains: TSQLQuery;
    dspDefaultDomains: TDataSetProvider;
    cdsDefaultDomains: TClientDataSet;
    dsDefaultDomains: TDataSource;
    cdsDefaultDomainsDOMAINID: TIntegerField;
    cdsDefaultDomainsCONTINENTID: TWideStringField;
    cdsDefaultDomainsDOMAINNAME: TWideStringField;
    sqlcStrat: TSQLConnection;
    qDepositFor: TSQLQuery;
    dsDepositFor: TDataSource;
    qDepositForSDBDEPOSITID: TIntegerField;
    qDepositForWHOFORID: TWideStringField;
    qDepositForINC4CHTYN: TWideStringField;
    qDepositForWHOFOR: TWideStringField;
    qDepositCommoditiesCOMMODITYGRADE: TFloatField;
    qDepositCommoditiesGRADEUNITID: TWideStringField;
    qDepositCommoditiesGRADEUNIT: TWideStringField;
    qGradeUnits: TSQLQuery;
    dspGradeUnits: TDataSetProvider;
    cdsGradeUnits: TClientDataSet;
    dsGradeUnits: TDataSource;
    cdsGradeUnitsGRADEID: TWideStringField;
    cdsGradeUnitsGRADEUNIT: TWideStringField;
    qDeposit: TSQLQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TWideStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField2: TWideStringField;
    StringField3: TWideStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField4: TWideStringField;
    dspDeposit: TDataSetProvider;
    cdsDeposit: TClientDataSet;
    cdsDepositSDBDEPOSITID: TIntegerField;
    cdsDepositDEPOSITCLANID: TIntegerField;
    cdsDepositDATABASEID: TIntegerField;
    cdsDepositDEPOSITNAME: TWideStringField;
    cdsDepositDEPLATITUDE: TFloatField;
    cdsDepositDEPLONGITUDE: TFloatField;
    cdsDepositAPPROXAGE: TFloatField;
    cdsDepositAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDepositCOUNTRYID: TWideStringField;
    cdsDepositCONTINENTID: TWideStringField;
    cdsDepositHOSTUNITID: TIntegerField;
    cdsDepositDEPOSITIDINT: TIntegerField;
    cdsDepositDEPOSITIDSTR: TWideStringField;
    cdsDepositqDepositFor: TDataSetField;
    cdsDepositqHostUnitAge: TDataSetField;
    cdsDepositqDepositCommodities: TDataSetField;
    cdsDepositqDepositDomains: TDataSetField;
    qDeleteDepositCommodityLink: TSQLQuery;
    qCommodities: TSQLQuery;
    dspCommodities: TDataSetProvider;
    cdsCommodities: TClientDataSet;
    dsCommodities: TDataSource;
    cdsCommoditiesCOMMODITYID: TWideStringField;
    cdsCommoditiesCOMMODITY: TWideStringField;
    qTest: TSQLQuery;
    dspTest: TDataSetProvider;
    cdsTest: TClientDataSet;
    dsTest: TDataSource;
    cdsTestCOMMODITYID: TWideStringField;
    cdsTestCOMMODITY: TWideStringField;
    cdsDepositDomains: TClientDataSet;
    cdsDepositCommodities: TClientDataSet;
    cdsHostUnitAge: TClientDataSet;
    cdsDepositFor: TClientDataSet;
    cdsDepositDomainsSBDEPOSITID: TIntegerField;
    cdsDepositDomainsDOMAINID: TIntegerField;
    cdsDepositDomainsDOMAINNAME: TWideStringField;
    cdsDepositDomainsCONTINENTID: TWideStringField;
    cdsDepositCommoditiesSBDEPOSITID: TIntegerField;
    cdsDepositCommoditiesCOMMODITYID: TWideStringField;
    cdsDepositCommoditiesCOMMODITY: TWideStringField;
    cdsDepositCommoditiesCOMMODITYGRADE: TFloatField;
    cdsDepositCommoditiesGRADEUNITID: TWideStringField;
    cdsDepositCommoditiesGRADEUNIT: TWideStringField;
    cdsHostUnitAgeMINAGE: TFloatField;
    cdsHostUnitAgeMAXAGE: TFloatField;
    cdsDepositForSDBDEPOSITID: TIntegerField;
    cdsDepositForWHOFORID: TWideStringField;
    cdsDepositForINC4CHTYN: TWideStringField;
    cdsDepositForWHOFOR: TWideStringField;
    qDepositIAPPROXAGE: TFloatField;
    cdsDepositIAPPROXAGE: TFloatField;
    qDepositCommoditiesOnly: TSQLQuery;
    dspDepositCommoditiesOnly: TDataSetProvider;
    cdsDepositCommoditiesOnly: TClientDataSet;
    dsDepositCommoditiesOnly: TDataSource;
    qDepositCommoditiesOnlySBDEPOSITID: TIntegerField;
    qDepositCommoditiesOnlyCOMMODITYID: TWideStringField;
    qDepositCommoditiesOnlyCOMMODITY: TWideStringField;
    qDepositCommoditiesOnlyCOMMODITYGRADE: TFloatField;
    qDepositCommoditiesOnlyGRADEUNITID: TWideStringField;
    qDepositCommoditiesOnlyGRADEUNIT: TWideStringField;
    cdsDepositCommoditiesOnlySBDEPOSITID: TIntegerField;
    cdsDepositCommoditiesOnlyCOMMODITYID: TWideStringField;
    cdsDepositCommoditiesOnlyCOMMODITY: TWideStringField;
    cdsDepositCommoditiesOnlyCOMMODITYGRADE: TFloatField;
    cdsDepositCommoditiesOnlyGRADEUNITID: TWideStringField;
    cdsDepositCommoditiesOnlyGRADEUNIT: TWideStringField;
    qDepositCommoditiesOnlyDEPOSITNAME: TWideStringField;
    cdsDepositCommoditiesOnlyDEPOSITNAME: TWideStringField;
    qDatingTypes: TSQLQuery;
    qGeodynamicSettings: TSQLQuery;
    dspGeodynamicSettings: TDataSetProvider;
    cdsGeodynamicSettings: TClientDataSet;
    dsGeodynamicSettings: TDataSource;
    dsDatingTypes: TDataSource;
    cdsDatingTypes: TClientDataSet;
    dspDatingTypes: TDataSetProvider;
    qDepositGEODYNAMICID: TIntegerField;
    qDepositDEPOSITPARENTID: TIntegerField;
    qDepositDATINGTYPEID: TIntegerField;
    cdsDepositGEODYNAMICID: TIntegerField;
    cdsDepositDEPOSITPARENTID: TIntegerField;
    cdsDepositDATINGTYPEID: TIntegerField;
    cdsDatingTypesDATINGTYPEID: TIntegerField;
    cdsDatingTypesDATINGTYPE: TWideStringField;
    cdsGeodynamicSettingsGEODYNAMICID: TIntegerField;
    cdsGeodynamicSettingsGEODYNAMICSETTING: TWideStringField;
    qSubDeposits: TSQLQuery;
    cdsSubDeposits: TClientDataSet;
    dsSubDeposits: TDataSource;
    qSubDepositsSDBDEPOSITID: TIntegerField;
    qSubDepositsDEPOSITNAME: TWideStringField;
    qSubDepositsDEPOSITCLANID: TIntegerField;
    cdsDepositqSubDeposits: TDataSetField;
    cdsSubDepositsSDBDEPOSITID: TIntegerField;
    cdsSubDepositsDEPOSITNAME: TWideStringField;
    cdsSubDepositsDEPOSITCLANID: TIntegerField;
    qSubDepositsAPPROXAGE: TFloatField;
    qSubDepositsAPPROXAGEUNCERTAINTY: TFloatField;
    cdsSubDepositsAPPROXAGE: TFloatField;
    cdsSubDepositsAPPROXAGEUNCERTAINTY: TFloatField;
    qDRep2: TSQLQuery;
    dsqDRep2: TDataSource;
    cdsDRep2: TClientDataSet;
    dsDRep2: TDataSource;
    cdsDRep1qDRep2: TDataSetField;
    cdsDRep2SDBDEPOSITID: TIntegerField;
    cdsDRep2COUNTRYID: TWideStringField;
    cdsDRep2DEPOSITNAME: TWideStringField;
    cdsDRep2DEPOSITCLAN: TWideStringField;
    cdsDRep2DEPLONGITUDE: TFloatField;
    cdsDRep2DEPLATITUDE: TFloatField;
    cdsDRep2APPROXAGE: TFloatField;
    cdsDRep2APPROXAGEUNCERTAINTY: TFloatField;
    cdsDRep2DATABASENAME: TWideStringField;
    cdsDRep1DATINGTYPE: TWideStringField;
    cdsDRep1GEODYNAMICSETTING: TWideStringField;
    cdsDRep1DEPOSITPARENTID: TIntegerField;
    cdsDRep2DATINGTYPE: TWideStringField;
    cdsDRep2GEODYNAMICSETTING: TWideStringField;
    cdsDRep2DEPOSITPARENTID: TIntegerField;
    cdsDepositQueryDEPOSITPARENTID: TIntegerField;
    cdsDepositQueryDATINGTYPE: TWideStringField;
    cdsDepositQueryGEODYNAMICSETTING: TWideStringField;
    qDepositStatus: TSQLQuery;
    dspDepositStatus: TDataSetProvider;
    cdsDepositStatus: TClientDataSet;
    dsDepositStatus: TDataSource;
    cdsDepositStatusDEPOSITSTATUSID: TIntegerField;
    cdsDepositStatusDEPOSITSTATUS: TWideStringField;
    qValidFull: TSQLQuery;
    dspValidFull: TDataSetProvider;
    cdsValidFull: TClientDataSet;
    dsValidFull: TDataSource;
    cdsValidFullSDBDEPOSITID: TIntegerField;
    cdsValidFullVALIDSTATUSID: TWideStringField;
    cdsValidFullDATEDONE: TSQLTimeStampField;
    cdsValidFullDONEBY: TWideStringField;
    cdsValidFullCOMMENTS: TBlobField;
    qDepositComment: TSQLQuery;
    cdsDepositComment: TClientDataSet;
    dsDepositComment: TDataSource;
    qDepositCommentSDBDEPOSITID: TIntegerField;
    qDepositCommentDEPOSITCOMMENT: TBlobField;
    cdsDepositCommentSDBDEPOSITID: TIntegerField;
    cdsDepositCommentDEPOSITCOMMENT: TBlobField;
    qDepositDEPOSITSTATUSID: TIntegerField;
    cdsDepositDEPOSITSTATUSID: TIntegerField;
    cdsDepositqDepositComment: TDataSetField;
    qValid: TSQLQuery;
    cdsValid: TClientDataSet;
    dsValid: TDataSource;
    cdsDepositqValid: TDataSetField;
    qValidSDBDEPOSITID: TIntegerField;
    qValidVALIDSTATUSID: TWideStringField;
    qValidDATEDONE: TSQLTimeStampField;
    qValidDONEBY: TWideStringField;
    qValidVALIDATIONSTATUS: TWideStringField;
    cdsValidSDBDEPOSITID: TIntegerField;
    cdsValidVALIDSTATUSID: TWideStringField;
    cdsValidDATEDONE: TSQLTimeStampField;
    cdsValidDONEBY: TWideStringField;
    cdsValidVALIDATIONSTATUS: TWideStringField;
    qRefs: TSQLQuery;
    cdsRefs: TClientDataSet;
    dsRefs: TDataSource;
    qRefsSDBDEPOSITID: TIntegerField;
    qRefsSOURCENUM: TIntegerField;
    qRefsSOURCESHORT: TWideStringField;
    qRefsSOURCEYEAR: TIntegerField;
    qRefsCONTINENTID: TWideStringField;
    cdsDepositqRefs: TDataSetField;
    cdsRefsSDBDEPOSITID: TIntegerField;
    cdsRefsSOURCENUM: TIntegerField;
    cdsRefsSOURCESHORT: TWideStringField;
    cdsRefsSOURCEYEAR: TIntegerField;
    cdsRefsCONTINENTID: TWideStringField;
    qDepRef: TSQLQuery;
    qInsertLink: TSQLQuery;
    qDepCommodities: TSQLQuery;
    dsqDepCommodities: TDataSource;
    dspDepCommodities: TDataSetProvider;
    cdsDepCommodities: TClientDataSet;
    cdsDepCommoditiesSDBDEPOSITID: TIntegerField;
    cdsDepCommoditiesDEPOSITNAME: TWideStringField;
    cdsDepCommoditiesDEPOSITPARENTID: TIntegerField;
    cdsDepCommoditiesDEPOSITCLANID: TIntegerField;
    cdsDepCommoditiesDEPLONGITUDE: TFloatField;
    cdsDepCommoditiesDEPLATITUDE: TFloatField;
    cdsDepCommoditiesAPPROXAGE: TFloatField;
    cdsDepCommoditiesAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDepCommoditiesDATINGTYPEID: TIntegerField;
    cdsDepCommoditiesDATABASEID: TIntegerField;
    cdsDepCommoditiesCOUNTRYID: TWideStringField;
    cdsDepCommoditiesGEODYNAMICID: TIntegerField;
    cdsDepCommoditiesHOSTUNITID: TIntegerField;
    cdsDepCommoditiesAPPROXSTRATAGE: TFloatField;
    cdsDepCommoditiesAPPROXSTRATAGEUNCERTAINTY: TFloatField;
    cdsDepCommoditiesDEPOSITSTATUSID: TIntegerField;
    cdsDepCommoditiesqCom0: TDataSetField;
    cdsDepCommoditiesqCom7: TDataSetField;
    cdsDepCommoditiesqCom8: TDataSetField;
    cdsDepCommoditiesqCom9: TDataSetField;
    cdsDepCommoditiesqCom4: TDataSetField;
    cdsDepCommoditiesqCom5: TDataSetField;
    cdsDepCommoditiesqCom6: TDataSetField;
    cdsDepCommoditiesqCom3: TDataSetField;
    cdsDepCommoditiesqCom2: TDataSetField;
    cdsDepCommoditiesqCom1: TDataSetField;
    cdsDepCommoditiesDEPOSITCLAN: TWideStringField;
    dsDepCommodities: TDataSource;
    qCom0: TSQLQuery;
    cdsCom0: TClientDataSet;
    cdsCom0SBDEPOSITID: TIntegerField;
    cdsCom0COMMODITYID: TWideStringField;
    cdsCom0COMMODITYGRADE: TFloatField;
    cdsCom0GRADEUNITID: TWideStringField;
    cdsCom0GRADEUNIT: TWideStringField;
    cdsCom0COMMODITY: TWideStringField;
    dsCom0: TDataSource;
    qCom1: TSQLQuery;
    cdsCom1: TClientDataSet;
    cdsCom1SBDEPOSITID: TIntegerField;
    cdsCom1COMMODITYORDER: TIntegerField;
    cdsCom1COMMODITYID: TWideStringField;
    cdsCom1COMMODITYGRADE: TFloatField;
    cdsCom1GRADEUNITID: TWideStringField;
    cdsCom1GRADEUNIT: TWideStringField;
    cdsCom1COMMODITY: TWideStringField;
    dsCom1: TDataSource;
    qCom2: TSQLQuery;
    cdsCom2: TClientDataSet;
    cdsCom2SBDEPOSITID: TIntegerField;
    cdsCom2COMMODITYORDER: TIntegerField;
    cdsCom2COMMODITYID: TWideStringField;
    cdsCom2COMMODITYGRADE: TFloatField;
    cdsCom2GRADEUNITID: TWideStringField;
    cdsCom2GRADEUNIT: TWideStringField;
    cdsCom2COMMODITY: TWideStringField;
    dsCom2: TDataSource;
    qCom3: TSQLQuery;
    cdsCom3: TClientDataSet;
    cdsCom3SBDEPOSITID: TIntegerField;
    cdsCom3COMMODITYORDER: TIntegerField;
    cdsCom3COMMODITYID: TWideStringField;
    cdsCom3COMMODITYGRADE: TFloatField;
    cdsCom3GRADEUNITID: TWideStringField;
    cdsCom3GRADEUNIT: TWideStringField;
    cdsCom3COMMODITY: TWideStringField;
    dsCom3: TDataSource;
    qCom4: TSQLQuery;
    cdsCom4: TClientDataSet;
    cdsCom4SBDEPOSITID: TIntegerField;
    cdsCom4COMMODITYORDER: TIntegerField;
    cdsCom4COMMODITYID: TWideStringField;
    cdsCom4COMMODITYGRADE: TFloatField;
    cdsCom4GRADEUNITID: TWideStringField;
    cdsCom4GRADEUNIT: TWideStringField;
    cdsCom4COMMODITY: TWideStringField;
    dsCom4: TDataSource;
    qCom5: TSQLQuery;
    cdsCom5: TClientDataSet;
    dsCom5: TDataSource;
    qCom6: TSQLQuery;
    cdsCom6: TClientDataSet;
    cdsCom6SBDEPOSITID: TIntegerField;
    cdsCom6COMMODITYORDER: TIntegerField;
    cdsCom6COMMODITYID: TWideStringField;
    cdsCom6COMMODITYGRADE: TFloatField;
    cdsCom6GRADEUNITID: TWideStringField;
    cdsCom6GRADEUNIT: TWideStringField;
    cdsCom6COMMODITY: TWideStringField;
    dsCom6: TDataSource;
    qCom7: TSQLQuery;
    cdsCom7: TClientDataSet;
    cdsCom7SBDEPOSITID: TIntegerField;
    cdsCom7COMMODITYORDER: TIntegerField;
    cdsCom7COMMODITYID: TWideStringField;
    cdsCom7COMMODITYGRADE: TFloatField;
    cdsCom7GRADEUNITID: TWideStringField;
    cdsCom7GRADEUNIT: TWideStringField;
    cdsCom7COMMODITY: TWideStringField;
    dsCom7: TDataSource;
    qCom8: TSQLQuery;
    cdsCom8: TClientDataSet;
    dsCom8: TDataSource;
    qCom9: TSQLQuery;
    cdsCom9: TClientDataSet;
    cdsCom9SBDEPOSITID: TIntegerField;
    cdsCom9COMMODITYORDER: TIntegerField;
    cdsCom9COMMODITYID: TWideStringField;
    cdsCom9COMMODITYGRADE: TFloatField;
    cdsCom9GRADEUNITID: TWideStringField;
    cdsCom9GRADEUNIT: TWideStringField;
    cdsCom9COMMODITY: TWideStringField;
    dsCom9: TDataSource;
    cdsDRep1DEPOSITSTATUS: TWideStringField;
    cdsDRep2DEPOSITSTATUS: TWideStringField;
    cdsDepCommoditiesDEPOSITSTATUS: TWideStringField;
    cdsDepositQueryDEPOSITSTATUS: TWideStringField;
    cdsCom0COMMODITYASSOCIATION: TWideStringField;
    cdsCom0COMMODITYASSOCID: TIntegerField;
    cdsCom0COMMODITYORDER: TIntegerField;
    cdsCom1COMMODITYASSOCIATION: TWideStringField;
    cdsCom1COMMODITYASSOCID: TIntegerField;
    cdsCom2COMMODITYASSOCIATION: TWideStringField;
    cdsCom2COMMODITYASSOCID: TIntegerField;
    cdsCom3COMMODITYASSOCIATION: TWideStringField;
    cdsCom3COMMODITYASSOCID: TIntegerField;
    cdsCom4COMMODITYASSOCIATION: TWideStringField;
    cdsCom4COMMODITYASSOCID: TIntegerField;
    cdsCom5SBDEPOSITID: TIntegerField;
    cdsCom5COMMODITYASSOCIATION: TWideStringField;
    cdsCom5COMMODITYASSOCID: TIntegerField;
    cdsCom5COMMODITYORDER: TIntegerField;
    cdsCom5COMMODITYID: TWideStringField;
    cdsCom5COMMODITY: TWideStringField;
    cdsCom5COMMODITYGRADE: TFloatField;
    cdsCom5GRADEUNITID: TWideStringField;
    cdsCom5GRADEUNIT: TWideStringField;
    cdsCom6COMMODITYASSOCIATION: TWideStringField;
    cdsCom6COMMODITYASSOCID: TIntegerField;
    cdsCom7COMMODITYASSOCIATION: TWideStringField;
    cdsCom7COMMODITYASSOCID: TIntegerField;
    cdsCom8SBDEPOSITID: TIntegerField;
    cdsCom8COMMODITYASSOCIATION: TWideStringField;
    cdsCom8COMMODITYASSOCID: TIntegerField;
    cdsCom8COMMODITYORDER: TIntegerField;
    cdsCom8COMMODITYID: TWideStringField;
    cdsCom8COMMODITY: TWideStringField;
    cdsCom8COMMODITYGRADE: TFloatField;
    cdsCom8GRADEUNITID: TWideStringField;
    cdsCom8GRADEUNIT: TWideStringField;
    cdsCom9COMMODITYASSOCIATION: TWideStringField;
    cdsCom9COMMODITYASSOCID: TIntegerField;
    qCommodityAssociation: TSQLQuery;
    cdsCommodityAssociation: TClientDataSet;
    dsCommodityAssociation: TDataSource;
    qCommodityAssociationCOMMODITYASSOCIATIONID: TIntegerField;
    cdsDepositqCommodityAssociation: TDataSetField;
    cdsCommodityAssociationCOMMODITYASSOCIATIONID: TIntegerField;
    qCommodityAssociations: TSQLQuery;
    dspCommodityAssociations: TDataSetProvider;
    cdsCommodityAssociations: TClientDataSet;
    dsCommodityAssociations: TDataSource;
    cdsCommodityAssociationsCOMMODITYASSOCID: TIntegerField;
    cdsCommodityAssociationsCOMMODITYASSOCIATION: TWideStringField;
    SQLMonitor1: TSQLMonitor;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    function GetCurrent_Date: variant;
    function GetCurrentDate: variant;
  public
    procedure SubmitDepositQuery;
    procedure ConstructDepositQuery;
    procedure DepositQueryRecordCount;
    procedure InsertDomainDepositLink (var wasSuccessful : boolean);
    procedure DeleteDomainRecord (var wasSuccessful : boolean);
    procedure DeleteDepositCommodityLink (var wasSuccessful : boolean);
    procedure InsertDepositCommodityLink (var wasSuccessful : boolean);
    procedure DeleteRefRecord (var wasSuccessful : boolean);
    procedure InsertReferenceLink (var wasSuccessful : boolean);
  published
    property Current_Date: variant read GetCurrent_Date;
    property CurrentDate: variant read GetCurrentDate;
  end;

// Procs
  function dmStratD: TdmStratD;

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


{
SELECT DEPOSITVALID.SDBDEPOSITID, DEPOSITVALID.VALIDSTATUSID,
  DEPOSITVALID.DATEDONE, DEPOSITVALID.DONEBY,
  VALIDATIONSTATUS.VALIDATIONSTATUS
FROM DEPOSITVALID, VALIDATIONSTATUS
WHERE DEPOSITVALID.SDBDEPOSITID = :DepositID
AND DEPOSITVALID.VALIDSTATUSID=VALIDATIONSTATUS.VALIDSTATUSID
ORDER BY DEPOSITVALID.VALIDSTATUSID
}

function dmStratD: TdmStratD;
begin
  Result := TUserSession(WebApplication.Data).dmStratD;
end;


procedure TdmStratD.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

function TdmStratD.GetCurrent_Date: variant;
begin
  Result:=dmUser.GetUTCDateTime;
end;

function TdmStratD.GetCurrentDate: variant;
begin
  Result:= double(dmUser.GetUTCDateTime); //Dates should be passed as numbers, and the corresponding cell in excel have Date format.
end;

procedure TdmStratD.SubmitDepositQuery;
begin
  ConstructDepositQuery;
  //UserSession.SQLMemoField.Text := dmStratD.DepositQuery.SQL.Text;
  //dmUser.SetDeveloperData(dmStratD.DepositQuery.SQL.Text);
  dmUser.SetFormData2(dmStratD.DepositQuery.SQL.Text);
end;

procedure TdmStratD.ConstructDepositQuery;
var
  i : integer;
  iCode : integer;
  tempStr : string;
  FromDate, ToDate : double;
begin
  if (UserSession.IncludeClanValues and (UserSession.ClanValues.Count=0)) then
  begin
    UserSession.IncludeClanValues := false;
  end;
  if (UserSession.IncludeAreaValues and (UserSession.AreaValues.Count=0)) then
  begin
    UserSession.IncludeAreaValues := false;
  end;
  if (UserSession.IncludeDepositValues and (UserSession.DepositValues.Count=0)) then
  begin
    UserSession.IncludeDepositValues := false;
  end;
  if (UserSession.IncludeCommodityValues and (UserSession.CommodityValues.Count=0)) then
  begin
    UserSession.IncludeCommodityValues := false;
  end;
  if (UserSession.IncludeDepositStatusValues and (UserSession.DepositStatusValues.Count=0)) then
  begin
    UserSession.IncludeDepositStatusValues := false;
  end;
  if (UserSession.IncludeValidationValues and (UserSession.ValidationValues.Count=0)) then
  begin
    UserSession.IncludeValidationValues := false;
  end;
  dmStratD.cdsDepositQuery.Close;
  dmStratD.DepositQuery.Close;
  dmStratD.DepositQuery.SQL.Clear;
  dmStratD.DepositQuery.SQL.Add('SELECT DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.DEPOSITCLANID,');
  dmStratD.DepositQuery.SQL.Add('  DEPOSITS.DEPOSITNAME,');
  dmStratD.DepositQuery.SQL.Add('  DEPOSITCLANS.DEPOSITCLAN, DEPOSITS.COUNTRYID,');
  dmStratD.DepositQuery.SQL.Add('  DEPOSITS.APPROXAGE, DEPOSITS.APPROXAGEUNCERTAINTY,');
  dmStratD.DepositQuery.SQL.Add('  DEPOSITS.DEPLATITUDE, DEPOSITS.DEPLONGITUDE,');
  dmStratD.DepositQuery.SQL.Add('  DATINGTYPES.DATINGTYPE, GEODYNAMICSETTINGS.GEODYNAMICSETTING,DEPOSITSTATI.DEPOSITSTATUS,');
  dmStratD.DepositQuery.SQL.Add('  OTHERDATABASES.DATABASENAME, DEPOSITS.DEPOSITPARENTID');
  dmStratD.DepositQuery.SQL.Add('FROM DEPOSITS, DEPOSITCLANS, OTHERDATABASES,DATINGTYPES,GEODYNAMICSETTINGS,DEPOSITFOR,USERSWHOFOR,DEPOSITSTATI');
  if (UserSession.IncludeContinentValues) then
  begin
    dmStratD.DepositQuery.SQL.Add(' ,COUNTRIES');
  end;
  if (UserSession.IncludeCommodityValues) then
  begin
    dmStratD.DepositQuery.SQL.Add(' ,DEPOSITCOMMODITIES');
  end;
  if UserSession.IncludeValidationValues then
  begin
    dmStratD.DepositQuery.SQL.Add(',STRATVALID ');
  end;
  dmStratD.DepositQuery.SQL.Add('WHERE USERSWHOFOR.USERID = :UserID ');
  dmStratD.DepositQuery.SQL.Add('AND USERSWHOFOR.WHOFORID=DEPOSITFOR.WHOFORID ');
  dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.SDBDEPOSITID=DEPOSITFOR.SDBDEPOSITID ');
  dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID ');
  dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID ');
  dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.DATINGTYPEID=DATINGTYPES.DATINGTYPEID ');
  dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.GEODYNAMICID=GEODYNAMICSETTINGS.GEODYNAMICID ');
  dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.DEPOSITSTATUSID=DEPOSITSTATI.DEPOSITSTATUSID ');
  if (not UserSession.IncludeAllParentIDs) then
  begin
    dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.DEPOSITPARENTID = 0');
  end;
  if UserSession.IncludeValidationValues then
  begin
    dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.SDBDEPOSITID = DEPOSITVALID.SDBDEPOSITID ');
  end;
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
  if UserSession.IncludeDateFromValue then
  begin
    tempStr := 'AND ';
    dmStratD.DepositQuery.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE >= '+UserSession.DateFromField;
    dmStratD.DepositQuery.SQL.Add(tempStr);
  end;
  if UserSession.IncludeDateToValue then
  begin
    tempStr := 'AND ';
    dmStratD.DepositQuery.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE <= '+ UserSession.DateToField;
    dmStratD.DepositQuery.SQL.Add(tempStr);
  end;
  {Continents}
  if (UserSession.IncludeContinentValues) then
  begin
    dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.COUNTRYID = COUNTRIES.COUNTRYID');
    dmStratD.DepositQuery.SQL.Add('AND ( COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStratD.DepositQuery.SQL.Add('OR COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.DepositQuery.SQL.Add(' ) ');
  end;
  {Clans}
  if (UserSession.IncludeClanValues) then
  begin
    dmStratD.DepositQuery.SQL.Add('AND ( DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[0]+'''');
    if (UserSession.ClanValues.Count >1) then
    begin
      for i := 2 to UserSession.ClanValues.Count do
      begin
        dmStratD.DepositQuery.SQL.Add('OR DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.DepositQuery.SQL.Add(' ) ');
  end;
  {Countries}
  if (UserSession.IncludeAreaValues) then
  begin
    dmStratD.DepositQuery.SQL.Add('AND ( DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmStratD.DepositQuery.SQL.Add('OR DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.DepositQuery.SQL.Add(' ) ');
  end;
  {Deposits}
  if (UserSession.IncludeDepositValues) then
  begin
    dmStratD.DepositQuery.SQL.Add('AND ( DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[0]+'''');
    if (UserSession.DepositValues.Count >1) then
    begin
      for i := 2 to UserSession.DepositValues.Count do
      begin
        dmStratD.DepositQuery.SQL.Add('OR DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.DepositQuery.SQL.Add(' ) ');
  end;
  {Commodities}
  if (UserSession.IncludeCommodityValues) then
  begin
    dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.SDBDEPOSITID = DEPOSITCOMMODITIES.SBDEPOSITID ');
    dmStratD.DepositQuery.SQL.Add('AND ( DEPOSITCOMMODITIES.COMMODITYID = '+''''+UserSession.CommodityValues.Strings[0]+'''');
    if (UserSession.CommodityValues.Count >1) then
    begin
      for i := 2 to UserSession.CommodityValues.Count do
      begin
        dmStratD.DepositQuery.SQL.Add('OR DEPOSITCOMMODITIES.COMMODITYID = '+''''+UserSession.CommodityValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.DepositQuery.SQL.Add(' ) ');
  end;
  {DepositStatus}
  if (UserSession.IncludeDepositStatusValues) then
  begin
    dmStratD.DepositQuery.SQL.Add('AND ( DEPOSITS.DEPOSITSTATUSID = '+''''+UserSession.DepositStatusValues.Strings[0]+'''');
    if (UserSession.DepositStatusValues.Count >1) then
    begin
      for i := 2 to UserSession.DepositStatusValues.Count do
      begin
        dmStratD.DepositQuery.SQL.Add('OR DEPOSITS.DEPOSITSTATUSID = '+''''+UserSession.DepositStatusValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.DepositQuery.SQL.Add(' ) ');
  end;
    {validation status}
    if (UserSession.IncludeValidationValues) then
    begin
      dmStratD.DepositQuery.SQL.Add('AND ');
      if ((UserSession.ValidationValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStratD.DepositQuery.SQL.Add(tempStr);
      end;
      tempStr := 'DEPOSITVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[0]+'''';
      dmStratD.DepositQuery.SQL.Add(tempStr);
      if (UserSession.ValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.ValidationValues.Count do
        begin
          dmStratD.DepositQuery.SQL.Add('OR ');
          tempStr := 'DEPOSITVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[i-1]+'''';
          dmStratD.DepositQuery.SQL.Add(tempStr);
        end;
        dmStratD.DepositQuery.SQL.Add(') ');
      end;
    end;
  if (UserSession.OrderByValue = '0') then
  begin
    dmStratD.DepositQuery.SQL.Add('ORDER by DEPOSITS.DEPOSITNAME');
  end;
  if (UserSession.OrderByValue = '1') then
  begin
    dmStratD.DepositQuery.SQL.Add('ORDER by DEPOSITS.COUNTRYID,DEPOSITS.DEPOSITNAME');
  end;
  if (UserSession.OrderByValue = '2') then
  begin
    dmStratD.DepositQuery.SQL.Add('ORDER by DEPOSITS.DEPOSITCLANID,DEPOSITS.COUNTRYID,DEPOSITS.DEPOSITNAME');
  end;
  if (UserSession.OrderByValue = '3') then
  begin
    if (UserSession.IncludeCommodityValues) then
    begin
      dmStratD.DepositQuery.SQL.Add('ORDER by DEPOSITCOMMODITIES.COMMODITYID');
    end;
  end;
  //dmUser.SetDeveloperData(dmStratD.DepositQuery.SQL.Text);
end;

procedure TdmStratD.DepositQueryRecordCount;
var
  nRec : integer;
  i : integer;
begin
    UserSession.NumRecordsFound := 0;
    with dmStratD do
    begin
      DepositQueryRec.Close;
      cdsDepositQueryRec.Close;
      DepositQueryRec.SQL.Text := dmStratD.DepositQuery.SQL.Text;
      DepositQueryRec.ParamByName('UserID').AsString := UserSession.UserID;
      cdsDepositQueryRec.Open;
    end;
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmStratD.cdsDepositQueryRec.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmStratD.cdsDepositQueryRec.Delete;
        end;
      end;
    end;
  try
    UserSession.NumRecordsFound := dmStratD.cdsDepositQueryRec.RecordCount;
  finally
    dmStratD.cdsDepositQueryRec.Close;
  end;
end;

procedure TdmStratD.InsertDomainDepositLink (var wasSuccessful : boolean);
var
  TD : TDBXTransaction;
  tmpDomainID : integer;
begin
  WasSuccessful := true;
  dmStratD.qDefaultDomains.Close;
  dmStratD.qDefaultDomains.ParamByName('ContinentID').AsString := dmStratD.cdsDepositCONTINENTID.AsString;
  dmStratD.cdsDefaultDomains.Close;
  dmStratD.cdsDefaultDomains.Open;
  tmpDomainID := dmStratD.cdsDefaultDomainsDOMAINID.AsInteger;
  UserSession.WhereAmI := 'InsertDomainDepositLink start';
  dmStratD.cdsDefaultDomains.Close;
  try
    dmStratD.qInsertLink.Close;
    dmStratD.qInsertLink.SQL.Clear;
    dmStratD.qInsertLink.SQL.Add('INSERT INTO DOMAINDEPOSITS');
    dmStratD.qInsertLink.SQL.Add('(DomainID, SBDepositID)');
    dmStratD.qInsertLink.SQL.Add('Values (:DomainID, :SBDepositID)');
    dmStratD.qInsertLink.ParamByName('DomainID').AsInteger := tmpDomainID;
    dmStratD.qInsertLink.ParamByName('SBDepositID').AsInteger := dmStratD.cdsDepositSDBDEPOSITID.AsInteger;
    {
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmStrat.qInsertLink.SQL.Text);
    end;
    }
    //if not dmStratD.sqlcStrat.InTransaction then
    //begin
      TD := dmStratD.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratD.qInsertLink.ExecSQL(false);
        dmStratD.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratD.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStratD.DeleteDomainRecord (var wasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteDomain start';
  try
    dmStratD.qDeleteDomainLink.ParamByName('SBDepositID').AsInteger := dmStratD.cdsDepositDomainsSBDEPOSITID.AsInteger;
    dmStratD.qDeleteDomainLink.ParamByName('DomainID').AsString := dmStratD.cdsDepositDomainsDOMAINID.AsString;
    //if not dmStratD.sqlcStrat.InTransaction then
    //begin
      TD := dmStratD.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratD.qDeleteDomainLink.ExecSQL(false);
        dmStratD.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratD.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStratD.DeleteDepositCommodityLink (var wasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteDepositCommodityLink start';
  try
    dmStratD.qDeleteDepositCommodityLink.ParamByName('SBDepositID').AsInteger := dmStratD.cdsDepositCommoditiesSBDEPOSITID.AsInteger;
    dmStratD.qDeleteDepositCommodityLink.ParamByName('CommodityID').AsString := dmStratD.cdsDepositCommoditiesCOMMODITYID.AsString;
    //if not dmStratD.sqlcStrat.InTransaction then
    //begin
      TD := dmStratD.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratD.qDeleteDepositCommodityLink.ExecSQL(false);
        dmStratD.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratD.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStratD.InsertDepositCommodityLink (var wasSuccessful : boolean);
var
  TD : TDBXTransaction;
  tmpOrder, n : integer;
begin
  WasSuccessful := true;
  //tmpOrder := 100;
  //n := dmStratD.cdsDepositCommodities.RecordCount;
  //dmStratD.cdsDepositCommodities.Last;
  //if (n > 0) then tmpOrder := dmStratD.cdsDepositCommoditiesCOMMODITYORDER.AsInteger + 1
  //           else tmpOrder := 1;
  //need to code to find next available order integer
  UserSession.WhereAmI := 'InsertDepositCommodityLink start';
  dmStratD.cdsDefaultDomains.Close;
  try
    dmStratD.qInsertLink.Close;
    dmStratD.qInsertLink.SQL.Clear;
    dmStratD.qInsertLink.SQL.Add('INSERT INTO DEPOSITCOMMODITIES');
    dmStratD.qInsertLink.SQL.Add('(SBDepositID,CommodityID,CommodityGrade,GradeUnitID)');
    dmStratD.qInsertLink.SQL.Add('Values (:SBDepositID,:CommodityID,:CommodityGrade,:GradeUnitID)');
    dmStratD.qInsertLink.ParamByName('SBDepositID').AsInteger := dmStratD.cdsDepositSDBDEPOSITID.AsInteger;
    //dmStratD.qInsertLink.ParamByName('CommodityOrder').AsInteger := tmpOrder;
    dmStratD.qInsertLink.ParamByName('CommodityID').AsString := 'NEW';
    dmStratD.qInsertLink.ParamByName('CommodityGrade').AsFloat := 0.0;
    dmStratD.qInsertLink.ParamByName('GradeUnitID').AsString := 'n';
    {
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmStratD.qInsertLink.SQL.Text);
    end;
    }
    //if not dmStratD.sqlcStrat.InTransaction then
    //begin
      TD := dmStratD.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratD.qInsertLink.ExecSQL(false);
        dmStratD.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratD.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStratD.DeleteRefRecord (var wasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteRef start';
  try
    dmStratD.qDepRef.ParamByName('SDBDepositID').AsInteger := dmStratD.cdsRefsSDBDEPOSITID.AsInteger;
    dmStratD.qDepRef.ParamByName('SourceNum').AsInteger := dmStratD.cdsRefsSOURCENUM.AsInteger;
    //if not dmStratD.sqlcStrat.InTransaction then
    //begin
      TD := dmStratD.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratD.qDepRef.ExecSQL(false);
        dmStratD.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratD.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStratD.InsertReferenceLink (var wasSuccessful : boolean);
var
  TD : TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertReferenceLink start';
  try
    dmStratD.qInsertLink.Close;
    dmStratD.qInsertLink.SQL.Clear;
    dmStratD.qInsertLink.SQL.Add('INSERT INTO DEPOSITREFS');
    dmStratD.qInsertLink.SQL.Add('(SDBDepositID, SourceNum)');
    dmStratD.qInsertLink.SQL.Add('Values (:SDBDepositID, :SourceNum)');
    dmStratD.qInsertLink.ParamByName('SDBDepositID').AsInteger := dmStratD.cdsDepositQuerySDBDEPOSITID.AsInteger;
    dmStratD.qInsertLink.ParamByName('SourceNum').AsInteger := 0;
    //if not dmStratD.sqlcStrat.InTransaction then
    //begin
      TD := dmStratD.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratD.qInsertLink.ExecSQL(false);
        dmStratD.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratD.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;



end.
