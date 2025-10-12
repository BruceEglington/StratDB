unit IWStrat_dmDV;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  DBXCommon,
  IWCompListbox, WideStrings,
  Data.DBXFirebird, DbxDevartInterBase;

type
  TdmDV = class(TDataModule)
    QueryDV: TSQLQuery;
    dspQueryDV: TDataSetProvider;
    cdsQueryDV: TClientDataSet;
    dsQueryDV: TDataSource;
    cdsQueryDVCOUNTRYABR: TWideStringField;
    cdsQueryDVUNITNAME: TWideStringField;
    cdsQueryDVMATERIALABR: TWideStringField;
    cdsQueryDVISOTOPESYSTEM: TWideStringField;
    cdsQueryDVAPPROACHABR: TWideStringField;
    cdsQueryDVINTERPABR: TWideStringField;
    cdsQueryDVIAGE: TIntegerField;
    cdsQueryDVIAGEPERROR: TIntegerField;
    cdsQueryDVIAGEMERROR: TIntegerField;
    cdsQueryDVAGEUNITS: TWideStringField;
    cdsQueryDVLITHOLOGY: TWideStringField;
    cdsQueryDVRECORDID: TIntegerField;
    cdsQueryDVCOUNTRY: TWideStringField;
    cdsQueryDVMATERIALDESCRIPTION: TWideStringField;
    cdsQueryDVINTERPRETATION: TWideStringField;
    cdsQueryDVAPPROACHDESCRIPTION: TWideStringField;
    cdsQueryDVISOSYSTEMNAME: TWideStringField;
    cdsQueryDVWHOFORID: TWideStringField;
    cdsQueryDVTECHABR: TWideStringField;
    cdsQueryDVTECHNIQUE: TWideStringField;
    qAddToDV: TSQLQuery;
    qDVMinMax: TSQLQuery;
    dspDVMinMax: TDataSetProvider;
    cdsDVMinMax: TClientDataSet;
    dsDVMinMax: TDataSource;
    qDomainDates: TSQLQuery;
    dsqDomainDates: TDataSource;
    dspDomainDates: TDataSetProvider;
    cdsDomainDates: TClientDataSet;
    cdsDomainDatesDOMAINID: TIntegerField;
    cdsDomainDatesUNITID: TIntegerField;
    cdsDomainDatesINC4CHTYN: TWideStringField;
    cdsDomainDatesDOMAINNAME: TWideStringField;
    cdsDomainDatesCOUNTRYID: TWideStringField;
    cdsDomainDatesUNITNAME: TWideStringField;
    cdsDomainDatesRANKID: TWideStringField;
    cdsDomainDatesAGEYEARS: TFMTBCDField;
    cdsDomainDatesMINAGE: TFloatField;
    cdsDomainDatesMAXAGE: TFloatField;
    cdsDomainDatesUNITRANK: TWideStringField;
    dsDomainDates: TDataSource;
    qDVUserDomains: TSQLQuery;
    dspDVUserDomains: TDataSetProvider;
    cdsDVUserDomains: TClientDataSet;
    dsDVUserDomains: TDataSource;
    cdsDVUserDomainsUSERID: TWideStringField;
    cdsDVUserDomainsDOMAINORDER: TIntegerField;
    cdsDVUserDomainsDOMAINID: TIntegerField;
    cdsDVUserDomainsDOMAINXMIN: TFloatField;
    cdsDVUserDomainsDOMAINXMAX: TFloatField;
    qDeleteDVUserDomains: TSQLQuery;
    qDVUser: TSQLQuery;
    dspDVUser: TDataSetProvider;
    cdsDVUser: TClientDataSet;
    dsDVUser: TDataSource;
    cdsDVUserNUMCONTRIBUTED: TIntegerField;
    qDVDomainDatesProvinces: TSQLQuery;
    dspDVDomainDatesProvinces: TDataSetProvider;
    cdsDVDomainDatesProvinces: TClientDataSet;
    dsDVDomainDatesProvinces: TDataSource;
    cdsDVDomainDatesProvincesDOMAINORDER: TIntegerField;
    cdsDVDomainDatesProvincesDOMAINID: TIntegerField;
    cdsDVDomainDatesProvincesDOMAINXMIN: TFloatField;
    cdsDVDomainDatesProvincesDOMAINXMAX: TFloatField;
    cdsDVDomainDatesProvincesCOUNTRYABR: TWideStringField;
    cdsDVDomainDatesProvincesUNITNAME: TWideStringField;
    cdsDVDomainDatesProvincesMATERIALABR: TWideStringField;
    cdsDVDomainDatesProvincesISOTOPESYSTEM: TWideStringField;
    cdsDVDomainDatesProvincesAPPROACHABR: TWideStringField;
    cdsDVDomainDatesProvincesTECHABR: TWideStringField;
    cdsDVDomainDatesProvincesINTERPABR: TWideStringField;
    cdsDVDomainDatesProvincesIAGE: TIntegerField;
    cdsDVDomainDatesProvincesIAGEPERROR: TIntegerField;
    cdsDVDomainDatesProvincesIAGEMERROR: TIntegerField;
    cdsDVDomainDatesProvincesAGEUNITS: TWideStringField;
    cdsDVDomainDatesProvincesLITHOLOGY: TWideStringField;
    cdsDVDomainDatesProvincesRECORDID: TIntegerField;
    cdsDVDomainDatesProvincesRAGE: TFloatField;
    cdsDVDomainDatesProvincesRAGEPERROR: TFloatField;
    cdsDVDomainDatesProvincesRAGEMERROR: TFloatField;
    cdsDVDomainDatesProvincesPREFLEVEL: TSmallintField;
    sqlcDateView: TSQLConnection;
    qDomainCurves: TSQLQuery;
    dsqDomainCurves: TDataSource;
    dspDomainCurves: TDataSetProvider;
    cdsDomainCurves: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TWideStringField;
    StringField2: TWideStringField;
    StringField3: TWideStringField;
    StringField4: TWideStringField;
    StringField5: TWideStringField;
    FMTBCDField1: TFMTBCDField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField6: TWideStringField;
    dsDomainCurves: TDataSource;
    qSuite: TSQLQuery;
    dspSuite: TDataSetProvider;
    cdsSuite: TClientDataSet;
    dsSuite: TDataSource;
    cdsSuiteUNITID: TIntegerField;
    cdsSuiteUNITNAME: TWideStringField;
    cdsSuiteUNITRANK: TWideStringField;
    cdsSuiteGISID: TIntegerField;
    cdsSuiteFORMATIONOFFSET: TFloatField;
    cdsSuiteFORMATIONOFFSET2: TFloatField;
    cdsSuiteFORMATIONOFFSET3: TFloatField;
    cdsSuitePARENTID: TIntegerField;
    cdsQueryDVUNITID: TIntegerField;
    cdsQueryDVRAGE: TFloatField;
    cdsQueryDVRAGEPERROR: TFloatField;
    cdsQueryDVRAGEMERROR: TFloatField;
    cdsDVDomainDatesProvincesDOMAINNAME: TWideStringField;
    cdsDVDomainDatesProvincesUNITID: TIntegerField;
    qSuiteName: TSQLQuery;
    dspSuiteName: TDataSetProvider;
    cdsSuiteName: TClientDataSet;
    dsSuiteName: TDataSource;
    cdsSuiteNameUNITID: TIntegerField;
    qCount: TSQLQuery;
    dspCount: TDataSetProvider;
    cdsCount: TClientDataSet;
    dsCount: TDataSource;
    qDVpdf: TSQLQuery;
    dspDVpdf: TDataSetProvider;
    cdsDVpdf: TClientDataSet;
    dsDVpdf: TDataSource;
    cdsDVpdfCOUNTRYABR: TWideStringField;
    cdsDVpdfUNITID: TIntegerField;
    cdsDVpdfMATERIALABR: TWideStringField;
    cdsDVpdfISOTOPESYSTEM: TWideStringField;
    cdsDVpdfAPPROACHABR: TWideStringField;
    cdsDVpdfTECHABR: TWideStringField;
    cdsDVpdfINTERPABR: TWideStringField;
    cdsDVpdfAGEUNITS: TWideStringField;
    cdsDVpdfRECORDID: TIntegerField;
    cdsDVpdfRAGE: TFloatField;
    cdsDVpdfRAGEPERROR: TFloatField;
    cdsDVpdfRAGEMERROR: TFloatField;
    cdsDVpdfWHOFORID: TWideStringField;
    qUserUnitSuites: TSQLQuery;
    dspUserUnitSuites: TDataSetProvider;
    cdsUserUnitSUites: TClientDataSet;
    dsUserUnitSUites: TDataSource;
    qUserUnitSuiteSamples: TSQLQuery;
    dspUserUnitSuiteSamples: TDataSetProvider;
    cdsUserUnitSuiteSamples: TClientDataSet;
    dsUserUnitSuiteSamples: TDataSource;
    cdsUserUnitSuiteSamplesUSERID: TWideStringField;
    cdsUserUnitSuiteSamplesUNITID: TIntegerField;
    cdsUserUnitSuiteSamplesSAMPLENO: TWideStringField;
    cdsUserUnitSuiteSamplesSTRATDBUNITID: TIntegerField;
    cdsUserUnitSuiteSamplesSTRATDBUNITNAME: TWideStringField;
    cdsUserUnitSuiteSamplesSTRATDBUNITRANK: TWideStringField;
    cdsUserUnitSuiteSamplesSTRATDBUNITAGE: TFloatField;
    cdsUserUnitSuiteSamplesLONGITUDE: TFloatField;
    cdsUserUnitSuiteSamplesLATITUDE: TFloatField;
    qUserSuiteForUnit: TSQLQuery;
    dspUserSuiteForUnit: TDataSetProvider;
    cdsUserSuiteForUnit: TClientDataSet;
    dsUserSuiteForUnit: TDataSource;
    qUserSamplesForUnit: TSQLQuery;
    dspUserSamplesForUnit: TDataSetProvider;
    cdsUserSamplesForUnit: TClientDataSet;
    dsUserSamplesForUnit: TDataSource;
    cdsUserSuiteForUnitUNITID: TIntegerField;
    cdsUserSamplesForUnitSAMPLENO: TWideStringField;
    cdsUserSamplesForUnitLONGITUDE: TFloatField;
    cdsUserSamplesForUnitLATITUDE: TFloatField;
    cdsUserSamplesForUnitELEVATION: TFloatField;
    cdsUserSamplesForUnitUNITID: TIntegerField;
    qInsertUserUnitSamples: TSQLQuery;
    qDeleteAny: TSQLQuery;
    cdsUserUnitSuiteSamplesCOUNTRYID: TWideStringField;
    qRawSmp: TSQLQuery;
    qRawSmpSAMPLENO: TWideStringField;
    qRawSmpFRAC: TWideStringField;
    dsqRawSmp: TDataSource;
    dspRawSmp: TDataSetProvider;
    cdsRawSmp: TClientDataSet;
    cdsRawSmpSAMPLENO: TWideStringField;
    cdsRawSmpFRAC: TWideStringField;
    cdsRawSmpqRawDataXerr: TDataSetField;
    cdsRawSmpqRawDataX: TDataSetField;
    cdsRawSmpqRawDataR: TDataSetField;
    cdsRawSmpqRawErrTypeX: TDataSetField;
    cdsRawSmpqRawErrTypeY: TDataSetField;
    cdsRawSmpqRawErrTypeZ: TDataSetField;
    cdsRawSmpqRawNormalisedValueZ: TDataSetField;
    cdsRawSmpqRawNormalisedValueY: TDataSetField;
    cdsRawSmpqRawDataPrecZ: TDataSetField;
    cdsRawSmpqRawDataZerr: TDataSetField;
    cdsRawSmpqRawDataZ: TDataSetField;
    cdsRawSmpqRawDataPrecY: TDataSetField;
    cdsRawSmpqRawDataYerr: TDataSetField;
    cdsRawSmpqRawDataY: TDataSetField;
    cdsRawSmpqRawDataPrecX: TDataSetField;
    cdsRawSmpqRawNormalisedValueX: TDataSetField;
    cdsRawSmpqRawAgePref: TDataSetField;
    cdsRawSmpqRawDiscordance: TDataSetField;
    cdsRawSmpqRawRef: TDataSetField;
    cdsRawSmpqRawSmpLoc: TDataSetField;
    cdsRawSmpqRawDataDM: TDataSetField;
    dsRawSmp: TDataSource;
    qRawDataX: TSQLQuery;
    qRawDataXSAMPLENO: TWideStringField;
    qRawDataXFRAC: TWideStringField;
    qRawDataXISOSYSTEM: TWideStringField;
    qRawDataXVARIABLEID: TWideStringField;
    qRawDataXDATAVALUE: TFloatField;
    qRawDataXNORMALISINGSTANDARD: TWideStringField;
    qRawDataXSTANDARDVALUE: TFloatField;
    qRawDataXVARIABLENAME: TWideStringField;
    dsqRawDataX: TDataSource;
    cdsRawDataX: TClientDataSet;
    cdsRawDataXSAMPLENO: TWideStringField;
    cdsRawDataXFRAC: TWideStringField;
    cdsRawDataXISOSYSTEM: TWideStringField;
    cdsRawDataXVARIABLEID: TWideStringField;
    cdsRawDataXDATAVALUE: TFloatField;
    cdsRawDataXNORMALISINGSTANDARD: TWideStringField;
    cdsRawDataXSTANDARDVALUE: TFloatField;
    cdsRawDataXVARIABLENAME: TWideStringField;
    cdsRawDataXqRawStandardValueX: TDataSetField;
    dsRawDataX: TDataSource;
    qRawStandardValueX: TSQLQuery;
    qRawStandardValueXACCEPTEDVALUE: TFloatField;
    cdsRawStandardValueX: TClientDataSet;
    cdsRawStandardValueXACCEPTEDVALUE: TFloatField;
    dsRawStandardValueX: TDataSource;
    qRawNormalisedValueX: TSQLQuery;
    qRawNormalisedValueXSAMPLENO: TWideStringField;
    qRawNormalisedValueXFRAC: TWideStringField;
    qRawNormalisedValueXISOSYSTEM: TWideStringField;
    qRawNormalisedValueXVARIABLEID: TWideStringField;
    qRawNormalisedValueXDATAVALUE: TFloatField;
    qRawNormalisedValueXNORMALISINGSTANDARD: TWideStringField;
    qRawNormalisedValueXSTANDARDVALUE: TFloatField;
    qRawNormalisedValueXACCEPTEDVALUE: TFloatField;
    qRawNormalisedValueXNORMALISEDVALUE: TFloatField;
    cdsRawNormalisedValueX: TClientDataSet;
    cdsRawNormalisedValueXSAMPLENO: TWideStringField;
    cdsRawNormalisedValueXFRAC: TWideStringField;
    cdsRawNormalisedValueXISOSYSTEM: TWideStringField;
    cdsRawNormalisedValueXVARIABLEID: TWideStringField;
    cdsRawNormalisedValueXDATAVALUE: TFloatField;
    cdsRawNormalisedValueXNORMALISINGSTANDARD: TWideStringField;
    cdsRawNormalisedValueXSTANDARDVALUE: TFloatField;
    cdsRawNormalisedValueXACCEPTEDVALUE: TFloatField;
    cdsRawNormalisedValueXNORMALISEDVALUE: TFloatField;
    dsRawNormalisedValueX: TDataSource;
    qRawDataXerr: TSQLQuery;
    qRawDataXerrSAMPLENO: TWideStringField;
    qRawDataXerrFRAC: TWideStringField;
    qRawDataXerrISOSYSTEM: TWideStringField;
    qRawDataXerrVARIABLEID: TWideStringField;
    qRawDataXerrDATAVALUE: TFloatField;
    qRawDataXerrNORMALISINGSTANDARD: TWideStringField;
    qRawDataXerrSTANDARDVALUE: TFloatField;
    qRawDataXerrVARIABLENAME: TWideStringField;
    dsqRawDataXerr: TDataSource;
    cdsRawDataXerr: TClientDataSet;
    cdsRawDataXerrSAMPLENO: TWideStringField;
    cdsRawDataXerrFRAC: TWideStringField;
    cdsRawDataXerrISOSYSTEM: TWideStringField;
    cdsRawDataXerrVARIABLEID: TWideStringField;
    cdsRawDataXerrDATAVALUE: TFloatField;
    cdsRawDataXerrNORMALISINGSTANDARD: TWideStringField;
    cdsRawDataXerrSTANDARDVALUE: TFloatField;
    cdsRawDataXerrVARIABLENAME: TWideStringField;
    dsRawDataXerr: TDataSource;
    qRawErrTypeX: TSQLQuery;
    qRawErrTypeXSAMPLENO: TWideStringField;
    qRawErrTypeXFRAC: TWideStringField;
    qRawErrTypeXISOSYSTEM: TWideStringField;
    qRawErrTypeXVARIABLEID: TWideStringField;
    qRawErrTypeXDATAVALUE: TFloatField;
    qRawErrTypeXNORMALISINGSTANDARD: TWideStringField;
    qRawErrTypeXSTANDARDVALUE: TFloatField;
    qRawErrTypeXVARIABLENAME: TWideStringField;
    cdsRawErrTypeX: TClientDataSet;
    cdsRawErrTypeXSAMPLENO: TWideStringField;
    cdsRawErrTypeXFRAC: TWideStringField;
    cdsRawErrTypeXISOSYSTEM: TWideStringField;
    cdsRawErrTypeXVARIABLEID: TWideStringField;
    cdsRawErrTypeXDATAVALUE: TFloatField;
    cdsRawErrTypeXNORMALISINGSTANDARD: TWideStringField;
    cdsRawErrTypeXSTANDARDVALUE: TFloatField;
    cdsRawErrTypeXVARIABLENAME: TWideStringField;
    dsRawErrTypeX: TDataSource;
    qRawDataPrecX: TSQLQuery;
    qRawDataPrecXSAMPLENO: TWideStringField;
    qRawDataPrecXFRAC: TWideStringField;
    qRawDataPrecXISOSYSTEM: TWideStringField;
    qRawDataPrecXVARIABLEID: TWideStringField;
    qRawDataPrecXDATAVALUE: TFloatField;
    cdsRawDataPrecX: TClientDataSet;
    cdsRawDataPrecXSAMPLENO: TWideStringField;
    cdsRawDataPrecXFRAC: TWideStringField;
    cdsRawDataPrecXISOSYSTEM: TWideStringField;
    cdsRawDataPrecXVARIABLEID: TWideStringField;
    cdsRawDataPrecXDATAVALUE: TFloatField;
    dsRawDataPrecX: TDataSource;
    qRawDataY: TSQLQuery;
    qRawDataYSAMPLENO: TWideStringField;
    qRawDataYFRAC: TWideStringField;
    qRawDataYISOSYSTEM: TWideStringField;
    qRawDataYVARIABLEID: TWideStringField;
    qRawDataYDATAVALUE: TFloatField;
    qRawDataYNORMALISINGSTANDARD: TWideStringField;
    qRawDataYSTANDARDVALUE: TFloatField;
    qRawDataYVARIABLENAME: TWideStringField;
    dsqRawDataY: TDataSource;
    cdsRawDataY: TClientDataSet;
    cdsRawDataYSAMPLENO: TWideStringField;
    cdsRawDataYFRAC: TWideStringField;
    cdsRawDataYISOSYSTEM: TWideStringField;
    cdsRawDataYVARIABLEID: TWideStringField;
    cdsRawDataYDATAVALUE: TFloatField;
    cdsRawDataYNORMALISINGSTANDARD: TWideStringField;
    cdsRawDataYSTANDARDVALUE: TFloatField;
    cdsRawDataYVARIABLENAME: TWideStringField;
    cdsRawDataYqRawStandardValueY: TDataSetField;
    dsRawDataY: TDataSource;
    qRawStandardValueY: TSQLQuery;
    qRawStandardValueYACCEPTEDVALUE: TFloatField;
    cdsRawStandardValueY: TClientDataSet;
    cdsRawStandardValueYACCEPTEDVALUE: TFloatField;
    dsRawStandardValueY: TDataSource;
    qRawNormalisedValueY: TSQLQuery;
    qRawNormalisedValueYSAMPLENO: TWideStringField;
    qRawNormalisedValueYFRAC: TWideStringField;
    qRawNormalisedValueYISOSYSTEM: TWideStringField;
    qRawNormalisedValueYVARIABLEID: TWideStringField;
    qRawNormalisedValueYDATAVALUE: TFloatField;
    qRawNormalisedValueYNORMALISINGSTANDARD: TWideStringField;
    qRawNormalisedValueYSTANDARDVALUE: TFloatField;
    qRawNormalisedValueYACCEPTEDVALUE: TFloatField;
    qRawNormalisedValueYNORMALISEDVALUE: TFloatField;
    cdsRawNormalisedValueY: TClientDataSet;
    cdsRawNormalisedValueYSAMPLENO: TWideStringField;
    cdsRawNormalisedValueYFRAC: TWideStringField;
    cdsRawNormalisedValueYISOSYSTEM: TWideStringField;
    cdsRawNormalisedValueYVARIABLEID: TWideStringField;
    cdsRawNormalisedValueYDATAVALUE: TFloatField;
    cdsRawNormalisedValueYNORMALISINGSTANDARD: TWideStringField;
    cdsRawNormalisedValueYSTANDARDVALUE: TFloatField;
    cdsRawNormalisedValueYACCEPTEDVALUE: TFloatField;
    cdsRawNormalisedValueYNORMALISEDVALUE: TFloatField;
    dsRawNormalisedValueY: TDataSource;
    qRawDataYerr: TSQLQuery;
    qRawDataYerrSAMPLENO: TWideStringField;
    qRawDataYerrFRAC: TWideStringField;
    qRawDataYerrISOSYSTEM: TWideStringField;
    qRawDataYerrVARIABLEID: TWideStringField;
    qRawDataYerrDATAVALUE: TFloatField;
    qRawDataYerrNORMALISINGSTANDARD: TWideStringField;
    qRawDataYerrSTANDARDVALUE: TFloatField;
    qRawDataYerrVARIABLENAME: TWideStringField;
    dsqRawDataYerr: TDataSource;
    cdsRawDataYerr: TClientDataSet;
    cdsRawDataYerrSAMPLENO: TWideStringField;
    cdsRawDataYerrFRAC: TWideStringField;
    cdsRawDataYerrISOSYSTEM: TWideStringField;
    cdsRawDataYerrVARIABLEID: TWideStringField;
    cdsRawDataYerrDATAVALUE: TFloatField;
    cdsRawDataYerrNORMALISINGSTANDARD: TWideStringField;
    cdsRawDataYerrSTANDARDVALUE: TFloatField;
    cdsRawDataYerrVARIABLENAME: TWideStringField;
    dsRawDataYerr: TDataSource;
    qRawDataR: TSQLQuery;
    qRawDataRSAMPLENO: TWideStringField;
    qRawDataRFRAC: TWideStringField;
    qRawDataRISOSYSTEM: TWideStringField;
    qRawDataRVARIABLEID: TWideStringField;
    qRawDataRDATAVALUE: TFloatField;
    qRawDataRNORMALISINGSTANDARD: TWideStringField;
    qRawDataRSTANDARDVALUE: TFloatField;
    qRawDataRVARIABLENAME: TWideStringField;
    cdsRawErrTypeY: TClientDataSet;
    cdsRawErrTypeYSAMPLENO: TWideStringField;
    cdsRawErrTypeYFRAC: TWideStringField;
    cdsRawErrTypeYISOSYSTEM: TWideStringField;
    cdsRawErrTypeYVARIABLEID: TWideStringField;
    cdsRawErrTypeYDATAVALUE: TFloatField;
    cdsRawErrTypeYNORMALISINGSTANDARD: TWideStringField;
    cdsRawErrTypeYSTANDARDVALUE: TFloatField;
    cdsRawErrTypeYVARIABLENAME: TWideStringField;
    dsRawErrTypeY: TDataSource;
    qRawDataPrecY: TSQLQuery;
    qRawDataPrecYSAMPLENO: TWideStringField;
    qRawDataPrecYFRAC: TWideStringField;
    qRawDataPrecYISOSYSTEM: TWideStringField;
    qRawDataPrecYVARIABLEID: TWideStringField;
    qRawDataPrecYDATAVALUE: TFloatField;
    cdsRawDataPrecY: TClientDataSet;
    cdsRawDataPrecYSAMPLENO: TWideStringField;
    cdsRawDataPrecYFRAC: TWideStringField;
    cdsRawDataPrecYISOSYSTEM: TWideStringField;
    cdsRawDataPrecYVARIABLEID: TWideStringField;
    cdsRawDataPrecYDATAVALUE: TFloatField;
    dsRawDataPrecY: TDataSource;
    qRawErrTypeY: TSQLQuery;
    qRawErrTypeYSAMPLENO: TWideStringField;
    qRawErrTypeYFRAC: TWideStringField;
    qRawErrTypeYISOSYSTEM: TWideStringField;
    qRawErrTypeYVARIABLEID: TWideStringField;
    qRawErrTypeYDATAVALUE: TFloatField;
    qRawErrTypeYNORMALISINGSTANDARD: TWideStringField;
    qRawErrTypeYSTANDARDVALUE: TFloatField;
    qRawErrTypeYVARIABLENAME: TWideStringField;
    cdsRawDataR: TClientDataSet;
    cdsRawDataRSAMPLENO: TWideStringField;
    cdsRawDataRFRAC: TWideStringField;
    cdsRawDataRISOSYSTEM: TWideStringField;
    cdsRawDataRVARIABLEID: TWideStringField;
    cdsRawDataRDATAVALUE: TFloatField;
    cdsRawDataRNORMALISINGSTANDARD: TWideStringField;
    cdsRawDataRSTANDARDVALUE: TFloatField;
    cdsRawDataRVARIABLENAME: TWideStringField;
    dsRawDataR: TDataSource;
    qRawDataZ: TSQLQuery;
    qRawDataZSAMPLENO: TWideStringField;
    qRawDataZFRAC: TWideStringField;
    qRawDataZISOSYSTEM: TWideStringField;
    qRawDataZVARIABLEID: TWideStringField;
    qRawDataZDATAVALUE: TFloatField;
    qRawDataZNORMALISINGSTANDARD: TWideStringField;
    qRawDataZSTANDARDVALUE: TFloatField;
    qRawDataZVARIABLENAME: TWideStringField;
    dsqRawDataZ: TDataSource;
    cdsRawDataZ: TClientDataSet;
    cdsRawDataZSAMPLENO: TWideStringField;
    cdsRawDataZFRAC: TWideStringField;
    cdsRawDataZISOSYSTEM: TWideStringField;
    cdsRawDataZVARIABLEID: TWideStringField;
    cdsRawDataZDATAVALUE: TFloatField;
    cdsRawDataZNORMALISINGSTANDARD: TWideStringField;
    cdsRawDataZSTANDARDVALUE: TFloatField;
    cdsRawDataZVARIABLENAME: TWideStringField;
    cdsRawDataZqRawStandardValueZ: TDataSetField;
    dsRawDataZ: TDataSource;
    qRawStandardValueZ: TSQLQuery;
    qRawStandardValueZACCEPTEDVALUE: TFloatField;
    cdsRawStandardValueZ: TClientDataSet;
    cdsRawStandardValueZACCEPTEDVALUE: TFloatField;
    dsRawStandardValueZ: TDataSource;
    qRawNormalisedValueZ: TSQLQuery;
    qRawNormalisedValueZSAMPLENO: TWideStringField;
    qRawNormalisedValueZFRAC: TWideStringField;
    qRawNormalisedValueZISOSYSTEM: TWideStringField;
    qRawNormalisedValueZVARIABLEID: TWideStringField;
    qRawNormalisedValueZDATAVALUE: TFloatField;
    qRawNormalisedValueZNORMALISINGSTANDARD: TWideStringField;
    qRawNormalisedValueZSTANDARDVALUE: TFloatField;
    qRawNormalisedValueZACCEPTEDVALUE: TFloatField;
    qRawNormalisedValueZNORMALISEDVALUE: TFloatField;
    cdsRawNormalisedValueZ: TClientDataSet;
    cdsRawNormalisedValueZSAMPLENO: TWideStringField;
    cdsRawNormalisedValueZFRAC: TWideStringField;
    cdsRawNormalisedValueZISOSYSTEM: TWideStringField;
    cdsRawNormalisedValueZVARIABLEID: TWideStringField;
    cdsRawNormalisedValueZDATAVALUE: TFloatField;
    cdsRawNormalisedValueZNORMALISINGSTANDARD: TWideStringField;
    cdsRawNormalisedValueZSTANDARDVALUE: TFloatField;
    cdsRawNormalisedValueZACCEPTEDVALUE: TFloatField;
    cdsRawNormalisedValueZNORMALISEDVALUE: TFloatField;
    dsRawNormalisedValueZ: TDataSource;
    qRawDataZerr: TSQLQuery;
    qRawDataZerrSAMPLENO: TWideStringField;
    qRawDataZerrFRAC: TWideStringField;
    qRawDataZerrISOSYSTEM: TWideStringField;
    qRawDataZerrVARIABLEID: TWideStringField;
    qRawDataZerrDATAVALUE: TFloatField;
    qRawDataZerrNORMALISINGSTANDARD: TWideStringField;
    qRawDataZerrSTANDARDVALUE: TFloatField;
    qRawDataZerrVARIABLENAME: TWideStringField;
    cdsRawDataZerr: TClientDataSet;
    cdsRawDataZerrSAMPLENO: TWideStringField;
    cdsRawDataZerrFRAC: TWideStringField;
    cdsRawDataZerrISOSYSTEM: TWideStringField;
    cdsRawDataZerrVARIABLEID: TWideStringField;
    cdsRawDataZerrDATAVALUE: TFloatField;
    cdsRawDataZerrNORMALISINGSTANDARD: TWideStringField;
    cdsRawDataZerrSTANDARDVALUE: TFloatField;
    cdsRawDataZerrVARIABLENAME: TWideStringField;
    dsRawDataZerr: TDataSource;
    qRawErrTypeZ: TSQLQuery;
    qRawErrTypeZSAMPLENO: TWideStringField;
    qRawErrTypeZFRAC: TWideStringField;
    qRawErrTypeZISOSYSTEM: TWideStringField;
    qRawErrTypeZVARIABLEID: TWideStringField;
    qRawErrTypeZDATAVALUE: TFloatField;
    qRawErrTypeZNORMALISINGSTANDARD: TWideStringField;
    qRawErrTypeZSTANDARDVALUE: TFloatField;
    qRawErrTypeZVARIABLENAME: TWideStringField;
    cdsRawErrTypeZ: TClientDataSet;
    cdsRawErrTypeZSAMPLENO: TWideStringField;
    cdsRawErrTypeZFRAC: TWideStringField;
    cdsRawErrTypeZISOSYSTEM: TWideStringField;
    cdsRawErrTypeZVARIABLEID: TWideStringField;
    cdsRawErrTypeZDATAVALUE: TFloatField;
    cdsRawErrTypeZNORMALISINGSTANDARD: TWideStringField;
    cdsRawErrTypeZSTANDARDVALUE: TFloatField;
    cdsRawErrTypeZVARIABLENAME: TWideStringField;
    dsRawErrTypeZ: TDataSource;
    qRawDataPrecZ: TSQLQuery;
    qRawDataPrecZSAMPLENO: TWideStringField;
    qRawDataPrecZFRAC: TWideStringField;
    qRawDataPrecZISOSYSTEM: TWideStringField;
    qRawDataPrecZVARIABLEID: TWideStringField;
    qRawDataPrecZDATAVALUE: TFloatField;
    cdsRawDataPrecZ: TClientDataSet;
    cdsRawDataPrecZSAMPLENO: TWideStringField;
    cdsRawDataPrecZFRAC: TWideStringField;
    cdsRawDataPrecZISOSYSTEM: TWideStringField;
    cdsRawDataPrecZVARIABLEID: TWideStringField;
    cdsRawDataPrecZDATAVALUE: TFloatField;
    dsRawDataPrecZ: TDataSource;
    qRawDiscordance: TSQLQuery;
    qRawDiscordanceSAMPLENO: TWideStringField;
    qRawDiscordanceFRAC: TWideStringField;
    qRawDiscordanceISOSYSTEM: TWideStringField;
    qRawDiscordanceVARIABLEID: TWideStringField;
    qRawDiscordanceDATAVALUE: TFloatField;
    cdsRawDiscordance: TClientDataSet;
    cdsRawDiscordanceSAMPLENO: TWideStringField;
    cdsRawDiscordanceFRAC: TWideStringField;
    cdsRawDiscordanceISOSYSTEM: TWideStringField;
    cdsRawDiscordanceVARIABLEID: TWideStringField;
    cdsRawDiscordanceDATAVALUE: TFloatField;
    dsRawDiscordance: TDataSource;
    qRawRef: TSQLQuery;
    qRawRefSAMPLENO: TWideStringField;
    qRawRefREFNUM: TIntegerField;
    qRawRefSOURCESHORT: TWideStringField;
    cdsRawRef: TClientDataSet;
    cdsRawRefSAMPLENO: TWideStringField;
    cdsRawRefREFNUM: TIntegerField;
    cdsRawRefSOURCESHORT: TWideStringField;
    dsRawRef: TDataSource;
    qRawDataDM: TSQLQuery;
    qRawDataDMSAMPLENO: TWideStringField;
    qRawDataDMFRAC: TWideStringField;
    qRawDataDMISOSYSTEM: TWideStringField;
    qRawDataDMVARIABLEID: TWideStringField;
    qRawDataDMDATAVALUE: TFloatField;
    dsqRawDataDM: TDataSource;
    cdsRawDataDM: TClientDataSet;
    cdsRawDataDMSAMPLENO: TWideStringField;
    cdsRawDataDMFRAC: TWideStringField;
    cdsRawDataDMISOSYSTEM: TWideStringField;
    cdsRawDataDMVARIABLEID: TWideStringField;
    cdsRawDataDMDATAVALUE: TFloatField;
    cdsRawDataDMqRawDataDMerr: TDataSetField;
    dsRawDataDM: TDataSource;
    qRawDataDMerr: TSQLQuery;
    qRawDataDMerrSAMPLENO: TWideStringField;
    qRawDataDMerrFRAC: TWideStringField;
    qRawDataDMerrISOSYSTEM: TWideStringField;
    qRawDataDMerrVARIABLEID: TWideStringField;
    qRawDataDMerrDATAVALUE: TFloatField;
    qRawDataDMerrNORMALISINGSTANDARD: TWideStringField;
    qRawDataDMerrSTANDARDVALUE: TFloatField;
    qRawDataDMerrVARIABLENAME: TWideStringField;
    dsqRawDataDMerr: TDataSource;
    cdsRawDataDMerr: TClientDataSet;
    cdsRawDataDMerrSAMPLENO: TWideStringField;
    cdsRawDataDMerrFRAC: TWideStringField;
    cdsRawDataDMerrISOSYSTEM: TWideStringField;
    cdsRawDataDMerrVARIABLEID: TWideStringField;
    cdsRawDataDMerrDATAVALUE: TFloatField;
    cdsRawDataDMerrNORMALISINGSTANDARD: TWideStringField;
    cdsRawDataDMerrSTANDARDVALUE: TFloatField;
    cdsRawDataDMerrVARIABLENAME: TWideStringField;
    dsRawDataDMerr: TDataSource;
    qExisting: TSQLQuery;
    dspExisting: TDataSetProvider;
    cdsExisting: TClientDataSet;
    cdsExistingRECORDID: TIntegerField;
    cdsExistingCOUNTRYABR: TWideStringField;
    cdsExistingUNITID: TIntegerField;
    cdsExistingMATERIALABR: TWideStringField;
    cdsExistingISOTOPESYSTEM: TWideStringField;
    cdsExistingAPPROACHABR: TWideStringField;
    cdsExistingTECHABR: TWideStringField;
    cdsExistingINTERPABR: TWideStringField;
    cdsExistingRAGE: TFloatField;
    cdsExistingRAGEPERROR: TFloatField;
    cdsExistingRAGEMERROR: TFloatField;
    cdsExistingUNITNAME: TWideStringField;
    cdsExistingUNITRANK: TWideStringField;
    cdsExistingCONTINENTID: TWideStringField;
    cdsExistingMATERIALDESCRIPTION: TWideStringField;
    cdsExistingAPPROACHDESCRIPTION: TWideStringField;
    cdsExistingTECHNIQUE: TWideStringField;
    cdsExistingINTERPRETATION: TWideStringField;
    dsExisting: TDataSource;
    qRawAgePref: TSQLQuery;
    qRawAgePrefSAMPLENO: TWideStringField;
    qRawAgePrefFRAC: TWideStringField;
    qRawAgePrefISOSYSTEM: TWideStringField;
    qRawAgePrefVARIABLEID: TWideStringField;
    qRawAgePrefDATAVALUE: TFloatField;
    dsqRawAgePref: TDataSource;
    cdsRawAgePref: TClientDataSet;
    cdsRawAgePrefSAMPLENO: TWideStringField;
    cdsRawAgePrefFRAC: TWideStringField;
    cdsRawAgePrefISOSYSTEM: TWideStringField;
    cdsRawAgePrefVARIABLEID: TWideStringField;
    cdsRawAgePrefDATAVALUE: TFloatField;
    cdsRawAgePrefqRawDataAgeerr: TDataSetField;
    dsRawAgePref: TDataSource;
    qRawSmpLoc: TSQLQuery;
    qRawSmpLocCOUNTRYABR: TWideStringField;
    qRawSmpLocCONTINENTID: TWideStringField;
    qRawSmpLocLONGITUDE: TFloatField;
    qRawSmpLocLATITUDE: TFloatField;
    qRawSmpLocELEVATION: TFloatField;
    cdsRawSmpLoc: TClientDataSet;
    cdsRawSmpLocCOUNTRYABR: TWideStringField;
    cdsRawSmpLocCONTINENTID: TWideStringField;
    cdsRawSmpLocLONGITUDE: TFloatField;
    cdsRawSmpLocLATITUDE: TFloatField;
    cdsRawSmpLocELEVATION: TFloatField;
    dsRawSmpLoc: TDataSource;
    qRawDataAgeerr: TSQLQuery;
    qRawDataAgeerrSAMPLENO: TWideStringField;
    qRawDataAgeerrFRAC: TWideStringField;
    qRawDataAgeerrISOSYSTEM: TWideStringField;
    qRawDataAgeerrVARIABLEID: TWideStringField;
    qRawDataAgeerrDATAVALUE: TFloatField;
    qRawDataAgeerrNORMALISINGSTANDARD: TWideStringField;
    qRawDataAgeerrSTANDARDVALUE: TFloatField;
    qRawDataAgeerrVARIABLENAME: TWideStringField;
    dsqRawDataAgeerr: TDataSource;
    cdsRawDataAgeerr: TClientDataSet;
    cdsRawDataAgeerrSAMPLENO: TWideStringField;
    cdsRawDataAgeerrFRAC: TWideStringField;
    cdsRawDataAgeerrISOSYSTEM: TWideStringField;
    cdsRawDataAgeerrVARIABLEID: TWideStringField;
    cdsRawDataAgeerrDATAVALUE: TFloatField;
    cdsRawDataAgeerrNORMALISINGSTANDARD: TWideStringField;
    cdsRawDataAgeerrSTANDARDVALUE: TFloatField;
    cdsRawDataAgeerrVARIABLENAME: TWideStringField;
    dsRawDataAgeerr: TDataSource;
    cdsSamplePDF: TClientDataSet;
    cdsSamplePDFStep: TIntegerField;
    cdsSamplePDFPDFDataValue: TFloatField;
    cdsSamplePDFPDFValue: TFloatField;
    dsSamplePDF: TDataSource;
    cdsData: TClientDataSet;
    cdsDatatRec: TIntegerField;
    cdsDataSampleNo: TWideStringField;
    cdsDataFrac: TWideStringField;
    cdsDataPb207U235: TFloatField;
    cdsDataPb207U235Sigma: TFloatField;
    cdsDataPb206U238: TFloatField;
    cdsDataPb206U238Sigma: TFloatField;
    cdsDataU238Pb206: TFloatField;
    cdsDataU238Pb206Sigma: TFloatField;
    cdsDataPb207Pb206: TFloatField;
    cdsDataPb207Pb206Sigma: TFloatField;
    cdsDataIncludeYN: TWideStringField;
    cdsDataPercentConcordance: TFloatField;
    cdsDataPreferredAge: TFloatField;
    cdsDataPreferredAgeSigma: TFloatField;
    dsData: TDataSource;
    cdsUnitPDF: TClientDataSet;
    dsUnitPDF: TDataSource;
    cdsUnitPDFUnitID: TIntegerField;
    cdsUnitPDFStepID: TIntegerField;
    cdsUnitPDFUnitAge: TFloatField;
    cdsUnitPDFGrainAge: TFloatField;
    cdsUnitPDFPDFvalue: TFloatField;
    qRawDataInclude: TSQLQuery;
    qRawDataIncludeSAMPLENO: TWideStringField;
    qRawDataIncludeFRAC: TWideStringField;
    qRawDataIncludeISOSYSTEM: TWideStringField;
    qRawDataIncludeVARIABLEID: TWideStringField;
    qRawDataIncludeDATAVALUE: TFloatField;
    cdsRawDataInclude: TClientDataSet;
    dsRawDataInclude: TDataSource;
    cdsRawSmpqRawDataInclude: TDataSetField;
    cdsRawDataIncludeSAMPLENO: TWideStringField;
    cdsRawDataIncludeFRAC: TWideStringField;
    cdsRawDataIncludeISOSYSTEM: TWideStringField;
    cdsRawDataIncludeVARIABLEID: TWideStringField;
    cdsRawDataIncludeDATAVALUE: TFloatField;
    cdsUnitGrainAgeData: TClientDataSet;
    dsUnitGrainAgeData: TDataSource;
    cdsUnitGrainAgeDataCountryID: TWideStringField;
    cdsUnitGrainAgeDataUnitID: TIntegerField;
    cdsUnitGrainAgeDataUnitName: TWideStringField;
    cdsUnitGrainAgeDataUnitRank: TWideStringField;
    cdsUnitGrainAgeDataUnitAge: TFloatField;
    cdsUnitGrainAgeDataGrainAge: TFloatField;
    cdsUnitGrainAgeDataGrainAgeUncertainty: TFloatField;
    cdsUnitGrainAgeDataAnalysisNo: TIntegerField;
    cdsUnitGrainAgeDataIncludeYN: TWideStringField;
    cdsUnitGrainAgeDataSampleNo: TWideStringField;
    cdsUnitGrainAgeDataFrac: TWideStringField;
    cdsUnitGrainAgeDataPercentConcordance: TFloatField;
    qSampleDetritalAges: TSQLQuery;
    dspSampleDetritalAges: TDataSetProvider;
    cdsSampleDetritalAges: TClientDataSet;
    dsSampleDetritalAges: TDataSource;
    cdsSampleDetritalAgesRECORDID: TIntegerField;
    cdsSampleDetritalAgesCOUNTRYABR: TWideStringField;
    cdsSampleDetritalAgesMATERIALABR: TWideStringField;
    cdsSampleDetritalAgesISOTOPESYSTEM: TWideStringField;
    cdsSampleDetritalAgesINTERPABR: TWideStringField;
    cdsSampleDetritalAgesRAGE: TFloatField;
    cdsSampleDetritalAgesRAGEPERROR: TFloatField;
    cdsSampleDetritalAgesRAGEMERROR: TFloatField;
    qMatchingAges: TSQLQuery;
    dspMatchingAges: TDataSetProvider;
    cdsMatchingAges: TClientDataSet;
    dsMatchingAges: TDataSource;
    cdsMatchingAgesRECORDID: TIntegerField;
    cdsMatchingAgesCOUNTRYABR: TWideStringField;
    cdsMatchingAgesMATERIALABR: TWideStringField;
    cdsMatchingAgesISOTOPESYSTEM: TWideStringField;
    cdsMatchingAgesINTERPABR: TWideStringField;
    cdsMatchingAgesRAGE: TFloatField;
    cdsMatchingAgesRAGEPERROR: TFloatField;
    cdsMatchingAgesRAGEMERROR: TFloatField;
    cdsMatchingAgesSAMPLENO: TWideStringField;
    cdsMatchingAgesLONGITUDE: TFloatField;
    cdsMatchingAgesLATITUDE: TFloatField;
    cdsMatchingAgesUNITNAME: TWideStringField;
    cdsMatchingAgesUNITRANK: TWideStringField;
    qInsertUserSourceSamples: TSQLQuery;
    qUserSourceSamples: TSQLQuery;
    dspUserSourceSamples: TDataSetProvider;
    cdsUserSourceSamples: TClientDataSet;
    dsUserSourceSamples: TDataSource;
    cdsUserSourceSamplesUSERID: TWideStringField;
    cdsUserSourceSamplesUNITID: TIntegerField;
    cdsUserSourceSamplesSAMPLENO: TWideStringField;
    cdsUserSourceSamplesSOURCERECORDID: TIntegerField;
    cdsUserSourceSamplesSTRATDBUNITID: TIntegerField;
    cdsUserSourceSamplesSTRATDBUNITNAME: TWideStringField;
    cdsUserSourceSamplesSTRATDBUNITRANK: TWideStringField;
    cdsUserSourceSamplesSTRATDBUNITAGE: TFloatField;
    cdsUserSourceSamplesLONGITUDE: TFloatField;
    cdsUserSourceSamplesLATITUDE: TFloatField;
    cdsUserSourceSamplesCOUNTRYID: TWideStringField;
    cdsUserSourceSamplesUSERPROJECTID: TIntegerField;
    qUserProjects: TSQLQuery;
    dspUserProjects: TDataSetProvider;
    cdsUserProjects: TClientDataSet;
    dsUserProjects: TDataSource;
    cdsUserProjectsUSERPROJECTID: TIntegerField;
    cdsUserProjectsUSERID: TWideStringField;
    cdsUserProjectsUSERPROJECTNAME: TWideStringField;
    qUserUnitGrainAgePDF: TSQLQuery;
    dspUserUnitGrainAgePDF: TDataSetProvider;
    cdsUserUnitGrainAgePDF: TClientDataSet;
    dsUserUnitGrainAgePDF: TDataSource;
    cdsUserUnitGrainAgePDFPROJECTID: TIntegerField;
    cdsUserUnitGrainAgePDFUNITID: TIntegerField;
    cdsUserUnitGrainAgePDFSTRATDBUNITAGE: TFloatField;
    qDeleteGrainAgePDF: TSQLQuery;
    qInsertUserGrainPDF: TSQLQuery;
    cdsUserUnitGrainAgePDFSTEPNO: TIntegerField;
    cdsUserUnitGrainAgePDFPDFAGE: TFloatField;
    cdsUserUnitGrainAgePDFPDFVALUE: TFloatField;
    cdsGrainUnits: TClientDataSet;
    dsGrainUnits: TDataSource;
    cdsGrainUnitsUnitID: TIntegerField;
    qSamplesForUnit: TSQLQuery;
    dspSamplesForUnit: TDataSetProvider;
    cdsSamplesForUnit: TClientDataSet;
    dsSamplesForUnit: TDataSource;
    cdsSamplesForUnitUSERID: TWideStringField;
    cdsSamplesForUnitSAMPLENO: TWideStringField;
    cdsSamplesForUnitSTRATDBUNITID: TIntegerField;
    cdsSamplesForUnitUNITID: TIntegerField;
    cdsSamplesForUnitSTRATDBUNITNAME: TWideStringField;
    cdsSamplesForUnitSTRATDBUNITRANK: TWideStringField;
    cdsSamplesForUnitSTRATDBUNITAGE: TFloatField;
    cdsSamplesForUnitLONGITUDE: TFloatField;
    cdsSamplesForUnitLATITUDE: TFloatField;
    cdsSamplesForUnitCOUNTRYID: TWideStringField;
    cdsUserUnitSuiteSamplesUSERPROJECTID: TIntegerField;
    qUserUnitSuiteSamplesUnits: TSQLQuery;
    dspUserUnitSuiteSamplesUnits: TDataSetProvider;
    cdsUserUnitSuiteSamplesUnits: TClientDataSet;
    dsUserUnitSuiteSamplesUnits: TDataSource;
    cdsUserUnitSuiteSamplesUnitsSTRATDBUNITID: TIntegerField;
    cdsMatchingAgesINTERPMATCHING: TIntegerField;
    cdsMatchingAgesUNITID: TIntegerField;
    cdsUserSourceSamplesSRCAGE: TFloatField;
    cdsUserSourceSamplesSRCAGEPLUS95: TFloatField;
    cdsUserSourceSamplesSRCAGEMINUS95: TFloatField;
    cdsUserSourceSamplesSRCSAMPLENO: TWideStringField;
    cdsUserSourceSamplesSRCLONGITUDE: TFloatField;
    cdsUserSourceSamplesSRCLATITUDE: TFloatField;
    cdsUserSourceSamplesSRCUNITID: TIntegerField;
    cdsUserSourceSamplesSRCINTERPABR: TWideStringField;
    qStratDBUnitIDforDVUnitID: TSQLQuery;
    dspStratDBUnitIDforDVUnitID: TDataSetProvider;
    cdsStratDBUnitIDforDVUnitID: TClientDataSet;
    dsStratDBUnitIDforDVUnitID: TDataSource;
    cdsStratDBUnitIDforDVUnitIDUNITID: TIntegerField;
    cdsStratDBUnitIDforDVUnitIDGISID: TIntegerField;
    cdsUserUnitGrainAgePDFSTRATDBUNITNAME: TWideStringField;
    cdsUserUnitGrainAgePDFSTRATDBUNITRANK: TWideStringField;
    qUpdateUserUnitSuiteSamples: TSQLQuery;
    qDVLIPDomainDatesProvinces: TSQLQuery;
    dspDVLIPDomainDatesProvinces: TDataSetProvider;
    cdsDVLIPDomainDatesProvinces: TClientDataSet;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField7: TWideStringField;
    StringField8: TWideStringField;
    StringField9: TWideStringField;
    StringField10: TWideStringField;
    StringField11: TWideStringField;
    StringField12: TWideStringField;
    StringField13: TWideStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    StringField14: TWideStringField;
    StringField15: TWideStringField;
    IntegerField8: TIntegerField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    SmallintField1: TSmallintField;
    StringField16: TWideStringField;
    IntegerField9: TIntegerField;
    dsDVLIPDomainDatesProvinces: TDataSource;
    cdsDVLIPDomainDatesProvincesLIPID: TIntegerField;
    cdsDVLIPDomainDatesProvincesLIPNAME: TWideStringField;
    cdsUserSamplesForUnitUSERID: TWideStringField;
    qUpdateNumFrac: TSQLQuery;
    qUserUnitSuiteSampleNumFrac: TSQLQuery;
    dspUserUnitSuiteSampleNumFrac: TDataSetProvider;
    cdsUserUnitSuiteSampleNumFrac: TClientDataSet;
    dsUserUnitSuiteSampleNumFrac: TDataSource;
    cdsUserUnitSuiteSampleNumFracNUMFRAC: TIntegerField;
    cdsUserUnitSuiteSamplesNUMFRACTOTAL: TIntegerField;
    cdsUserUnitSuiteSamplesNUMFRACINCLAGE: TIntegerField;
    cdsUserUnitSuiteSamplesNUMFRACINCLISORAT: TIntegerField;
    SQLMonitor1: TSQLMonitor;
    qRawDataVar1: TSQLQuery;
    StringField17: TWideStringField;
    StringField18: TWideStringField;
    StringField19: TWideStringField;
    StringField20: TWideStringField;
    FloatField8: TFloatField;
    StringField21: TWideStringField;
    FloatField9: TFloatField;
    StringField22: TWideStringField;
    cdsRawDataVar1: TClientDataSet;
    dsRawDataVar1: TDataSource;
    qRawSmpREGASSOCID: TWideStringField;
    cdsRawSmpREGASSOCID: TWideStringField;
    qRawDataXREGASSOCID: TWideStringField;
    cdsRawDataXREGASSOCID: TWideStringField;
    qRawDataYREGASSOCID: TWideStringField;
    cdsRawDataYREGASSOCID: TWideStringField;
    qRawDataZREGASSOCID: TWideStringField;
    cdsRawDataZREGASSOCID: TWideStringField;
    qRawDataDMREGASSOCID: TWideStringField;
    cdsRawDataDMREGASSOCID: TWideStringField;
    qRawAgePrefREGASSOCID: TWideStringField;
    cdsRawAgePrefREGASSOCID: TWideStringField;
    qRawDataVar2: TSQLQuery;
    StringField29: TWideStringField;
    StringField30: TWideStringField;
    StringField31: TWideStringField;
    StringField32: TWideStringField;
    FloatField12: TFloatField;
    StringField33: TWideStringField;
    FloatField13: TFloatField;
    StringField34: TWideStringField;
    cdsRawDataVar2: TClientDataSet;
    dsRawDataVar2: TDataSource;
    qRawDataVar3: TSQLQuery;
    StringField41: TWideStringField;
    StringField42: TWideStringField;
    StringField43: TWideStringField;
    StringField44: TWideStringField;
    FloatField16: TFloatField;
    StringField45: TWideStringField;
    FloatField17: TFloatField;
    StringField46: TWideStringField;
    cdsRawDataVar3: TClientDataSet;
    dsRawDataVar3: TDataSource;
    cdsRawSmpqRawDataVar3: TDataSetField;
    cdsRawSmpqRawDataVar2: TDataSetField;
    cdsRawSmpqRawDataVar1: TDataSetField;
    cdsDataVar1: TFloatField;
    cdsDataVar2: TFloatField;
    cdsDataVar3: TFloatField;
    cdsUserUnitGrainAgePDFREGASSOCID: TWideStringField;
    cdsUnitGrainAgeDataRegAssocID: TFloatField;
    cdsUnitGrainAgeDataVar1: TFloatField;
    cdsUnitGrainAgeDataVar2: TFloatField;
    cdsUnitGrainAgeDataVar3: TFloatField;
    qUserDetritalSamples: TSQLQuery;
    dspUserDetritalSamples: TDataSetProvider;
    cdsUserDetritalSamples: TClientDataSet;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    StringField53: TWideStringField;
    IntegerField12: TIntegerField;
    StringField54: TWideStringField;
    IntegerField13: TIntegerField;
    StringField55: TWideStringField;
    StringField56: TWideStringField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    StringField57: TWideStringField;
    StringField58: TWideStringField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    StringField59: TWideStringField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    IntegerField14: TIntegerField;
    StringField60: TWideStringField;
    dsUserDetritalSamples: TDataSource;
    cdsRawDataVar1SAMPLENO: TWideStringField;
    cdsRawDataVar1FRAC: TWideStringField;
    cdsRawDataVar1ISOSYSTEM: TWideStringField;
    cdsRawDataVar1VARIABLEID: TWideStringField;
    cdsRawDataVar1DATAVALUE: TFloatField;
    cdsRawDataVar1NORMALISINGSTANDARD: TWideStringField;
    cdsRawDataVar1STANDARDVALUE: TFloatField;
    cdsRawDataVar1VARIABLENAME: TWideStringField;
    cdsRawDataVar2SAMPLENO: TWideStringField;
    cdsRawDataVar2FRAC: TWideStringField;
    cdsRawDataVar2ISOSYSTEM: TWideStringField;
    cdsRawDataVar2VARIABLEID: TWideStringField;
    cdsRawDataVar2DATAVALUE: TFloatField;
    cdsRawDataVar2NORMALISINGSTANDARD: TWideStringField;
    cdsRawDataVar2STANDARDVALUE: TFloatField;
    cdsRawDataVar2VARIABLENAME: TWideStringField;
    cdsRawDataVar3SAMPLENO: TWideStringField;
    cdsRawDataVar3FRAC: TWideStringField;
    cdsRawDataVar3ISOSYSTEM: TWideStringField;
    cdsRawDataVar3VARIABLEID: TWideStringField;
    cdsRawDataVar3DATAVALUE: TFloatField;
    cdsRawDataVar3NORMALISINGSTANDARD: TWideStringField;
    cdsRawDataVar3STANDARDVALUE: TFloatField;
    cdsRawDataVar3VARIABLENAME: TWideStringField;
    cdsDataZoneID: TWideStringField;
    cdsUnitGrainAgeDataZoneID: TWideStringField;
    qRawSmpZONEID: TWideStringField;
    cdsRawSmpZONEID: TWideStringField;
    qSampleZones: TSQLQuery;
    dspSampleZones: TDataSetProvider;
    cdsSampleZones: TClientDataSet;
    dsSampleZones: TDataSource;
    cdsSampleZonesZONEID: TWideStringField;
    cdsSampleZonesZONETYPE: TWideStringField;
    cdsUserSourceSamplesSRCUNITNAME: TWideStringField;
    cdsUserSourceSamplesSRCUNITRANK: TWideStringField;
    cdsUserSourceSamplesSRCREFNUM: TIntegerField;
    cdsUserSourceSamplesSRCREFSHORT: TWideStringField;
    cdsUserSourceSamplesSRCREFNUMCOMPILED: TIntegerField;
    qUpdateUserUnitSourceReferences: TSQLQuery;
    qRefFull: TSQLQuery;
    dspRefFull: TDataSetProvider;
    cdsRefFull: TClientDataSet;
    dsRefFull: TDataSource;
    qRefFullSOURCENUM: TIntegerField;
    qRefFullSOURCESHORT: TWideStringField;
    qRefFullSOURCEYEAR: TIntegerField;
    qRefFullCONTINENTID: TWideStringField;
    qRefFullWHOFORID: TWideStringField;
    qRefFullSOURCEDESCRIPTION: TBlobField;
    qRefFullDOI: TWideStringField;
    cdsRefFullSOURCENUM: TIntegerField;
    cdsRefFullSOURCESHORT: TWideStringField;
    cdsRefFullSOURCEYEAR: TIntegerField;
    cdsRefFullCONTINENTID: TWideStringField;
    cdsRefFullWHOFORID: TWideStringField;
    cdsRefFullSOURCEDESCRIPTION: TBlobField;
    cdsRefFullDOI: TWideStringField;
    qInsertLink: TSQLQuery;
    cdsDVMinMaxMINAGE: TFloatField;
    cdsDVMinMaxMAXAGE: TFloatField;
    qCompleteUserGrainData: TSQLQuery;
    dspCompleteUserGrainData: TDataSetProvider;
    cdsCompleteUserGrainData: TClientDataSet;
    dsCompleteUserGrainData: TDataSource;
    cdsCompleteUserGrainDataUSERID: TWideStringField;
    cdsCompleteUserGrainDataSAMPLENO: TWideStringField;
    cdsCompleteUserGrainDataFRAC: TWideStringField;
    cdsCompleteUserGrainDataORIGINALNO: TWideStringField;
    cdsCompleteUserGrainDataLITHOLOGY: TWideStringField;
    cdsCompleteUserGrainDataLONGITUDE: TFloatField;
    cdsCompleteUserGrainDataLATITUDE: TFloatField;
    cdsCompleteUserGrainDataELEVATION: TFloatField;
    cdsCompleteUserGrainDataUSERPROJECTID: TIntegerField;
    cdsCompleteUserGrainDataUSERPROJECTNAME: TWideStringField;
    cdsCompleteUserGrainDataCOUNTRYID: TWideStringField;
    cdsCompleteUserGrainDataUNITID: TIntegerField;
    cdsCompleteUserGrainDataSTRATDBUNITID: TIntegerField;
    cdsCompleteUserGrainDataSTRATDBUNITNAME: TWideStringField;
    cdsCompleteUserGrainDataSTRATDBUNITRANK: TWideStringField;
    cdsCompleteUserGrainDataSTRATDBUNITAGE: TFloatField;
    cdsCompleteUserGrainDataVAR3X: TFloatField;
    cdsCompleteUserGrainDataVAR4XERR: TFloatField;
    cdsCompleteUserGrainDataVAR5Y: TFloatField;
    cdsCompleteUserGrainDataVAR6YERR: TFloatField;
    cdsCompleteUserGrainDataVAR7R: TFloatField;
    cdsCompleteUserGrainDataVAR8Z: TFloatField;
    cdsCompleteUserGrainDataVAR9ZERR: TFloatField;
    cdsCompleteUserGrainDataVARAXPRE: TFloatField;
    cdsCompleteUserGrainDataVARBYPRE: TFloatField;
    cdsCompleteUserGrainDataVARCXERT: TFloatField;
    cdsCompleteUserGrainDataVARDYERT: TFloatField;
    cdsCompleteUserGrainDataVARE: TFloatField;
    cdsCompleteUserGrainDataVARF: TFloatField;
    cdsCompleteUserGrainDataVARGZPRE: TFloatField;
    cdsCompleteUserGrainDataVARHZERT: TFloatField;
    cdsCompleteUserGrainDataVARIDISC: TFloatField;
    cdsCompleteUserGrainDataVARJAGE: TFloatField;
    cdsCompleteUserGrainDataVARKAERR: TFloatField;
    cdsCompleteUserGrainDataVARLDM: TFloatField;
    cdsCompleteUserGrainDataVARMDMERR: TFloatField;
    cdsCompleteUserGrainDataVARNINCL: TFloatField;
    cdsCompleteUserGrainDataVAROINIT: TFloatField;
    cdsCompleteUserGrainDataVARP: TFloatField;
    cdsCompleteUserGrainDataVARQVAR1: TFloatField;
    cdsCompleteUserGrainDataVARRVAR2: TFloatField;
    cdsCompleteUserGrainDataVARSVAR3: TFloatField;
    cdsCompleteUserGrainDataDATEDONE: TSQLTimeStampField;
    cdsCountCOUNT: TFMTBCDField;
    cdsUnitPDFCountryID: TWideStringField;
    cdsUnitPDFUnitName: TWideStringField;
    cdsUnitPDFUnitRank: TWideStringField;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
  public
    function CalculateDVMedian : double;
    procedure AddUnitToDV(tmpUnitName, tmpUnitRankID, tmpGISID, tmpCountryID : string);
    procedure AddDomainToDV(tmpDomainName, tmpDomainID, tmpContinentID, tmpDomainTypeID, tmpDVLevel : string);
    procedure AddLIPToDV(tmpLIPName, tmpLIPID : string);
    procedure AddUserToDV(UserID : string);
    procedure AddUserDomainsToDV(UserID, tmpDomainOrder, tmpDomainID, tmpDomainXMin, tmpDomainXMax : string);
    procedure DeleteUserDomains(UserID : string);
    procedure DefineDVQuery(tmpID : integer);
    procedure DefineDVPdfQuery(tmpID : integer);
    procedure AddPdfToDV(tmpUserID,tmpDomainOrder,tmpPdfOrder,tmpAge,tmpPDFValue,tmpDomainID : string);
    procedure InsertUserUnitSamples(tProjectID,tUserID,tUnitIDstr,tSampleNo,tStratDBUnitIDstr,tStratDBUnitName,tStratDBUnitRank,tStratDBUnitAgeStr,tLongitudeStr,tLatitudeStr,tCountryID : string);
    procedure DeleteUserUnitSamples(ProjectID : string);
    procedure ConstructRawDataSampleQuery;
    procedure InsertUserSourceSamples(tProjectID,tUserID,tUnitIDstr,tSampleNo,tSourceRecordIDstr,
      tStratDBUnitIDstr,tStratDBUnitName,tStratDBUnitRank,tStratDBUnitAgeStr,
      tLongitudeStr,tLatitudeStr,tCountryID,SRCUnitIDstr,
      SRCInterpAbr, SRCAgeStr, SRCAgePlus95Str, SRCAgeMinus95Str,
      SRCSampleNo, SRCLongitudeStr, SRCLatitudeStr : string);
    procedure InsertUserGrainAgePDF(tProjectID,tUserID,tUnitIDstr, tStepNoStr,
      tStratDBUnitAgeStr,RegAssocIDstr : string; PDFage,PDFvalue : double);
    procedure DeleteUserGrainAgePDF(ProjectIDstr : string);
    procedure DeleteUserProvenanceData(ProjectIDstr : string);
    procedure UpdateUserUnitSuiteSamples(tUnitID : integer; tStratUnitAge : double);
    procedure UpdateUserUnitSuiteSamplesNumFrac(tNumFrac : integer; tProjectID : string; tSampleNo : string);
    procedure UpdateUserUnitSuiteSamplesNumFracIncl(UpdateType : string; tNumFrac : integer; tProjectID : string; tSampleNo : string);
    procedure InsertReference (tSourceNum,tSourceYear : integer; tSourceShort,tContinentID,tWhoForID : string; var wasSuccessful : boolean);
  end;

