unit IWStrat_dm;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  DBXCommon,
  IWCompListbox, WideStrings, Data.DBXFirebird, DbxDevartInterBase;

type
  TdmStrat = class(TDataModule)
    Query1: TSQLQuery;
    dspQuery1: TDataSetProvider;
    cdsQuery1: TClientDataSet;
    dsQuery1: TDataSource;
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
    dspRefDetail: TDataSetProvider;
    cdsRefDetail: TClientDataSet;
    cdsRefDetailSOURCEID: TStringField;
    cdsRefDetailSOURCEDES: TMemoField;
    dspRefFull: TDataSetProvider;
    cdsRefFull: TClientDataSet;
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
    cdsUnitCountryUNITNAME: TStringField;
    qYesNo: TSQLQuery;
    dspYesNo: TDataSetProvider;
    cdsYesNo: TClientDataSet;
    dsYesNo: TDataSource;
    qUsers: TSQLQuery;
    dspUsers: TDataSetProvider;
    cdsUsers: TClientDataSet;
    dsUsers: TDataSource;
    cdsRefDetailREFNUM: TIntegerField;
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
    qUsersUSERID: TStringField;
    cdsUsersUSERID: TStringField;
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
    cdsUnitQqSubUnits: TDataSetField;
    cdsUnitQqParent: TDataSetField;
    cdsParentUNITID: TIntegerField;
    cdsParentUNITNAME: TStringField;
    cdsParentRANKID: TStringField;
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
    cdsUnitQqCorrelatives: TDataSetField;
    cdsUnitQqSynonyms: TDataSetField;
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
    cdsUnitQqRecords: TDataSetField;
    cdsSynonymsAPPROVALSTATUS: TStringField;
    qUnitQUNITID: TIntegerField;
    qUnitQUNITNAME: TStringField;
    qUnitQPARENTID: TIntegerField;
    qUnitQRANKID: TStringField;
    qUnitQMINAGE: TFloatField;
    qUnitQMAXAGE: TFloatField;
    qUnitQDESCRIPTION: TMemoField;
    qUnitQCOUNTRYID: TStringField;
    qUnitQCOUNTRY: TStringField;
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
    cdsMapsMAPNAME: TStringField;
    qStratMaps: TSQLQuery;
    cdsStratMaps: TClientDataSet;
    dsStratMaps: TDataSource;
    cdsUnitQqStratMaps: TDataSetField;
    qUnitQAGEUNITS: TStringField;
    cdsUnitQAGEUNITS: TStringField;
    cdsQuery1AGEUNITS: TStringField;
    cdsMapsSHAPEFILENAME: TStringField;
    qStratDomain: TSQLQuery;
    cdsStratDomain: TClientDataSet;
    dsStratDomain: TDataSource;
    dspDomains: TDataSetProvider;
    cdsDomains: TClientDataSet;
    dsDomains: TDataSource;
    cdsDomainsDOMAINNAME: TStringField;
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
    cdsLinkedApplications: TClientDataSet;
    dsLinkedApplications: TDataSource;
    cdsUnitQqLinkedApplications: TDataSetField;
    qLinkedApplicationsUNITID: TIntegerField;
    qLinkedApplicationsAPPLICATIONID: TIntegerField;
    qLinkedApplicationsAPPLICATIONID_1: TIntegerField;
    qLinkedApplicationsAPPLICATION: TStringField;
    cdsLinkedApplicationsUNITID: TIntegerField;
    cdsLinkedApplicationsAPPLICATIONID: TIntegerField;
    cdsLinkedApplicationsAPPLICATIONID_1: TIntegerField;
    cdsLinkedApplicationsAPPLICATION: TStringField;
    cdsRecordsUNITID: TIntegerField;
    cdsRecordsRECORDID: TIntegerField;
    qApplications: TSQLQuery;
    dspApplications: TDataSetProvider;
    cdsApplications: TClientDataSet;
    dsApplications: TDataSource;
    qApplicationsAPPLICATIONID: TIntegerField;
    qApplicationsAPPLICATION: TStringField;
    cdsApplicationsAPPLICATIONID: TIntegerField;
    cdsApplicationsAPPLICATION: TStringField;
    qDeleteLinkToApplication: TSQLQuery;
    qRep1: TSQLQuery;
    qRep2: TSQLQuery;
    qRep3: TSQLQuery;
    qRep4: TSQLQuery;
    dsqRep1: TDataSource;
    dsqRep2: TDataSource;
    dsqRep3: TDataSource;
    dsqRep4: TDataSource;
    dspRep1: TDataSetProvider;
    cdsRep1: TClientDataSet;
    cdsRep2: TClientDataSet;
    cdsRep3: TClientDataSet;
    cdsRep4: TClientDataSet;
    dsRep1: TDataSource;
    dsRep2: TDataSource;
    dsRep3: TDataSource;
    dsRep4: TDataSource;
    cdsRep1UNITID: TIntegerField;
    cdsRep1COUNTRYID: TStringField;
    cdsRep1UNITNAME: TStringField;
    cdsRep1PARENTID: TIntegerField;
    cdsRep1RANKID: TStringField;
    cdsRep1MINAGE: TFloatField;
    cdsRep1MAXAGE: TFloatField;
    cdsRep1AGEUNITS: TStringField;
    cdsRep1UNITRANK: TStringField;
    cdsRep1COUNTRY: TStringField;
    cdsRep1APPROVALID: TStringField;
    cdsRep1APPROVALSTATUS: TStringField;
    cdsRep1APPLICATIONID: TIntegerField;
    cdsRep1qRep2: TDataSetField;
    qRep1UNITID: TIntegerField;
    qRep1COUNTRYID: TStringField;
    qRep1UNITNAME: TStringField;
    qRep1PARENTID: TIntegerField;
    qRep1RANKID: TStringField;
    qRep1MINAGE: TFloatField;
    qRep1MAXAGE: TFloatField;
    qRep1AGEUNITS: TStringField;
    qRep1UNITRANK: TStringField;
    qRep1COUNTRY: TStringField;
    qRep1APPROVALID: TStringField;
    qRep1APPROVALSTATUS: TStringField;
    qRep1APPLICATIONID: TIntegerField;
    cdsRep2UNITID: TIntegerField;
    cdsRep2UNITNAME: TStringField;
    cdsRep2PARENTID: TIntegerField;
    cdsRep2RANKID: TStringField;
    cdsRep2MINAGE: TFloatField;
    cdsRep2MAXAGE: TFloatField;
    cdsRep2UNITRANK: TStringField;
    cdsRep2qRep3: TDataSetField;
    cdsRep3UNITID: TIntegerField;
    cdsRep3UNITNAME: TStringField;
    cdsRep3PARENTID: TIntegerField;
    cdsRep3RANKID: TStringField;
    cdsRep3MINAGE: TFloatField;
    cdsRep3MAXAGE: TFloatField;
    cdsRep3UNITRANK: TStringField;
    cdsRep3qRep4: TDataSetField;
    cdsRep4UNITID: TIntegerField;
    cdsRep4UNITNAME: TStringField;
    cdsRep4PARENTID: TIntegerField;
    cdsRep4RANKID: TStringField;
    cdsRep4MINAGE: TFloatField;
    cdsRep4MAXAGE: TFloatField;
    cdsRep4UNITRANK: TStringField;
    qRep2UNITID: TIntegerField;
    qRep2UNITNAME: TStringField;
    qRep2PARENTID: TIntegerField;
    qRep2RANKID: TStringField;
    qRep2MINAGE: TFloatField;
    qRep2MAXAGE: TFloatField;
    qRep2UNITRANK: TStringField;
    qRep2AGEUNITS: TStringField;
    qRep2APPROVALID: TStringField;
    qRep2APPROVALSTATUS: TStringField;
    qRep3UNITID: TIntegerField;
    qRep3UNITNAME: TStringField;
    qRep3PARENTID: TIntegerField;
    qRep3RANKID: TStringField;
    qRep3MINAGE: TFloatField;
    qRep3MAXAGE: TFloatField;
    qRep3UNITRANK: TStringField;
    qRep3AGEUNITS: TStringField;
    qRep3APPROVALID: TStringField;
    qRep3APPROVALSTATUS: TStringField;
    qRep4UNITID: TIntegerField;
    qRep4UNITNAME: TStringField;
    qRep4PARENTID: TIntegerField;
    qRep4RANKID: TStringField;
    qRep4MINAGE: TFloatField;
    qRep4MAXAGE: TFloatField;
    qRep4UNITRANK: TStringField;
    qRep4AGEUNITS: TStringField;
    qRep4APPROVALID: TStringField;
    qRep4APPROVALSTATUS: TStringField;
    cdsRep2AGEUNITS: TStringField;
    cdsRep2APPROVALID: TStringField;
    cdsRep2APPROVALSTATUS: TStringField;
    cdsRep3AGEUNITS: TStringField;
    cdsRep3APPROVALID: TStringField;
    cdsRep3APPROVALSTATUS: TStringField;
    cdsRep4AGEUNITS: TStringField;
    cdsRep4APPROVALID: TStringField;
    cdsRep4APPROVALSTATUS: TStringField;
    qUnitCountryCOUNTRYID: TStringField;
    cdsUnitCountryCOUNTRYID: TStringField;
    qDomains: TSQLQuery;
    qDomainsDOMAINNAME: TStringField;
    qDomainsCONTINENTID: TStringField;
    cdsDomainsCONTINENTID: TStringField;
    qRockClasses: TSQLQuery;
    dspRockClasses: TDataSetProvider;
    cdsRockClasses: TClientDataSet;
    dsRockClasses: TDataSource;
    qSettings: TSQLQuery;
    dspSettings: TDataSetProvider;
    cdsSettings: TClientDataSet;
    dsSettings: TDataSource;
    cdsRockClassesROCKCLASS: TStringField;
    cdsRockClassesLEGENDORDER: TSmallintField;
    cdsSettingsSETTINGID: TStringField;
    cdsSettingsSETTING: TStringField;
    cdsSettingsLEGENDORDER: TSmallintField;
    qUnitRockClass: TSQLQuery;
    cdsUnitRockClass: TClientDataSet;
    dsUnitRockClass: TDataSource;
    qUnitSetting: TSQLQuery;
    cdsUnitSetting: TClientDataSet;
    dsUnitSetting: TDataSource;
    cdsUnitQqUnitSetting: TDataSetField;
    cdsUnitQqUnitRockClass: TDataSetField;
    cdsUnitRockClassUNITID: TIntegerField;
    cdsUnitRockClassROCKCLASSID: TStringField;
    cdsUnitSettingUNITID: TIntegerField;
    cdsUnitSettingSETTINGID: TStringField;
    qDomainsDOMAINID: TIntegerField;
    qDomainsSPOTLATITUDE: TFloatField;
    qDomainsSPOTLONGITUDE: TFloatField;
    cdsDomainsDOMAINID: TIntegerField;
    cdsDomainsSPOTLATITUDE: TFloatField;
    cdsDomainsSPOTLONGITUDE: TFloatField;
    qStratDomainUNITID: TIntegerField;
    qStratDomainDOMAINID: TIntegerField;
    qStratDomainDOMAINID_1: TIntegerField;
    qStratDomainDOMAINNAME: TStringField;
    qStratDomainCONTINENTID: TStringField;
    qStratDomainCONTINENTID_1: TStringField;
    qStratDomainCONTINENT: TStringField;
    cdsUnitQqStratDomain: TDataSetField;
    cdsStratDomainUNITID: TIntegerField;
    cdsStratDomainDOMAINID: TIntegerField;
    cdsStratDomainDOMAINID_1: TIntegerField;
    cdsStratDomainDOMAINNAME: TStringField;
    cdsStratDomainCONTINENTID: TStringField;
    cdsStratDomainCONTINENTID_1: TStringField;
    cdsStratDomainCONTINENT: TStringField;
    cdsMapsMAPID2: TStringField;
    qStratMapsUNITID: TIntegerField;
    qStratMapsMAPID2: TStringField;
    qStratMapsGISINT: TIntegerField;
    qStratMapsGISSTR: TStringField;
    qStratMapsMAPID2_1: TStringField;
    qStratMapsMAPNAME: TStringField;
    cdsStratMapsUNITID: TIntegerField;
    cdsStratMapsMAPID2: TStringField;
    cdsStratMapsGISINT: TIntegerField;
    cdsStratMapsGISSTR: TStringField;
    cdsStratMapsMAPID2_1: TStringField;
    cdsStratMapsMAPNAME: TStringField;
    qRep1ROCKCLASS: TStringField;
    qRep1SETTING: TStringField;
    qRep2ROCKCLASS: TStringField;
    qRep2SETTING: TStringField;
    qRep3ROCKCLASS: TStringField;
    qRep3SETTING: TStringField;
    qRep4ROCKCLASS: TStringField;
    qRep4SETTING: TStringField;
    cdsRep1ROCKCLASS: TStringField;
    cdsRep1SETTING: TStringField;
    cdsRep2ROCKCLASS: TStringField;
    cdsRep2SETTING: TStringField;
    cdsRep3ROCKCLASS: TStringField;
    cdsRep3SETTING: TStringField;
    cdsRep4ROCKCLASS: TStringField;
    cdsRep4SETTING: TStringField;
    qDomainQ: TSQLQuery;
    dsqDomainQ: TDataSource;
    dspDomainQ: TDataSetProvider;
    cdsDomainQ: TClientDataSet;
    dsDomainQ: TDataSource;
    qDomainParent: TSQLQuery;
    cdsDomainParent: TClientDataSet;
    dsDomainParent: TDataSource;
    qSubDomains: TSQLQuery;
    cdsSubDomains: TClientDataSet;
    dsSubDomains: TDataSource;
    qDomainQDOMAINID: TIntegerField;
    qDomainQDOMAINNAME: TStringField;
    qDomainQCONTINENTID: TStringField;
    qDomainQDOMAINPARENTID: TIntegerField;
    qDomainQDOMAINTYPEID: TStringField;
    qDomainQSPOTLATITUDE: TFloatField;
    qDomainQSPOTLONGITUDE: TFloatField;
    qDomainQDOMAINTYPEID_1: TStringField;
    qDomainQDOMAINTYPE: TStringField;
    qDomainQCONTINENTID_1: TStringField;
    qDomainQCONTINENT: TStringField;
    cdsDomainQDOMAINID: TIntegerField;
    cdsDomainQDOMAINNAME: TStringField;
    cdsDomainQCONTINENTID: TStringField;
    cdsDomainQDOMAINPARENTID: TIntegerField;
    cdsDomainQDOMAINTYPEID: TStringField;
    cdsDomainQSPOTLATITUDE: TFloatField;
    cdsDomainQSPOTLONGITUDE: TFloatField;
    cdsDomainQqDomainParent: TDataSetField;
    cdsDomainQqSubDomains: TDataSetField;
    DomainQuery: TSQLQuery;
    dspDomainQuery: TDataSetProvider;
    cdsDomainQuery: TClientDataSet;
    dsDomainQuery: TDataSource;
    cdsDomainQueryDOMAINID: TIntegerField;
    cdsDomainQueryCONTINENTID: TStringField;
    cdsDomainQueryDOMAINNAME: TStringField;
    cdsDomainQueryDOMAINPARENTID: TIntegerField;
    cdsDomainQueryDOMAINTYPEID: TStringField;
    cdsDomainQuerySPOTLATITUDE: TFloatField;
    cdsDomainQuerySPOTLONGITUDE: TFloatField;
    cdsDomainQueryDOMAINTYPE: TStringField;
    cdsDomainQueryCONTINENT: TStringField;
    qDomainMetamorphism: TSQLQuery;
    cdsDomainMetamorphism: TClientDataSet;
    dsDomainMetamorphism: TDataSource;
    qDomainDeformation: TSQLQuery;
    cdsDomainDeformation: TClientDataSet;
    dsDomainDeformation: TDataSource;
    cdsDomainParentDOMAINID: TIntegerField;
    cdsDomainParentDOMAINNAME: TStringField;
    cdsDomainParentDOMAINPARENTID: TIntegerField;
    cdsDomainParentDOMAINTYPEID: TStringField;
    cdsDomainParentDOMAINTYPE: TStringField;
    cdsSubDomainsDOMAINID: TIntegerField;
    cdsSubDomainsDOMAINNAME: TStringField;
    cdsSubDomainsDOMAINPARENTID: TIntegerField;
    cdsSubDomainsDOMAINTYPEID: TStringField;
    cdsSubDomainsDOMAINTYPE: TStringField;
    cdsDomainQqDomainMetamorphism: TDataSetField;
    cdsDomainQqDomainDeformation: TDataSetField;
    cdsDomainMetamorphismDOMAINID: TIntegerField;
    cdsDomainMetamorphismMETAMORPHISMORDER: TIntegerField;
    cdsDomainMetamorphismGRADEID: TStringField;
    cdsDomainMetamorphismPEAKAGE: TFloatField;
    cdsDomainMetamorphismAGEPLUS: TFloatField;
    cdsDomainMetamorphismAGEMINUS: TFloatField;
    cdsDomainMetamorphismGRADE: TStringField;
    cdsDomainMetamorphismOROGENY: TStringField;
    cdsDomainDeformationDOMAINID: TIntegerField;
    cdsDomainDeformationDEFORMATIONORDER: TIntegerField;
    cdsDomainDeformationAGEMIN: TFloatField;
    cdsDomainDeformationAGEMAX: TFloatField;
    cdsDomainDeformationOROGENYID: TIntegerField;
    cdsDomainDeformationOROGENY: TStringField;
    DomainQueryRec: TSQLQuery;
    dspDomainQueryRec: TDataSetProvider;
    cdsDomainQueryRec: TClientDataSet;
    cdsDomainQueryRecDOMAINID: TIntegerField;
    qDomainValid: TSQLQuery;
    cdsDomainValid: TClientDataSet;
    dsDomainValid: TDataSource;
    cdsDomainQqDomainValid: TDataSetField;
    qDomainValidDOMAINID: TIntegerField;
    qDomainValidVALIDSTATUSID: TStringField;
    qDomainValidDATEDONE: TSQLTimeStampField;
    qDomainValidDONEBY: TStringField;
    qDomainValidVALIDSTATUSID_1: TStringField;
    qDomainValidVALIDATIONSTATUS: TStringField;
    cdsDomainValidDOMAINID: TIntegerField;
    cdsDomainValidVALIDSTATUSID: TStringField;
    cdsDomainValidDATEDONE: TSQLTimeStampField;
    cdsDomainValidDONEBY: TStringField;
    cdsDomainValidVALIDSTATUSID_1: TStringField;
    cdsDomainValidVALIDATIONSTATUS: TStringField;
    qDomainValidFull: TSQLQuery;
    dspDomainValidFull: TDataSetProvider;
    cdsDomainValidFull: TClientDataSet;
    dsDomainValidFull: TDataSource;
    cdsDomainValidFullDOMAINID: TIntegerField;
    cdsDomainValidFullVALIDSTATUSID: TStringField;
    cdsDomainValidFullDATEDONE: TSQLTimeStampField;
    cdsDomainValidFullDONEBY: TStringField;
    cdsDomainValidFullCOMMENTS: TMemoField;
    qDRep1: TSQLQuery;
    dsqDRep1: TDataSource;
    dspDRep1: TDataSetProvider;
    cdsDRep1: TClientDataSet;
    dsDRep1: TDataSource;
    qDRep2: TSQLQuery;
    dsqDRep2: TDataSource;
    cdsDRep2: TClientDataSet;
    dsDRep2: TDataSource;
    qDRep1DOMAINID: TIntegerField;
    qDRep1CONTINENTID: TStringField;
    qDRep1DOMAINNAME: TStringField;
    qDRep1DOMAINPARENTID: TIntegerField;
    qDRep1DOMAINTYPEID: TStringField;
    qDRep1DOMAINTYPE: TStringField;
    qDRep1CONTINENT: TStringField;
    qDRep2DOMAINID: TIntegerField;
    qDRep2CONTINENTID: TStringField;
    qDRep2DOMAINNAME: TStringField;
    qDRep2DOMAINPARENTID: TIntegerField;
    qDRep2DOMAINTYPEID: TStringField;
    qDRep2DOMAINTYPE: TStringField;
    qDRep2CONTINENT: TStringField;
    cdsDRep1DOMAINID: TIntegerField;
    cdsDRep1CONTINENTID: TStringField;
    cdsDRep1DOMAINNAME: TStringField;
    cdsDRep1DOMAINPARENTID: TIntegerField;
    cdsDRep1DOMAINTYPEID: TStringField;
    cdsDRep1DOMAINTYPE: TStringField;
    cdsDRep1CONTINENT: TStringField;
    cdsDRep1qDRep2: TDataSetField;
    cdsDRep2DOMAINID: TIntegerField;
    cdsDRep2CONTINENTID: TStringField;
    cdsDRep2DOMAINNAME: TStringField;
    cdsDRep2DOMAINPARENTID: TIntegerField;
    cdsDRep2DOMAINTYPEID: TStringField;
    cdsDRep2DOMAINTYPE: TStringField;
    cdsDRep2CONTINENT: TStringField;
    qDRep3: TSQLQuery;
    dsqDRep3: TDataSource;
    cdsDRep3: TClientDataSet;
    dsDRep3: TDataSource;
    qDRep4: TSQLQuery;
    dsqDRep4: TDataSource;
    cdsDRep4: TClientDataSet;
    dsDRep4: TDataSource;
    qDRep3DOMAINID: TIntegerField;
    qDRep3CONTINENTID: TStringField;
    qDRep3DOMAINNAME: TStringField;
    qDRep3DOMAINPARENTID: TIntegerField;
    qDRep3DOMAINTYPEID: TStringField;
    qDRep3DOMAINTYPE: TStringField;
    qDRep3CONTINENT: TStringField;
    qDRep4DOMAINID: TIntegerField;
    qDRep4CONTINENTID: TStringField;
    qDRep4DOMAINNAME: TStringField;
    qDRep4DOMAINPARENTID: TIntegerField;
    qDRep4DOMAINTYPEID: TStringField;
    qDRep4DOMAINTYPE: TStringField;
    qDRep4CONTINENT: TStringField;
    cdsDRep2qDRep3: TDataSetField;
    cdsDRep3DOMAINID: TIntegerField;
    cdsDRep3CONTINENTID: TStringField;
    cdsDRep3DOMAINNAME: TStringField;
    cdsDRep3DOMAINPARENTID: TIntegerField;
    cdsDRep3DOMAINTYPEID: TStringField;
    cdsDRep3DOMAINTYPE: TStringField;
    cdsDRep3CONTINENT: TStringField;
    cdsDRep3qDRep4: TDataSetField;
    qDRep5: TSQLQuery;
    dsqDRep5: TDataSource;
    cdsDRep5: TClientDataSet;
    dsDRep5: TDataSource;
    qDRep5DOMAINID: TIntegerField;
    qDRep5CONTINENTID: TStringField;
    qDRep5DOMAINNAME: TStringField;
    qDRep5DOMAINPARENTID: TIntegerField;
    qDRep5DOMAINTYPEID: TStringField;
    qDRep5DOMAINTYPE: TStringField;
    qDRep5CONTINENT: TStringField;
    cdsDRep4DOMAINID: TIntegerField;
    cdsDRep4CONTINENTID: TStringField;
    cdsDRep4DOMAINNAME: TStringField;
    cdsDRep4DOMAINPARENTID: TIntegerField;
    cdsDRep4DOMAINTYPEID: TStringField;
    cdsDRep4DOMAINTYPE: TStringField;
    cdsDRep4CONTINENT: TStringField;
    cdsDRep5DOMAINID: TIntegerField;
    cdsDRep5CONTINENTID: TStringField;
    cdsDRep5DOMAINNAME: TStringField;
    cdsDRep5DOMAINPARENTID: TIntegerField;
    cdsDRep5DOMAINTYPEID: TStringField;
    cdsDRep5DOMAINTYPE: TStringField;
    cdsDRep5CONTINENT: TStringField;
    qDomainQDVLEVEL: TIntegerField;
    cdsDomainQDVLEVEL: TIntegerField;
    qDomainUnits: TSQLQuery;
    cdsDomainUnits: TClientDataSet;
    dsDomainUnits: TDataSource;
    cdsDomainQqDomainUnits: TDataSetField;
    cdsDomainUnitsDOMAINID: TIntegerField;
    cdsDomainUnitsUNITID: TIntegerField;
    cdsDomainUnitsCOUNTRYID: TStringField;
    cdsDomainUnitsUNITNAME: TStringField;
    cdsDomainUnitsRANKID: TStringField;
    cdsDomainUnitsUNITRANK: TStringField;
    qContinentsDEFAULTDOMAINID: TIntegerField;
    cdsContinentsDEFAULTDOMAINID: TIntegerField;
    qLinkUnitToParentDomain: TSQLQuery;
    cdsUnitQqUnitPeriods: TDataSetField;
    cdsUnitPeriodsUNITID: TIntegerField;
    cdsUnitPeriodsPERIODID: TIntegerField;
    qPeriods: TSQLQuery;
    dspPeriods: TDataSetProvider;
    cdsPeriods: TClientDataSet;
    dsPeriods: TDataSource;
    qPRep1: TSQLQuery;
    dsqPRep1: TDataSource;
    dspPRep1: TDataSetProvider;
    cdsPRep1: TClientDataSet;
    dsPRep11: TDataSource;
    qPRep2: TSQLQuery;
    dsqPRep2: TDataSource;
    cdsPRep2: TClientDataSet;
    dsPRep2: TDataSource;
    qPRep3: TSQLQuery;
    dsqPRep3: TDataSource;
    cdsPRep3: TClientDataSet;
    dsPRep3: TDataSource;
    qPRep4: TSQLQuery;
    dsqPRep4: TDataSource;
    cdsPRep4: TClientDataSet;
    dsPRep4: TDataSource;
    qPRep1PERIODID: TIntegerField;
    qPRep1PERIODNAME: TStringField;
    qPRep1CPARENTID: TIntegerField;
    qPRep1PERIODRANKID: TStringField;
    qPRep1MINAGE: TFloatField;
    qPRep1MAXAGE: TFloatField;
    qPRep1PERIODRANK: TStringField;
    cdsPRep1PERIODID: TIntegerField;
    cdsPRep1PERIODNAME: TStringField;
    cdsPRep1CPARENTID: TIntegerField;
    cdsPRep1PERIODRANKID: TStringField;
    cdsPRep1MINAGE: TFloatField;
    cdsPRep1MAXAGE: TFloatField;
    cdsPRep1PERIODRANK: TStringField;
    cdsPRep1qPRep2: TDataSetField;
    qPRep2PERIODID: TIntegerField;
    qPRep2PERIODNAME: TStringField;
    qPRep2CPARENTID: TIntegerField;
    qPRep2PERIODRANKID: TStringField;
    qPRep2MINAGE: TFloatField;
    qPRep2MAXAGE: TFloatField;
    qPRep2PERIODRANK: TStringField;
    qPRep3PERIODID: TIntegerField;
    qPRep3PERIODNAME: TStringField;
    qPRep3CPARENTID: TIntegerField;
    qPRep3PERIODRANKID: TStringField;
    qPRep3MINAGE: TFloatField;
    qPRep3MAXAGE: TFloatField;
    qPRep3PERIODRANK: TStringField;
    qPRep4PERIODID: TIntegerField;
    qPRep4PERIODNAME: TStringField;
    qPRep4CPARENTID: TIntegerField;
    qPRep4PERIODRANKID: TStringField;
    qPRep4MINAGE: TFloatField;
    qPRep4MAXAGE: TFloatField;
    qPRep4PERIODRANK: TStringField;
    cdsPRep2PERIODID: TIntegerField;
    cdsPRep2PERIODNAME: TStringField;
    cdsPRep2CPARENTID: TIntegerField;
    cdsPRep2PERIODRANKID: TStringField;
    cdsPRep2MINAGE: TFloatField;
    cdsPRep2MAXAGE: TFloatField;
    cdsPRep2PERIODRANK: TStringField;
    cdsPRep2qPRep3: TDataSetField;
    cdsPRep3PERIODID: TIntegerField;
    cdsPRep3PERIODNAME: TStringField;
    cdsPRep3CPARENTID: TIntegerField;
    cdsPRep3PERIODRANKID: TStringField;
    cdsPRep3MINAGE: TFloatField;
    cdsPRep3MAXAGE: TFloatField;
    cdsPRep3PERIODRANK: TStringField;
    cdsPRep3qPRep4: TDataSetField;
    cdsPRep4PERIODID: TIntegerField;
    cdsPRep4PERIODNAME: TStringField;
    cdsPRep4CPARENTID: TIntegerField;
    cdsPRep4PERIODRANKID: TStringField;
    cdsPRep4MINAGE: TFloatField;
    cdsPRep4MAXAGE: TFloatField;
    cdsPRep4PERIODRANK: TStringField;
    cdsPeriodsPERIODID: TIntegerField;
    cdsPeriodsPERIODNAME: TStringField;
    cdsPeriodsPERIODRANKID: TStringField;
    cdsPeriodsCPARENTID: TIntegerField;
    cdsPeriodsMINAGE: TFloatField;
    cdsPeriodsMAXAGE: TFloatField;
    cdsPeriodsPERIODRANK: TStringField;
    qUnitRockClassUNITID: TIntegerField;
    qUnitRockClassROCKCLASSID: TStringField;
    qUnitSettingUNITID: TIntegerField;
    qUnitSettingSETTINGID: TStringField;
    qUnitPeriodsUNITID: TIntegerField;
    qUnitPeriodsPERIODID: TIntegerField;
    qRanks: TSQLQuery;
    dspRanks: TDataSetProvider;
    cdsRanks: TClientDataSet;
    dsRanks: TDataSource;
    cdsRanksRANKID: TStringField;
    cdsRanksUNITRANK: TStringField;
    cdsRanksRANKWIDTH: TSmallintField;
    qParentUNITID: TIntegerField;
    qParentUNITNAME: TStringField;
    qParentRANKID: TStringField;
    qParentUNITRANK: TStringField;
    qSubUnitsUNITID: TIntegerField;
    qSubUnitsUNITNAME: TStringField;
    qSubUnitsPARENTID: TIntegerField;
    qSubUnitsRANKID: TStringField;
    qSubUnitsMINAGE: TFloatField;
    qSubUnitsMAXAGE: TFloatField;
    qSubUnitsUNITRANK: TStringField;
    qRecordsUNITID: TIntegerField;
    qRecordsRECORDID: TIntegerField;
    qSynonymsUNITID: TIntegerField;
    qSynonymsSYNONYMID: TIntegerField;
    qSynonymsCOMMENTS: TMemoField;
    qSynonymsUNITNAME: TStringField;
    qSynonymsRANKID: TStringField;
    qSynonymsUNITRANK: TStringField;
    qSynonymsAPPROVALID: TStringField;
    qSynonymsAPPROVALSTATUS: TStringField;
    qCorrelativesUNITID: TIntegerField;
    qCorrelativesCORRELATIVEID: TIntegerField;
    qCorrelativesCOMMENTS: TMemoField;
    qCorrelativesUNITNAME: TStringField;
    qCorrelativesRANKID: TStringField;
    qCorrelativesCOUNTRYID: TStringField;
    qCorrelativesCOUNTRY: TStringField;
    qCorrelativesUNITRANK: TStringField;
    qPRep1MINAGEUNCERTAINTY: TFloatField;
    qPRep1MAXAGEUNCERTAINTY: TFloatField;
    qPRep2MINAGEUNCERTAINTY: TFloatField;
    qPRep2MAXAGEUNCERTAINTY: TFloatField;
    qPRep3MINAGEUNCERTAINTY: TFloatField;
    qPRep3MAXAGEUNCERTAINTY: TFloatField;
    qPRep4MINAGEUNCERTAINTY: TFloatField;
    qPRep4MAXAGEUNCERTAINTY: TFloatField;
    cdsPRep1MINAGEUNCERTAINTY: TFloatField;
    cdsPRep1MAXAGEUNCERTAINTY: TFloatField;
    cdsPRep2MINAGEUNCERTAINTY: TFloatField;
    cdsPRep2MAXAGEUNCERTAINTY: TFloatField;
    cdsPRep3MINAGEUNCERTAINTY: TFloatField;
    cdsPRep3MAXAGEUNCERTAINTY: TFloatField;
    cdsPRep4MINAGEUNCERTAINTY: TFloatField;
    cdsPRep4MAXAGEUNCERTAINTY: TFloatField;
    qDomainsMAXAGE: TFloatField;
    cdsDomainsMAXAGE: TFloatField;
    qDomainQMAXAGE: TFloatField;
    cdsDomainQMAXAGE: TFloatField;
    cdsDomainMetamorphismPEAKTMIN: TFloatField;
    cdsDomainMetamorphismPEAKTMAX: TFloatField;
    cdsDomainMetamorphismPEAKPMIN: TFloatField;
    cdsDomainMetamorphismPEAKPMAX: TFloatField;
    cdsDomainMetamorphismCONSTRAINTLEVELID: TSmallintField;
    cdsDomainMetamorphismAGECONSTRAINTLEVEL: TStringField;
    cdsDomainDeformationCONSTRAINTLEVELID: TSmallintField;
    cdsDomainDeformationAGECONSTRAINTLEVEL: TStringField;
    qAgeConstraints: TSQLQuery;
    dspAgeConstraints: TDataSetProvider;
    cdsAgeConstraints: TClientDataSet;
    dsAgeConstraints: TDataSource;
    cdsAgeConstraintsAGECONSTRAINTLEVELID: TSmallintField;
    cdsAgeConstraintsAGECONSTRAINTLEVEL: TStringField;
    qStatus: TSQLQuery;
    dspStatus: TDataSetProvider;
    cdsStatus: TClientDataSet;
    dsStatus: TDataSource;
    cdsStatusAPPROVALID: TStringField;
    cdsStatusAPPROVALSTATUS: TStringField;
    qUnitQCONSTRAINTLEVELID: TSmallintField;
    qUnitQAPPROVALID: TStringField;
    cdsUnitQCONSTRAINTLEVELID: TSmallintField;
    cdsUnitQAPPROVALID: TStringField;
    qDomainsDOMAINPARENTID: TIntegerField;
    qDomainsDOMAINTYPEID: TStringField;
    qDomainsMINPLOTAGE: TFloatField;
    qDomainsMAXPLOTAGE: TFloatField;
    cdsDomainsDOMAINPARENTID: TIntegerField;
    cdsDomainsDOMAINTYPEID: TStringField;
    cdsDomainsMINPLOTAGE: TFloatField;
    cdsDomainsMAXPLOTAGE: TFloatField;
    qDomainQMINPLOTAGE: TFloatField;
    qDomainQMAXPLOTAGE: TFloatField;
    cdsDomainQMINPLOTAGE: TFloatField;
    cdsDomainQMAXPLOTAGE: TFloatField;
    cdsDomainQueryMINPLOTAGE: TFloatField;
    cdsDomainQueryMAXPLOTAGE: TFloatField;
    qUnitFeature: TSQLQuery;
    cdsUnitFeature: TClientDataSet;
    dsUnitFeature: TDataSource;
    qUnitFeatureUNITID: TIntegerField;
    qUnitFeatureSPECIALFEATUREID: TIntegerField;
    cdsUnitQqUnitFeature: TDataSetField;
    cdsUnitFeatureUNITID: TIntegerField;
    cdsUnitFeatureSPECIALFEATUREID: TIntegerField;
    qDomainDeposits: TSQLQuery;
    cdsDomainDeposits: TClientDataSet;
    dsDomainDeposits: TDataSource;
    qDomainTypes: TSQLQuery;
    dspDomainTypes: TDataSetProvider;
    cdsDomainTypes: TClientDataSet;
    dsDomainTypes: TDataSource;
    cdsDomainTypesDOMAINTYPEID: TStringField;
    cdsDomainTypesDOMAINTYPE: TStringField;
    cdsDomainTypesDVLEVEL: TIntegerField;
    cdsDomainQCONTINENT: TStringField;
    cdsRockClassesROCKCLASSID: TStringField;
    cdsRockClassesROCKCLASSID2: TStringField;
    qDeleteSynonymLink: TSQLQuery;
    qDeleteCorrelativeLink: TSQLQuery;
    qDeleteFeatureLink: TSQLQuery;
    qDeleteSucceedingLink: TSQLQuery;
    qDeletePrecedingLink: TSQLQuery;
    qDeleteSpecialFeatureLink: TSQLQuery;
    qInsertLink: TSQLQuery;
    qSpecialFeatures: TSQLQuery;
    dspSpecialFeatures: TDataSetProvider;
    cdsSpecialFeatures: TClientDataSet;
    dsSpecialFeatures: TDataSource;
    cdsSpecialFeaturesSPECIALFEATUREID: TIntegerField;
    cdsSpecialFeaturesSPECIALFEATURE: TStringField;
    cdsSpecialFeaturesLEGENDORDER: TSmallintField;
    qUnitFeatureSPECIALFEATURE: TStringField;
    cdsUnitFeatureSPECIALFEATURE: TStringField;
    cdsCountriesSTARTINGVALUE: TIntegerField;
    cdsCountriesDEFAULTMAPID: TStringField;
    qWhoFor: TSQLQuery;
    dspWhoFor: TDataSetProvider;
    cdsWhoFor: TClientDataSet;
    dsWhoFor: TDataSource;
    cdsWhoForWHOFORID: TStringField;
    cdsWhoForWHOFOR: TStringField;
    cdsWhoForOWNER: TStringField;
    qUsersWhoFor: TSQLQuery;
    dspUsersWhoFor: TDataSetProvider;
    cdsUsersWhoFor: TClientDataSet;
    dsUsersWhoFor: TDataSource;
    qUsersWhoForUSERID: TStringField;
    qUsersWhoForWHOFORID: TStringField;
    qUsersWhoForWHOFOR: TStringField;
    qUsersWhoForOWNER: TStringField;
    cdsUsersWhoForUSERID: TStringField;
    cdsUsersWhoForWHOFORID: TStringField;
    cdsUsersWhoForWHOFOR: TStringField;
    cdsUsersWhoForOWNER: TStringField;
    qInsertNew: TSQLQuery;
    qMaxID: TSQLQuery;
    qCountryDefault: TSQLQuery;
    dspMaxID: TDataSetProvider;
    cdsMaxID: TClientDataSet;
    dsMaxID: TDataSource;
    dspCountryDefault: TDataSetProvider;
    cdsCountryDefault: TClientDataSet;
    dsCountryDefault: TDataSource;
    cdsMaxIDMAX: TIntegerField;
    cdsCountryDefaultSTARTINGVALUE: TIntegerField;
    cdsCountryDefaultCOUNTRYHASRECORDS: TStringField;
    cdsCountryDefaultCOUNTRYID: TStringField;
    qCorrelativesMINAGE: TFloatField;
    qCorrelativesMAXAGE: TFloatField;
    cdsCorrelativesMINAGE: TFloatField;
    cdsCorrelativesMAXAGE: TFloatField;
    qDomainParentDOMAINID: TIntegerField;
    qDomainParentDOMAINNAME: TStringField;
    qDomainParentDOMAINPARENTID: TIntegerField;
    qDomainParentDOMAINTYPEID: TStringField;
    qDomainParentDOMAINTYPE: TStringField;
    qDepositTypes: TSQLQuery;
    dspDepsoitTypes: TDataSetProvider;
    cdsDepositTypes: TClientDataSet;
    dsDepositTypes: TDataSource;
    cdsDepositTypesDEPOSITTYPEID: TStringField;
    cdsDepositTypesDEPOSITTYPE: TStringField;
    qMetamorphicGrades: TSQLQuery;
    dspMetamorphicGrades: TDataSetProvider;
    cdsMetamorphicGrades: TClientDataSet;
    dsMetamorphicGrades: TDataSource;
    cdsMetamorphicGradesGRADEID: TStringField;
    cdsMetamorphicGradesGRADE: TStringField;
    qOrogenies: TSQLQuery;
    dspOrogenies: TDataSetProvider;
    cdsOrogenies: TClientDataSet;
    dsOrogenies: TDataSource;
    cdsOrogeniesOROGENYID: TIntegerField;
    cdsOrogeniesOROGENY: TStringField;
    cdsOrogeniesCONTINENTID: TStringField;
    qDomainUnitsDOMAINID: TIntegerField;
    qDomainUnitsUNITID: TIntegerField;
    qDomainUnitsCOUNTRYID: TStringField;
    qDomainUnitsUNITNAME: TStringField;
    qDomainUnitsRANKID: TStringField;
    qDomainUnitsUNITRANK: TStringField;
    qDomainMetamorphismDOMAINID: TIntegerField;
    qDomainMetamorphismMETAMORPHISMORDER: TIntegerField;
    qDomainMetamorphismGRADEID: TStringField;
    qDomainMetamorphismPEAKAGE: TFloatField;
    qDomainMetamorphismAGEPLUS: TFloatField;
    qDomainMetamorphismAGEMINUS: TFloatField;
    qDomainMetamorphismPEAKTMIN: TFloatField;
    qDomainMetamorphismPEAKTMAX: TFloatField;
    qDomainMetamorphismPEAKPMIN: TFloatField;
    qDomainMetamorphismPEAKPMAX: TFloatField;
    qDomainMetamorphismCONSTRAINTLEVELID: TSmallintField;
    qDomainMetamorphismGRADE: TStringField;
    qDomainMetamorphismAGECONSTRAINTLEVEL: TStringField;
    qDomainMetamorphismOROGENY: TStringField;
    qDomainDeformationDOMAINID: TIntegerField;
    qDomainDeformationDEFORMATIONORDER: TIntegerField;
    qDomainDeformationAGEMIN: TFloatField;
    qDomainDeformationAGEMAX: TFloatField;
    qDomainDeformationOROGENYID: TIntegerField;
    qDomainDeformationCONSTRAINTLEVELID: TSmallintField;
    qDomainDeformationAGECONSTRAINTLEVEL: TStringField;
    qDomainDeformationOROGENY: TStringField;
    qDomainMetamorphismOROGENYID: TIntegerField;
    cdsDomainMetamorphismOROGENYID: TIntegerField;
    qDuctilities: TSQLQuery;
    dspDuctilities: TDataSetProvider;
    cdsDuctilities: TClientDataSet;
    dsDuctilities: TDataSource;
    cdsDuctilitiesDUCTILITYTYPEID: TStringField;
    cdsDuctilitiesDUCTILITYTYPE: TStringField;
    qDomainDeformationDUCTILITYTYPEID: TStringField;
    cdsDomainDeformationDUCTILITYTYPEID: TStringField;
    qDomainDeformationDEFORMATIONTYPEID: TIntegerField;
    cdsDomainDeformationDEFORMATIONTYPEID: TIntegerField;
    qOrogenyTypes: TSQLQuery;
    dspOrogenyTypes: TDataSetProvider;
    cdsOrogenyTypes: TClientDataSet;
    dsOrogenyTypes: TDataSource;
    cdsOrogenyTypesDEFORMATIONTYPEID: TIntegerField;
    cdsOrogenyTypesDEFORMATIONTYPE: TStringField;
    cdsDomainQqDomainDeposits: TDataSetField;
    qDeposits: TSQLQuery;
    dspDeposits: TDataSetProvider;
    cdsDeposits: TClientDataSet;
    dsDeposits: TDataSource;
    cdsDepositsSDBDEPOSITID: TIntegerField;
    cdsDepositsDEPLATITUDE: TFloatField;
    cdsDepositsDEPLONGITUDE: TFloatField;
    cdsDepositsDATABASEID: TIntegerField;
    cdsDepositsDEPOSITIDINT: TIntegerField;
    cdsDepositsDEPOSITIDSTR: TStringField;
    cdsDepositsDEPOSITNAME: TStringField;
    cdsDepositsCOUNTRYID: TStringField;
    qDomainDeformationVERGENCEANGLE: TIntegerField;
    cdsDomainDeformationVERGENCEANGLE: TIntegerField;
    qDirections: TSQLQuery;
    dspDirections: TDataSetProvider;
    cdsDirections: TClientDataSet;
    dsDirections: TDataSource;
    cdsDirectionsDIRECTIONANGLE: TIntegerField;
    cdsDirectionsDIRECTIONNAME: TStringField;
    qStratRel: TSQLQuery;
    dspStratRel: TDataSetProvider;
    cdsStratRel: TClientDataSet;
    dsStratRel: TDataSource;
    cdsStratRelRELATIONSHIPID: TStringField;
    cdsStratRelRELPOSID: TStringField;
    cdsStratRelRELATIONSHIP: TStringField;
    cdsStratRelRELATIONSHIPREVID: TStringField;
    qPreceedingUNITID: TIntegerField;
    qPreceedingPRECEDEDBY: TIntegerField;
    qPreceedingPREREL: TStringField;
    qPreceedingUNITNAME: TStringField;
    cdsPreceedingUNITID: TIntegerField;
    cdsPreceedingPRECEDEDBY: TIntegerField;
    cdsPreceedingPREREL: TStringField;
    cdsPreceedingUNITNAME: TStringField;
    qSucceedingUNITID: TIntegerField;
    qSucceedingSUCCEEDEDBY: TIntegerField;
    qSucceedingSUCREL: TStringField;
    qSucceedingUNITNAME: TStringField;
    qSucceedingRELATIONSHIP: TStringField;
    cdsSucceedingUNITID: TIntegerField;
    cdsSucceedingSUCCEEDEDBY: TIntegerField;
    cdsSucceedingSUCREL: TStringField;
    cdsSucceedingUNITNAME: TStringField;
    cdsSucceedingRELATIONSHIP: TStringField;
    qStratDomainINC4CHTYN: TStringField;
    cdsStratDomainINC4CHTYN: TStringField;
    qDomainUnitsINC4CHTYN: TStringField;
    cdsDomainUnitsINC4CHTYN: TStringField;
    qDomainDepositsDOMAINID: TIntegerField;
    qDomainDepositsSBDEPOSITID: TIntegerField;
    qDomainDepositsDEPOSITCLANID: TIntegerField;
    qDomainDepositsAPPROXAGE: TFloatField;
    qDomainDepositsAPPROXAGEUNCERTAINTY: TFloatField;
    qDomainDepositsDEPOSITNAME: TStringField;
    qDomainDepositsDEPOSITCLAN: TStringField;
    cdsDomainDepositsDOMAINID: TIntegerField;
    cdsDomainDepositsSBDEPOSITID: TIntegerField;
    cdsDomainDepositsDEPOSITCLANID: TIntegerField;
    cdsDomainDepositsAPPROXAGE: TFloatField;
    cdsDomainDepositsAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDomainDepositsDEPOSITNAME: TStringField;
    cdsDomainDepositsDEPOSITCLAN: TStringField;
    cdsDepositsDEPOSITCLANID: TIntegerField;
    qUnitCurrent: TSQLQuery;
    cdsUnitCurrent: TClientDataSet;
    dsUnitCurrent: TDataSource;
    qUnitSedEnv: TSQLQuery;
    cdsUnitSedEnv: TClientDataSet;
    dsUnitSedEnv: TDataSource;
    qUnitCurrentUNITID: TIntegerField;
    qUnitCurrentCURRENTDIRECTION: TIntegerField;
    qUnitSedEnvUNITID: TIntegerField;
    qUnitSedEnvDEPOSITIONENVIRONMENTID: TStringField;
    cdsUnitQqUnitSedEnv: TDataSetField;
    cdsUnitQqUnitCurrent: TDataSetField;
    cdsUnitCurrentUNITID: TIntegerField;
    cdsUnitCurrentCURRENTDIRECTION: TIntegerField;
    cdsUnitSedEnvUNITID: TIntegerField;
    cdsUnitSedEnvDEPOSITIONENVIRONMENTID: TStringField;
    qSedEnvironments: TSQLQuery;
    dspSedEnvironments: TDataSetProvider;
    cdsSedEnvironments: TClientDataSet;
    dsSedEnvironments: TDataSource;
    cdsSedEnvironmentsDEPOSITIONENVIRONMENTID: TStringField;
    cdsSedEnvironmentsDEPOSITIONENVIRONMENT: TStringField;
    cdsDirectionsSOURCEFROMNAME: TStringField;
    qRep1SOURCEFROMNAME: TStringField;
    qRep1DEPOSITIONENVIRONMENT: TStringField;
    cdsRep1SOURCEFROMNAME: TStringField;
    cdsRep1DEPOSITIONENVIRONMENT: TStringField;
    qRep2SOURCEFROMNAME: TStringField;
    qRep2DEPOSITIONENVIRONMENT: TStringField;
    qRep3SOURCEFROMNAME: TStringField;
    qRep3DEPOSITIONENVIRONMENT: TStringField;
    qRep4SOURCEFROMNAME: TStringField;
    qRep4DEPOSITIONENVIRONMENT: TStringField;
    cdsRep2SOURCEFROMNAME: TStringField;
    cdsRep2DEPOSITIONENVIRONMENT: TStringField;
    cdsRep3SOURCEFROMNAME: TStringField;
    cdsRep3DEPOSITIONENVIRONMENT: TStringField;
    cdsRep4SOURCEFROMNAME: TStringField;
    cdsRep4DEPOSITIONENVIRONMENT: TStringField;
    cdsRockClassesROCKCLASSFUNDAMENTAL: TStringField;
    qStratMapsDISPLAYORDER: TIntegerField;
    cdsStratMapsDISPLAYORDER: TIntegerField;
    sqlcStrat: TSQLConnection;
    qRefDetailSOURCENUM: TIntegerField;
    qRefDetailSOURCESHORT: TStringField;
    qRefDetailSOURCEYEAR: TSmallintField;
    qRefDetailSOURCEDESCRIPTION: TMemoField;
    qRefDetailCONTINENTID: TStringField;
    qRefDetailDOI: TStringField;
    qRefFull: TSQLQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TSmallintField;
    MemoField1: TMemoField;
    StringField2: TStringField;
    StringField3: TStringField;
    cdsRefFullSOURCENUM: TIntegerField;
    cdsRefFullSOURCESHORT: TStringField;
    cdsRefFullSOURCEYEAR: TSmallintField;
    cdsRefFullSOURCEDESCRIPTION: TMemoField;
    cdsRefFullCONTINENTID: TStringField;
    cdsRefFullDOI: TStringField;
    qRefNew: TSQLQuery;
    qRefNewSOURCEID: TStringField;
    qRefNewCONTINENTID: TStringField;
    qReferencesSOURCEYEAR: TSmallintField;
    cdsReferencesSOURCEYEAR: TSmallintField;
    qUnitFor: TSQLQuery;
    cdsUnitFor: TClientDataSet;
    dsUnitFor: TDataSource;
    qUnitForUNITID: TIntegerField;
    qUnitForWHOFORID: TStringField;
    qUnitForWHOFOR: TStringField;
    cdsUnitQqUnitFor: TDataSetField;
    cdsUnitForUNITID: TIntegerField;
    cdsUnitForWHOFORID: TStringField;
    cdsUnitForWHOFOR: TStringField;
    qUserUnitAccess: TSQLQuery;
    dspUserUnitAccess: TDataSetProvider;
    cdsUserUnitAccess: TClientDataSet;
    dsUserUnitAccess: TDataSource;
    cdsUserUnitAccessUNITID: TIntegerField;
    qDomainFor: TSQLQuery;
    cdsDomainFor: TClientDataSet;
    dsDomainFor: TDataSource;
    qDomainForDOMAINID: TIntegerField;
    qDomainForWHOFORID: TStringField;
    qDomainForWHOFOR: TStringField;
    cdsDomainQqDomainFor: TDataSetField;
    cdsDomainForDOMAINID: TIntegerField;
    cdsDomainForWHOFORID: TStringField;
    cdsDomainForWHOFOR: TStringField;
    qDomainLIP: TSQLQuery;
    cdsDomainLIP: TClientDataSet;
    dsDomainLIP: TDataSource;
    qDomainLIPDOMAINID: TIntegerField;
    qDomainLIPLIPID: TIntegerField;
    qDomainLIPCONTINENTID: TStringField;
    qDomainLIPMINPLOTAGE: TFloatField;
    qDomainLIPMAXPLOTAGE: TFloatField;
    qDomainLIPLIPNAME: TStringField;
    qDomainLIPCONTOCEANID: TStringField;
    qDomainLIPLIPSIZEID: TIntegerField;
    qDomainLIPLIPRATINGID: TStringField;
    qDomainLIPCONSTRAINTLEVELID: TSmallintField;
    qDomainLIPAREALEXTENT: TFloatField;
    qDomainLIPVOLUMEESTIMATE: TFloatField;
    qDomainLIPLIPPARENTID: TIntegerField;
    cdsDomainQqDomainLIP: TDataSetField;
    cdsDomainLIPDOMAINID: TIntegerField;
    cdsDomainLIPLIPID: TIntegerField;
    cdsDomainLIPCONTINENTID: TStringField;
    cdsDomainLIPMINPLOTAGE: TFloatField;
    cdsDomainLIPMAXPLOTAGE: TFloatField;
    cdsDomainLIPLIPNAME: TStringField;
    cdsDomainLIPCONTOCEANID: TStringField;
    cdsDomainLIPLIPSIZEID: TIntegerField;
    cdsDomainLIPLIPRATINGID: TStringField;
    cdsDomainLIPCONSTRAINTLEVELID: TSmallintField;
    cdsDomainLIPAREALEXTENT: TFloatField;
    cdsDomainLIPVOLUMEESTIMATE: TFloatField;
    cdsDomainLIPLIPPARENTID: TIntegerField;
    qCountPublished: TSQLQuery;
    dspCountPublished: TDataSetProvider;
    cdsCountPublished: TClientDataSet;
    dsCountPublished: TDataSource;
    cdsYesNoYESNOID: TStringField;
    cdsYesNoYESNO: TStringField;
    qInsertOrogeny: TSQLQuery;
    qUnitQAGEYEARS: TFloatField;
    cdsUnitQAGEYEARS: TFloatField;
    qSubUnitsAGEYEARS: TFloatField;
    cdsSubUnitsAGEYEARS: TFloatField;
    cdsQuery1AGEYEARS: TFloatField;
    qDomainUnitsAGEYEARS: TFloatField;
    cdsDomainUnitsAGEYEARS: TFloatField;
    qStratMapsINCL4MAP: TStringField;
    cdsStratMapsINCL4MAP: TStringField;
    qPreceedingRELATIONSHIP: TStringField;
    cdsPreceedingRELATIONSHIP: TStringField;
    qPreceedingRELATIONSHIPREVID: TStringField;
    cdsPreceedingRELATIONSHIPREVID: TStringField;
    qSucceedingRELATIONSHIPREVID: TStringField;
    cdsSucceedingRELATIONSHIPREVID: TStringField;
    qSucceedingMINAGE: TFloatField;
    qSucceedingMAXAGE: TFloatField;
    qSucceedingUNITRANK: TStringField;
    qPreceedingMINAGE: TFloatField;
    qPreceedingMAXAGE: TFloatField;
    qPreceedingUNITRANK: TStringField;
    cdsSucceedingMINAGE: TFloatField;
    cdsSucceedingMAXAGE: TFloatField;
    cdsSucceedingUNITRANK: TStringField;
    cdsPreceedingMINAGE: TFloatField;
    cdsPreceedingMAXAGE: TFloatField;
    cdsPreceedingUNITRANK: TStringField;
    qRep1AGEYEARS: TFloatField;
    cdsRep1AGEYEARS: TFloatField;
    qRep2AGEYEARS: TFloatField;
    cdsRep2AGEYEARS: TFloatField;
    qRep3AGEYEARS: TFloatField;
    cdsRep3AGEYEARS: TFloatField;
    qRep4AGEYEARS: TFloatField;
    cdsRep4AGEYEARS: TFloatField;
    Query1Rec: TSQLQuery;
    dspQuery1Rec: TDataSetProvider;
    cdsQuery1Rec: TClientDataSet;
    cdsQuery1RecUNITID: TIntegerField;
    qUsersLASTUSED: TSQLTimeStampField;
    cdsUsersLASTUSED: TSQLTimeStampField;
    qUserUnits: TSQLQuery;
    qInsertUserUnits: TSQLQuery;
    dspUserUnits: TDataSetProvider;
    cdsUserUnits: TClientDataSet;
    dsUserUnits: TDataSource;
    qUserUnitsUSERID: TStringField;
    qUserUnitsUNITID: TIntegerField;
    qUserUnitsUNITAGE: TFloatField;
    qUserUnitsCOUNTRYID: TStringField;
    cdsUserUnitsUSERID: TStringField;
    cdsUserUnitsUNITID: TIntegerField;
    cdsUserUnitsUNITAGE: TFloatField;
    qDeleteAny: TSQLQuery;
    qUserUnitsDVUNITID: TIntegerField;
    qUserUnitsSTRATDBUNITNAME: TStringField;
    qUserUnitsSTRATDBUNITRANK: TStringField;
    cdsUserUnitsCOUNTRYID: TStringField;
    cdsUserUnitsDVUNITID: TIntegerField;
    cdsUserUnitsSTRATDBUNITNAME: TStringField;
    cdsUserUnitsSTRATDBUNITRANK: TStringField;
    qUnitRanks: TSQLQuery;
    dspUnitRanks: TDataSetProvider;
    cdsUnitRanks: TClientDataSet;
    dsUnitRanks: TDataSource;
    cdsUnitRanksRANKID: TStringField;
    cdsUnitRanksUNITRANK: TStringField;
    dspThisUnit: TDataSetProvider;
    cdsThisUnit: TClientDataSet;
    dsThisUnit: TDataSource;
    qThisUnit: TSQLQuery;
    cdsThisUnitUNITID: TIntegerField;
    cdsThisUnitCOUNTRYID: TStringField;
    cdsThisUnitUNITNAME: TStringField;
    cdsThisUnitPARENTID: TIntegerField;
    cdsThisUnitRANKID: TStringField;
    cdsThisUnitAGEYEARS: TFloatField;
    cdsThisUnitMINAGE: TFloatField;
    cdsThisUnitMAXAGE: TFloatField;
    cdsThisUnitAGEUNITS: TStringField;
    cdsThisUnitUNITRANK: TStringField;
    qThisUnitAge: TSQLQuery;
    dspThisUnitAge: TDataSetProvider;
    cdsThisUnitAge: TClientDataSet;
    dsThisUnitAge: TDataSource;
    cdsThisUnitAgeUNITID: TIntegerField;
    cdsThisUnitAgeCOUNTRYID: TStringField;
    cdsThisUnitAgeMINAGE: TFloatField;
    cdsThisUnitAgeMAXAGE: TFloatField;
    cdsThisUnitAgeAGEUNITS: TStringField;
    qUserProjects: TSQLQuery;
    dspUserProjects: TDataSetProvider;
    cdsUserProjects: TClientDataSet;
    cdsUserProjectsUSERPROJECTID: TIntegerField;
    cdsUserProjectsUSERID: TStringField;
    cdsUserProjectsUSERPROJECTNAME: TStringField;
    dsUserProjects: TDataSource;
    qInsertUserProject: TSQLQuery;
    qRefFullWHOFORID: TStringField;
    cdsRefFullWHOFORID: TStringField;
    SQLMonitor1: TSQLMonitor;
    cdsUnitsUNITID: TIntegerField;
    cdsUnitsUNITNAME: TStringField;
    cdsUnitsUNITNAMEUNITID: TStringField;
    cdsUnitsCOUNTRYID: TStringField;
    cdsUnitsPARENTID: TIntegerField;
    cdsUnitsRANKID: TStringField;
    cdsUnitsAGEYEARS: TFloatField;
    cdsCountPublishedCOUNT: TFMTBCDField;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    function GetCurrent_Date: variant;
    function GetCurrentDate: variant;
  public
    //procedure GetFormData2(var SQLMemoField : string);
    //procedure SetFormData2(SQLMemoField : string);
    procedure ConstructUnitAreaQuery;
    procedure SubmitContAreaQuery;
    procedure SubmitQuery1;
    procedure SubmitDomainQuery;
    procedure ConstructQuery;
    procedure ConstructDomainQuery;
    procedure SubmitNewRecord2(var WasSuccessful : boolean);
    procedure Query1RecordCount;
    procedure DomainQueryRecordCount;
    procedure DeleteRefRecord (var wasSuccessful : boolean);
    procedure DeleteDomainRecord (var wasSuccessful : boolean);
    procedure DeleteLinkToApplicationRecord(var WasSuccessful : boolean);
    procedure DeleteDomainWhoForLinkRecord (var wasSuccessful : boolean);
    procedure DeleteUnitWhoForLinkRecord (var wasSuccessful : boolean);
    procedure DeleteSucceedingLinkRecord (var wasSuccessful : boolean);
    procedure DeletePrecedingLinkRecord (var wasSuccessful : boolean);
    procedure DeleteSynonymLinkRecord (var wasSuccessful : boolean);
    procedure DeleteCorrelativeLinkRecord (var wasSuccessful : boolean);
    procedure DeleteSpecialFeatureLinkRecord (var wasSuccessful : boolean);
    procedure LinkUnitsToParentDomain;
    procedure InsertOrogeny (var wasSuccessful : boolean);
    procedure InsertSpecialFeatureLink (var wasSuccessful : boolean);
    procedure InsertDomainLink (var wasSuccessful : boolean);
    procedure InsertSucceedingLink (var wasSuccessful : boolean);
    procedure InsertPrecedingLink (var wasSuccessful : boolean);
    procedure InsertSynonymLink (var wasSuccessful : boolean);
    procedure InsertCorrelativeLink (var wasSuccessful : boolean);
    procedure InsertReverseCorrelativeLink (var wasSuccessful : boolean);
    procedure InsertReverseSynonymLink (var wasSuccessful : boolean);
    procedure InsertReverseSucceedingLink (var wasSuccessful : boolean);
    procedure InsertReversePrecedingLink (var wasSuccessful : boolean);
    procedure InsertReferenceLink (var wasSuccessful : boolean);
    procedure InsertReference (var wasSuccessful : boolean);
    procedure InsertApplicationLink (var wasSuccessful : boolean);
    procedure InsertGISLink (var wasSuccessful : boolean);
    procedure InsertEconomicFeatureLink (var wasSuccessful : boolean);
    procedure InsertMetamorphismLink (var wasSuccessful : boolean);
    procedure InsertDeformationLink (var wasSuccessful : boolean);
    procedure InsertStratUnitLink (var wasSuccessful : boolean);
    procedure SubmitNewReference(var WasSuccessful : boolean);
    procedure InsertDomainLIPLink (var wasSuccessful : boolean);
    procedure InsertUserUnits(IncludeSubunits : boolean);
    procedure DeleteUserUnits;
    procedure InsertUserProject(var WasSuccessful : boolean);
  published
    property Current_Date: variant read GetCurrent_Date;
    property CurrentDate: variant read GetCurrentDate;
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

