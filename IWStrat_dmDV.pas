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
    cdsQueryDVCOUNTRYABR: TStringField;
    cdsQueryDVUNITNAME: TStringField;
    cdsQueryDVMATERIALABR: TStringField;
    cdsQueryDVISOTOPESYSTEM: TStringField;
    cdsQueryDVAPPROACHABR: TStringField;
    cdsQueryDVINTERPABR: TStringField;
    cdsQueryDVIAGE: TIntegerField;
    cdsQueryDVIAGEPERROR: TIntegerField;
    cdsQueryDVIAGEMERROR: TIntegerField;
    cdsQueryDVAGEUNITS: TStringField;
    cdsQueryDVLITHOLOGY: TStringField;
    cdsQueryDVRECORDID: TIntegerField;
    cdsQueryDVCOUNTRY: TStringField;
    cdsQueryDVMATERIALDESCRIPTION: TStringField;
    cdsQueryDVINTERPRETATION: TStringField;
    cdsQueryDVAPPROACHDESCRIPTION: TStringField;
    cdsQueryDVISOSYSTEMNAME: TStringField;
    cdsQueryDVWHOFORID: TStringField;
    cdsQueryDVTECHABR: TStringField;
    cdsQueryDVTECHNIQUE: TStringField;
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
    cdsDomainDatesINC4CHTYN: TStringField;
    cdsDomainDatesDOMAINNAME: TStringField;
    cdsDomainDatesCOUNTRYID: TStringField;
    cdsDomainDatesUNITNAME: TStringField;
    cdsDomainDatesRANKID: TStringField;
    cdsDomainDatesAGEYEARS: TFMTBCDField;
    cdsDomainDatesMINAGE: TFloatField;
    cdsDomainDatesMAXAGE: TFloatField;
    cdsDomainDatesUNITRANK: TStringField;
    dsDomainDates: TDataSource;
    qDVUserDomains: TSQLQuery;
    dspDVUserDomains: TDataSetProvider;
    cdsDVUserDomains: TClientDataSet;
    dsDVUserDomains: TDataSource;
    cdsDVUserDomainsUSERID: TStringField;
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
    cdsDVDomainDatesProvincesCOUNTRYABR: TStringField;
    cdsDVDomainDatesProvincesUNITNAME: TStringField;
    cdsDVDomainDatesProvincesMATERIALABR: TStringField;
    cdsDVDomainDatesProvincesISOTOPESYSTEM: TStringField;
    cdsDVDomainDatesProvincesAPPROACHABR: TStringField;
    cdsDVDomainDatesProvincesTECHABR: TStringField;
    cdsDVDomainDatesProvincesINTERPABR: TStringField;
    cdsDVDomainDatesProvincesIAGE: TIntegerField;
    cdsDVDomainDatesProvincesIAGEPERROR: TIntegerField;
    cdsDVDomainDatesProvincesIAGEMERROR: TIntegerField;
    cdsDVDomainDatesProvincesAGEUNITS: TStringField;
    cdsDVDomainDatesProvincesLITHOLOGY: TStringField;
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
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FMTBCDField1: TFMTBCDField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField6: TStringField;
    dsDomainCurves: TDataSource;
    qSuite: TSQLQuery;
    dspSuite: TDataSetProvider;
    cdsSuite: TClientDataSet;
    dsSuite: TDataSource;
    cdsSuiteUNITID: TIntegerField;
    cdsSuiteUNITNAME: TStringField;
    cdsSuiteUNITRANK: TStringField;
    cdsSuiteGISID: TIntegerField;
    cdsSuiteFORMATIONOFFSET: TFloatField;
    cdsSuiteFORMATIONOFFSET2: TFloatField;
    cdsSuiteFORMATIONOFFSET3: TFloatField;
    cdsSuitePARENTID: TIntegerField;
    cdsQueryDVUNITID: TIntegerField;
    cdsQueryDVRAGE: TFloatField;
    cdsQueryDVRAGEPERROR: TFloatField;
    cdsQueryDVRAGEMERROR: TFloatField;
    cdsDVDomainDatesProvincesDOMAINNAME: TStringField;
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
    cdsCountCOUNT: TIntegerField;
    qDVpdf: TSQLQuery;
    dspDVpdf: TDataSetProvider;
    cdsDVpdf: TClientDataSet;
    dsDVpdf: TDataSource;
    cdsDVpdfCOUNTRYABR: TStringField;
    cdsDVpdfUNITID: TIntegerField;
    cdsDVpdfMATERIALABR: TStringField;
    cdsDVpdfISOTOPESYSTEM: TStringField;
    cdsDVpdfAPPROACHABR: TStringField;
    cdsDVpdfTECHABR: TStringField;
    cdsDVpdfINTERPABR: TStringField;
    cdsDVpdfAGEUNITS: TStringField;
    cdsDVpdfRECORDID: TIntegerField;
    cdsDVpdfRAGE: TFloatField;
    cdsDVpdfRAGEPERROR: TFloatField;
    cdsDVpdfRAGEMERROR: TFloatField;
    cdsDVpdfWHOFORID: TStringField;
    qUserUnitSuites: TSQLQuery;
    dspUserUnitSuites: TDataSetProvider;
    cdsUserUnitSUites: TClientDataSet;
    dsUserUnitSUites: TDataSource;
    qUserUnitSuiteSamples: TSQLQuery;
    dspUserUnitSuiteSamples: TDataSetProvider;
    cdsUserUnitSuiteSamples: TClientDataSet;
    dsUserUnitSuiteSamples: TDataSource;
    cdsUserUnitSuiteSamplesUSERID: TStringField;
    cdsUserUnitSuiteSamplesUNITID: TIntegerField;
    cdsUserUnitSuiteSamplesSAMPLENO: TStringField;
    cdsUserUnitSuiteSamplesSTRATDBUNITID: TIntegerField;
    cdsUserUnitSuiteSamplesSTRATDBUNITNAME: TStringField;
    cdsUserUnitSuiteSamplesSTRATDBUNITRANK: TStringField;
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
    cdsUserSamplesForUnitSAMPLENO: TStringField;
    cdsUserSamplesForUnitLONGITUDE: TFloatField;
    cdsUserSamplesForUnitLATITUDE: TFloatField;
    cdsUserSamplesForUnitELEVATION: TFloatField;
    cdsUserSamplesForUnitUNITID: TIntegerField;
    qInsertUserUnitSamples: TSQLQuery;
    qDeleteAny: TSQLQuery;
    cdsUserUnitSuiteSamplesCOUNTRYID: TStringField;
    qRawSmp: TSQLQuery;
    qRawSmpSAMPLENO: TStringField;
    qRawSmpFRAC: TStringField;
    dsqRawSmp: TDataSource;
    dspRawSmp: TDataSetProvider;
    cdsRawSmp: TClientDataSet;
    cdsRawSmpSAMPLENO: TStringField;
    cdsRawSmpFRAC: TStringField;
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
    qRawDataXSAMPLENO: TStringField;
    qRawDataXFRAC: TStringField;
    qRawDataXISOSYSTEM: TStringField;
    qRawDataXVARIABLEID: TStringField;
    qRawDataXDATAVALUE: TFloatField;
    qRawDataXNORMALISINGSTANDARD: TStringField;
    qRawDataXSTANDARDVALUE: TFloatField;
    qRawDataXVARIABLENAME: TStringField;
    dsqRawDataX: TDataSource;
    cdsRawDataX: TClientDataSet;
    cdsRawDataXSAMPLENO: TStringField;
    cdsRawDataXFRAC: TStringField;
    cdsRawDataXISOSYSTEM: TStringField;
    cdsRawDataXVARIABLEID: TStringField;
    cdsRawDataXDATAVALUE: TFloatField;
    cdsRawDataXNORMALISINGSTANDARD: TStringField;
    cdsRawDataXSTANDARDVALUE: TFloatField;
    cdsRawDataXVARIABLENAME: TStringField;
    cdsRawDataXqRawStandardValueX: TDataSetField;
    dsRawDataX: TDataSource;
    qRawStandardValueX: TSQLQuery;
    qRawStandardValueXACCEPTEDVALUE: TFloatField;
    cdsRawStandardValueX: TClientDataSet;
    cdsRawStandardValueXACCEPTEDVALUE: TFloatField;
    dsRawStandardValueX: TDataSource;
    qRawNormalisedValueX: TSQLQuery;
    qRawNormalisedValueXSAMPLENO: TStringField;
    qRawNormalisedValueXFRAC: TStringField;
    qRawNormalisedValueXISOSYSTEM: TStringField;
    qRawNormalisedValueXVARIABLEID: TStringField;
    qRawNormalisedValueXDATAVALUE: TFloatField;
    qRawNormalisedValueXNORMALISINGSTANDARD: TStringField;
    qRawNormalisedValueXSTANDARDVALUE: TFloatField;
    qRawNormalisedValueXACCEPTEDVALUE: TFloatField;
    qRawNormalisedValueXNORMALISEDVALUE: TFloatField;
    cdsRawNormalisedValueX: TClientDataSet;
    cdsRawNormalisedValueXSAMPLENO: TStringField;
    cdsRawNormalisedValueXFRAC: TStringField;
    cdsRawNormalisedValueXISOSYSTEM: TStringField;
    cdsRawNormalisedValueXVARIABLEID: TStringField;
    cdsRawNormalisedValueXDATAVALUE: TFloatField;
    cdsRawNormalisedValueXNORMALISINGSTANDARD: TStringField;
    cdsRawNormalisedValueXSTANDARDVALUE: TFloatField;
    cdsRawNormalisedValueXACCEPTEDVALUE: TFloatField;
    cdsRawNormalisedValueXNORMALISEDVALUE: TFloatField;
    dsRawNormalisedValueX: TDataSource;
    qRawDataXerr: TSQLQuery;
    qRawDataXerrSAMPLENO: TStringField;
    qRawDataXerrFRAC: TStringField;
    qRawDataXerrISOSYSTEM: TStringField;
    qRawDataXerrVARIABLEID: TStringField;
    qRawDataXerrDATAVALUE: TFloatField;
    qRawDataXerrNORMALISINGSTANDARD: TStringField;
    qRawDataXerrSTANDARDVALUE: TFloatField;
    qRawDataXerrVARIABLENAME: TStringField;
    dsqRawDataXerr: TDataSource;
    cdsRawDataXerr: TClientDataSet;
    cdsRawDataXerrSAMPLENO: TStringField;
    cdsRawDataXerrFRAC: TStringField;
    cdsRawDataXerrISOSYSTEM: TStringField;
    cdsRawDataXerrVARIABLEID: TStringField;
    cdsRawDataXerrDATAVALUE: TFloatField;
    cdsRawDataXerrNORMALISINGSTANDARD: TStringField;
    cdsRawDataXerrSTANDARDVALUE: TFloatField;
    cdsRawDataXerrVARIABLENAME: TStringField;
    dsRawDataXerr: TDataSource;
    qRawErrTypeX: TSQLQuery;
    qRawErrTypeXSAMPLENO: TStringField;
    qRawErrTypeXFRAC: TStringField;
    qRawErrTypeXISOSYSTEM: TStringField;
    qRawErrTypeXVARIABLEID: TStringField;
    qRawErrTypeXDATAVALUE: TFloatField;
    qRawErrTypeXNORMALISINGSTANDARD: TStringField;
    qRawErrTypeXSTANDARDVALUE: TFloatField;
    qRawErrTypeXVARIABLENAME: TStringField;
    cdsRawErrTypeX: TClientDataSet;
    cdsRawErrTypeXSAMPLENO: TStringField;
    cdsRawErrTypeXFRAC: TStringField;
    cdsRawErrTypeXISOSYSTEM: TStringField;
    cdsRawErrTypeXVARIABLEID: TStringField;
    cdsRawErrTypeXDATAVALUE: TFloatField;
    cdsRawErrTypeXNORMALISINGSTANDARD: TStringField;
    cdsRawErrTypeXSTANDARDVALUE: TFloatField;
    cdsRawErrTypeXVARIABLENAME: TStringField;
    dsRawErrTypeX: TDataSource;
    qRawDataPrecX: TSQLQuery;
    qRawDataPrecXSAMPLENO: TStringField;
    qRawDataPrecXFRAC: TStringField;
    qRawDataPrecXISOSYSTEM: TStringField;
    qRawDataPrecXVARIABLEID: TStringField;
    qRawDataPrecXDATAVALUE: TFloatField;
    cdsRawDataPrecX: TClientDataSet;
    cdsRawDataPrecXSAMPLENO: TStringField;
    cdsRawDataPrecXFRAC: TStringField;
    cdsRawDataPrecXISOSYSTEM: TStringField;
    cdsRawDataPrecXVARIABLEID: TStringField;
    cdsRawDataPrecXDATAVALUE: TFloatField;
    dsRawDataPrecX: TDataSource;
    qRawDataY: TSQLQuery;
    qRawDataYSAMPLENO: TStringField;
    qRawDataYFRAC: TStringField;
    qRawDataYISOSYSTEM: TStringField;
    qRawDataYVARIABLEID: TStringField;
    qRawDataYDATAVALUE: TFloatField;
    qRawDataYNORMALISINGSTANDARD: TStringField;
    qRawDataYSTANDARDVALUE: TFloatField;
    qRawDataYVARIABLENAME: TStringField;
    dsqRawDataY: TDataSource;
    cdsRawDataY: TClientDataSet;
    cdsRawDataYSAMPLENO: TStringField;
    cdsRawDataYFRAC: TStringField;
    cdsRawDataYISOSYSTEM: TStringField;
    cdsRawDataYVARIABLEID: TStringField;
    cdsRawDataYDATAVALUE: TFloatField;
    cdsRawDataYNORMALISINGSTANDARD: TStringField;
    cdsRawDataYSTANDARDVALUE: TFloatField;
    cdsRawDataYVARIABLENAME: TStringField;
    cdsRawDataYqRawStandardValueY: TDataSetField;
    dsRawDataY: TDataSource;
    qRawStandardValueY: TSQLQuery;
    qRawStandardValueYACCEPTEDVALUE: TFloatField;
    cdsRawStandardValueY: TClientDataSet;
    cdsRawStandardValueYACCEPTEDVALUE: TFloatField;
    dsRawStandardValueY: TDataSource;
    qRawNormalisedValueY: TSQLQuery;
    qRawNormalisedValueYSAMPLENO: TStringField;
    qRawNormalisedValueYFRAC: TStringField;
    qRawNormalisedValueYISOSYSTEM: TStringField;
    qRawNormalisedValueYVARIABLEID: TStringField;
    qRawNormalisedValueYDATAVALUE: TFloatField;
    qRawNormalisedValueYNORMALISINGSTANDARD: TStringField;
    qRawNormalisedValueYSTANDARDVALUE: TFloatField;
    qRawNormalisedValueYACCEPTEDVALUE: TFloatField;
    qRawNormalisedValueYNORMALISEDVALUE: TFloatField;
    cdsRawNormalisedValueY: TClientDataSet;
    cdsRawNormalisedValueYSAMPLENO: TStringField;
    cdsRawNormalisedValueYFRAC: TStringField;
    cdsRawNormalisedValueYISOSYSTEM: TStringField;
    cdsRawNormalisedValueYVARIABLEID: TStringField;
    cdsRawNormalisedValueYDATAVALUE: TFloatField;
    cdsRawNormalisedValueYNORMALISINGSTANDARD: TStringField;
    cdsRawNormalisedValueYSTANDARDVALUE: TFloatField;
    cdsRawNormalisedValueYACCEPTEDVALUE: TFloatField;
    cdsRawNormalisedValueYNORMALISEDVALUE: TFloatField;
    dsRawNormalisedValueY: TDataSource;
    qRawDataYerr: TSQLQuery;
    qRawDataYerrSAMPLENO: TStringField;
    qRawDataYerrFRAC: TStringField;
    qRawDataYerrISOSYSTEM: TStringField;
    qRawDataYerrVARIABLEID: TStringField;
    qRawDataYerrDATAVALUE: TFloatField;
    qRawDataYerrNORMALISINGSTANDARD: TStringField;
    qRawDataYerrSTANDARDVALUE: TFloatField;
    qRawDataYerrVARIABLENAME: TStringField;
    dsqRawDataYerr: TDataSource;
    cdsRawDataYerr: TClientDataSet;
    cdsRawDataYerrSAMPLENO: TStringField;
    cdsRawDataYerrFRAC: TStringField;
    cdsRawDataYerrISOSYSTEM: TStringField;
    cdsRawDataYerrVARIABLEID: TStringField;
    cdsRawDataYerrDATAVALUE: TFloatField;
    cdsRawDataYerrNORMALISINGSTANDARD: TStringField;
    cdsRawDataYerrSTANDARDVALUE: TFloatField;
    cdsRawDataYerrVARIABLENAME: TStringField;
    dsRawDataYerr: TDataSource;
    qRawDataR: TSQLQuery;
    qRawDataRSAMPLENO: TStringField;
    qRawDataRFRAC: TStringField;
    qRawDataRISOSYSTEM: TStringField;
    qRawDataRVARIABLEID: TStringField;
    qRawDataRDATAVALUE: TFloatField;
    qRawDataRNORMALISINGSTANDARD: TStringField;
    qRawDataRSTANDARDVALUE: TFloatField;
    qRawDataRVARIABLENAME: TStringField;
    cdsRawErrTypeY: TClientDataSet;
    cdsRawErrTypeYSAMPLENO: TStringField;
    cdsRawErrTypeYFRAC: TStringField;
    cdsRawErrTypeYISOSYSTEM: TStringField;
    cdsRawErrTypeYVARIABLEID: TStringField;
    cdsRawErrTypeYDATAVALUE: TFloatField;
    cdsRawErrTypeYNORMALISINGSTANDARD: TStringField;
    cdsRawErrTypeYSTANDARDVALUE: TFloatField;
    cdsRawErrTypeYVARIABLENAME: TStringField;
    dsRawErrTypeY: TDataSource;
    qRawDataPrecY: TSQLQuery;
    qRawDataPrecYSAMPLENO: TStringField;
    qRawDataPrecYFRAC: TStringField;
    qRawDataPrecYISOSYSTEM: TStringField;
    qRawDataPrecYVARIABLEID: TStringField;
    qRawDataPrecYDATAVALUE: TFloatField;
    cdsRawDataPrecY: TClientDataSet;
    cdsRawDataPrecYSAMPLENO: TStringField;
    cdsRawDataPrecYFRAC: TStringField;
    cdsRawDataPrecYISOSYSTEM: TStringField;
    cdsRawDataPrecYVARIABLEID: TStringField;
    cdsRawDataPrecYDATAVALUE: TFloatField;
    dsRawDataPrecY: TDataSource;
    qRawErrTypeY: TSQLQuery;
    qRawErrTypeYSAMPLENO: TStringField;
    qRawErrTypeYFRAC: TStringField;
    qRawErrTypeYISOSYSTEM: TStringField;
    qRawErrTypeYVARIABLEID: TStringField;
    qRawErrTypeYDATAVALUE: TFloatField;
    qRawErrTypeYNORMALISINGSTANDARD: TStringField;
    qRawErrTypeYSTANDARDVALUE: TFloatField;
    qRawErrTypeYVARIABLENAME: TStringField;
    cdsRawDataR: TClientDataSet;
    cdsRawDataRSAMPLENO: TStringField;
    cdsRawDataRFRAC: TStringField;
    cdsRawDataRISOSYSTEM: TStringField;
    cdsRawDataRVARIABLEID: TStringField;
    cdsRawDataRDATAVALUE: TFloatField;
    cdsRawDataRNORMALISINGSTANDARD: TStringField;
    cdsRawDataRSTANDARDVALUE: TFloatField;
    cdsRawDataRVARIABLENAME: TStringField;
    dsRawDataR: TDataSource;
    qRawDataZ: TSQLQuery;
    qRawDataZSAMPLENO: TStringField;
    qRawDataZFRAC: TStringField;
    qRawDataZISOSYSTEM: TStringField;
    qRawDataZVARIABLEID: TStringField;
    qRawDataZDATAVALUE: TFloatField;
    qRawDataZNORMALISINGSTANDARD: TStringField;
    qRawDataZSTANDARDVALUE: TFloatField;
    qRawDataZVARIABLENAME: TStringField;
    dsqRawDataZ: TDataSource;
    cdsRawDataZ: TClientDataSet;
    cdsRawDataZSAMPLENO: TStringField;
    cdsRawDataZFRAC: TStringField;
    cdsRawDataZISOSYSTEM: TStringField;
    cdsRawDataZVARIABLEID: TStringField;
    cdsRawDataZDATAVALUE: TFloatField;
    cdsRawDataZNORMALISINGSTANDARD: TStringField;
    cdsRawDataZSTANDARDVALUE: TFloatField;
    cdsRawDataZVARIABLENAME: TStringField;
    cdsRawDataZqRawStandardValueZ: TDataSetField;
    dsRawDataZ: TDataSource;
    qRawStandardValueZ: TSQLQuery;
    qRawStandardValueZACCEPTEDVALUE: TFloatField;
    cdsRawStandardValueZ: TClientDataSet;
    cdsRawStandardValueZACCEPTEDVALUE: TFloatField;
    dsRawStandardValueZ: TDataSource;
    qRawNormalisedValueZ: TSQLQuery;
    qRawNormalisedValueZSAMPLENO: TStringField;
    qRawNormalisedValueZFRAC: TStringField;
    qRawNormalisedValueZISOSYSTEM: TStringField;
    qRawNormalisedValueZVARIABLEID: TStringField;
    qRawNormalisedValueZDATAVALUE: TFloatField;
    qRawNormalisedValueZNORMALISINGSTANDARD: TStringField;
    qRawNormalisedValueZSTANDARDVALUE: TFloatField;
    qRawNormalisedValueZACCEPTEDVALUE: TFloatField;
    qRawNormalisedValueZNORMALISEDVALUE: TFloatField;
    cdsRawNormalisedValueZ: TClientDataSet;
    cdsRawNormalisedValueZSAMPLENO: TStringField;
    cdsRawNormalisedValueZFRAC: TStringField;
    cdsRawNormalisedValueZISOSYSTEM: TStringField;
    cdsRawNormalisedValueZVARIABLEID: TStringField;
    cdsRawNormalisedValueZDATAVALUE: TFloatField;
    cdsRawNormalisedValueZNORMALISINGSTANDARD: TStringField;
    cdsRawNormalisedValueZSTANDARDVALUE: TFloatField;
    cdsRawNormalisedValueZACCEPTEDVALUE: TFloatField;
    cdsRawNormalisedValueZNORMALISEDVALUE: TFloatField;
    dsRawNormalisedValueZ: TDataSource;
    qRawDataZerr: TSQLQuery;
    qRawDataZerrSAMPLENO: TStringField;
    qRawDataZerrFRAC: TStringField;
    qRawDataZerrISOSYSTEM: TStringField;
    qRawDataZerrVARIABLEID: TStringField;
    qRawDataZerrDATAVALUE: TFloatField;
    qRawDataZerrNORMALISINGSTANDARD: TStringField;
    qRawDataZerrSTANDARDVALUE: TFloatField;
    qRawDataZerrVARIABLENAME: TStringField;
    cdsRawDataZerr: TClientDataSet;
    cdsRawDataZerrSAMPLENO: TStringField;
    cdsRawDataZerrFRAC: TStringField;
    cdsRawDataZerrISOSYSTEM: TStringField;
    cdsRawDataZerrVARIABLEID: TStringField;
    cdsRawDataZerrDATAVALUE: TFloatField;
    cdsRawDataZerrNORMALISINGSTANDARD: TStringField;
    cdsRawDataZerrSTANDARDVALUE: TFloatField;
    cdsRawDataZerrVARIABLENAME: TStringField;
    dsRawDataZerr: TDataSource;
    qRawErrTypeZ: TSQLQuery;
    qRawErrTypeZSAMPLENO: TStringField;
    qRawErrTypeZFRAC: TStringField;
    qRawErrTypeZISOSYSTEM: TStringField;
    qRawErrTypeZVARIABLEID: TStringField;
    qRawErrTypeZDATAVALUE: TFloatField;
    qRawErrTypeZNORMALISINGSTANDARD: TStringField;
    qRawErrTypeZSTANDARDVALUE: TFloatField;
    qRawErrTypeZVARIABLENAME: TStringField;
    cdsRawErrTypeZ: TClientDataSet;
    cdsRawErrTypeZSAMPLENO: TStringField;
    cdsRawErrTypeZFRAC: TStringField;
    cdsRawErrTypeZISOSYSTEM: TStringField;
    cdsRawErrTypeZVARIABLEID: TStringField;
    cdsRawErrTypeZDATAVALUE: TFloatField;
    cdsRawErrTypeZNORMALISINGSTANDARD: TStringField;
    cdsRawErrTypeZSTANDARDVALUE: TFloatField;
    cdsRawErrTypeZVARIABLENAME: TStringField;
    dsRawErrTypeZ: TDataSource;
    qRawDataPrecZ: TSQLQuery;
    qRawDataPrecZSAMPLENO: TStringField;
    qRawDataPrecZFRAC: TStringField;
    qRawDataPrecZISOSYSTEM: TStringField;
    qRawDataPrecZVARIABLEID: TStringField;
    qRawDataPrecZDATAVALUE: TFloatField;
    cdsRawDataPrecZ: TClientDataSet;
    cdsRawDataPrecZSAMPLENO: TStringField;
    cdsRawDataPrecZFRAC: TStringField;
    cdsRawDataPrecZISOSYSTEM: TStringField;
    cdsRawDataPrecZVARIABLEID: TStringField;
    cdsRawDataPrecZDATAVALUE: TFloatField;
    dsRawDataPrecZ: TDataSource;
    qRawDiscordance: TSQLQuery;
    qRawDiscordanceSAMPLENO: TStringField;
    qRawDiscordanceFRAC: TStringField;
    qRawDiscordanceISOSYSTEM: TStringField;
    qRawDiscordanceVARIABLEID: TStringField;
    qRawDiscordanceDATAVALUE: TFloatField;
    cdsRawDiscordance: TClientDataSet;
    cdsRawDiscordanceSAMPLENO: TStringField;
    cdsRawDiscordanceFRAC: TStringField;
    cdsRawDiscordanceISOSYSTEM: TStringField;
    cdsRawDiscordanceVARIABLEID: TStringField;
    cdsRawDiscordanceDATAVALUE: TFloatField;
    dsRawDiscordance: TDataSource;
    qRawRef: TSQLQuery;
    qRawRefSAMPLENO: TStringField;
    qRawRefREFNUM: TIntegerField;
    qRawRefSOURCESHORT: TStringField;
    cdsRawRef: TClientDataSet;
    cdsRawRefSAMPLENO: TStringField;
    cdsRawRefREFNUM: TIntegerField;
    cdsRawRefSOURCESHORT: TStringField;
    dsRawRef: TDataSource;
    qRawDataDM: TSQLQuery;
    qRawDataDMSAMPLENO: TStringField;
    qRawDataDMFRAC: TStringField;
    qRawDataDMISOSYSTEM: TStringField;
    qRawDataDMVARIABLEID: TStringField;
    qRawDataDMDATAVALUE: TFloatField;
    dsqRawDataDM: TDataSource;
    cdsRawDataDM: TClientDataSet;
    cdsRawDataDMSAMPLENO: TStringField;
    cdsRawDataDMFRAC: TStringField;
    cdsRawDataDMISOSYSTEM: TStringField;
    cdsRawDataDMVARIABLEID: TStringField;
    cdsRawDataDMDATAVALUE: TFloatField;
    cdsRawDataDMqRawDataDMerr: TDataSetField;
    dsRawDataDM: TDataSource;
    qRawDataDMerr: TSQLQuery;
    qRawDataDMerrSAMPLENO: TStringField;
    qRawDataDMerrFRAC: TStringField;
    qRawDataDMerrISOSYSTEM: TStringField;
    qRawDataDMerrVARIABLEID: TStringField;
    qRawDataDMerrDATAVALUE: TFloatField;
    qRawDataDMerrNORMALISINGSTANDARD: TStringField;
    qRawDataDMerrSTANDARDVALUE: TFloatField;
    qRawDataDMerrVARIABLENAME: TStringField;
    dsqRawDataDMerr: TDataSource;
    cdsRawDataDMerr: TClientDataSet;
    cdsRawDataDMerrSAMPLENO: TStringField;
    cdsRawDataDMerrFRAC: TStringField;
    cdsRawDataDMerrISOSYSTEM: TStringField;
    cdsRawDataDMerrVARIABLEID: TStringField;
    cdsRawDataDMerrDATAVALUE: TFloatField;
    cdsRawDataDMerrNORMALISINGSTANDARD: TStringField;
    cdsRawDataDMerrSTANDARDVALUE: TFloatField;
    cdsRawDataDMerrVARIABLENAME: TStringField;
    dsRawDataDMerr: TDataSource;
    qExisting: TSQLQuery;
    dspExisting: TDataSetProvider;
    cdsExisting: TClientDataSet;
    cdsExistingRECORDID: TIntegerField;
    cdsExistingCOUNTRYABR: TStringField;
    cdsExistingUNITID: TIntegerField;
    cdsExistingMATERIALABR: TStringField;
    cdsExistingISOTOPESYSTEM: TStringField;
    cdsExistingAPPROACHABR: TStringField;
    cdsExistingTECHABR: TStringField;
    cdsExistingINTERPABR: TStringField;
    cdsExistingRAGE: TFloatField;
    cdsExistingRAGEPERROR: TFloatField;
    cdsExistingRAGEMERROR: TFloatField;
    cdsExistingUNITNAME: TStringField;
    cdsExistingUNITRANK: TStringField;
    cdsExistingCONTINENTID: TStringField;
    cdsExistingMATERIALDESCRIPTION: TStringField;
    cdsExistingAPPROACHDESCRIPTION: TStringField;
    cdsExistingTECHNIQUE: TStringField;
    cdsExistingINTERPRETATION: TStringField;
    dsExisting: TDataSource;
    qRawAgePref: TSQLQuery;
    qRawAgePrefSAMPLENO: TStringField;
    qRawAgePrefFRAC: TStringField;
    qRawAgePrefISOSYSTEM: TStringField;
    qRawAgePrefVARIABLEID: TStringField;
    qRawAgePrefDATAVALUE: TFloatField;
    dsqRawAgePref: TDataSource;
    cdsRawAgePref: TClientDataSet;
    cdsRawAgePrefSAMPLENO: TStringField;
    cdsRawAgePrefFRAC: TStringField;
    cdsRawAgePrefISOSYSTEM: TStringField;
    cdsRawAgePrefVARIABLEID: TStringField;
    cdsRawAgePrefDATAVALUE: TFloatField;
    cdsRawAgePrefqRawDataAgeerr: TDataSetField;
    dsRawAgePref: TDataSource;
    qRawSmpLoc: TSQLQuery;
    qRawSmpLocCOUNTRYABR: TStringField;
    qRawSmpLocCONTINENTID: TStringField;
    qRawSmpLocLONGITUDE: TFloatField;
    qRawSmpLocLATITUDE: TFloatField;
    qRawSmpLocELEVATION: TFloatField;
    cdsRawSmpLoc: TClientDataSet;
    cdsRawSmpLocCOUNTRYABR: TStringField;
    cdsRawSmpLocCONTINENTID: TStringField;
    cdsRawSmpLocLONGITUDE: TFloatField;
    cdsRawSmpLocLATITUDE: TFloatField;
    cdsRawSmpLocELEVATION: TFloatField;
    dsRawSmpLoc: TDataSource;
    qRawDataAgeerr: TSQLQuery;
    qRawDataAgeerrSAMPLENO: TStringField;
    qRawDataAgeerrFRAC: TStringField;
    qRawDataAgeerrISOSYSTEM: TStringField;
    qRawDataAgeerrVARIABLEID: TStringField;
    qRawDataAgeerrDATAVALUE: TFloatField;
    qRawDataAgeerrNORMALISINGSTANDARD: TStringField;
    qRawDataAgeerrSTANDARDVALUE: TFloatField;
    qRawDataAgeerrVARIABLENAME: TStringField;
    dsqRawDataAgeerr: TDataSource;
    cdsRawDataAgeerr: TClientDataSet;
    cdsRawDataAgeerrSAMPLENO: TStringField;
    cdsRawDataAgeerrFRAC: TStringField;
    cdsRawDataAgeerrISOSYSTEM: TStringField;
    cdsRawDataAgeerrVARIABLEID: TStringField;
    cdsRawDataAgeerrDATAVALUE: TFloatField;
    cdsRawDataAgeerrNORMALISINGSTANDARD: TStringField;
    cdsRawDataAgeerrSTANDARDVALUE: TFloatField;
    cdsRawDataAgeerrVARIABLENAME: TStringField;
    dsRawDataAgeerr: TDataSource;
    cdsSamplePDF: TClientDataSet;
    cdsSamplePDFStep: TIntegerField;
    cdsSamplePDFPDFDataValue: TFloatField;
    cdsSamplePDFPDFValue: TFloatField;
    dsSamplePDF: TDataSource;
    cdsData: TClientDataSet;
    cdsDatatRec: TIntegerField;
    cdsDataSampleNo: TStringField;
    cdsDataFrac: TStringField;
    cdsDataPb207U235: TFloatField;
    cdsDataPb207U235Sigma: TFloatField;
    cdsDataPb206U238: TFloatField;
    cdsDataPb206U238Sigma: TFloatField;
    cdsDataU238Pb206: TFloatField;
    cdsDataU238Pb206Sigma: TFloatField;
    cdsDataPb207Pb206: TFloatField;
    cdsDataPb207Pb206Sigma: TFloatField;
    cdsDataIncludeYN: TStringField;
    cdsDataPercentConcordance: TFloatField;
    cdsDataPreferredAge: TFloatField;
    cdsDataPreferredAgeSigma: TFloatField;
    dsData: TDataSource;
    cdsUnitPDF: TClientDataSet;
    dsUnitPDF: TDataSource;
    cdsUnitPDFUnitID: TIntegerField;
    cdsUnitPDFUnitName: TStringField;
    cdsUnitPDFUnitRank: TStringField;
    cdsUnitPDFCountryID: TStringField;
    cdsUnitPDFStepID: TIntegerField;
    cdsUnitPDFUnitAge: TFloatField;
    cdsUnitPDFGrainAge: TFloatField;
    cdsUnitPDFPDFvalue: TFloatField;
    qRawDataInclude: TSQLQuery;
    qRawDataIncludeSAMPLENO: TStringField;
    qRawDataIncludeFRAC: TStringField;
    qRawDataIncludeISOSYSTEM: TStringField;
    qRawDataIncludeVARIABLEID: TStringField;
    qRawDataIncludeDATAVALUE: TFloatField;
    cdsRawDataInclude: TClientDataSet;
    dsRawDataInclude: TDataSource;
    cdsRawSmpqRawDataInclude: TDataSetField;
    cdsRawDataIncludeSAMPLENO: TStringField;
    cdsRawDataIncludeFRAC: TStringField;
    cdsRawDataIncludeISOSYSTEM: TStringField;
    cdsRawDataIncludeVARIABLEID: TStringField;
    cdsRawDataIncludeDATAVALUE: TFloatField;
    cdsUnitGrainAgeData: TClientDataSet;
    dsUnitGrainAgeData: TDataSource;
    cdsUnitGrainAgeDataCountryID: TStringField;
    cdsUnitGrainAgeDataUnitID: TIntegerField;
    cdsUnitGrainAgeDataUnitName: TStringField;
    cdsUnitGrainAgeDataUnitRank: TStringField;
    cdsUnitGrainAgeDataUnitAge: TFloatField;
    cdsUnitGrainAgeDataGrainAge: TFloatField;
    cdsUnitGrainAgeDataGrainAgeUncertainty: TFloatField;
    cdsUnitGrainAgeDataAnalysisNo: TIntegerField;
    cdsUnitGrainAgeDataIncludeYN: TStringField;
    cdsUnitGrainAgeDataSampleNo: TStringField;
    cdsUnitGrainAgeDataFrac: TStringField;
    cdsUnitGrainAgeDataPercentConcordance: TFloatField;
    qSampleDetritalAges: TSQLQuery;
    dspSampleDetritalAges: TDataSetProvider;
    cdsSampleDetritalAges: TClientDataSet;
    dsSampleDetritalAges: TDataSource;
    cdsSampleDetritalAgesRECORDID: TIntegerField;
    cdsSampleDetritalAgesCOUNTRYABR: TStringField;
    cdsSampleDetritalAgesMATERIALABR: TStringField;
    cdsSampleDetritalAgesISOTOPESYSTEM: TStringField;
    cdsSampleDetritalAgesINTERPABR: TStringField;
    cdsSampleDetritalAgesRAGE: TFloatField;
    cdsSampleDetritalAgesRAGEPERROR: TFloatField;
    cdsSampleDetritalAgesRAGEMERROR: TFloatField;
    qMatchingAges: TSQLQuery;
    dspMatchingAges: TDataSetProvider;
    cdsMatchingAges: TClientDataSet;
    dsMatchingAges: TDataSource;
    cdsMatchingAgesRECORDID: TIntegerField;
    cdsMatchingAgesCOUNTRYABR: TStringField;
    cdsMatchingAgesMATERIALABR: TStringField;
    cdsMatchingAgesISOTOPESYSTEM: TStringField;
    cdsMatchingAgesINTERPABR: TStringField;
    cdsMatchingAgesRAGE: TFloatField;
    cdsMatchingAgesRAGEPERROR: TFloatField;
    cdsMatchingAgesRAGEMERROR: TFloatField;
    cdsMatchingAgesSAMPLENO: TStringField;
    cdsMatchingAgesLONGITUDE: TFloatField;
    cdsMatchingAgesLATITUDE: TFloatField;
    cdsMatchingAgesUNITNAME: TStringField;
    cdsMatchingAgesUNITRANK: TStringField;
    qInsertUserSourceSamples: TSQLQuery;
    qUserSourceSamples: TSQLQuery;
    dspUserSourceSamples: TDataSetProvider;
    cdsUserSourceSamples: TClientDataSet;
    dsUserSourceSamples: TDataSource;
    cdsUserSourceSamplesUSERID: TStringField;
    cdsUserSourceSamplesUNITID: TIntegerField;
    cdsUserSourceSamplesSAMPLENO: TStringField;
    cdsUserSourceSamplesSOURCERECORDID: TIntegerField;
    cdsUserSourceSamplesSTRATDBUNITID: TIntegerField;
    cdsUserSourceSamplesSTRATDBUNITNAME: TStringField;
    cdsUserSourceSamplesSTRATDBUNITRANK: TStringField;
    cdsUserSourceSamplesSTRATDBUNITAGE: TFloatField;
    cdsUserSourceSamplesLONGITUDE: TFloatField;
    cdsUserSourceSamplesLATITUDE: TFloatField;
    cdsUserSourceSamplesCOUNTRYID: TStringField;
    cdsUserSourceSamplesUSERPROJECTID: TIntegerField;
    qUserProjects: TSQLQuery;
    dspUserProjects: TDataSetProvider;
    cdsUserProjects: TClientDataSet;
    dsUserProjects: TDataSource;
    cdsUserProjectsUSERPROJECTID: TIntegerField;
    cdsUserProjectsUSERID: TStringField;
    cdsUserProjectsUSERPROJECTNAME: TStringField;
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
    cdsSamplesForUnitUSERID: TStringField;
    cdsSamplesForUnitSAMPLENO: TStringField;
    cdsSamplesForUnitSTRATDBUNITID: TIntegerField;
    cdsSamplesForUnitUNITID: TIntegerField;
    cdsSamplesForUnitSTRATDBUNITNAME: TStringField;
    cdsSamplesForUnitSTRATDBUNITRANK: TStringField;
    cdsSamplesForUnitSTRATDBUNITAGE: TFloatField;
    cdsSamplesForUnitLONGITUDE: TFloatField;
    cdsSamplesForUnitLATITUDE: TFloatField;
    cdsSamplesForUnitCOUNTRYID: TStringField;
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
    cdsUserSourceSamplesSRCSAMPLENO: TStringField;
    cdsUserSourceSamplesSRCLONGITUDE: TFloatField;
    cdsUserSourceSamplesSRCLATITUDE: TFloatField;
    cdsUserSourceSamplesSRCUNITID: TIntegerField;
    cdsUserSourceSamplesSRCINTERPABR: TStringField;
    qStratDBUnitIDforDVUnitID: TSQLQuery;
    dspStratDBUnitIDforDVUnitID: TDataSetProvider;
    cdsStratDBUnitIDforDVUnitID: TClientDataSet;
    dsStratDBUnitIDforDVUnitID: TDataSource;
    cdsStratDBUnitIDforDVUnitIDUNITID: TIntegerField;
    cdsStratDBUnitIDforDVUnitIDGISID: TIntegerField;
    cdsUserUnitGrainAgePDFSTRATDBUNITNAME: TStringField;
    cdsUserUnitGrainAgePDFSTRATDBUNITRANK: TStringField;
    qUpdateUserUnitSuiteSamples: TSQLQuery;
    qDVLIPDomainDatesProvinces: TSQLQuery;
    dspDVLIPDomainDatesProvinces: TDataSetProvider;
    cdsDVLIPDomainDatesProvinces: TClientDataSet;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    StringField14: TStringField;
    StringField15: TStringField;
    IntegerField8: TIntegerField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    SmallintField1: TSmallintField;
    StringField16: TStringField;
    IntegerField9: TIntegerField;
    dsDVLIPDomainDatesProvinces: TDataSource;
    cdsDVLIPDomainDatesProvincesLIPID: TIntegerField;
    cdsDVLIPDomainDatesProvincesLIPNAME: TStringField;
    cdsUserSamplesForUnitUSERID: TStringField;
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
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    FloatField8: TFloatField;
    StringField21: TStringField;
    FloatField9: TFloatField;
    StringField22: TStringField;
    cdsRawDataVar1: TClientDataSet;
    dsRawDataVar1: TDataSource;
    qRawSmpREGASSOCID: TStringField;
    cdsRawSmpREGASSOCID: TStringField;
    qRawDataXREGASSOCID: TStringField;
    cdsRawDataXREGASSOCID: TStringField;
    qRawDataYREGASSOCID: TStringField;
    cdsRawDataYREGASSOCID: TStringField;
    qRawDataZREGASSOCID: TStringField;
    cdsRawDataZREGASSOCID: TStringField;
    qRawDataDMREGASSOCID: TStringField;
    cdsRawDataDMREGASSOCID: TStringField;
    qRawAgePrefREGASSOCID: TStringField;
    cdsRawAgePrefREGASSOCID: TStringField;
    qRawDataVar2: TSQLQuery;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    FloatField12: TFloatField;
    StringField33: TStringField;
    FloatField13: TFloatField;
    StringField34: TStringField;
    cdsRawDataVar2: TClientDataSet;
    dsRawDataVar2: TDataSource;
    qRawDataVar3: TSQLQuery;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    FloatField16: TFloatField;
    StringField45: TStringField;
    FloatField17: TFloatField;
    StringField46: TStringField;
    cdsRawDataVar3: TClientDataSet;
    dsRawDataVar3: TDataSource;
    cdsRawSmpqRawDataVar3: TDataSetField;
    cdsRawSmpqRawDataVar2: TDataSetField;
    cdsRawSmpqRawDataVar1: TDataSetField;
    cdsDataVar1: TFloatField;
    cdsDataVar2: TFloatField;
    cdsDataVar3: TFloatField;
    cdsUserUnitGrainAgePDFREGASSOCID: TStringField;
    cdsUnitGrainAgeDataRegAssocID: TFloatField;
    cdsUnitGrainAgeDataVar1: TFloatField;
    cdsUnitGrainAgeDataVar2: TFloatField;
    cdsUnitGrainAgeDataVar3: TFloatField;
    qUserDetritalSamples: TSQLQuery;
    dspUserDetritalSamples: TDataSetProvider;
    cdsUserDetritalSamples: TClientDataSet;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    StringField53: TStringField;
    IntegerField12: TIntegerField;
    StringField54: TStringField;
    IntegerField13: TIntegerField;
    StringField55: TStringField;
    StringField56: TStringField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    StringField57: TStringField;
    StringField58: TStringField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    StringField59: TStringField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    IntegerField14: TIntegerField;
    StringField60: TStringField;
    dsUserDetritalSamples: TDataSource;
    cdsRawDataVar1SAMPLENO: TStringField;
    cdsRawDataVar1FRAC: TStringField;
    cdsRawDataVar1ISOSYSTEM: TStringField;
    cdsRawDataVar1VARIABLEID: TStringField;
    cdsRawDataVar1DATAVALUE: TFloatField;
    cdsRawDataVar1NORMALISINGSTANDARD: TStringField;
    cdsRawDataVar1STANDARDVALUE: TFloatField;
    cdsRawDataVar1VARIABLENAME: TStringField;
    cdsRawDataVar2SAMPLENO: TStringField;
    cdsRawDataVar2FRAC: TStringField;
    cdsRawDataVar2ISOSYSTEM: TStringField;
    cdsRawDataVar2VARIABLEID: TStringField;
    cdsRawDataVar2DATAVALUE: TFloatField;
    cdsRawDataVar2NORMALISINGSTANDARD: TStringField;
    cdsRawDataVar2STANDARDVALUE: TFloatField;
    cdsRawDataVar2VARIABLENAME: TStringField;
    cdsRawDataVar3SAMPLENO: TStringField;
    cdsRawDataVar3FRAC: TStringField;
    cdsRawDataVar3ISOSYSTEM: TStringField;
    cdsRawDataVar3VARIABLEID: TStringField;
    cdsRawDataVar3DATAVALUE: TFloatField;
    cdsRawDataVar3NORMALISINGSTANDARD: TStringField;
    cdsRawDataVar3STANDARDVALUE: TFloatField;
    cdsRawDataVar3VARIABLENAME: TStringField;
    cdsDataZoneID: TStringField;
    cdsUnitGrainAgeDataZoneID: TStringField;
    qRawSmpZONEID: TStringField;
    cdsRawSmpZONEID: TStringField;
    qSampleZones: TSQLQuery;
    dspSampleZones: TDataSetProvider;
    cdsSampleZones: TClientDataSet;
    dsSampleZones: TDataSource;
    cdsSampleZonesZONEID: TStringField;
    cdsSampleZonesZONETYPE: TStringField;
    cdsUserSourceSamplesSRCUNITNAME: TStringField;
    cdsUserSourceSamplesSRCUNITRANK: TStringField;
    cdsUserSourceSamplesSRCREFNUM: TIntegerField;
    cdsUserSourceSamplesSRCREFSHORT: TStringField;
    cdsUserSourceSamplesSRCREFNUMCOMPILED: TIntegerField;
    qUpdateUserUnitSourceReferences: TSQLQuery;
    qRefFull: TSQLQuery;
    dspRefFull: TDataSetProvider;
    cdsRefFull: TClientDataSet;
    dsRefFull: TDataSource;
    qRefFullSOURCENUM: TIntegerField;
    qRefFullSOURCESHORT: TStringField;
    qRefFullSOURCEYEAR: TIntegerField;
    qRefFullCONTINENTID: TStringField;
    qRefFullWHOFORID: TStringField;
    qRefFullSOURCEDESCRIPTION: TMemoField;
    qRefFullDOI: TStringField;
    cdsRefFullSOURCENUM: TIntegerField;
    cdsRefFullSOURCESHORT: TStringField;
    cdsRefFullSOURCEYEAR: TIntegerField;
    cdsRefFullCONTINENTID: TStringField;
    cdsRefFullWHOFORID: TStringField;
    cdsRefFullSOURCEDESCRIPTION: TMemoField;
    cdsRefFullDOI: TStringField;
    qInsertLink: TSQLQuery;
    cdsDVMinMaxMINAGE: TFloatField;
    cdsDVMinMaxMAXAGE: TFloatField;
    qCompleteUserGrainData: TSQLQuery;
    dspCompleteUserGrainData: TDataSetProvider;
    cdsCompleteUserGrainData: TClientDataSet;
    dsCompleteUserGrainData: TDataSource;
    cdsCompleteUserGrainDataUSERID: TStringField;
    cdsCompleteUserGrainDataSAMPLENO: TStringField;
    cdsCompleteUserGrainDataFRAC: TStringField;
    cdsCompleteUserGrainDataORIGINALNO: TStringField;
    cdsCompleteUserGrainDataLITHOLOGY: TStringField;
    cdsCompleteUserGrainDataLONGITUDE: TFloatField;
    cdsCompleteUserGrainDataLATITUDE: TFloatField;
    cdsCompleteUserGrainDataELEVATION: TFloatField;
    cdsCompleteUserGrainDataUSERPROJECTID: TIntegerField;
    cdsCompleteUserGrainDataUSERPROJECTNAME: TStringField;
    cdsCompleteUserGrainDataCOUNTRYID: TStringField;
    cdsCompleteUserGrainDataUNITID: TIntegerField;
    cdsCompleteUserGrainDataSTRATDBUNITID: TIntegerField;
    cdsCompleteUserGrainDataSTRATDBUNITNAME: TStringField;
    cdsCompleteUserGrainDataSTRATDBUNITRANK: TStringField;
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