// Procs
  function dmDV: TdmDV;

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

function dmDV: TdmDV;
begin
  Result := TUserSession(WebApplication.Data).dmDV;
end;


procedure TdmDV.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

procedure TdmDV.AddUnitToDV(tmpUnitName, tmpUnitRankID, tmpGISID, tmpCountryID : string);
const
  zero = 0;
var
  TD : TDBXTransaction;
  WasSuccessful : boolean;
  tmpUnitID : string;
begin
  {first insert the UnitName}
  WasSuccessful := true;
  UserSession.WhereAmI := 'AddUnitToDateView start';
  try
    dmDV.qAddToDV.Close;
    dmDV.qAddToDV.SQL.Clear;
    dmDV.qAddToDV.SQL.Add('INSERT INTO SUITE');
    dmDV.qAddToDV.SQL.Add('(UNITNAME, UNITRANK, GISID, FORMATIONOFFSET, FORMATIONOFFSET2, FORMATIONOFFSET3, PARENTID)');
    dmDV.qAddToDV.SQL.Add('VALUES ('+''''+Trim(tmpUnitName)+''''+', '+''''+Trim(tmpUnitRankID)+''''+', '+''''+tmpGISID+''''+', ');
    dmDV.qAddToDV.SQL.Add(' '+FormatFloat('###0.000',zero)+', '+FormatFloat('###0.000',zero)+', '+FormatFloat('###0.000',zero)+', '+FormatFloat('###0',zero)+')');

    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qAddToDV.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to append Unit to Suite table '+UserSession.WhereAmI);
  end;
  if not WasSuccessful then WebApplication.ShowMessage('Unit information NOT transferred to DateView');
  if WasSuccessful then WebApplication.ShowMessage('Unit information successfully transferred to DateView');
  {first insert the UnitID}
  dmDV.qSuiteName.Close;
  dmDV.qSuiteName.ParamByName('UnitName').AsString := tmpUnitName;
  dmDV.cdsSuiteName.Close;
  dmDV.cdsSuiteName.Open;
  if (dmDV.cdsSuiteName.RecordCount > 0) then
  begin
    tmpUnitID := dmDV.cdsSuiteNameUNITID.AsString;
    dmDV.cdsSuiteName.Close;
    WasSuccessful := true;
    UserSession.WhereAmI := 'AddUnitToDateView part 2';
    try
      dmDV.qAddToDV.Close;
      dmDV.qAddToDV.SQL.Clear;
      dmDV.qAddToDV.SQL.Add('INSERT INTO SUITECOUNTRY');
      dmDV.qAddToDV.SQL.Add('(UNITID, COUNTRYABR, UNITHASRECORDS)');
      dmDV.qAddToDV.SQL.Add('VALUES ('+''''+tmpUnitID+''''+', '+''''+Trim(tmpCountryID)+''''+', '+''''+'N'+''''+')');
      //dmUser.SetDeveloperData(dmDV.qAddToDV.SQL.Text);
      //if not dmDV.sqlcDateView.InTransaction then
      //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmDV.qAddToDV.ExecSQL(false);
          dmDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
        except
          dmDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
          WasSuccessful := false;
        end;
      //end;
    except
      WasSuccessful := false;
      WebApplication.ShowMessage('Unable to append Unit and Country link '+UserSession.WhereAmI);
    end;
  end;
end;

procedure TdmDV.AddDomainToDV(tmpDomainName, tmpDomainID, tmpContinentID, tmpDomainTypeID, tmpDVLevel : string);
const
  zero = 0;
var
  TD : TDBXTransaction;
  WasSuccessful : boolean;
begin
  {insert the DomainName}
  WasSuccessful := true;
  UserSession.WhereAmI := 'AddDomainToDateView start';
  try
    dmDV.qAddToDV.Close;
    dmDV.qAddToDV.SQL.Clear;
    dmDV.qAddToDV.SQL.Add('Insert into DOMAINS');
    dmDV.qAddToDV.SQL.Add('(DOMAINNAME, CONTINENTID, DOMAINTYPEID, NUMRECORDSLINKED, DOMAINID)');
    dmDV.qAddToDV.SQL.Add('VALUES ('+''''+tmpDomainName+''''+', '+''''+tmpContinentID+''''+', '
        +''''+tmpDomainTypeID+''''+', '+''''+IntToStr(zero)+''''+', '+''''+tmpDomainID+''''+')');
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qAddToDV.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to append Unit to Suite table '+UserSession.WhereAmI);
  end;
  if WasSuccessful then WebApplication.ShowMessage('Domain information successfully transferred to DateView');
end;

procedure TdmDV.AddLIPToDV(tmpLIPName, tmpLIPID : string);
var
  TD : TDBXTransaction;
  WasSuccessful : boolean;
begin
  {insert the LIPName}
  WasSuccessful := true;
  UserSession.WhereAmI := 'AddLIPToDateView start';
  try
    dmDV.qAddToDV.Close;
    dmDV.qAddToDV.SQL.Clear;
    dmDV.qAddToDV.SQL.Add('Insert into LIPS');
    dmDV.qAddToDV.SQL.Add('(LIPID, LIPNAME)');
    dmDV.qAddToDV.SQL.Add('VALUES ('+''''+tmpLIPID+''''+', '+''''+tmpLIPName+''''+')');

    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qAddToDV.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
  except
    WasSuccessful := false;
    WebApplication.ShowMessage('Unable to append LIP to DV table '+UserSession.WhereAmI);
  end;
  if WasSuccessful then WebApplication.ShowMessage('LIP information successfully transferred to DateView');
end;

procedure TdmDV.AddUserToDV(UserID : string);
const
  zero = 0;
var
  TD : TDBXTransaction;
begin
  {first insert the UnitName}
  UserSession.WhereAmI := 'AddUserToDateView start';
  try
    dmDV.qAddToDV.Close;
    dmDV.qAddToDV.SQL.Clear;
    dmDV.qAddToDV.SQL.Add('Insert into USERS');
    dmDV.qAddToDV.SQL.Add('(USERID, NUMCONTRIBUTED)');
    dmDV.qAddToDV.SQL.Add('VALUES ('+''''+UserID+''''+', '+FormatFloat('###0.000',zero)+')');

    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qAddToDV.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
      end;
    //end;
  except
    WebApplication.ShowMessage('Unable to append User to DateView Users table '+UserSession.WhereAmI);
  end;
end;

procedure TdmDV.AddUserDomainsToDV(UserID, tmpDomainOrder, tmpDomainID, tmpDomainXMin, tmpDomainXMax : string);

var
  TD : TDBXTransaction;
begin
  {first insert the UnitName}
  UserSession.WhereAmI := 'AddUserDomainsToDateView start';
  try
    dmDV.qAddToDV.Close;
    dmDV.qAddToDV.SQL.Clear;
    dmDV.qAddToDV.SQL.Add('Insert into USERDOMAINS');
    dmDV.qAddToDV.SQL.Add('(USERID, DOMAINORDER, DOMAINID, DOMAINXMIN, DOMAINXMAX)');
    dmDV.qAddToDV.SQL.Add('VALUES ('+''''+UserID+''''+', '+''''+tmpDomainOrder+''''+', '+''''+tmpDomainID+''''+', ');
    dmDV.qAddToDV.SQL.Add(' '+''''+tmpDomainXMin+''''+', '+''''+tmpDomainXMax+''''+')');
    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qAddToDV.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
      end;
    //end;
  except
    WebApplication.ShowMessage('Unable to append UserDomain details to DateView'+UserSession.WhereAmI);
  end;
end;

procedure TdmDV.DeleteUserDomains(UserID : string);
var
  TD : TDBXTransaction;
begin
  {first insert the UnitName}
  UserSession.WhereAmI := 'DeleteUserDomainsFromDateView start';
  try
    dmDV.qDeleteDVUserDomains.Close;
    dmDV.qDeleteDVUserDomains.ParamByName('USERID').AsString := UserSession.UserID;

    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qDeleteDVUserDomains.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
      end;
    //end;
  except
    WebApplication.ShowMessage('Unable to clear UserDomains in DateView '+UserSession.WhereAmI);
  end;
end;

function TdmDV.CalculateDVMedian : double;
const
  nmax = 500;
var
  i, j, n : integer;
  upr, lwr, d, tempd : integer;
  darray : array[0..nmax] of double;
  median : double;
  tempi : integer;
  tempr : double;
begin
  n := dmDV.cdsQueryDV.RecordCount;
  if (n > nmax) then n := nmax;
  lwr := 1;
  upr := n;
  for i:=1 to nmax do
  begin
    darray[i] := 0;
  end;
  dmDV.cdsQueryDV.First;
  for i:=1 to n do
  begin
    darray[i] := dmDV.cdsQueryDVRAGE.AsInteger;
    dmDV.cdsQueryDV.Next;
  end;
  if (n > 1) then
  begin
    d := upr - lwr + 1;
    while (d > 1) do
    begin
      if (d < 5) then d := 1
                 else d := trunc(0.45454 * d);
      {do linear insertion sort in steps size d}
      for i := upr-d downto lwr do
      begin
        tempr := darray[i];
        j := i+d;
        while (j <= upr) do
        begin
          if tempr > darray[j] then
          begin
            darray[j-d] := darray[j];
            j := j+d
          end else
          begin
            Break;
          end;
          darray[j-d] := tempr;
        end;
      end;
    end;
  end;
  median := 1.0*(darray[1]);
  if (n > 1) then
  begin
    tempd := n div 2;
    if (tempd = 0) then
    begin
      median := (darray[tempd] + darray[tempd+1])/2.0;
    end else
    begin
      median := 1.0*(darray[tempd+1]);
    end;
  end;
  Result := median/1.0;
end;

procedure TdmDV.DefineDVQuery(tmpID : integer);
var
  iRows, i : integer;
begin
  try
    dmDV.QueryDV.SQL.Clear;
    dmDV.QueryDV.SQL.Add('SELECT DISTINCT SUITE.GISID, ISORGR30.COUNTRYABR, ISORGR30.UNITID, SUITE.UNITNAME,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.TECHABR,TECHNIQUE.TECHNIQUE,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.INTERPABR,ISORGR30.IAGE,ISORGR30.IAGEPERROR,ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.LITHOLOGY,ISORGR30.RECORDID,COUNTRY.COUNTRY,MATERIAL.MATERIALDESCRIPTION,');
    dmDV.QueryDV.SQL.Add('  INTERPRETATION.INTERPRETATION,APPROACH.APPROACHDESCRIPTION,ISOSYSTEM.ISOSYSTEMNAME,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOFOR.WHOFORID');
    dmDV.QueryDV.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,ISOSYSTEM,ISOFOR,TECHNIQUE,SUITE,SUITECOUNTRY,USERSWHOFOR  ');
    if (UserSession.UnitSender = usDetails) then
      dmDV.QueryDV.SQL.Add('  ');
    if ((UserSession.UnitSender = usDomains) or (UserSession.UnitSender = usChartDomains)) then
      dmDV.QueryDV.SQL.Add(',ISOPROVTERR ');
    if (UserSession.UnitSender = usDeposits) then
      dmDV.QueryDV.SQL.Add('  ');
    if ((UserSession.UnitSender = usLIPs) or (UserSession.UnitSender = usChartLIPs)) then
      dmDV.QueryDV.SQL.Add(',ISOLIP');

    dmDV.QueryDV.SQL.Add('WHERE  ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.MATERIALABR = MATERIAL.MATERIALABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.APPROACHABR = APPROACH.APPROACHABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.TECHABR = TECHNIQUE.TECHABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.PREFLEVEL >= 1');
    dmDV.QueryDV.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
    if (UserSession.UnitSender = usDetails) then
      dmDV.QueryDV.SQL.Add('  ');
    if ((UserSession.UnitSender = usDomains) or (UserSession.UnitSender = usChartDomains)) then
    begin
      dmDV.QueryDV.SQL.Add('AND ISOPROVTERR.DOMAINID= :DOMAINID');
      dmDV.QueryDV.SQL.Add('AND ISOPROVTERR.RECORDID=ISORGR30.RECORDID');
    end;
    if (UserSession.UnitSender = usDeposits) then
      dmDV.QueryDV.SQL.Add('  ');
    if ((UserSession.UnitSender = usLIPs) or (UserSession.UnitSender = usChartLIPs)) then
      dmDV.QueryDV.SQL.Add('AND ISOLIP.RECORDID=ISORGR30.RECORDID');

    dmDV.QueryDV.SQL.Add('AND USERSWHOFOR.USERID = :UserID');
    dmDV.QueryDV.SQL.Add('AND USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID');
    dmDV.QueryDV.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
    dmDV.QueryDV.SQL.Add('AND SUITE.UNITID=SUITECOUNTRY.UNITID');
    dmDV.QueryDV.SQL.Add('AND SUITECOUNTRY.UNITID=ISORGR30.UNITID');
    dmDV.QueryDV.SQL.Add('AND SUITECOUNTRY.COUNTRYABR=ISORGR30.COUNTRYABR');
    if (UserSession.UnitSender = usDetails)  then
    begin
      dmDV.QueryDV.SQL.Add('AND INTERPRETATION.INTERPGROUP>=1');
    end;
    if ((UserSession.UnitSender = usDomains) or (UserSession.UnitSender = usChartDomains)) then
    begin
      dmDV.QueryDV.SQL.Add('AND INTERPRETATION.INTERPCHARTDOMAIN>=1');
    end;
    if (UserSession.UnitSender = usDeposits)  then
    begin
      dmDV.QueryDV.SQL.Add('AND INTERPRETATION.INTERPGROUP>0');
    end;
    if ((UserSession.UnitSender = usLIPs) or (UserSession.UnitSender = usChartLIPs)) then
    begin
      dmDV.QueryDV.SQL.Add('AND ISOLIP.LIPID= :LIPID');
      dmDV.QueryDV.SQL.Add('AND INTERPRETATION.INTERPIGNEOUS=1');
    end;
    if ((UserSession.UnitSender = usChartDomains) or (UserSession.UnitSender = usChartLIPs))  then
    begin
      dmDV.QueryDV.SQL.Add('AND ISORGR30.RAGE >= :MinAge');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.RAGE <= :MaxAge');
    end;
    dmDV.QueryDV.SQL.Add('ORDER BY ISORGR30.RAGE,SUITE.UNITNAME,ISORGR30.MATERIALABR,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.PREFLEVEL');
    //dmUser.SetDeveloperData(dmDV.QueryDV.SQL.Text);
    dmDV.qCount.SQL.Clear;
    iRows := dmDV.qCount.SQL.Count;
    dmDV.qCount.SQL.Add('SELECT COUNT(*) FROM (');
    dmDV.qCount.SQL.Add(dmDV.QueryDV.SQL.Text);
    dmDV.qCount.SQL.Add(')');
  except
  end;
end;

procedure TdmDV.DefineDVPdfQuery(tmpID : integer);
var
  iRows, i : integer;
begin
  try
    dmDV.qDVpdf.SQL.Clear;
    dmDV.qDVpdf.SQL.Add('SELECT DISTINCT ISORGR30.COUNTRYABR, ISORGR30.UNITID,');
    dmDV.qDVpdf.SQL.Add('  ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,');
    dmDV.qDVpdf.SQL.Add('  ISORGR30.TECHABR,');
    dmDV.qDVpdf.SQL.Add('  ISORGR30.INTERPABR,ISORGR30.AGEUNITS,');
    dmDV.qDVpdf.SQL.Add('  ISORGR30.RECORDID,');
    dmDV.qDVpdf.SQL.Add('  ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOFOR.WHOFORID');
    dmDV.qDVpdf.SQL.Add('FROM ISORGR30,ISOFOR,USERSWHOFOR,INTERPRETATION  ');
    if (UserSession.UnitSender = usDetails) then
      dmDV.qDVpdf.SQL.Add('  ');
    if ((UserSession.UnitSender = usDomains) or (UserSession.UnitSender = usChartDomains)) then
      dmDV.qDVpdf.SQL.Add(',ISOPROVTERR ');
    if (UserSession.UnitSender = usDeposits) then
      dmDV.qDVpdf.SQL.Add('  ');
    if ((UserSession.UnitSender = usLIPs) or (UserSession.UnitSender = usChartLIPs)) then
      dmDV.qDVpdf.SQL.Add(',ISOLIP,LIPDOMAIN');

    dmDV.qDVpdf.SQL.Add('WHERE  USERSWHOFOR.USERID = :UserID');
    dmDV.qDVpdf.SQL.Add('AND ISORGR30.PREFLEVEL >= :PrefLevel');
    dmDV.qDVpdf.SQL.Add('AND ISORGR30.AGEUNITS = '+''''+'Ma'+'''');
    dmDV.qDVpdf.SQL.Add('AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR');
    dmDV.qDVpdf.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
    if (UserSession.UnitSender = usDetails) then
      dmDV.qDVpdf.SQL.Add('  ');
    if ((UserSession.UnitSender = usDomains) or (UserSession.UnitSender = usChartDomains)) then
    begin
      dmDV.qDVpdf.SQL.Add('AND ISOPROVTERR.DOMAINID= :DOMAINID');
      dmDV.qDVpdf.SQL.Add('AND ISOPROVTERR.RECORDID=ISORGR30.RECORDID');
    end;
    if (UserSession.UnitSender = usDeposits) then
      dmDV.qDVpdf.SQL.Add('  ');
    if ((UserSession.UnitSender = usLIPs) or (UserSession.UnitSender = usChartLIPs)) then
    begin
      dmDV.qDVpdf.SQL.Add('AND ISOLIP.RECORDID=ISORGR30.RECORDID');
      dmDV.qDVpdf.SQL.Add('AND ISOLIP.LIPID=LIPDOMAIN.LIPID');
      dmDV.qDVpdf.SQL.Add('AND LIPDOMAIN.INC4CHTYN = '+quotedstr('Y'));
      dmDV.qDVpdf.SQL.Add('AND LIPDOMAIN.DOMAINID= :DOMAINID');
    end;
    dmDV.qDVpdf.SQL.Add('AND USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID');
    dmDV.qDVpdf.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
    if (UserSession.UnitSender = usDetails)  then
    begin
      dmDV.qDVpdf.SQL.Add('AND INTERPRETATION.INTERPGROUP>=1');
    end;
    if ((UserSession.UnitSender = usDomains) or (UserSession.UnitSender = usChartDomains)) then
    begin
      dmDV.qDVpdf.SQL.Add('AND INTERPRETATION.INTERPCHARTDOMAIN>=1');
    end;
    if (UserSession.UnitSender = usDeposits)  then
    begin
      dmDV.qDVpdf.SQL.Add('AND INTERPRETATION.INTERPGROUP>0');
    end;
    if ((UserSession.UnitSender = usLIPs) or (UserSession.UnitSender = usChartLIPs)) then
    begin
      //dmDV.qDVpdf.SQL.Add('AND ISOLIP.LIPID= :LIPID');
      dmDV.qDVpdf.SQL.Add('AND INTERPRETATION.INTERPIGNEOUS=1');
    end;
    if ((UserSession.UnitSender = usChartDomains) or (UserSession.UnitSender = usChartLIPs))  then
    begin
      dmDV.qDVpdf.SQL.Add('AND ISORGR30.RAGE >= :MinAge');
      dmDV.qDVpdf.SQL.Add('AND ISORGR30.RAGE <= :MaxAge');
    end;
    dmDV.qDVpdf.SQL.Add('ORDER BY ISORGR30.RAGE,ISORGR30.UNITID,ISORGR30.MATERIALABR,');
    dmDV.qDVpdf.SQL.Add('  ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,');
    dmDV.qDVpdf.SQL.Add('  ISORGR30.PREFLEVEL');
    //dmUser.SetDeveloperData(dmDV.qDVpdf.SQL.Text);
    dmDV.qCount.SQL.Clear;
    dmDV.qCount.SQL.Add('SELECT COUNT(*) FROM (');
    dmDV.qCount.SQL.Add(dmDV.qDVpdf.SQL.Text);
    dmDV.qCount.SQL.Add(')');
    iRows := dmDV.qCount.SQL.Count;
    //dmUser.SetDeveloperData(dmDV.qCount.SQL.Text);
  except
  end;
end;

procedure TdmDV.AddPdfToDV(tmpUserID,tmpDomainOrder,tmpPdfOrder,tmpAge,tmpPDFValue,tmpDomainID : string);
var
  TD : TDBXTransaction;
begin
  {insert the PDFvalue}
  UserSession.WhereAmI := 'AddPdfToDateView start';
  try
    dmDV.qAddToDV.Close;
    dmDV.qAddToDV.SQL.Clear;
    dmDV.qAddToDV.SQL.Add('Insert into USERSPDF');
    dmDV.qAddToDV.SQL.Add('(USERID, DOMAINORDER, PDFORDER, AGE, PDFVALUE, DOMAINID)');
    dmDV.qAddToDV.SQL.Add('VALUES ('+''''+tmpUserID+''''+', '+''''+tmpDomainOrder+''''+', '+''''+tmpPdfOrder+''''+', '+''''+tmpAge+''''+', ');
    dmDV.qAddToDV.SQL.Add(' '+''''+tmpPdfValue+''''+', '+''''+tmpDomainID+''''+')');

    //if not dmDV.sqlcDateView.InTransaction then
    //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDV.qAddToDV.ExecSQL(false);
        dmDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
      end;
    //end;
  except
    //WebApplication.ShowMessage('Unable to append PDF value to DV table '+UserSession.WhereAmI);
  end;
  //if WasSuccessful then WebApplication.ShowMessage('PDF information successfully transferred to DateView');
end;

procedure TdmDV.InsertUserUnitSamples(tProjectID,tUserID,tUnitIDstr,tSampleNo,tStratDBUnitIDstr,tStratDBUnitName,tStratDBUnitRank,tStratDBUnitAgeStr,tLongitudeStr,tLatitudeStr,tCountryID : string);
var
  TD : TDBXTransaction;
begin
  UserSession.WhereAmI := 'InsertUserUnitSamples start';
  dmDV.qInsertUserUnitSamples.Close;
  dmDV.qInsertUserUnitSamples.SQL.Clear;
  dmDV.qInsertUserUnitSamples.SQL.Add('INSERT INTO USERUNITSUITESAMPLES');
  dmDV.qInsertUserUnitSamples.SQL.Add('(UserProjectID,UserID,UnitID,SampleNo,StratDBUnitID,StratDBUnitName,StratDBUnitRank,StratDBUnitAge,Longitude,Latitude,CountryID)');
  dmDV.qInsertUserUnitSamples.SQL.Add('VALUES ('+''''+tProjectID+''''+', '+''''+tUserID+''''+', '+''''+tUnitIDstr+''''+', '+''''+tSampleNo+''''+', '+''''+tStratDBUnitIDstr+''''+', '+''''+tStratDBUnitName+''''+', '+''''+tStratDBUnitRank+''''+', '+''''+tStratDBUnitAgestr+''''+', '    +''''+tLongitudeStr+''''+', '+''''+tLatitudeStr+''''+', '+''''+tCountryID+''''+')');
  //dmUser.SetDeveloperData(dmDV.qInsertUserUnitSamples.SQL.Text);
  //if not dmDV.sqlcDateView.InTransaction then
  //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDV.qInsertUserUnitSamples.ExecSQL(false);
      dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes;
    except
      dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes;
    end;
  //end;
end;

procedure TdmDV.DeleteUserUnitSamples(ProjectID : string);
var
  TD : TDBXTransaction;
begin
  UserSession.WhereAmI := 'DeleteUserUnitSamples start';
  dmDV.qDeleteAny.Close;
  dmDV.qDeleteAny.SQL.Clear;
  dmDV.qDeleteAny.SQL.Add('DELETE FROM USERUNITSUITESAMPLES');
  dmDV.qDeleteAny.SQL.Add('WHERE USERUNITSUITESAMPLES.USERPROJECTID = :ProjectID');
  dmDV.qDeleteAny.ParamByName('ProjectID').AsString := ProjectID;
  //if not dmDV.sqlcDateView.InTransaction then
  //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDV.qDeleteAny.ExecSQL(false);
      dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes;
    except
      dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes;
    end;
  //end;
end;

procedure TdmDV.DeleteUserGrainAgePDF(ProjectIDstr : string);
var
  TD : TDBXTransaction;
begin
  UserSession.WhereAmI := 'DeleteUserGrainAgePDF';
  dmDV.qDeleteAny.Close;
  dmDV.qDeleteAny.SQL.Clear;
  dmDV.qDeleteAny.SQL.Add('DELETE FROM USERGRAINAGEPDF');
  dmDV.qDeleteAny.SQL.Add('WHERE USERGRAINAGEPDF.PROJECTID = :ProjectID');
  dmDV.qDeleteAny.ParamByName('ProjectID').AsString := ProjectIDstr;
  //if not dmDV.sqlcDateView.InTransaction then
  //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDV.qDeleteAny.ExecSQL(false);
      dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes;
    except
      dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes;
    end;
  //end;
end;

procedure TdmDV.DeleteUserProvenanceData(ProjectIDstr : string);
var
  TD : TDBXTransaction;
begin
  UserSession.WhereAmI := 'DeleteUserProvenanceData';
  dmDV.qDeleteAny.Close;
  dmDV.qDeleteAny.SQL.Clear;
  dmDV.qDeleteAny.SQL.Add('DELETE FROM USERUNITSUITESOURCES');
  dmDV.qDeleteAny.SQL.Add('WHERE USERUNITSUITESOURCES.USERPROJECTID = :ProjectID');
  dmDV.qDeleteAny.ParamByName('ProjectID').AsString := ProjectIDstr;
  //if not dmDV.sqlcDateView.InTransaction then
  //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDV.qDeleteAny.ExecSQL(false);
      dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes;
    except
      dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes;
    end;
  //end;
end;

procedure TdmDV.InsertUserSourceSamples(tProjectID,tUserID,tUnitIDstr,tSampleNo,tSourceRecordIDstr,
      tStratDBUnitIDstr,tStratDBUnitName,tStratDBUnitRank,tStratDBUnitAgeStr,
      tLongitudeStr,tLatitudeStr,tCountryID,SRCUnitIDstr,
      SRCInterpAbr, SRCAgeStr, SRCAgePlus95Str, SRCAgeMinus95Str,
      SRCSampleNo, SRCLongitudeStr, SRCLatitudeStr : string);
var
  TD : TDBXTransaction;
begin
  UserSession.WhereAmI := 'InsertUserSourceSamples start';
        //UserID, UnitID, SampleNo, SourceRecordID, StratDBUnitID, StratDBUnitName,
        //  StratDBUnitRank, StratDBUnitAge, Longitude, Latitude, CountryID, SourceUnitID,
        //  SourceInterpAbr, SourceAge, SourceAgePlus95, SourceAgeMinus95,
        //  SourceSampleNo, SourceLongitude, SourceLatitude
  dmDV.qInsertUserSourceSamples.Close;
  dmDV.qInsertUserSourceSamples.SQL.Clear;
  dmDV.qInsertUserSourceSamples.SQL.Add('INSERT INTO USERUNITSUITESOURCES');
  dmDV.qInsertUserSourceSamples.SQL.Add('(UserProjectID,UserID,UnitID,SampleNo,SourceRecordID,StratDBUnitID,StratDBUnitName,StratDBUnitRank,StratDBUnitAge,Longitude,Latitude,CountryID,SRCUnitID,SRCInterpAbr,SRCAge,SRCAgePlus95,SRCAgeMinus95,SRCSampleNo,SRCLongitude,SRCLatitude)');
  dmDV.qInsertUserSourceSamples.SQL.Add('VALUES ('+quotedstr(tProjectID)+', '+quotedstr(tUserID)+', '+quotedstr(tUnitIDstr)+', '
    +quotedstr(tSampleNo)+', '+quotedstr(tSourceRecordIDstr)+', '
    +quotedstr(tStratDBUnitIDstr)+', '+quotedstr(tStratDBUnitName)+', '+quotedstr(tStratDBUnitRank)+', '
    +quotedstr(tStratDBUnitAgestr)+', '+quotedstr(tLongitudeStr)+', '+quotedstr(tLatitudeStr)+', '+quotedstr(tCountryID)+', '
    +quotedstr(SRCUnitIDstr)+', '
    +quotedstr(SRCInterpAbr)+', '+quotedstr(SRCAgeStr)+', '+quotedstr(SRCAgePlus95Str)+', '+quotedstr(SRCAgeMinus95Str)+', '
    +quotedstr(SRCSampleNo)+', '+quotedstr(SRCLongitudeStr)+', '+quotedstr(SRCLatitudeStr)
    +')');
  //dmUser.SetDeveloperData(dmDV.qInsertUserSourceSamples.SQL.Text);
  //if not dmDV.sqlcDateView.InTransaction then
  //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDV.qInsertUserSourceSamples.ExecSQL(false);
      dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes;
    except
      dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes;
    end;
  //end;
end;

procedure TdmDV.InsertUserGrainAgePDF(tProjectID,tUserID,tUnitIDstr, tStepNoStr,
      tStratDBUnitAgeStr,RegAssocIDstr : string; PDFage,PDFvalue : double);
var
  TD : TDBXTransaction;
  PDFageStr, PDFvalueStr : string;
begin
  UserSession.WhereAmI := 'InsertUserGrainAgePDF start';
  PDFageStr := FormatFloat('###0.000',PDFage);
  PDFvalueStr := FormatFloat('###0.0000',PDFvalue);
  dmDV.qInsertUserGrainPDF.Close;
  dmDV.qInsertUserGrainPDF.SQL.Clear;
  dmDV.qInsertUserGrainPDF.SQL.Add('INSERT INTO USERGRAINAGEPDF');
  dmDV.qInsertUserGrainPDF.SQL.Add('(ProjectID,UnitID,StepNo,PDFage,PDFvalue,StratDBUnitAge,RegAssocID)');
  dmDV.qInsertUserGrainPDF.SQL.Add('VALUES ('+quotedstr(tProjectID)+', '+quotedstr(tUnitIDstr)+', '
    +quotedstr(tStepNoStr)+', '+quotedstr(PDFageStr)+', '+quotedstr(PDFvalueStr)+', '
    +quotedstr(tStratDBUnitAgestr)+', '+quotedstr(RegAssocIDstr)
    +')');
  //dmUser.SetDeveloperData(dmDV.qInsertUserGrainPDF.SQL.Text);
  //if not dmDV.sqlcDateView.InTransaction then
  //begin
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDV.qInsertUserGrainPDF.ExecSQL(false);
      dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes;
    except
      dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes;
    end;
  //end;
end;

procedure TdmDV.ConstructRawDataSampleQuery;
var
  i : integer;
begin
  dmDV.qRawSmp.Close;
  dmDV.qRawSmp.SQL.Clear;
  dmDV.qRawSmp.SQL.Add('SELECT DISTINCT SMPDATA.SAMPLENO, SMPDATA.FRAC,');
  dmDV.qRawSmp.SQL.Add('SMPFRAC.ZONEID,');
  dmDV.qRawSmp.SQL.Add('VARREGASSOC.REGASSOCID');
  dmDV.qRawSmp.SQL.Add('FROM SMPDATA,SMPFRAC,USERUNITSUITESAMPLES,VARREGASSOC');
  dmDV.qRawSmp.SQL.Add('WHERE USERUNITSUITESAMPLES.USERID = :UserID');
  dmDV.qRawSmp.SQL.Add('AND USERUNITSUITESAMPLES.SAMPLENO = :SampleNo');
  dmDV.qRawSmp.SQL.Add('AND SMPDATA.SAMPLENO=USERUNITSUITESAMPLES.SAMPLENO');
  dmDV.qRawSmp.SQL.Add('AND SMPDATA.SAMPLENO=SMPFRAC.SAMPLENO');
  dmDV.qRawSmp.SQL.Add('AND SMPDATA.FRAC=SMPFRAC.FRAC');
  dmDV.qRawSmp.SQL.Add('AND VARREGASSOC.REGASSOCID=:REGASSOCID');
  //dmDV.qRawSmp.SQL.Add('AND (SMPDATA.ISOSYSTEM=:IsotopeSystem');
  //dmDV.qRawSmp.SQL.Add('OR SMPDATA.ISOSYSTEM='+''''+'NA'+''''+')');
  if (UserSession.IncludeSampleZoneValues) then
  begin
    dmDV.qRawSmp.SQL.Add('AND ( SMPFRAC.ZONEID = '+''''+UserSession.SampleZoneValues.Strings[0]+'''');
    if (UserSession.SampleZoneValues.Count >1) then
    begin
      for i := 2 to UserSession.SampleZoneValues.Count do
      begin
        dmDV.qRawSmp.SQL.Add('OR SMPFRAC.ZONEID = '+''''+UserSession.SampleZoneValues.Strings[i-1]+'''');
      end;
    end;
    dmDV.qRawSmp.SQL.Add(' ) ');
  end;
  dmDV.qRawSmp.SQL.Add('ORDER BY SMPDATA.SAMPLENO, SMPDATA.FRAC');
end;

procedure TdmDV.UpdateUserUnitSuiteSamples(tUnitID : integer; tStratUnitAge : double);
var
  TD : TDBXTransaction;
begin
  UserSession.WhereAmI := 'UpdateUserUnitSuiteSamples start';
  dmDV.qUpdateUserUnitSuiteSamples.Close;
  dmDV.qUpdateUserUnitSuiteSamples.ParamByName('UnitID').AsInteger := tUnitID;
  dmDV.qUpdateUserUnitSuiteSamples.ParamByName('RevisedAge').AsFloat := tStratUnitAge;
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDV.qUpdateUserUnitSuiteSamples.ExecSQL(false);
      dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes;
    except
      dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes;
    end;
end;

procedure TdmDV.UpdateUserUnitSuiteSamplesNumFrac(tNumFrac : integer; tProjectID : string; tSampleNo : string);
var
  TD : TDBXTransaction;
begin
  UserSession.WhereAmI := 'UpdateUserUnitSuiteSamplesNumFrac start';
  dmDV.qUpdateNumFrac.Close;
  dmDV.qUpdateNumFrac.SQL.Clear;
  dmDV.qUpdateNumFrac.SQL.Add('update userunitsuitesamples');
  dmDV.qUpdateNumFrac.SQL.Add('set userUNITsuitesamples.numfractotal=:totalnumberfrac');
  dmDV.qUpdateNumFrac.SQL.Add('where userunitsuitesamples.sampleno=:sampleno');
  dmDV.qUpdateNumFrac.SQL.Add('and userunitsuitesamples.userprojectid = :projectid');
  dmDV.qUpdateNumFrac.ParamByName('ProjectID').AsString := tProjectID;
  dmDV.qUpdateNumFrac.ParamByName('SampleNo').AsString := tSampleNo;
  dmDV.qUpdateNumFrac.ParamByName('TotalNumberFrac').AsInteger := tNumFrac;
      TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDV.qUpdateNumFrac.ExecSQL(false);
      dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes;
    except
      dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes;
    end;
end;

procedure TdmDV.UpdateUserUnitSuiteSamplesNumFracIncl(UpdateType : string; tNumFrac : integer; tProjectID : string; tSampleNo : string);
var
  TD : TDBXTransaction;
begin
  //UpdateType = 'A' for updating included age fractions (mostly based on 'Age_preferred')
  //UpdateType = 'R' for updating included isotope ratio fractions (mostly based on '176Hf177Hf')
  UserSession.WhereAmI := 'UpdateUserUnitSuiteSamplesNumFracIncl start';
  dmDV.qUpdateNumFrac.Close;
  dmDV.qUpdateNumFrac.SQL.Clear;
  dmDV.qUpdateNumFrac.SQL.Add('update userunitsuitesamples');
  if (UpdateType = 'A') then
  begin
    dmDV.qUpdateNumFrac.SQL.Add('set userUNITsuitesamples.numfracinclage=:numberfracincl');
  end;
  if (UpdateType = 'R') then
  begin
    dmDV.qUpdateNumFrac.SQL.Add('set userUNITsuitesamples.numfracinclisorat=:numberfracincl');
  end;
  dmDV.qUpdateNumFrac.SQL.Add('where userunitsuitesamples.sampleno=:sampleno');
  dmDV.qUpdateNumFrac.SQL.Add('and userunitsuitesamples.userprojectid = :projectid');
  dmDV.qUpdateNumFrac.ParamByName('ProjectID').AsString := tProjectID;
  dmDV.qUpdateNumFrac.ParamByName('SampleNo').AsString := tSampleNo;
  dmDV.qUpdateNumFrac.ParamByName('NumberFracIncl').AsInteger := tNumFrac;
  TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmDV.qUpdateNumFrac.ExecSQL(false);
    dmDV.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes;
  except
    dmDV.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes;
  end;
end;

procedure TdmDV.InsertReference (tSourceNum,tSourceYear : integer; tSourceShort,tContinentID,tWhoForID : string; var wasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  UserSession.WhereAmI := 'InsertReference start DateView';
  //dmUser.SetDeveloperData(UserSession.WhereAmI);
  try
    dmDV.qInsertLink.Close;
    dmDV.qInsertLink.SQL.Clear;
    dmDV.qInsertLink.SQL.Add('INSERT INTO SOURCELIST');
    dmDV.qInsertLink.SQL.Add('(SourceNum, SourceShort, SourceYear, ContinentID, WhoForID)');
    dmDV.qInsertLink.SQL.Add(' Values (:tSourceNum, :tSourceShort, :tSourceYear, :tContinentID, :tWhoForID)');
    dmDV.qInsertLink.ParamByName('tSourceNum').AsInteger := tSourceNum;
    dmDV.qInsertLink.ParamByName('tSourceShort').AsString := tSourceShort;
    dmDV.qInsertLink.ParamByName('tSourceYear').AsInteger := tSourceYear;
    dmDV.qInsertLink.ParamByName('tContinentID').AsString := tContinentID;
    dmDV.qInsertLink.ParamByName('tWhoForID').AsString := tWhoForID;
    //dmUser.SetDeveloperData(dmDV.qInsertLink.SQL.Text);
    TD := dmDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDV.qInsertLink.ExecSQL(false);
      dmDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
    except
      dmDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
      WasSuccessful := false;
    end;
  except
    WasSuccessful := false;
    //WebApplication.ShowMessage('Unable to insert record '+UserSession.WhereAmI);
  end;
end;


end.