function TdmStrat.GetCurrent_Date: variant;
begin
  Result:=dmUser.GetUTCDateTime;
end;

function TdmStrat.GetCurrentDate: variant;
begin
  Result:= double(dmUser.GetUTCDateTime); //Dates should be passed as numbers, and the corresponding cell in excel have Date format.
end;

{
procedure TdmStrat.GetFormData2(var SQLMemoField : string);
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

procedure TdmStrat.SetFormData2(SQLMemoField : string);
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
    dmUser.cdsUserInfoLASTUSED.AsDateTime := Now;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := SQLMemoField;
    dmUser.cdsUserInfo.Post;
  end else
  begin
    dmUser.cdsUserInfo.Edit;
    dmUser.cdsUserInfoLASTUSED.AsDateTime := Now;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := SQLMemoField;
    dmUser.cdsUserInfo.Post;
  end;
  dmUser.cdsUserInfo.ApplyUpdates(0);
  dmUser.cdsUserInfo.Close;
end;
}

procedure TdmStrat.ConstructUnitAreaQuery;
var
  i : integer;
  tempStr : string;
begin
  {UnitAreasRanks}
  dmStrat.qUnits.Close;
  dmStrat.qUnits.SQL.Clear;
  dmStrat.qUnits.SQL.Add('SELECT DISTINCT STRATUNITS.UNITID, STRATUNITS.UNITNAME, ');
  tempStr := '   STRATUNITS.UNITNAME || '+Quotedstr(' (')+'||STRATUNITS.COUNTRYID || STRATUNITS.UNITID||'+Quotedstr(') ')+' AS UNITNAMEUNITID, ';
  dmStrat.qUnits.SQL.Add(tempStr);
  dmStrat.qUnits.SQL.Add('   STRATUNITS.COUNTRYID, STRATUNITS.PARENTID,');
  dmStrat.qUnits.SQL.Add('   STRATUNITS.RANKID, STRATUNITS.AGEYEARS,');
  dmStrat.qUnits.SQL.Add('   APPLICLINK.UNITID, APPLICLINK.APPLICATIONID');
  dmStrat.qUnits.SQL.Add('FROM STRATUNITS,COUNTRIES,CONTINENTS,APPLICLINK,UNITFOR,USERSWHOFOR,RANKS');
  dmStrat.qUnits.SQL.Add('WHERE CONTINENTS.CONTINENTID = COUNTRIES.CONTINENTID');
  dmStrat.qUnits.SQL.Add('AND USERSWHOFOR.USERID = :UserID ');
  dmStrat.qUnits.SQL.Add('AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID ');
  dmStrat.qUnits.SQL.Add('AND COUNTRIES.COUNTRYID = STRATUNITS.COUNTRYID');
  dmStrat.qUnits.SQL.Add('AND STRATUNITS.RANKID = RANKS.RANKID');
  dmStrat.qUnits.SQL.Add('AND STRATUNITS.UNITID = APPLICLINK.UNITID');
  dmStrat.qUnits.SQL.Add('AND STRATUNITS.UNITID=UNITFOR.UNITID ');
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
    dmStrat.qUnits.SQL.Add('OR CONTINENTS.CONTINENTID = '+''''+'UND'+'''');
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

  if (UserSession.IncludeUnitRankValues) then
  begin
    dmStrat.qUnits.SQL.Add('AND ( STRATUNITS.RANKID = '+''''+UserSession.UnitRankValues.Strings[0]+'''');
    if (UserSession.UnitRankValues.Count >1) then
    begin
      for i := 2 to UserSession.UnitRankValues.Count do
      begin
        dmStrat.qUnits.SQL.Add('OR STRATUNITS.RANKID = '+''''+UserSession.UnitRankValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qUnits.SQL.Add(' ) ');
  end;

  dmStrat.qUnits.SQL.Add('ORDER BY STRATUNITS.UNITNAME, STRATUNITS.UNITID');

  //dmUser.SetDeveloperData(dmStrat.qUnits.SQL.Text);

  {References}
  dmStrat.qReferences.Close;
  dmStrat.qReferences.SQL.Clear;
  dmStrat.qReferences.SQL.Add('SELECT DISTINCT SOURCELIST.SOURCENUM, SOURCELIST.SOURCESHORT, SOURCELIST.SOURCEYEAR, SOURCELIST.CONTINENTID, ');
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
  dmStrat.qReferences.SQL.Add('ORDER BY SOURCELIST.SOURCESHORT ');
end;

procedure TdmStrat.SubmitContAreaQuery;
begin
  ConstructUnitAreaQuery;
  //UserSession.SQLMemoField.Text := dmStrat.qUnits.SQL.Text;
  //dmUser.SetDeveloperData(dmStrat.qUnits.SQL.Text);
  dmUser.SetFormData2(dmStrat.qUnits.SQL.Text);
end;

procedure TdmStrat.SubmitQuery1;
begin
  ConstructQuery;
  dmStrat.Query1.ParamByName('USERID').AsString := UserSession.UserID;
  //UserSession.SQLMemoField.Text := dmStrat.Query1.SQL.Text;
  dmUser.SetFormData2(dmStrat.Query1.SQL.Text);
end;

procedure TdmStrat.SubmitDomainQuery;
begin
  ConstructDomainQuery;
  dmStrat.DomainQuery.ParamByName('USERID').AsString := UserSession.UserID;
  //UserSession.SQLMemoField.Text := dmStrat.DomainQuery.SQL.Text;
  dmUser.SetFormData2(dmStrat.DomainQuery.SQL.Text);
end;

procedure TdmStrat.ConstructQuery;
var
  i, iCode : integer;
  tempStr : string;
  FromDate, ToDate : double;
  FromSort, ToSort : double;
begin
  dmStrat.cdsQuery1.Close;
  dmStrat.Query1.Close;
  dmStrat.Query1.SQL.Clear;
  dmStrat.Query1.SQL.Add('SELECT DISTINCT STRATUNITS.UNITID,STRATUNITS.COUNTRYID, STRATUNITS.UNITNAME, STRATUNITS.PARENTID, ');
  dmStrat.Query1.SQL.Add('STRATUNITS.RANKID, STRATUNITS.AGEYEARS, STRATUNITS.MINAGE, ');
  dmStrat.Query1.SQL.Add('STRATUNITS.MAXAGE, STRATUNITS.AGEUNITS, RANKS.UNITRANK, COUNTRIES.COUNTRY, ');
  dmStrat.Query1.SQL.Add('APPROVALSTATUS.APPROVALID, APPROVALSTATUS.APPROVALSTATUS, ');
  dmStrat.Query1.SQL.Add('APPLICLINK.UNITID, APPLICLINK.APPLICATIONID,');
  dmStrat.Query1.SQL.Add('UNITROCKCLASS.UNITID, UNITROCKCLASS.ROCKCLASSID,');
  dmStrat.Query1.SQL.Add('UNITSETTING.UNITID,UNITSETTING.SETTINGID,');
  dmStrat.Query1.SQL.Add('ROCKCLASSES.ROCKCLASSID, ROCKCLASSES.ROCKCLASS,');
  dmStrat.Query1.SQL.Add('SETTINGS.SETTING,');
  dmStrat.Query1.SQL.Add('DIRECTIONS.SOURCEFROMNAME,');
  dmStrat.Query1.SQL.Add('DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT');
  dmStrat.Query1.SQL.Add('from STRATUNITS, COUNTRIES, RANKS, APPROVALSTATUS, APPLICLINK, UNITFOR, USERSWHOFOR, ');
  dmStrat.Query1.SQL.Add('  UNITROCKCLASS,UNITSETTING,ROCKCLASSES,SETTINGS,STRATSEDENVIRONMENT,STRATCURRENT,DIRECTIONS,DEPOSITIONNVIRONMENT');
  if (UserSession.IncludeAreaValues
      or UserSession.IncludeContinentValues
      or UserSession.IncludeUnitValues
      or UserSession.IncludeUnitRankValues
      or UserSession.IncludeReferenceValues
      or UserSession.IncludeUsersWhoForValues
      or UserSession.IncludeValidationValues
      or UserSession.IncludeDomainValues
      or UserSession.IncludePeriodValues
      or UserSession.IncludeAgeConstraintValues
      or UserSession.IncludeSortFromValue
      or UserSession.IncludeSortToValue
      or UserSession.IncludeDateFromValue
      or UserSession.IncludeDateToValue) then
  begin
    if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count=0)) then UserSession.IncludeContinentValues := false;
    if ((UserSession.IncludeAreaValues) and (UserSession.AreaValues.Count=0)) then UserSession.IncludeAreaValues := false;
    if ((UserSession.IncludeUnitValues) and (UserSession.UnitValues.Count=0)) then UserSession.IncludeUnitValues := false;
    if ((UserSession.IncludeUnitRankValues) and (UserSession.UnitRankValues.Count=0)) then UserSession.IncludeUnitRankValues := false;
    if ((UserSession.IncludeReferenceValues) and (UserSession.ReferenceValues.Count=0)) then UserSession.IncludeReferenceValues := false;
    if ((UserSession.IncludeUsersWhoForValues) and (UserSession.UsersWhoForValues.Count=0)) then UserSession.IncludeUsersWhoForValues := false;
    if ((UserSession.IncludeValidationValues) and (UserSession.ValidationValues.Count=0)) then UserSession.IncludeValidationValues := false;
    if ((UserSession.IncludeDomainValues) and (UserSession.DomainValues.Count=0)) then UserSession.IncludeDomainValues := false;
    if ((UserSession.IncludePeriodValues) and (UserSession.PeriodValues.Count=0)) then UserSession.IncludePeriodValues := false;
    if ((UserSession.IncludeAgeConstraintValues) and (UserSession.AgeConstraintValues.Count=0)) then UserSession.IncludeAgeConstraintValues := false;
    if ((UserSession.IncludeInc4ChtValues) and (UserSession.Inc4ChtValues.Count=0)) then UserSession.IncludeInc4ChtValues := false;
    if ((UserSession.IncludeInc4ChtValues) and (not UserSession.IncludeDomainValues)) then UserSession.IncludeInc4ChtValues := false;
    if UserSession.IncludeDateFromValue then
    begin
      if (UserSession.DateFromField = '') then UserSession.IncludeDateFromValue := false;
    end;
    if UserSession.IncludeDateToValue then
    begin
      if (UserSession.DateToField = '') then UserSession.IncludeDateToValue := false;
    end;
    if UserSession.IncludeSortFromValue then
    begin
      if (UserSession.SortFromField = '') then UserSession.IncludeSortFromValue := false;
    end;
    if UserSession.IncludeSortToValue then
    begin
      if (UserSession.SortToField = '') then UserSession.IncludeSortToValue := false;
    end;
  end else
  begin
    {}
  end;
  if (UserSession.IncludeAreaValues
      or UserSession.IncludeContinentValues
      or UserSession.IncludeUnitValues
      or UserSession.IncludeUnitRankValues
      or UserSession.IncludeReferenceValues
      or UserSession.IncludeUsersWhoForValues
      or UserSession.IncludeValidationValues
      or UserSession.IncludeDomainValues
      or UserSession.IncludePeriodValues
      or UserSession.IncludeAgeConstraintValues
      or UserSession.IncludeSortFromValue
      or UserSession.IncludeSortToValue
      or UserSession.IncludeDateFromValue
      or UserSession.IncludeDateToValue) then
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
    if UserSession.IncludeSortFromValue then
    begin
      Val(UserSession.SortFromField,FromSort,iCode);
      UserSession.SortFromField := '0.0';
      if (iCode = 0) then UserSession.SortFromField := FormatFloat('  ###0.00',FromSort);
    end;
    if UserSession.IncludeSortToValue then
    begin
      Val(UserSession.SortToField,ToSort,iCode);
      UserSession.SortToField := '0.0';
      if (iCode = 0) then UserSession.SortToField := FormatFloat('  ###0.00',ToSort);
    end;
  if (UserSession.IncludeReferenceValues) then
  begin
    dmStrat.Query1.SQL.Add(',SOURCELIST, UNITREFS ');
  end;
    if UserSession.IncludeValidationValues then
    begin
      dmStrat.Query1.SQL.Add(',STRATVALID ');
    end;
    if UserSession.IncludeDomainValues then
    begin
      dmStrat.Query1.SQL.Add(',STRATDOMAIN ');
    end;
    if UserSession.IncludePeriodValues then
    begin
      dmStrat.Query1.SQL.Add(',UNITPERIODS ');
    end;
    dmStrat.Query1.SQL.Add('WHERE STRATUNITS.COUNTRYID = COUNTRIES.COUNTRYID ');
    dmStrat.Query1.SQL.Add('AND USERSWHOFOR.USERID = :UserID ');
    dmStrat.Query1.SQL.Add('AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.RANKID = RANKS.RANKID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID = APPLICLINK.UNITID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID=UNITSETTING.UNITID ');
    dmStrat.Query1.SQL.Add('AND ROCKCLASSES.ROCKCLASSID=UNITROCKCLASS.ROCKCLASSID ');
    dmStrat.Query1.SQL.Add('AND SETTINGS.SETTINGID=UNITSETTING.SETTINGID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID=STRATCURRENT.UNITID ');
    dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID=UNITFOR.UNITID ');
    dmStrat.Query1.SQL.Add('AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENTID ');
    dmStrat.Query1.SQL.Add('AND STRATCURRENT.CURRENTDIRECTION=DIRECTIONS.DIRECTIONANGLE ');
    if (UserSession.ThisProgram = 'IGCP509') then dmStrat.Query1.SQL.Add('AND APPLICLINK.APPLICATIONID = 2 ');
    if (UserSession.ThisProgram = 'StratDB') then dmStrat.Query1.SQL.Add('AND APPLICLINK.APPLICATIONID = 1 ');
    if UserSession.IncludeValidationValues then
    begin
      dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID = STRATVALID.UNITID ');
    end;
    if not UserSession.IncludeAllParentIDs then
    begin
      dmStrat.Query1.SQL.Add('AND STRATUNITS.PARENTID = 0 ');
    end;
    if UserSession.IncludePeriodValues then
    begin
      dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID = UNITPERIODS.UNITID ');
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
    {units}
    if UserSession.IncludeUnitValues then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.UnitValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'STRATUNITS.UNITID = '+''''+UserSession.UnitValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.UnitValues.Count > 1) then
      begin
        for i := 2 to UserSession.UnitValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'STRATUNITS.UNITID = '+''''+UserSession.UnitValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    {unit ranks}
    if UserSession.IncludeUnitRankValues then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.UnitRankValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'STRATUNITS.RANKID = '+''''+UserSession.UnitRankValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.UnitRankValues.Count > 1) then
      begin
        for i := 2 to UserSession.UnitRankValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'STRATUNITS.RANKID = '+''''+UserSession.UnitRankValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    if UserSession.IncludeDateFromValue then
    begin
      tempStr := 'AND ';
      dmStrat.Query1.SQL.Add(tempStr);
      tempStr := 'STRATUNITS.MINAGE >= '+UserSession.DateFromField;
      dmStrat.Query1.SQL.Add(tempStr);
    end;
    if UserSession.IncludeDateToValue then
    begin
      tempStr := 'AND ';
      dmStrat.Query1.SQL.Add(tempStr);
      tempStr := 'STRATUNITS.MAXAGE <= '+ UserSession.DateToField;
      dmStrat.Query1.SQL.Add(tempStr);
    end;
    if UserSession.IncludeSortFromValue then
    begin
      tempStr := 'AND ';
      dmStrat.Query1.SQL.Add(tempStr);
      tempStr := 'STRATUNITS.AGEYEARS >= '+UserSession.SortFromField;
      dmStrat.Query1.SQL.Add(tempStr);
    end;
    if UserSession.IncludeSortToValue then
    begin
      tempStr := 'AND ';
      dmStrat.Query1.SQL.Add(tempStr);
      tempStr := 'STRATUNITS.AGEYEARS <= '+ UserSession.SortToField;
      dmStrat.Query1.SQL.Add(tempStr);
    end;
    {reference}
    if UserSession.IncludeReferenceValues then
    begin
      dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID = UNITREFS.UNITID ');
      dmStrat.Query1.SQL.Add('AND UNITREFS.SOURCENUM = SOURCELIST.SOURCENUM ');
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
    {domains}
    if UserSession.IncludeDomainValues then
    begin
      dmStrat.Query1.SQL.Add('AND STRATUNITS.UNITID = STRATDOMAIN.UNITID');
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.DomainValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'STRATDOMAIN.DOMAINID = '+''''+UserSession.DomainValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.DomainValues.Count > 1) then
      begin
        for i := 2 to UserSession.DomainValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'STRATDOMAIN.DOMAINID = '+''''+UserSession.DomainValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    {chronostratigraphic periods}
    if (UserSession.IncludePeriodValues) then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.PeriodValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'UNITPERIODS.PERIODID = '+''''+UserSession.PeriodValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.PeriodValues.Count > 1) then
      begin
        for i := 2 to UserSession.PeriodValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'UNITPERIODS.PERIODID = '+''''+UserSession.PeriodValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    {age constraints}
    if (UserSession.IncludeAgeConstraintValues) then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.AgeConstraintValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'STRATUNITS.CONSTRAINTLEVELID = '+''''+UserSession.AgeConstraintValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.AgeConstraintValues.Count > 1) then
      begin
        for i := 2 to UserSession.AgeConstraintValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'STRATUNITS.CONSTRAINTLEVELID = '+''''+UserSession.AgeConstraintValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    {include for chart}
    if (UserSession.IncludeInc4ChtValues) then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.Inc4ChtValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'STRATDOMAIN.INC4CHTYN = '+''''+UserSession.Inc4ChtValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.Inc4ChtValues.Count > 1) then
      begin
        for i := 2 to UserSession.Inc4ChtValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'STRATDOMAIN.INC4CHTYN = '+''''+UserSession.Inc4ChtValues[i-1]+'''';
          dmStrat.Query1.SQL.Add(tempStr);
        end;
        dmStrat.Query1.SQL.Add(') ');
      end;
    end;
    {users who for}
    if (UserSession.IncludeUsersWhoForValues) then
    begin
      dmStrat.Query1.SQL.Add('AND ');
      if ((UserSession.UsersWhoForValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.Query1.SQL.Add(tempStr);
      end;
      tempStr := 'UNITFOR.WHOFORID = '+''''+UserSession.UsersWhoForValues[0]+'''';
      dmStrat.Query1.SQL.Add(tempStr);
      if (UserSession.UsersWhoForValues.Count > 1) then
      begin
        for i := 2 to UserSession.UsersWhoForValues.Count do
        begin
          dmStrat.Query1.SQL.Add('OR ');
          tempStr := 'UNITFOR.WHOFORID = '+''''+UserSession.UsersWhoForValues[i-1]+'''';
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
    //dmUser.SetDeveloperData(dmStrat.Query1.SQL.Text);
  end;
end;


procedure TdmStrat.ConstructDomainQuery;
var
  i : integer;
  tempStr : string;
begin
  dmStrat.cdsDomainQuery.Close;
  dmStrat.DomainQuery.Close;
  dmStrat.DomainQuery.SQL.Clear;
  dmStrat.DomainQuery.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,');
  dmStrat.DomainQuery.SQL.Add('DOMAINS.DOMAINNAME,  DOMAINS.DOMAINPARENTID, ');
  dmStrat.DomainQuery.SQL.Add('DOMAINS.DOMAINTYPEID,  DOMAINS.SPOTLATITUDE, ');
  dmStrat.DomainQuery.SQL.Add('DOMAINS.SPOTLONGITUDE, ');
  dmStrat.DomainQuery.SQL.Add('DOMAINS.MINPLOTAGE,  DOMAINS.MAXPLOTAGE, ');
  dmStrat.DomainQuery.SQL.Add('DOMAINTYPES.DOMAINTYPE, CONTINENTS.CONTINENT');
  dmStrat.DomainQuery.SQL.Add('from DOMAINS, DOMAINTYPES, CONTINENTS, DOMAINFOR, USERSWHOFOR');
  if (UserSession.IncludeAreaValues
      or UserSession.IncludeContinentValues
      or UserSession.IncludeDomainValues
      or UserSession.IncludeOrogenyValues
      or UserSession.IncludeDomainTypeValues
      or UserSession.IncludeDomainValidationValues) then
  begin
    if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count=0)) then UserSession.IncludeContinentValues := false;
    if ((UserSession.IncludeDomainTypeValues) and (UserSession.DomainTypeValues.Count=0)) then UserSession.IncludeDomainTypeValues := false;
    if ((UserSession.IncludeOrogenyValues) and (UserSession.OrogenyValues.Count=0)) then UserSession.IncludeOrogenyValues := false;
    if ((UserSession.IncludeDomainValidationValues) and (UserSession.DomainValidationValues.Count=0)) then UserSession.IncludeDomainValidationValues := false;
    if ((UserSession.IncludeDomainValues) and (UserSession.DomainValues.Count=0)) then UserSession.IncludeDomainValues := false;
  end else
  begin
    {}
  end;
  if (UserSession.IncludeDomainTypeValues
      or UserSession.IncludeContinentValues
      or UserSession.IncludeOrogenyValues
      or UserSession.IncludeDomainValidationValues
      or UserSession.IncludeDomainValues) then
  begin
    if UserSession.IncludeDomainValidationValues then
    begin
      dmStrat.DomainQuery.SQL.Add(',DOMAINVALID ');
    end;
    dmStrat.DomainQuery.SQL.Add('where DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID ');
    dmStrat.DomainQuery.SQL.Add('AND USERSWHOFOR.USERID = :UserID ');
    dmStrat.DomainQuery.SQL.Add('AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID ');
    dmStrat.DomainQuery.SQL.Add('AND DOMAINS.DOMAINID=DOMAINFOR.DOMAINID ');
    dmStrat.DomainQuery.SQL.Add('and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID ');
    //if (UserSession.ThisProgram = 'IGCP509') then dmStrat.DomainQuery.SQL.Add('AND APPLICLINK.APPLICATIONID = 2 ');
    //if (UserSession.ThisProgram = 'StratDB') then dmStrat.DomainQuery.SQL.Add('AND APPLICLINK.APPLICATIONID = 1 ');
    if UserSession.IncludeDomainValidationValues then
    begin
      dmStrat.DomainQuery.SQL.Add('AND DOMAINS.DOMAINID = DOMAINVALID.DOMAINID ');
    end;
    if not UserSession.IncludeAllParentIDs then
    begin
      dmStrat.DomainQuery.SQL.Add('AND DOMAINS.DOMAINPARENTID = 0 ');
    end;
    {continent}
    if UserSession.IncludeContinentValues then
    begin
      dmStrat.DomainQuery.SQL.Add('AND ');
      if ((UserSession.ContinentValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.DomainQuery.SQL.Add(tempStr);
      end;
      tempStr := 'DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues[0]+'''';
      dmStrat.DomainQuery.SQL.Add(tempStr);
      if (UserSession.ContinentValues.Count > 1) then
      begin
        for i := 2 to UserSession.ContinentValues.Count do
        begin
          dmStrat.DomainQuery.SQL.Add('OR ');
          tempStr := 'DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues[i-1]+'''';
          dmStrat.DomainQuery.SQL.Add(tempStr);
        end;
        dmStrat.DomainQuery.SQL.Add(') ');
      end;
    end;
    {domains}
    if UserSession.IncludeDomainValues then
    begin
      dmStrat.DomainQuery.SQL.Add('AND ');
      if ((UserSession.DomainValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.DomainQuery.SQL.Add(tempStr);
      end;
      tempStr := 'DOMAINS.DOMAINID = '+''''+UserSession.DomainValues[0]+'''';
      dmStrat.DomainQuery.SQL.Add(tempStr);
      if (UserSession.DomainValues.Count > 1) then
      begin
        for i := 2 to UserSession.DomainValues.Count do
        begin
          dmStrat.DomainQuery.SQL.Add('OR ');
          tempStr := 'DOMAINS.DOMAINID = '+''''+UserSession.DomainValues[i-1]+'''';
          dmStrat.DomainQuery.SQL.Add(tempStr);
        end;
        dmStrat.DomainQuery.SQL.Add(') ');
      end;
    end;
    {domain types}
    if UserSession.IncludeDomainTypeValues then
    begin
      dmStrat.DomainQuery.SQL.Add('AND ');
      if ((UserSession.DomainTypeValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.DomainQuery.SQL.Add(tempStr);
      end;
      tempStr := 'DOMAINS.DOMAINTYPEID = '+''''+UserSession.DomainTypeValues[0]+'''';
      dmStrat.DomainQuery.SQL.Add(tempStr);
      if (UserSession.DomainTypeValues.Count > 1) then
      begin
        for i := 2 to UserSession.DomainTypeValues.Count do
        begin
          dmStrat.DomainQuery.SQL.Add('OR ');
          tempStr := 'DOMAINS.DOMAINTYPEID = '+''''+UserSession.DomainTypeValues[i-1]+'''';
          dmStrat.DomainQuery.SQL.Add(tempStr);
        end;
        dmStrat.DomainQuery.SQL.Add(') ');
      end;
    end;
    {orogenies}
    if UserSession.IncludeOrogenyValues then
    begin
      dmStrat.DomainQuery.SQL.Add('AND ');
      if ((UserSession.OrogenyValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.DomainQuery.SQL.Add(tempStr);
      end;
      tempStr := 'DOMAINS.OROGENYID = '+''''+UserSession.OrogenyValues[0]+'''';
      dmStrat.DomainQuery.SQL.Add(tempStr);
      if (UserSession.OrogenyValues.Count > 1) then
      begin
        for i := 2 to UserSession.OrogenyValues.Count do
        begin
          dmStrat.DomainQuery.SQL.Add('OR ');
          tempStr := 'DOMAINS.OROGENYID = '+''''+UserSession.OrogenyValues[i-1]+'''';
          dmStrat.DomainQuery.SQL.Add(tempStr);
        end;
        dmStrat.DomainQuery.SQL.Add(') ');
      end;
    end;
    {validation status}
    if (UserSession.IncludeDomainValidationValues) then
    begin
      dmStrat.DomainQuery.SQL.Add('AND ');
      if ((UserSession.DomainValidationValues.Count > 1)) then
      begin
        tempStr := ' (';
        dmStrat.DomainQuery.SQL.Add(tempStr);
      end;
      tempStr := 'DOMAINVALID.VALIDSTATUSID = '+''''+UserSession.DomainValidationValues[0]+'''';
      dmStrat.DomainQuery.SQL.Add(tempStr);
      if (UserSession.DomainValidationValues.Count > 1) then
      begin
        for i := 2 to UserSession.DomainValidationValues.Count do
        begin
          dmStrat.DomainQuery.SQL.Add('OR ');
          tempStr := 'DOMAINVALID.VALIDSTATUSID = '+''''+UserSession.DomainValidationValues[i-1]+'''';
          dmStrat.DomainQuery.SQL.Add(tempStr);
        end;
        dmStrat.DomainQuery.SQL.Add(') ');
      end;
    end;
    if (UserSession.OrderByValue = '0') then
    begin
      dmStrat.DomainQuery.SQL.Add('ORDER by DOMAINS.CONTINENTID,DOMAINS.DOMAINNAME');
    end;
    if (UserSession.OrderByValue = '1') then
    begin
      dmStrat.DomainQuery.SQL.Add('ORDER by DOMAINS.DOMAINID');
    end;
    if (UserSession.OrderByValue = '2') then
    begin
      dmStrat.DomainQuery.SQL.Add('ORDER by DOMAINS.DOMAINPARENTID');
    end;
  end;
end;

procedure TdmStrat.SubmitNewRecord2(var WasSuccessful : boolean);
const
  zero = 0;
  one = 1;
var
  TD, TD2: TDBXTransaction;
  NextAvailableUnitID : integer;
  i : integer;
begin
  NextAvailableUnitID := 0;
  WasSuccessful := true;
  UserSession.WhereAmI := 'NewRecord start';
  try
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      {
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmUser.qInsertDevInfo.ExecSQL(true);
          dmUser.sqlcWebUser.CommitFreeAndNil(TD); //on success, commit the changes;
        except
          dmUser.sqlcWebUser.RollbackFreeAndNil(TD); //on failure, undo the changes;
        end;
        }
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        //get new unitID for the country involved
        dmStrat.qCountryDefault.Close;
        dmStrat.qCountryDefault.ParamByName('CountryID').AsString := UserSession.NewAreaID;
        dmStrat.cdsCountryDefault.Close;
        dmStrat.cdsCountryDefault.Open;
        NextAvailableUnitID := dmStrat.cdsCountryDefaultSTARTINGVALUE.AsInteger;
        dmStrat.cdsCountryDefault.Close;
        dmStrat.qMaxID.Close;
        dmStrat.qMaxID.ParamByName('CountryID').AsString := UserSession.NewAreaID;
        dmStrat.cdsMaxID.Close;
        dmStrat.cdsMaxID.Open;
        if (dmStrat.cdsMaxIDMAX.AsInteger > 0) then
          NextAvailableUnitID := dmStrat.cdsMaxIDMAX.AsInteger+1;
        dmStrat.cdsMaxID.Close;
        //insert new record in StratUnits
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO STRATUNITS');
        dmStrat.qInsertNew.SQL.Add('(UnitID, CountryID, UnitName)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :CountryID, :UnitName)');
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('CountryID').AsString := UserSession.NewAreaID;
        dmStrat.qInsertNew.ParamByName('UnitName').AsString := UserSession.NewUnit;
        //dmUser.SetDeveloperData(dmStrat.qInsertNew.SQL.Text+'*'+IntToStr(NextAvailableUnitID)+'*'+UserSession.NewAreaID+'*'+UserSession.NewUnit+'*');
        dmStrat.qInsertnew.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); //on failure, undo the changes;
        WasSuccessful := false;
        WebApplication.ShowMessage('Unable to insert record for new unit. '+UserSession.WhereAmI);
      end;
    //end;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to insert record for new unit. '+UserSession.WhereAmI);
  end;
  UserSession.WhereAmI := 'NewRecord step2';
  try
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        //insert link record in ApplicLink
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO APPLICLINK');
        dmStrat.qInsertNew.SQL.Add('(UnitID, ApplicationID)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :ApplicationID)');
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('ApplicationID').AsInteger := one;
        dmStrat.qInsertnew.ExecSQL(false);
        //insert link record in StratValid (Capt)
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO STRATVALID');
        dmStrat.qInsertNew.SQL.Add('(UnitID, ValidStatusID, DateDone, DoneBy)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :ValidStatusID, :DateDone, :DoneBy)');
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('ValidStatusID').AsString := 'Capt';
        dmStrat.qInsertNew.ParamByName('DateDone').AsDateTime := Date;
        dmStrat.qInsertNew.ParamByName('DoneBy').AsString := UserSession.UserID;
        dmStrat.qInsertnew.ExecSQL(false);
        //insert link record in StratValid (NotYt)
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('ValidStatusID').AsString := 'NotYt';
        dmStrat.qInsertNew.ParamByName('DateDone').AsDateTime := Date;
        dmStrat.qInsertNew.ParamByName('DoneBy').AsString := 'Nobody';
        dmStrat.qInsertnew.ExecSQL(false);
        //insert link record in UnitRefs
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO UNITREFS');
        dmStrat.qInsertNew.SQL.Add('(UnitID, SourceNum)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :SourceNum)');
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('SourceNum').AsString := UserSession.NewReferenceID;
        dmStrat.qInsertnew.ExecSQL(false);
        //insert link record in UnitPeriodLinks
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO UNITPERIODS');
        dmStrat.qInsertNew.SQL.Add('(UnitID, PeriodID)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :PeriodID)');
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('PeriodID').AsInteger := zero;
        dmStrat.qInsertnew.ExecSQL(false);
        //insert link record in UnitRockClass
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO UNITROCKCLASS');
        dmStrat.qInsertNew.SQL.Add('(UnitID, RockClassID)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :RockClassID)');
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('RockClassID').AsString := 'N';
        dmStrat.qInsertnew.ExecSQL(false);
        //insert link record in UnitSetting
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO UNITSETTING');
        dmStrat.qInsertNew.SQL.Add('(UnitID, SettingID)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :SettingID)');
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('SettingID').AsString := 'nd';
        dmStrat.qInsertnew.ExecSQL(false);
        //insert link record in UnitCurrent
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO STRATCURRENT');
        dmStrat.qInsertNew.SQL.Add('(UnitID, CurrentDirection)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :CurrentDirection)');
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('CurrentDirection').AsInteger := 361;
        dmStrat.qInsertnew.ExecSQL(false);
        //insert link record in UnitSedEnvironment
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO STRATSEDENVIRONMENT');
        dmStrat.qInsertNew.SQL.Add('(UnitID, DepositionEnvironmentID)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :DepositionEnvironmentID)');
        dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
        dmStrat.qInsertNew.ParamByName('DepositionEnvironmentID').AsString := '0';
        dmStrat.qInsertnew.ExecSQL(false);
        //insert link record in UnitFor
        dmStrat.qInsertNew.Close;
        dmStrat.qInsertNew.SQL.Clear;
        dmStrat.qInsertNew.SQL.Add('INSERT INTO UNITFOR');
        dmStrat.qInsertNew.SQL.Add('(UnitID, WhoForID)');
        dmStrat.qInsertNew.SQL.Add('Values (:UnitID, :WhoForID)');
        if (UserSession.UsersWhoForValues.Count > 0) then
        begin
          for i := 1 to UserSession.UsersWhoForValues.Count do
          begin
            try
            dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
            dmStrat.qInsertNew.ParamByName('WhoForID').AsString := UserSession.UsersWhoForValues.Strings[i-1];
            except
            end;
            dmStrat.qInsertnew.ExecSQL(false);
          end;
        end;
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        dmStrat.cdsCountries.Open;
        if (dmStrat.cdsCountriesCOUNTRYHASRECORDS.AsString='N') then
        begin
          try
            dmStrat.cdsCountries.Edit;
            dmStrat.cdsCountriesCOUNTRYHASRECORDS.AsString := 'Y';
            dmStrat.cdsCountries.Post;
            dmStrat.cdsCountries.ApplyUpdates(0);
          except
          end;
        end;
        dmStrat.cdsCountries.Close;
        UserSession.RecordChosen := IntToStr(NextAvailableUnitID);
        //update NeedsChange value so that replication occurs properly
        try
          TD2 := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
          //first do so for new record in StratUnits
          dmStrat.qInsertNew.Close;
          dmStrat.qInsertNew.SQL.Clear;
          dmStrat.qInsertNew.SQL.Add('UPDATE STRATUNITS');
          dmStrat.qInsertNew.SQL.Add('SET STRATUNITS.NEEDSCHANGE = '+QuotedStr('N'));
          dmStrat.qInsertNew.SQL.Add('WHERE STRATUNITS.UNITID = :UnitID');
          dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
          dmStrat.qInsertnew.ExecSQL(false);
          //then do so for all new UnitFor records for this new UnitID
          dmStrat.qInsertNew.Close;
          dmStrat.qInsertNew.SQL.Clear;
          dmStrat.qInsertNew.SQL.Add('UPDATE UNITFOR');
          dmStrat.qInsertNew.SQL.Add('SET UNITFOR.NEEDSCHANGE = '+QuotedStr('N'));
          dmStrat.qInsertNew.SQL.Add('WHERE UNITFOR.UNITID = :UnitID');
          dmStrat.qInsertNew.ParamByName('UnitID').AsInteger := NextAvailableUnitID;
          dmStrat.qInsertnew.ExecSQL(false);
          dmStrat.sqlcStrat.CommitFreeAndNil(TD2); {on success, commit the changes};
        except
          dmStrat.sqlcStrat.RollbackFreeAndNil(TD2); {on failure, undo the changes};
        end;
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to insert record for new unit. '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.Query1RecordCount;
var
  nRec : integer;
  i : integer;
  tmpStr : string;
begin
    UserSession.NumRecordsFound := 0;
    with dmStrat do
    begin
      {
      tmpStr := Query1.SQL.Text;
      Query1Rec.Close;
      cdsQuery1Rec.Close;
      Query1Rec.SQL.Clear;
      Query1Rec.SQL.Add('SELECT COUNT(*) FROM (');
      Query1Rec.SQL.Add(tmpStr);
      Query1Rec.SQL.Add(')');
      Query1Rec.ParamByName('USERID').AsString := UserSession.UserID;
      cdsQuery1Rec.Open;
      }
      Query1Rec.Close;
      cdsQuery1Rec.Close;
      Query1Rec.SQL.Text := dmStrat.Query1.SQL.Text;
      Query1Rec.ParamByName('USERID').AsString := UserSession.UserID;
      cdsQuery1Rec.Open;
    end;
  try
    UserSession.NumRecordsFound := dmStrat.cdsQuery1Rec.RecordCount;
    //UserSession.NumRecordsFound := dmStrat.cdsQuery1.RecordCount;
  finally
    dmStrat.cdsQuery1Rec.Close;
  end;
end;

procedure TdmStrat.DomainQueryRecordCount;
var
  nRec : integer;
  i : integer;
begin
    UserSession.NumRecordsFound := 0;
    with dmStrat do
    begin
      DomainQueryRec.Close;
      cdsDomainQueryRec.Close;
      DomainQueryRec.SQL.Text := dmStrat.DomainQuery.SQL.Text;
      DomainQueryRec.ParamByName('USERID').AsString := UserSession.UserID;
      cdsDomainQueryRec.Open;
    end;
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmStrat.cdsDomainQueryRec.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmStrat.cdsDomainQueryRec.Delete;
        end;
      end;
    end;
  try
    UserSession.NumRecordsFound := dmStrat.cdsDomainQueryRec.RecordCount;
  finally
    dmStrat.cdsDomainQueryRec.Close;
  end;
end;

procedure TdmStrat.DeleteRefRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteRef start';
  try
    dmStrat.qStratRef.ParamByName('UnitID').AsInteger := dmStrat.cdsRefsUNITID.AsInteger;
    dmStrat.qStratRef.ParamByName('SourceNum').AsInteger := dmStrat.cdsRefsSOURCENUM.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qStratRef.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.DeleteDomainRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteDomain start';
  try
    dmStrat.qDeleteStratDomain.ParamByName('UnitID').AsInteger := dmStrat.cdsStratDomainUNITID.AsInteger;
    dmStrat.qDeleteStratDomain.ParamByName('DomainID').AsString := dmStrat.cdsStratDomainDOMAINID.AsString;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qDeleteStratDomain.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.DeleteSucceedingLinkRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteSucceedingLink start';
  try
    dmStrat.qDeleteSucceedingLink.ParamByName('UnitID').AsInteger := dmStrat.cdsSucceedingUNITID.AsInteger;
    dmStrat.qDeleteSucceedingLink.ParamByName('SucceededBy').AsInteger := dmStrat.cdsSucceedingSUCCEEDEDBY.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qDeleteSucceedingLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.DeletePrecedingLinkRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeletePrecedingLink start';
  try
    dmStrat.qDeletePrecedingLink.ParamByName('UnitID').AsInteger := dmStrat.cdsPreceedingUNITID.AsInteger;
    dmStrat.qDeletePrecedingLink.ParamByName('PrecededBy').AsInteger := dmStrat.cdsPreceedingPRECEDEDBY.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qDeletePrecedingLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.DeleteSynonymLinkRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteSynonymLink start';
  try
    dmStrat.qDeleteSynonymLink.ParamByName('UnitID').AsInteger := dmStrat.cdsSynonymsUNITID.AsInteger;
    dmStrat.qDeleteSynonymLink.ParamByName('SynonymID').AsInteger := dmStrat.cdsSynonymsSYNONYMID.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qDeleteSynonymLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.DeleteCorrelativeLinkRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteCorrelativeLink start';
  try
    dmStrat.qDeleteCorrelativeLink.ParamByName('UnitID').AsInteger := dmStrat.cdsCorrelativesUNITID.AsInteger;
    dmStrat.qDeleteCorrelativeLink.ParamByName('CorrelativeID').AsInteger := dmStrat.cdsCorrelativesCORRELATIVEID.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qDeleteCorrelativeLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.DeleteSpecialFeatureLinkRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteSpecialFeatureLink start';
  try
    dmStrat.qDeleteSpecialFeatureLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitFeatureUNITID.AsInteger;
    dmStrat.qDeleteSpecialFeatureLink.ParamByName('SpecialFeatureID').AsInteger := dmStrat.cdsUnitFeatureSPECIALFEATUREID.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qDeleteSpecialFeatureLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.DeleteLinkToApplicationRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteLinkToApplication start';
  try
    dmStrat.qDeleteLinkToApplication.ParamByName('UnitID').AsInteger := dmStrat.cdsLinkedApplicationsUNITID.AsInteger;
    dmStrat.qDeleteLinkToApplication.ParamByName('ApplicationID').AsInteger := dmStrat.cdsLinkedApplicationsAPPLICATIONID.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qDeleteLinkToApplication.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.DeleteUnitWhoForLinkRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteUnitLinkToWhoFor start';
  try
    //dmStrat.qDeleteUnitWhoForLink.ParamByName('UnitID').AsInteger := dmStrat.cdsLinkedApplicationsUNITID.AsInteger;
    //dmStrat.qDeleteUnitWhoForLink.ParamByName('WhoForID').AsInteger := dmStrat.cdsLinkedApplicationsAPPLICATIONID.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        //dmStrat.qDeleteUnitWhoForLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;


procedure TdmStrat.DeleteDomainWhoForLinkRecord (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'DeleteDomainLinkToWhoFor start';
  try
    //dmStrat.qDeleteDomainWhoForLink.ParamByName('UnitID').AsInteger := dmStrat.cdsLinkedApplicationsUNITID.AsInteger;
    //dmStrat.qDeleteDomainWhoForLink.ParamByName('WhoForID').AsInteger := dmStrat.cdsLinkedApplicationsAPPLICATIONID.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        //dmStrat.qDeleteUnitWhoForLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to delete linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.LinkUnitsToParentDomain;
var
  tmpUnitID : integer;
  tmpDomainID : integer;
  TD: TDBXTransaction;
begin
  tmpDomainID := dmStrat.cdsDomainQDOMAINPARENTID.AsInteger;
  dmStrat.cdsDomainUnits.First;
  repeat
    tmpUnitID := dmStrat.cdsDomainUnitsUNITID.AsInteger;
    try
      dmStrat.qLinkUnitToParentDomain.Close;
      dmStrat.qLinkUnitToParentDomain.ParamByName('UNITID').AsInteger := tmpUnitID;
      dmStrat.qLinkUnitToParentDomain.ParamByName('DOMAINID').AsInteger := tmpDomainID;

      //if not dmStrat.sqlcStrat.InTransaction then
      //begin
        TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmStrat.qLinkUnitToParentDomain.ExecSQL(false);
          dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        except
          dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        end;
      //end;
    except
    end;
    dmStrat.cdsDomainUnits.Next;
  until dmStrat.cdsDomainUnits.Eof;
  dmStrat.cdsDomainUnits.First;
end;

procedure TdmStrat.InsertOrogeny (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertOrogeny start';
  dmStrat.qInsertOrogeny.SQL.Clear;
  dmStrat.qInsertOrogeny.SQL.Add('DELETE FROM OROGENIES');
  dmStrat.qInsertOrogeny.SQL.Add('WHERE OROGENIES.OROGENY = '+''''+'NEW'+UserSession.UserID+'''');

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStrat.qInsertOrogeny.SQL.Text);
  end;

  //if not dmStrat.sqlcStrat.InTransaction then
  //begin
    TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmStrat.qInsertOrogeny.ExecSQL(false);
      dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
    except
      dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
      WasSuccessful := false;
    end;
  //end;
  dmStrat.qInsertOrogeny.SQL.Clear;
  dmStrat.qInsertOrogeny.SQL.Add('INSERT INTO OROGENIES');
  dmStrat.qInsertOrogeny.SQL.Add('(OROGENY, CONTINENTID)');
  dmStrat.qInsertOrogeny.SQL.Add('VALUES ('+''''+'NEW'+UserSession.UserID+''''+', '+''''+ValueForUndefinedContinentID+''''+')');

  //if UserSession.IsDeveloper then
  //begin
  //  dmUser.SetDeveloperData(dmStrat.qInsertOrogeny.SQL.Text);
  //end;

  try
    dmStrat.qInsertOrogeny.Close;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertOrogeny.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        //WebApplication.ShowMessage('New orogeny record successfully inserted');
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertSpecialFeatureLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertSpecialFeatureLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO UNITFEATURES');
    dmStrat.qInsertLink.SQL.Add('(UnitID, SpecialFeatureID)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :SpecialFeatureID)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitQUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('SpecialFeatureID').AsInteger := -1;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertDomainLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertDomainLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO STRATDOMAIN');
    dmStrat.qInsertLink.SQL.Add('(UnitID, DomainID)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :DomainID)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitQUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('DomainID').AsInteger := 0;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertGISLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertGISLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO STRATMAPS2');
    dmStrat.qInsertLink.SQL.Add('(UnitID, MapID2, DisplayOrder)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :MapID2, :DisplayOrder)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitQUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('MapID2').AsString := 'nd';
    dmStrat.qInsertLink.ParamByName('DisplayOrder').AsInteger := 999;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertSucceedingLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertSucceedingLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO SUCCEEDING');
    dmStrat.qInsertLink.SQL.Add('(UnitID, SucceededBy, SucRel)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :SucceededBy, :SucRel)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitQUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('SucceededBy').AsInteger := 0;
    dmStrat.qInsertLink.ParamByName('SucRel').AsString := 'NDS';
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData(dmStrat.qInsertLink.SQL.Text);
    end;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertPrecedingLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertPrecedingLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO PRECEDING');
    dmStrat.qInsertLink.SQL.Add('(UnitID, PrecededBy, PreRel)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :PrecededBy, :PreRel)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitQUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('PrecededBy').AsInteger := 0;
    dmStrat.qInsertLink.ParamByName('PreRel').AsString := 'NDP';
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData(dmStrat.qInsertLink.SQL.Text);
    end;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertSynonymLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertSynonymLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO SYNONYMS');
    dmStrat.qInsertLink.SQL.Add('(UnitID, SynonymID)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :SynonymID)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitQUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('SynonymID').AsInteger := 0;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertCorrelativeLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertCorrelativeLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO CORRELATIVES');
    dmStrat.qInsertLink.SQL.Add('(UnitID, CorrelativeID)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :CorrelativeID)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitQUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('CorrelativeID').AsInteger := 0;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertReferenceLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertReferenceLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO UNITREFS');
    dmStrat.qInsertLink.SQL.Add('(UnitID, SourceNum)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :SourceNum)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitQUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('SourceNum').AsInteger := 0;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertReference (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
  NewRefNum : integer;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertReference start';
  NewRefNum := 0;
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO SOURCELIST');
    dmStrat.qInsertLink.SQL.Add('(SourceNum, SourceShort, SourceYear, ContinentID)');
    dmStrat.qInsertLink.SQL.Add('Values (:SourceNum, :SourceShort, :SourceYear, :ContinentID)');
    dmStrat.qInsertLink.ParamByName('SourceNum').AsInteger := NewRefNum;
    dmStrat.qInsertLink.ParamByName('SourceShort').AsString := 'NEW'+UserSession.UserID;
    dmStrat.qInsertLink.ParamByName('SourceYear').AsInteger := 1900;
    dmStrat.qInsertLink.ParamByName('ContinentID').AsString := UserSession.NewContinentID;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertReverseCorrelativeLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertReverseCorrelativeLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO CORRELATIVES');
    dmStrat.qInsertLink.SQL.Add('(UnitID, CorrelativeID)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :CorrelativeID)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsCorrelativesCORRELATIVEID.AsInteger;
    dmStrat.qInsertLink.ParamByName('CorrelativeID').AsInteger := dmStrat.cdsCorrelativesUNITID.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        WebApplication.ShowMessage('Linked record successfully inserted');
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertReverseSynonymLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertReverseSynonymLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO SYNONYMS');
    dmStrat.qInsertLink.SQL.Add('(UnitID, SynonymID)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :SynonymID)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsSynonymsSYNONYMID.AsInteger;
    dmStrat.qInsertLink.ParamByName('SynonymID').AsInteger := dmStrat.cdsSynonymsUNITID.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        WebApplication.ShowMessage('Linked record successfully inserted');
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertReverseSucceedingLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertReverseSucceedingLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO PRECEDING');
    dmStrat.qInsertLink.SQL.Add('(UnitID, PrecededBy, PreRel)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :PrecededBy, :PreRel)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsSucceedingSUCCEEDEDBY.AsInteger;
    dmStrat.qInsertLink.ParamByName('PrecededBy').AsInteger := dmStrat.cdsSucceedingUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('PreRel').AsString := dmStrat.cdsSucceedingRELATIONSHIPREVID.AsString;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData(dmStrat.qInsertLink.SQL.Text);
      //dmUser.SetDeveloperData('UnitID = '+dmStrat.cdsSucceedingSUCCEEDEDBY.AsString);
      //dmUser.SetDeveloperData('PrecededBy = '+dmStrat.cdsSucceedingUNITID.AsString);
      //dmUser.SetDeveloperData('PreRel = '+dmStrat.cdsSucceedingRELATIONSHIPREVID.AsString);
    end;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        WebApplication.ShowMessage('Linked record successfully inserted');
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertReversePrecedingLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertReversePrecedingLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO SUCCEEDING');
    dmStrat.qInsertLink.SQL.Add('(UnitID, SucceededBy, SucRel)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :SucceededBy, :SucRel)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsPreceedingPRECEDEDBY.AsInteger;
    dmStrat.qInsertLink.ParamByName('SucceededBy').AsInteger := dmStrat.cdsPreceedingUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('SucRel').AsString := dmStrat.cdsPreceedingRELATIONSHIPREVID.AsString;
    if (UserSession.IsDeveloper) then
    begin
      //dmUser.SetDeveloperData(dmStrat.qInsertLink.SQL.Text);
      //dmUser.SetDeveloperData('UnitID = '+dmStrat.cdsPreceedingPRECEDEDBY.AsString);
      //dmUser.SetDeveloperData('Succeeded By = '+dmStrat.cdsPreceedingUNITID.AsString);
      //dmUser.SetDeveloperData('SucRel = '+dmStrat.cdsPreceedingRELATIONSHIPREVID.AsString);
    end;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        WebApplication.ShowMessage('Linked record successfully inserted');
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertApplicationLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertApplicationFeatureLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO APPLICLINK');
    dmStrat.qInsertLink.SQL.Add('(UnitID, ApplicationID)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :ApplicationID)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := dmStrat.cdsUnitQUNITID.AsInteger;
    dmStrat.qInsertLink.ParamByName('ApplicationID').AsInteger := 0;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertEconomicFeatureLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertEconomicFeatureLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO DOMAINDEPOSITS');
    dmStrat.qInsertLink.SQL.Add('(DomainID, SBDepositID)');
    dmStrat.qInsertLink.SQL.Add('Values (:DomainID, :SBDepositID)');
    dmStrat.qInsertLink.ParamByName('DomainID').AsInteger := dmStrat.cdsDomainQDOMAINID.AsInteger;
    dmStrat.qInsertLink.ParamByName('SBDepositID').AsInteger := -1;
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmStrat.qInsertLink.SQL.Text);
    end;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertMetamorphismLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tmpOrog : integer;
  tmpCont : string;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertMetamorphismLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO DOMANMETAMORPHISM');
    dmStrat.qInsertLink.SQL.Add('(DomainID, MetamorphismOrder, GradeID, OrogenyID)');
    dmStrat.qInsertLink.SQL.Add('Values (:DomainID, :MetamorphismOrder, :GradeID, :OrogenyID)');
    dmStrat.qInsertLink.ParamByName('DomainID').AsInteger := dmStrat.cdsDomainQDOMAINID.AsInteger;
    dmStrat.qInsertLink.ParamByName('MetamorphismOrder').AsInteger := 999;
    dmStrat.qInsertLink.ParamByName('GradeID').AsString := 'U';
    tmpCont := UserSession.ContinentValues[0];
    tmpOrog := -1;
    if tmpCont = 'AFR' then tmpOrog := -8;
    if tmpCont = 'ANT' then tmpOrog := -7;
    if tmpCont = 'ASI' then tmpOrog := -6;
    if tmpCont = 'EUR' then tmpOrog := -5;
    if tmpCont = 'NAM' then tmpOrog := -4;
    if tmpCont = 'OCE' then tmpOrog := -3;
    if tmpCont = 'SAM' then tmpOrog := -2;
    if tmpCont = 'UND' then tmpOrog := -1;
    dmStrat.qInsertLink.ParamByName('OrogenyID').AsInteger := tmpOrog;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertDeformationLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tmpOrog : integer;
  tmpCont : string;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertDeformationLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO DOMAINDEFORMATION');
    dmStrat.qInsertLink.SQL.Add('(DomainID, DeformationOrder,OrogenyID)');
    dmStrat.qInsertLink.SQL.Add('Values (:DomainID, :DeformationOrder, :OrogenyID)');
    dmStrat.qInsertLink.ParamByName('DomainID').AsInteger := dmStrat.cdsDomainQDOMAINID.AsInteger;
    dmStrat.qInsertLink.ParamByName('DeformationOrder').AsInteger := 999;
    tmpCont := UserSession.ContinentValues[0];
    tmpOrog := -1;
    if tmpCont = 'AFR' then tmpOrog := -8;
    if tmpCont = 'ANT' then tmpOrog := -7;
    if tmpCont = 'ASI' then tmpOrog := -6;
    if tmpCont = 'EUR' then tmpOrog := -5;
    if tmpCont = 'NAM' then tmpOrog := -4;
    if tmpCont = 'OCE' then tmpOrog := -3;
    if tmpCont = 'SAM' then tmpOrog := -2;
    if tmpCont = 'UND' then tmpOrog := -1;
    dmStrat.qInsertLink.ParamByName('OrogenyID').AsInteger := tmpOrog;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.InsertStratUnitLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertStratUnitLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO STRATDOMAIN');
    dmStrat.qInsertLink.SQL.Add('(UnitID, DomainID)');
    dmStrat.qInsertLink.SQL.Add('Values (:UnitID, :DomainID)');
    dmStrat.qInsertLink.ParamByName('UnitID').AsInteger := 0;
    dmStrat.qInsertLink.ParamByName('DomainID').AsInteger := dmStrat.cdsDomainQDOMAINID.AsInteger;
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmStrat.qInsertLink.SQL.Text);
    end;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;


procedure TdmStrat.InsertDomainLIPLink (var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertDomainLIPLink start';
  try
    dmStrat.qInsertLink.Close;
    dmStrat.qInsertLink.SQL.Clear;
    dmStrat.qInsertLink.SQL.Add('INSERT INTO LIPDOMAIN');
    dmStrat.qInsertLink.SQL.Add('(LIPID, DomainID)');
    dmStrat.qInsertLink.SQL.Add('Values (:LIPID, :DomainID)');
    dmStrat.qInsertLink.ParamByName('LIPID').AsInteger := 0;
    dmStrat.qInsertLink.ParamByName('DomainID').AsInteger := dmStrat.cdsDomainQDomainID.AsInteger;
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertLink.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert linked record '+UserSession.WhereAmI);
  end;
end;

procedure TdmStrat.SubmitNewReference(var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  try
    WasSuccessful := true;
    dmStrat.qRefNew.SQL.Clear;
    dmStrat.qRefNew.SQL.Add('DELETE FROM SOURCELIST');
    dmStrat.qRefNew.SQL.Add('WHERE SOURCELIST.SOURCESHORT = '+''''+'NEW'+UserSession.UserID+'''');
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qRefNew.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
    dmStrat.qRefNew.SQL.Clear;
    dmStrat.qRefNew.SQL.Add('INSERT INTO SOURCELIST');
    dmStrat.qRefNew.SQL.Add('(SOURCESHORT, CONTINENTID)');
    dmStrat.qRefNew.SQL.Add('VALUES ('+''''+'NEW'+UserSession.UserID+''''+', '+''''+ValueForUndefinedContinentID+''''+')');

      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData(dmStrat.qRefNew.SQL.Text);
      end;

    WasSuccessful := true;
    //WebApplication.ShowMessage('test 0');
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qRefNew.ExecSQL(false);
        //WebApplication.ShowMessage('test 1');
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        //WebApplication.ShowMessage('test 2');
        UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
  end;
end;

procedure TdmStrat.InsertUserUnits(IncludeSubunits : boolean);
var
  TD: TDBXTransaction;
  tUserID : string;
  tParentID : integer;
  tUnitIDstr, tUnitAgestr : string;
  tDVUnitIDstr,tUnitName,tUnitRank,tCountryID : string;
begin
  UserSession.WhereAmI := 'InsertUserUnit start';
  dmStrat.cdsQuery1.First;
  tUserID := UserSession.UserID;
  repeat
    tUnitIDstr := dmStrat.cdsQuery1UNITID.AsString;
    tUnitAgestr := dmStrat.cdsQuery1MINAGE.AsString;
    tDVUnitIDstr := '0';
    tUnitName := dmStrat.cdsQuery1UNITNAME.AsString;
    tUnitRank := dmStrat.cdsQuery1UNITRANK.AsString;
    tCountryID := dmStrat.cdsQuery1COUNTRYID.AsString;
    dmStrat.qInsertUserUnits.Close;
    dmStrat.qInsertUserUnits.SQL.Clear;
    dmStrat.qInsertUserUnits.SQL.Add('INSERT INTO USERUNITS');
    dmStrat.qInsertUserUnits.SQL.Add('(USERID,UNITID,UNITAGE,DVUNITID,STRATDBUNITNAME,STRATDBUNITRANK,COUNTRYID)');
    dmStrat.qInsertUserUnits.SQL.Add('VALUES ('+''''+tUserID+''''+', '+''''+tUnitIDstr+''''+', '+''''+tUnitAgestr+''''+', '+''''+tDVUnitIDstr+''''+', '+''''+tUnitName+''''+', '+''''+tUnitRank+''''+', '+''''+tCountryID+''''+')');
    //dmUser.SetDeveloperData(dmStrat.qInsertUserUnits.SQL.Text);
    //if not dmStrat.sqlcStrat.InTransaction then
    //begin
      TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStrat.qInsertUserUnits.ExecSQL(false);
        dmStrat.sqlcStrat.CommitFreeAndNil(TD); //on success, commit the changes;
      except
        dmStrat.sqlcStrat.RollbackFreeAndNil(TD); //on failure, undo the changes;
      end;
    //end;
    dmStrat.cdsQuery1.Next;
  until (dmStrat.cdsQuery1.Eof);
  //dmUser.SetDeveloperData('Before IncludeSubunits');
  if (IncludeSubunits) then
  begin
    dmStrat.cdsQuery1.First;
    tUserID := UserSession.UserID;
    repeat
      tParentID := dmStrat.cdsQuery1UNITID.AsInteger;
      //dmUser.SetDeveloperData('In IncludeSubunits '+IntToStr(tParentID));
      if (tParentID <> 0) then
      begin
        //dmUser.SetDeveloperData('ParentID is '+IntToStr(tParentID));
        dmStrat.qThisUnit.Close;
        dmStrat.qThisUnit.ParamByName('UserID').AsString := UserSession.UserID;
        dmStrat.qThisUnit.ParamByName('ParentID').AsString := IntToStr(tParentID);
        dmStrat.cdsThisUnit.Close;
        dmStrat.cdsThisUnit.Open;
        if (dmStrat.cdsThisUnit.RecordCount > 0) then
        begin
          repeat
            tUnitIDstr := dmStrat.cdsThisUnitUNITID.AsString;
            tUnitAgestr := dmStrat.cdsThisUnitMINAGE.AsString;
            tDVUnitIDstr := '0';
            tUnitName := dmStrat.cdsThisUnitUNITNAME.AsString;
            tUnitRank := dmStrat.cdsThisUnitUNITRANK.AsString;
            tCountryID := dmStrat.cdsThisUnitCOUNTRYID.AsString;
            dmStrat.qInsertUserUnits.Close;
            dmStrat.qInsertUserUnits.SQL.Clear;
            dmStrat.qInsertUserUnits.SQL.Add('INSERT INTO USERUNITS');
            dmStrat.qInsertUserUnits.SQL.Add('(USERID,UNITID,UNITAGE,DVUNITID,STRATDBUNITNAME,STRATDBUNITRANK,COUNTRYID)');
            dmStrat.qInsertUserUnits.SQL.Add('VALUES ('+''''+tUserID+''''+', '+''''+tUnitIDstr+''''+', '+''''+tUnitAgestr+''''+', '+''''+tDVUnitIDstr+''''+', '+''''+tUnitName+''''+', '+''''+tUnitRank+''''+', '+''''+tCountryID+''''+')');
            //dmUser.SetDeveloperData(dmStrat.qInsertUserUnits.SQL.Text);
            //if not dmStrat.sqlcStrat.InTransaction then
            //begin
              TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
              try
                dmStrat.qInsertUserUnits.ExecSQL(false);
                dmStrat.sqlcStrat.CommitFreeAndNil(TD); //on success, commit the changes;
              except
                dmStrat.sqlcStrat.RollbackFreeAndNil(TD); //on failure, undo the changes;
              end;
            //end;
            dmStrat.cdsThisUnit.Next;
          until dmStrat.cdsThisUnit.Eof;
        end;
      end;
      dmStrat.cdsQuery1.Next;
    until (dmStrat.cdsQuery1.Eof);
  end;
end;

procedure TdmStrat.DeleteUserUnits;
var
  TD: TDBXTransaction;
begin
  UserSession.WhereAmI := 'DeleteUserUnit start';
  dmStrat.qDeleteAny.Close;
  dmStrat.qDeleteAny.SQL.Clear;
  dmStrat.qDeleteAny.SQL.Add('DELETE FROM USERUNITS');
  dmStrat.qDeleteAny.SQL.Add('WHERE USERUNITS.USERID = :UserID');
  dmStrat.qDeleteAny.ParamByName('UserID').AsString := UserSession.UserID;
  //if not dmStrat.sqlcStrat.InTransaction then
  //begin
    TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmStrat.qDeleteAny.ExecSQL(false);
      dmStrat.sqlcStrat.CommitFreeAndNil(TD); //on success, commit the changes;
    except
      dmStrat.sqlcStrat.RollbackFreeAndNil(TD); //on failure, undo the changes;
    end;
  //end;
end;

procedure TdmStrat.InsertUserProject(var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  tUserID : string;
  tUserProjectID : integer;
  tUserProjectName : string;
begin
  UserSession.WhereAmI := 'InsertUserProject start';
  tUserProjectID := 14;
  tUserID := UserSession.UserID;
  tUserProjectName := 'New'+tUserID;
  dmStrat.qInsertUserProject.Close;
  dmStrat.qInsertUserProject.SQL.Clear;
  dmStrat.qInsertUserProject.SQL.Add('INSERT INTO USERPROJECTS');
  dmStrat.qInsertUserProject.SQL.Add('(UserID,UserProjectName)');
  dmStrat.qInsertUserProject.SQL.Add('Values ('+QuotedStr(tUserID)+','+QuotedStr(tUserProjectName)+')');
  //dmStrat.qInsertUserProject.ParamByName('UserProjectID').AsInteger := tUserProjectID;
  //dmStrat.qInsertUserProject.ParamByName('UserID').AsString := tUserID;
  //dmStrat.qInsertUserProject.ParamByName('UserProjectName').AsString := tUserProjectName;
  TD := dmStrat.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmStrat.qInsertUserProject.ExecSQL(true);
    dmStrat.sqlcStrat.CommitFreeAndNil(TD); //on success, commit the changes;
    WasSuccessful := true;
  except
    dmStrat.sqlcStrat.RollbackFreeAndNil(TD); //on failure, undo the changes;
    WasSuccessful := false;
  end;
end;

end.
