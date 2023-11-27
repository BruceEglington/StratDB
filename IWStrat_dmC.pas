unit IWStrat_dmC;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  DBXCommon,
  IWCompListbox, WideStrings,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DBXFirebird,
  DbxDevartInterBase;

type
  TdmStratC = class(TDataModule)
    qCharts: TSQLQuery;
    dspCharts: TDataSetProvider;
    cdsCharts: TClientDataSet;
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
    dsCharts: TDataSource;
    dsRefFull: TDataSource;
    dsRefDetail: TDataSource;
    qYesNo: TSQLQuery;
    dspYesNo: TDataSetProvider;
    cdsYesNo: TClientDataSet;
    dsYesNo: TDataSource;
    qYesNoYESNOID: TStringField;
    qYesNoYESNO: TStringField;
    cdsYesNoYESNOID: TStringField;
    cdsYesNoYESNO: TStringField;
    cdsRefFullCONTINENTID: TStringField;
    qRefDetailREFNUM: TIntegerField;
    cdsRefDetailREFNUM: TIntegerField;
    cdsRefFullREFNUM: TIntegerField;
    Query1Rec: TSQLQuery;
    dspQuery1Rec: TDataSetProvider;
    cdsQuery1Rec: TClientDataSet;
    cdsQuery1RecUNITID: TIntegerField;
    qValidFull: TSQLQuery;
    dspValidFull: TDataSetProvider;
    cdsValidFull: TClientDataSet;
    dsValidFull: TDataSource;
    cdsValidFullUNITID: TIntegerField;
    cdsValidFullVALIDSTATUSID: TStringField;
    cdsValidFullDATEDONE: TSQLTimeStampField;
    cdsValidFullDONEBY: TStringField;
    cdsValidFullCOMMENTS: TMemoField;
    qStratRef: TSQLQuery;
    qDeleteStratDomain: TSQLQuery;
    qDeleteLinkToApplication: TSQLQuery;
    qChart: TSQLQuery;
    dspChart: TDataSetProvider;
    cdsChart: TClientDataSet;
    dsChart: TDataSource;
    dsqChart: TDataSource;
    qChartDomains: TSQLQuery;
    cdsChartDomain: TClientDataSet;
    dsChartDomain: TDataSource;
    cdsChartDomainCHARTID: TIntegerField;
    cdsChartDomainOFFSET_MM: TIntegerField;
    cdsChartDomainDOMAINID: TIntegerField;
    cdsChartDomainDOMAINNAME: TStringField;
    cdsChartDomainCONTINENTID: TStringField;
    cdsChartsCHARTID: TIntegerField;
    cdsChartsCHART: TStringField;
    cdsChartsCHARTOFFSET_MM: TIntegerField;
    cdsChartsDEFAULTDOMAINOFFSET: TIntegerField;
    cdsChartsUSERID: TStringField;
    qDomains: TSQLQuery;
    dspDomains: TDataSetProvider;
    cdsDomains: TClientDataSet;
    dsDomains: TDataSource;
    cdsDomainsDOMAINID: TIntegerField;
    cdsDomainsCONTINENTID: TStringField;
    cdsDomainsDOMAINNAME: TStringField;
    cdsDomainsSPOTLATITUDE: TFloatField;
    cdsDomainsSPOTLONGITUDE: TFloatField;
    cdsChartDomainDOMAINORDER: TSmallintField;
    qNewChartDomain: TSQLQuery;
    qOrogenies: TSQLQuery;
    dspOrogenies: TDataSetProvider;
    cdsOrogenies: TClientDataSet;
    dsOrogenies: TDataSource;
    cdsOrogeniesOROGENYID: TIntegerField;
    cdsOrogeniesOROGENY: TStringField;
    cdsOrogeniesCONTINENTID: TStringField;
    qDomain: TSQLQuery;
    dspDomain: TDataSetProvider;
    cdsDomain: TClientDataSet;
    dsDomain: TDataSource;
    dsqDomain: TDataSource;
    cdsDomainDOMAINID: TIntegerField;
    cdsDomainDOMAINNAME: TStringField;
    cdsDomainCONTINENTID: TStringField;
    qDomainMetamorphism: TSQLQuery;
    cdsDomainMetamorphism: TClientDataSet;
    dsDomainMetamorphism: TDataSource;
    cdsDomainqDomainMetamorphism: TDataSetField;
    qDomainDeformation: TSQLQuery;
    cdsDomainDeformation: TClientDataSet;
    dsDomainDeformation: TDataSource;
    qMetamorphicGrade: TSQLQuery;
    dspMetamorphicGrade: TDataSetProvider;
    cdsMetamorphicGrade: TClientDataSet;
    dsMetamorphicGrade: TDataSource;
    cdsMetamorphicGradeGRADEID: TStringField;
    cdsMetamorphicGradeGRADE: TStringField;
    qTimeSpace: TSQLQuery;
    dsqTimeSpace: TDataSource;
    dspTimeSpace: TDataSetProvider;
    cdsTimeSpace: TClientDataSet;
    dsTimeSpace: TDataSource;
    cdsTimeSpaceCHARTID: TIntegerField;
    cdsTimeSpaceUNITID: TIntegerField;
    cdsTimeSpacePOINTID: TSmallintField;
    cdsTimeSpaceDOMAINID: TIntegerField;
    cdsTimeSpaceCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceUNITOFFSET_MM: TIntegerField;
    cdsTimeSpaceMINAGE: TFloatField;
    cdsTimeSpaceMAXAGE: TFloatField;
    cdsTimeSpaceRANKWIDTH: TSmallintField;
    cdsTimeSpaceUNITNAME: TStringField;
    cdsTimeSpaceUNITRANK: TStringField;
    cdsTimeSpaceDOMAINNAME: TStringField;
    cdsTimeSpaceROCKCLASS: TStringField;
    cdsTimeSpaceSETTING: TStringField;
    qDomainTypes: TSQLQuery;
    dspDomainTypes: TDataSetProvider;
    cdsDomainTypes: TClientDataSet;
    dsDomainTypes: TDataSource;
    cdsDomainTypesDOMAINTYPEID: TStringField;
    cdsDomainTypesDOMAINTYPE: TStringField;
    cdsDomainsDOMAINPARENTID: TIntegerField;
    cdsDomainsDOMAINTYPEID: TStringField;
    qOrogeniesCont: TSQLQuery;
    dspOrogeniesCont: TDataSetProvider;
    cdsOrogeniesCont: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    dsOrogeniesCont: TDataSource;
    qChartDomainsCHARTID: TIntegerField;
    qChartDomainsDOMAINORDER: TSmallintField;
    qChartDomainsOFFSET_MM: TIntegerField;
    qChartDomainsDOMAINID: TIntegerField;
    qChartDomainsDOMAINNAME: TStringField;
    qChartDomainsCONTINENTID: TStringField;
    cdsDomainTypesDVLEVEL: TIntegerField;
    qContinents: TSQLQuery;
    qContinentsCONTINENTID: TStringField;
    qContinentsCONTINENT: TStringField;
    qContinentsDEFAULTDOMAINID: TIntegerField;
    dsContinents: TDataSource;
    cdsContinents: TClientDataSet;
    dspContinents: TDataSetProvider;
    cdsContinentsCONTINENTID: TStringField;
    cdsContinentsCONTINENT: TStringField;
    cdsContinentsDEFAULTDOMAINID: TIntegerField;
    qDomainsAll: TSQLQuery;
    dspDomainsAll: TDataSetProvider;
    cdsDomainsAll: TClientDataSet;
    dsDomainsAll: TDataSource;
    cdsDomainsAllDOMAINID: TIntegerField;
    cdsDomainsAllCONTINENTID: TStringField;
    cdsDomainsAllDOMAINNAME: TStringField;
    cdsDomainsAllDOMAINPARENTID: TIntegerField;
    cdsDomainsAllDOMAINTYPEID: TStringField;
    qTimeSpaceMetamorphism: TSQLQuery;
    dsqTimeSpaceMetamorphism: TDataSource;
    dspTimeSpaceMetamorphism: TDataSetProvider;
    cdsTimeSpaceMetamorphism: TClientDataSet;
    dsTimeSpaceMetamorphism: TDataSource;
    qTimeSpaceDeformation: TSQLQuery;
    dsqTimeSpaceDeformation: TDataSource;
    dspTimeSpaceDeformation: TDataSetProvider;
    cdsTimeSpaceDeformation: TClientDataSet;
    dsTimeSpaceDeformation: TDataSource;
    cdsTimeSpaceDeformationCHARTID: TIntegerField;
    cdsTimeSpaceDeformationDOMAINID: TIntegerField;
    cdsTimeSpaceDeformationDEFORMATIONORDER: TIntegerField;
    cdsTimeSpaceDeformationPOINTID: TSmallintField;
    cdsTimeSpaceDeformationCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceDeformationDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceDeformationAGEMIN: TFloatField;
    cdsTimeSpaceDeformationAGEMAX: TFloatField;
    cdsTimeSpaceDeformationDOMAINNAME: TStringField;
    cdsTimeSpaceDeformationDOMAINTYPE: TStringField;
    cdsTimeSpaceDeformationOROGENY: TStringField;
    cdsTimeSpaceDOMAINORDER: TSmallintField;
    cdsTimeSpaceDeformationDOMAINORDER: TSmallintField;
    cdsChartsXMIN: TIntegerField;
    cdsChartsXMAX: TIntegerField;
    cdsChartsYMIN: TIntegerField;
    cdsChartsYMAX: TIntegerField;
    qChartPosition: TSQLQuery;
    dsqChartPosition: TDataSource;
    dspChartPosition: TDataSetProvider;
    cdsChartPosition: TClientDataSet;
    dsChartPosition: TDataSource;
    cdsChartPositionCHARTID: TIntegerField;
    cdsChartPositionXMIN: TIntegerField;
    cdsChartPositionYMIN: TIntegerField;
    cdsChartPositionXMAX: TIntegerField;
    cdsChartPositionYMAX: TIntegerField;
    cdsTimeSpaceSETTINGID: TStringField;
    cdsTimeSpaceROCKCLASSID: TStringField;
    qMaxChart: TSQLQuery;
    dspMaxChart: TDataSetProvider;
    cdsMaxChart: TClientDataSet;
    dsMaxChart: TDataSource;
    qMaxChartMAX: TIntegerField;
    cdsMaxChartMAX: TIntegerField;
    cdsDomainsMINPLOTAGE: TFloatField;
    cdsDomainsMAXPLOTAGE: TFloatField;
    qChartDomainsMINPLOTAGE: TFloatField;
    qChartDomainsMAXPLOTAGE: TFloatField;
    cdsChartDomainMINPLOTAGE: TFloatField;
    cdsChartDomainMAXPLOTAGE: TFloatField;
    qChartDomainsDOMAINXMIN: TIntegerField;
    qChartDomainsDOMAINXMAX: TIntegerField;
    cdsChartDomainDOMAINXMIN: TIntegerField;
    cdsChartDomainDOMAINXMAX: TIntegerField;
    cdsTimeSpaceDOMAINXMIN: TIntegerField;
    cdsTimeSpaceDOMAINXMAX: TIntegerField;
    cdsTimeSpaceINC4CHTYN: TStringField;
    cdsTimeSpaceDeformationDOMAINXMIN: TIntegerField;
    cdsTimeSpaceDeformationDOMAINXMAX: TIntegerField;
    cdsTimeSpaceDeformationCONSTRAINTLEVELID: TSmallintField;
    cdsTimeSpaceDeformationAGECONSTRAINTLEVEL: TStringField;
    cdsTimeSpaceDeformationDUCTILITYTYPEID: TStringField;
    cdsTimeSpaceDeformationDUCTILITYTYPE: TStringField;
    cdsTimeSpaceDeformationDEFORMATIONTYPEID: TIntegerField;
    cdsTimeSpaceDeformationDEFORMATIONTYPE: TStringField;
    cdsTimeSpaceDeformationVERGENCEANGLE: TIntegerField;
    cdsTimeSpaceDeformationDIRECTIONNAME: TStringField;
    cdsTimeSpaceMetamorphismCHARTID: TIntegerField;
    cdsTimeSpaceMetamorphismDOMAINORDER: TSmallintField;
    cdsTimeSpaceMetamorphismDOMAINID: TIntegerField;
    cdsTimeSpaceMetamorphismMETAMORPHISMORDER: TIntegerField;
    cdsTimeSpaceMetamorphismPOINTID: TSmallintField;
    cdsTimeSpaceMetamorphismCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceMetamorphismDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceMetamorphismDOMAINXMIN: TIntegerField;
    cdsTimeSpaceMetamorphismDOMAINXMAX: TIntegerField;
    cdsTimeSpaceMetamorphismPEAKAGE: TFloatField;
    cdsTimeSpaceMetamorphismMINAGE: TFloatField;
    cdsTimeSpaceMetamorphismMAXAGE: TFloatField;
    cdsTimeSpaceMetamorphismDOMAINNAME: TStringField;
    cdsTimeSpaceMetamorphismOROGENY: TStringField;
    cdsTimeSpaceMetamorphismGRADEID: TStringField;
    cdsTimeSpaceMetamorphismGRADE: TStringField;
    cdsTimeSpaceMetamorphismCONSTRAINTLEVELID: TSmallintField;
    cdsTimeSpaceMetamorphismAGECONSTRAINTLEVEL: TStringField;
    cdsTimeSpaceMetamorphismPEAKTMIN: TFloatField;
    cdsTimeSpaceMetamorphismPEAKTMAX: TFloatField;
    cdsTimeSpaceMetamorphismPEAKPMIN: TFloatField;
    cdsTimeSpaceMetamorphismPEAKPMAX: TFloatField;
    cdsTimeSpaceMetamorphismDOMAINTYPE: TStringField;
    qMapUnitsGIS: TSQLQuery;
    dsqMapUnitsGIS: TDataSource;
    dspMapUnitsGIS: TDataSetProvider;
    cdsMapUnitsGIS: TClientDataSet;
    dsMapUnitsGIS: TDataSource;
    cdsMapUnitsGISMAPID2: TStringField;
    cdsMapUnitsGISMAPNAME: TStringField;
    cdsMapUnitsGISUNITID: TIntegerField;
    cdsMapUnitsGISGISINT: TIntegerField;
    cdsMapUnitsGISGISSTR: TStringField;
    qDomainUnits: TSQLQuery;
    dsqDomainUnits: TDataSource;
    dspDomainUnits: TDataSetProvider;
    cdsDomainUnits: TClientDataSet;
    dsDomainUnits: TDataSource;
    cdsDomainUnitsDOMAINID: TIntegerField;
    cdsDomainUnitsUNITID: TIntegerField;
    cdsDomainUnitsINC4CHTYN: TStringField;
    cdsDomainUnitsDOMAINNAME: TStringField;
    cdsDomainUnitsCOUNTRYID: TStringField;
    cdsDomainUnitsUNITNAME: TStringField;
    cdsDomainUnitsRANKID: TStringField;
    cdsDomainUnitsMINAGE: TFloatField;
    cdsDomainUnitsMAXAGE: TFloatField;
    cdsDomainUnitsUNITRANK: TStringField;
    qChartDomainUnits: TSQLQuery;
    dsqChartDomainUnits: TDataSource;
    cdsChartDomainUnits: TClientDataSet;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField8: TStringField;
    dsChartDomainUnits: TDataSource;
    cdsChartDomainUnitsDOMAINORDER: TSmallintField;
    cdsTimeSpaceROCKCLASSID2: TStringField;
    cdsTimeSpaceSETTINGIDCOMBINED: TStringField;
    qTimeSpaceFeature: TSQLQuery;
    dsqTimeSpaceFeature: TDataSource;
    dspTimeSpaceFeature: TDataSetProvider;
    cdsTimeSpaceFeature: TClientDataSet;
    dsTimeSpaceFeature: TDataSource;
    qTimeSpaceDeposit: TSQLQuery;
    dsqTimeSpaceDeposit: TDataSource;
    dspTimeSpaceDeposit: TDataSetProvider;
    cdsTimeSpaceDeposit: TClientDataSet;
    dsTimeSpaceDeposit: TDataSource;
    cdsTimeSpaceFeatureCHARTID: TIntegerField;
    cdsTimeSpaceFeatureDOMAINORDER: TSmallintField;
    cdsTimeSpaceFeatureUNITID: TIntegerField;
    cdsTimeSpaceFeatureINC4CHTYN: TStringField;
    cdsTimeSpaceFeatureDOMAINID: TIntegerField;
    cdsTimeSpaceFeatureCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceFeatureDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceFeatureDOMAINXMIN: TIntegerField;
    cdsTimeSpaceFeatureDOMAINXMAX: TIntegerField;
    cdsTimeSpaceFeatureUNITOFFSET_MM: TIntegerField;
    cdsTimeSpaceFeatureMINAGE: TFloatField;
    cdsTimeSpaceFeatureMAXAGE: TFloatField;
    cdsTimeSpaceFeatureRANKWIDTH: TSmallintField;
    cdsTimeSpaceFeatureUNITNAME: TStringField;
    cdsTimeSpaceFeatureUNITRANK: TStringField;
    cdsTimeSpaceFeatureDOMAINNAME: TStringField;
    cdsTimeSpaceFeatureSPECIALFEATURE: TStringField;
    cdsTimeSpaceFeatureLEGENDORDER: TSmallintField;
    cdsTimeSpaceFeatureSPECIALFEATUREID: TIntegerField;
    cdsTimeSpaceDepositCHARTID: TIntegerField;
    cdsTimeSpaceDepositDOMAINORDER: TSmallintField;
    cdsTimeSpaceDepositSBDEPOSITID: TIntegerField;
    cdsTimeSpaceDepositDEPOSITNAME: TStringField;
    cdsTimeSpaceDepositDOMAINID: TIntegerField;
    cdsTimeSpaceDepositCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceDepositDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceDepositDOMAINXMIN: TIntegerField;
    cdsTimeSpaceDepositDOMAINXMAX: TIntegerField;
    cdsTimeSpaceDepositAPPROXAGE: TFloatField;
    cdsTimeSpaceDepositAPPROXAGEUNCERTAINTY: TFloatField;
    cdsTimeSpaceDepositDOMAINNAME: TStringField;
    cdsTimeSpaceDepositCOMMODITYID: TStringField;
    cdsTimeSpaceDepositCOMMODITY: TStringField;
    qTimeSpaceDomainHeadings: TSQLQuery;
    dsqTimeSpaceDomainHeadings: TDataSource;
    dspTimeSpaceDomainHeadings: TDataSetProvider;
    cdsTimeSpaceDomainHeadings: TClientDataSet;
    dsTimeSpaceDomainHeadings: TDataSource;
    cdsTimeSpaceDomainHeadingsCHARTID: TIntegerField;
    cdsTimeSpaceDomainHeadingsDOMAINORDER: TSmallintField;
    cdsTimeSpaceDomainHeadingsDOMAINID: TIntegerField;
    cdsTimeSpaceDomainHeadingsCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceDomainHeadingsDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceDomainHeadingsDOMAINXMIN: TIntegerField;
    cdsTimeSpaceDomainHeadingsDOMAINXMAX: TIntegerField;
    cdsTimeSpaceDomainHeadingsDOMAINNAME: TStringField;
    cdsTimeSpaceDomainHeadingsDOMAINTYPE: TStringField;
    cdsTimeSpaceDomainHeadingsMINPLOTAGE: TFloatField;
    cdsTimeSpaceDomainHeadingsMAXPLOTAGE: TFloatField;
    cdsTimeSpaceCONSTRAINTLEVELID: TSmallintField;
    cdsTimeSpaceAGECONSTRAINTLEVEL: TStringField;
    cdsTimeSpaceDepositHOSTUNITID: TIntegerField;
    cdsTimeSpaceDepositUNITNAME: TStringField;
    cdsTimeSpaceDepositHOSTMINAGE: TFloatField;
    cdsTimeSpaceDepositHOSTMAXAGE: TFloatField;
    cdsTimeSpaceDEPOSITIONENVIRONMENTID: TStringField;
    cdsTimeSpaceDEPOSITIONENVIRONMENT: TStringField;
    qTimeSpaceDomainColumns: TSQLQuery;
    dsqTimeSpaceDomainColumns: TDataSource;
    dspTimeSpaceDomainColumns: TDataSetProvider;
    cdsTimeSpaceDomainColumns: TClientDataSet;
    dsTimeSpaceDomainColumns: TDataSource;
    cdsTimeSpaceDomainColumnsCHARTID: TIntegerField;
    cdsTimeSpaceDomainColumnsDOMAINORDER: TSmallintField;
    cdsTimeSpaceDomainColumnsCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceDomainColumnsDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceDomainColumnsDOMAINXMIN: TIntegerField;
    cdsTimeSpaceDomainColumnsDOMAINXMAX: TIntegerField;
    cdsTimeSpaceDomainColumnsXMIN: TIntegerField;
    cdsTimeSpaceDomainColumnsXMAX: TIntegerField;
    cdsTimeSpaceDomainColumnsYMIN: TIntegerField;
    cdsTimeSpaceDomainColumnsYMAX: TIntegerField;
    cdsTimeSpaceDepositDEPOSITCLANID: TIntegerField;
    cdsTimeSpaceDepositDEPOSITCLAN: TStringField;
    qChartDomainsDOMAINHEADING: TStringField;
    cdsTimeSpaceDomainHeadingsDOMAINHEADING: TStringField;
    cdsChartDomainDOMAINHEADING: TStringField;
    cdsTimeSpaceROCKCLASSFUNDAMENTAL: TStringField;
    cdsChartDomainUnitsCONSTRAINTLEVELID: TSmallintField;
    cdsChartDomainUnitsAGECONSTRAINTLEVEL: TStringField;
    cdsChartDomainUnitsRANKWIDTH: TSmallintField;
    cdsChartDomainUnitsROCKCLASS: TStringField;
    cdsChartDomainUnitsROCKCLASSID2: TStringField;
    cdsChartDomainUnitsROCKCLASSFUNDAMENTAL: TStringField;
    cdsChartDomainUnitsSETTING: TStringField;
    cdsChartDomainUnitsSETTINGIDCOMBINED: TStringField;
    cdsChartDomainUnitsSETTINGID: TStringField;
    cdsChartDomainUnitsROCKCLASSID: TStringField;
    cdsChartDomainUnitsDEPOSITIONENVIRONMENTID: TStringField;
    cdsChartDomainUnitsDEPOSITIONENVIRONMENT: TStringField;
    qChartDomainDomains: TSQLQuery;
    dsqChartDomainDomains: TDataSource;
    dspChartDomainDomains: TDataSetProvider;
    cdsChartDomainDomains: TClientDataSet;
    dsChartDomainDomains: TDataSource;
    cdsChartDomainDomainsDOMAINORDER: TSmallintField;
    cdsChartDomainDomainsDOMAINID: TIntegerField;
    cdsChartDomainDomainsDOMAINNAME: TStringField;
    cdsChartDomainDomainsqChartDomainUnits: TDataSetField;
    sqlcStrat: TSQLConnection;
    qTimeSpaceLIP: TSQLQuery;
    dsqTimeSpaceLIP: TDataSource;
    dspTimeSpaceLIP: TDataSetProvider;
    cdsTimeSpaceLIP: TClientDataSet;
    dsTimeSpaceLIP: TDataSource;
    qTimeSpaceLIPCHARTID: TIntegerField;
    qTimeSpaceLIPDOMAINORDER: TSmallintField;
    qTimeSpaceLIPLIPID: TIntegerField;
    qTimeSpaceLIPINC4CHTYN: TStringField;
    qTimeSpaceLIPPOINTID: TSmallintField;
    qTimeSpaceLIPDOMAINID: TIntegerField;
    qTimeSpaceLIPCHARTOFFSET_MM: TIntegerField;
    qTimeSpaceLIPDOMAINOFFSET_MM: TIntegerField;
    qTimeSpaceLIPDOMAINXMIN: TIntegerField;
    qTimeSpaceLIPDOMAINXMAX: TIntegerField;
    qTimeSpaceLIPCONSTRAINTLEVELID: TSmallintField;
    qTimeSpaceLIPAGECONSTRAINTLEVEL: TStringField;
    qTimeSpaceLIPMINPLOTAGE: TFloatField;
    qTimeSpaceLIPMAXPLOTAGE: TFloatField;
    qTimeSpaceLIPLIPNAME: TStringField;
    qTimeSpaceLIPDOMAINNAME: TStringField;
    cdsTimeSpaceLIPCHARTID: TIntegerField;
    cdsTimeSpaceLIPDOMAINORDER: TSmallintField;
    cdsTimeSpaceLIPLIPID: TIntegerField;
    cdsTimeSpaceLIPINC4CHTYN: TStringField;
    cdsTimeSpaceLIPPOINTID: TSmallintField;
    cdsTimeSpaceLIPDOMAINID: TIntegerField;
    cdsTimeSpaceLIPCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceLIPDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceLIPDOMAINXMIN: TIntegerField;
    cdsTimeSpaceLIPDOMAINXMAX: TIntegerField;
    cdsTimeSpaceLIPCONSTRAINTLEVELID: TSmallintField;
    cdsTimeSpaceLIPAGECONSTRAINTLEVEL: TStringField;
    cdsTimeSpaceLIPMINPLOTAGE: TFloatField;
    cdsTimeSpaceLIPMAXPLOTAGE: TFloatField;
    cdsTimeSpaceLIPLIPNAME: TStringField;
    cdsTimeSpaceLIPDOMAINNAME: TStringField;
    cdsDomainsAllDOMAINCONTINENTID: TStringField;
    qTimeSpaceDomainBoxes: TSQLQuery;
    dsqTimeSpaceDomainBoxes: TDataSource;
    dspTimeSpaceDomainBoxes: TDataSetProvider;
    cdsTimeSpaceDomainBoxes: TClientDataSet;
    IntegerField4: TIntegerField;
    SmallintField1: TSmallintField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    dsTimeSpaceDomainBoxes: TDataSource;
    cdsTimeSpaceDomainBoxesMINPLOTAGE: TFloatField;
    cdsTimeSpaceDomainBoxesMAXPLOTAGE: TFloatField;
    cdsTimeSpaceDomainBoxesDOMAINNAME: TStringField;
    cdsChartsDEFAULTMINAGE: TFloatField;
    cdsChartsDEFAULTMAXAGE: TFloatField;
    qTimeSpaceLIPBARCODEAGE: TFloatField;
    cdsTimeSpaceLIPBARCODEAGE: TFloatField;
    qUserChartDomainLIP: TSQLQuery;
    cdsUserChartDomainLIP: TClientDataSet;
    dsUserChartDomainLIP: TDataSource;
    dsqUserChartDomainLIP: TDataSource;
    dspUserChartDomainLIP: TDataSetProvider;
    cdsUserChartDomainLIPDOMAINORDER: TSmallintField;
    cdsUserChartDomainLIPDOMAINID: TIntegerField;
    cdsUserChartDomainLIPLIPID: TIntegerField;
    cdsUserChartDomainLIPINC4CHTYN: TStringField;
    qUserChartDomain: TSQLQuery;
    dsqUserChartDomain: TDataSource;
    dspUserChartDomain: TDataSetProvider;
    cdsUserChartDomain: TClientDataSet;
    dsUserChartDomain: TDataSource;
    cdsUserChartDomainDOMAINORDER: TSmallintField;
    cdsUserChartDomainDOMAINID: TIntegerField;
    qTimeSpaceDomainCurves: TSQLQuery;
    dsqTimeSpaceDomainCurves: TDataSource;
    dspTimeSpaceDomainCurves: TDataSetProvider;
    cdsTimeSpaceDomainCurves: TClientDataSet;
    dsTimeSpaceDomainCurves: TDataSource;
    qDeleteUserDVCurves: TSQLQuery;
    qAddToPDF: TSQLQuery;
    cdsTimeSpaceDomainCurvesCHARTID: TIntegerField;
    cdsTimeSpaceDomainCurvesDOMAINORDER: TSmallintField;
    cdsTimeSpaceDomainCurvesDOMAINID: TIntegerField;
    cdsTimeSpaceDomainCurvesCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceDomainCurvesDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceDomainCurvesDOMAINXMIN: TIntegerField;
    cdsTimeSpaceDomainCurvesDOMAINXMAX: TIntegerField;
    cdsTimeSpaceDomainCurvesDOMAINNAME: TStringField;
    cdsTimeSpaceDomainCurvesCURVEORDER: TSmallintField;
    cdsTimeSpaceDomainCurvesPDFORDER: TIntegerField;
    cdsTimeSpaceDomainCurvesAGE: TFloatField;
    cdsTimeSpaceDomainCurvesPDFVALUE: TFloatField;
    cdsUserChartDomainMINPLOTAGE: TFloatField;
    cdsUserChartDomainMAXPLOTAGE: TFloatField;
    cdsTimeSpaceDomainHeadingsDEFAULTMINAGE: TFloatField;
    cdsTimeSpaceDomainHeadingsDEFAULTMAXAGE: TFloatField;
    qTimeSpaceLIPLIPHEADING: TStringField;
    cdsTimeSpaceLIPLIPHEADING: TStringField;
    qTimeSpaceLIPLIPPARENTID: TIntegerField;
    cdsTimeSpaceLIPLIPPARENTID: TIntegerField;
    qChartUsers: TSQLQuery;
    cdsChartUsers: TClientDataSet;
    dsChartUsers: TDataSource;
    qChartUsersCHARTID: TIntegerField;
    qChartUsersUSERID: TStringField;
    cdsChartUsersCHARTID: TIntegerField;
    cdsChartUsersUSERID: TStringField;
    qNewChartUser: TSQLQuery;
    qTimeSpaceLIPPLOTBARCODE: TStringField;
    cdsTimeSpaceLIPPLOTBARCODE: TStringField;
    qTimeSpaceLIPCOMPOSITIONID: TIntegerField;
    qTimeSpaceLIPDOMINANTCOMPOSITION: TStringField;
    cdsTimeSpaceLIPCOMPOSITIONID: TIntegerField;
    cdsTimeSpaceLIPDOMINANTCOMPOSITION: TStringField;
    qTimeSpaceLIPLIPSIZEID: TIntegerField;
    qTimeSpaceLIPLIPSIZEDESCRIPTION: TStringField;
    qTimeSpaceLIPLIPRATINGID: TStringField;
    qTimeSpaceLIPLIPRATINGDESCRIPTION: TStringField;
    cdsTimeSpaceLIPLIPSIZEID: TIntegerField;
    cdsTimeSpaceLIPLIPSIZEDESCRIPTION: TStringField;
    cdsTimeSpaceLIPLIPRATINGID: TStringField;
    cdsTimeSpaceLIPLIPRATINGDESCRIPTION: TStringField;
    qChartCHARTID: TIntegerField;
    qChartCHART: TStringField;
    qChartCHARTOFFSET_MM: TIntegerField;
    qChartDEFAULTDOMAINOFFSET: TIntegerField;
    qChartXMIN: TIntegerField;
    qChartYMIN: TIntegerField;
    qChartXMAX: TIntegerField;
    qChartYMAX: TIntegerField;
    qChartDEFAULTMINAGE: TFloatField;
    qChartDEFAULTMAXAGE: TFloatField;
    qChartDESCRIPTION: TMemoField;
    qChartOWNERID: TStringField;
    cdsChartCHARTID: TIntegerField;
    cdsChartCHART: TStringField;
    cdsChartOWNERID: TStringField;
    cdsChartCHARTOFFSET_MM: TIntegerField;
    cdsChartDEFAULTDOMAINOFFSET: TIntegerField;
    cdsChartXMIN: TIntegerField;
    cdsChartYMIN: TIntegerField;
    cdsChartXMAX: TIntegerField;
    cdsChartYMAX: TIntegerField;
    cdsChartDEFAULTMINAGE: TFloatField;
    cdsChartDEFAULTMAXAGE: TFloatField;
    cdsChartDESCRIPTION: TMemoField;
    cdsChartqChartUsers: TDataSetField;
    cdsChartqChartDomains: TDataSetField;
    cdsChartsOWNERID: TStringField;
    qDomainsDOMAINID: TIntegerField;
    qDomainsCONTINENTID: TStringField;
    qDomainsDOMAINNAME: TStringField;
    qDomainsSPOTLATITUDE: TFloatField;
    qDomainsSPOTLONGITUDE: TFloatField;
    qDomainsDOMAINPARENTID: TIntegerField;
    qDomainsDOMAINTYPEID: TStringField;
    qDomainsMINPLOTAGE: TFloatField;
    qDomainsMAXPLOTAGE: TFloatField;
    qDeleteDomain: TSQLQuery;
    qInsertDomain: TSQLQuery;
    qNewDomainName: TSQLQuery;
    dspNewDomainName: TDataSetProvider;
    cdsNewDomainName: TClientDataSet;
    dsNewDomainName: TDataSource;
    cdsNewDomainNameDOMAINID: TIntegerField;
    cdsNewDomainNameCONTINENTID: TStringField;
    cdsNewDomainNameDOMAINNAME: TStringField;
    qChartsList: TSQLQuery;
    dspChartsList: TDataSetProvider;
    cdsChartsList: TClientDataSet;
    dsChartsList: TDataSource;
    cdsChartsListCHARTID: TIntegerField;
    cdsChartsListCHART: TStringField;
    cdsChartsListCHARTOFFSET_MM: TIntegerField;
    cdsChartsListDEFAULTDOMAINOFFSET: TIntegerField;
    cdsChartsListOWNERID: TStringField;
    cdsChartsListXMIN: TIntegerField;
    cdsChartsListXMAX: TIntegerField;
    cdsChartsListYMIN: TIntegerField;
    cdsChartsListYMAX: TIntegerField;
    cdsChartsListDEFAULTMINAGE: TFloatField;
    cdsChartsListDEFAULTMAXAGE: TFloatField;
    qChartsCHARTID: TIntegerField;
    qChartsCHART: TStringField;
    qChartsCHARTOFFSET_MM: TIntegerField;
    qChartsDEFAULTDOMAINOFFSET: TIntegerField;
    qChartsOWNERID: TStringField;
    qChartsXMIN: TIntegerField;
    qChartsXMAX: TIntegerField;
    qChartsYMIN: TIntegerField;
    qChartsYMAX: TIntegerField;
    qChartsDEFAULTMINAGE: TFloatField;
    qChartsDEFAULTMAXAGE: TFloatField;
    qChartsUSERID: TStringField;
    qUserChartDomainUnit: TSQLQuery;
    dsqUserChartDomainUnit: TDataSource;
    dspUserChartDomainUnit: TDataSetProvider;
    cdsUserChartDomainUnit: TClientDataSet;
    cdsUserChartDomainUnitDOMAINORDER: TSmallintField;
    cdsUserChartDomainUnitDOMAINID: TIntegerField;
    cdsUserChartDomainUnitUNITID: TIntegerField;
    cdsUserChartDomainUnitINC4CHTYN: TStringField;
    dsUserChartDomainUnit: TDataSource;
    qAAA: TSQLQuery;
    cdsTimeSpaceAGEYEARS: TFloatField;
    cdsDomainUnitsAGEYEARS: TFloatField;
    cdsTimeSpaceDomainColumnsDEFAULTMINAGE: TFloatField;
    cdsTimeSpaceDomainColumnsDEFAULTMAXAGE: TFloatField;
    cdsChartDomainUnitsAGEYEARS: TFloatField;
    qChartDomainDomainsLIP: TSQLQuery;
    dsqChartDomainDomainsLIP: TDataSource;
    dspChartDomainDomainsLIP: TDataSetProvider;
    cdsChartDomainDomainsLIP: TClientDataSet;
    dsChartDomainDomainsLIP: TDataSource;
    cdsChartDomainDomainsLIPDOMAINORDER: TSmallintField;
    cdsChartDomainDomainsLIPDOMAINID: TIntegerField;
    cdsChartDomainDomainsLIPDOMAINNAME: TStringField;
    qChartDomainLIPs: TSQLQuery;
    cdsChartDomainLIPs: TClientDataSet;
    dsChartDomainLIPs: TDataSource;
    cdsChartDomainDomainsLIPqChartDomainLIPs: TDataSetField;
    cdsChartDomainLIPsDOMAINORDER: TSmallintField;
    cdsChartDomainLIPsDOMAINID: TIntegerField;
    cdsChartDomainLIPsLIPID: TIntegerField;
    cdsChartDomainLIPsINC4CHTYN: TStringField;
    cdsChartDomainLIPsDOMAINNAME: TStringField;
    cdsChartDomainLIPsCONTINENTID: TStringField;
    cdsChartDomainLIPsLIPNAME: TStringField;
    cdsChartDomainLIPsLIPHEADING: TStringField;
    cdsChartDomainLIPsLIPPARENTID: TIntegerField;
    cdsChartDomainLIPsCONTOCEANID: TStringField;
    cdsChartDomainLIPsLIPSIZEID: TIntegerField;
    cdsChartDomainLIPsMINPLOTAGE: TFloatField;
    cdsChartDomainLIPsMAXPLOTAGE: TFloatField;
    cdsChartDomainLIPsBARCODEAGE: TFloatField;
    cdsChartDomainLIPsLIPSIZEDESCRIPTION: TStringField;
    cdsChartDomainLIPsPLOTBARCODE: TStringField;
    cdsChartDomainLIPsCONSTRAINTLEVELID: TSmallintField;
    cdsChartDomainLIPsAGECONSTRAINTLEVEL: TStringField;
    cdsChartDomainLIPsLIPRATINGID: TStringField;
    cdsChartDomainLIPsAREALEXTENT: TFloatField;
    cdsChartDomainLIPsVOLUMEESTIMATE: TFloatField;
    cdsChartDomainLIPsLIPRATINGDESCRIPTION: TStringField;
    cdsChartDomainLIPsCOMPOSITIONID: TIntegerField;
    cdsChartDomainLIPsDOMINANTCOMPOSITION: TStringField;
    qChartDomainDomainsLIPUnits: TSQLQuery;
    qChartDomainLIPsUnits: TSQLQuery;
    qChartLIPUnits: TSQLQuery;
    dsqChartDomainDomainsLIPUnits: TDataSource;
    dsqChartDomainLIPsUnits: TDataSource;
    dspChartDomainDomainsLIPUnits: TDataSetProvider;
    cdsChartDomainDomainsLIPUnits: TClientDataSet;
    cdsChartDomainLIPsUnits: TClientDataSet;
    cdsChartLIPUnits: TClientDataSet;
    dsChartDomainDomainsLIPUnits: TDataSource;
    dsChartDomainLIPsUnits: TDataSource;
    dsChartLIPUnits: TDataSource;
    cdsChartDomainDomainsLIPUnitsDOMAINORDER: TSmallintField;
    cdsChartDomainDomainsLIPUnitsDOMAINID: TIntegerField;
    cdsChartDomainDomainsLIPUnitsDOMAINNAME: TStringField;
    cdsChartDomainDomainsLIPUnitsqChartDomainLIPsUnits: TDataSetField;
    cdsChartDomainLIPsUnitsDOMAINORDER: TSmallintField;
    cdsChartDomainLIPsUnitsDOMAINID: TIntegerField;
    cdsChartDomainLIPsUnitsLIPID: TIntegerField;
    cdsChartDomainLIPsUnitsINC4CHTYN: TStringField;
    cdsChartDomainLIPsUnitsDOMAINNAME: TStringField;
    cdsChartDomainLIPsUnitsCONTINENTID: TStringField;
    cdsChartDomainLIPsUnitsLIPNAME: TStringField;
    cdsChartDomainLIPsUnitsLIPHEADING: TStringField;
    cdsChartDomainLIPsUnitsLIPPARENTID: TIntegerField;
    cdsChartDomainLIPsUnitsCONTOCEANID: TStringField;
    cdsChartDomainLIPsUnitsLIPSIZEID: TIntegerField;
    cdsChartDomainLIPsUnitsMINPLOTAGE: TFloatField;
    cdsChartDomainLIPsUnitsMAXPLOTAGE: TFloatField;
    cdsChartDomainLIPsUnitsBARCODEAGE: TFloatField;
    cdsChartDomainLIPsUnitsLIPSIZEDESCRIPTION: TStringField;
    cdsChartDomainLIPsUnitsPLOTBARCODE: TStringField;
    cdsChartDomainLIPsUnitsCONSTRAINTLEVELID: TSmallintField;
    cdsChartDomainLIPsUnitsAGECONSTRAINTLEVEL: TStringField;
    cdsChartDomainLIPsUnitsLIPRATINGID: TStringField;
    cdsChartDomainLIPsUnitsAREALEXTENT: TFloatField;
    cdsChartDomainLIPsUnitsVOLUMEESTIMATE: TFloatField;
    cdsChartDomainLIPsUnitsLIPRATINGDESCRIPTION: TStringField;
    cdsChartDomainLIPsUnitsCOMPOSITIONID: TIntegerField;
    cdsChartDomainLIPsUnitsDOMINANTCOMPOSITION: TStringField;
    cdsChartDomainLIPsUnitsqChartLIPUnits: TDataSetField;
    cdsChartLIPUnitsDOMAINORDER: TSmallintField;
    cdsChartLIPUnitsDOMAINID: TIntegerField;
    cdsChartLIPUnitsUNITID: TIntegerField;
    cdsChartLIPUnitsINC4CHTYN: TStringField;
    cdsChartLIPUnitsLIPID: TIntegerField;
    cdsChartLIPUnitsCOUNTRYID: TStringField;
    cdsChartLIPUnitsUNITNAME: TStringField;
    cdsChartLIPUnitsRANKID: TStringField;
    cdsChartLIPUnitsAGEYEARS: TFloatField;
    cdsChartLIPUnitsMINAGE: TFloatField;
    cdsChartLIPUnitsMAXAGE: TFloatField;
    cdsChartLIPUnitsUNITRANK: TStringField;
    cdsChartLIPUnitsCONSTRAINTLEVELID: TSmallintField;
    cdsChartLIPUnitsAGECONSTRAINTLEVEL: TStringField;
    cdsChartDomainDomainsLIPUnitsCHARTID: TIntegerField;
    cdsChartDomainLIPsUnitsCHARTID: TIntegerField;
    cdsChartLIPUnitsCHARTID: TIntegerField;
    qChartMapUnits: TSQLQuery;
    dspChartMapUnits: TDataSetProvider;
    cdsChartMapUnits: TClientDataSet;
    dsChartMapUnits: TDataSource;
    cdsChartMapUnitsCHARTID: TIntegerField;
    cdsChartMapUnitsUNITID: TIntegerField;
    cdsChartMapUnitsMAPID2: TStringField;
    cdsChartMapUnitsGISINT: TIntegerField;
    cdsChartMapUnitsGISSTR: TStringField;
    cdsChartMapUnitsINCL4MAP: TStringField;
    cdsChartMapUnitsMAPNAME: TStringField;
    cdsChartMapUnitsCOUNTRYID: TStringField;
    cdsChartMapUnitsUNITNAME: TStringField;
    cdsChartMapUnitsRANKID: TStringField;
    cdsChartMapUnitsAGEYEARS: TFloatField;
    cdsChartMapUnitsMINAGE: TFloatField;
    cdsChartMapUnitsMAXAGE: TFloatField;
    cdsChartMapUnitsUNITRANK: TStringField;
    cdsChartMapUnitsCONSTRAINTLEVELID: TSmallintField;
    cdsChartMapUnitsAGECONSTRAINTLEVEL: TStringField;
    cdsChartMapUnitsRANKWIDTH: TSmallintField;
    cdsChartMapUnitsROCKCLASS: TStringField;
    cdsChartMapUnitsROCKCLASSID2: TStringField;
    cdsChartMapUnitsROCKCLASSFUNDAMENTAL: TStringField;
    cdsChartMapUnitsSETTING: TStringField;
    cdsChartMapUnitsSETTINGIDCOMBINED: TStringField;
    cdsChartMapUnitsSETTINGID: TStringField;
    cdsChartMapUnitsROCKCLASSID: TStringField;
    cdsChartMapUnitsDEPOSITIONENVIRONMENTID: TStringField;
    cdsChartMapUnitsDEPOSITIONENVIRONMENT: TStringField;
    cdsChartMapUnitsPARENTID: TIntegerField;
    qUnconformities: TSQLQuery;
    dspUnconformities: TDataSetProvider;
    cdsUnconformities: TClientDataSet;
    dsUnconformities: TDataSource;
    cdsUnconformitiesCHARTID: TIntegerField;
    cdsUnconformitiesDOMAINORDER: TSmallintField;
    cdsUnconformitiesUNITID: TIntegerField;
    cdsUnconformitiesINC4CHTYN: TStringField;
    cdsUnconformitiesDOMAINID: TIntegerField;
    cdsUnconformitiesCHARTOFFSET_MM: TIntegerField;
    cdsUnconformitiesDOMAINOFFSET_MM: TIntegerField;
    cdsUnconformitiesDOMAINXMIN: TIntegerField;
    cdsUnconformitiesDOMAINXMAX: TIntegerField;
    cdsUnconformitiesUNITOFFSET_MM: TIntegerField;
    cdsUnconformitiesDOMAINNAME: TStringField;
    cdsUnconformitiesCOUNTRYID: TStringField;
    cdsUnconformitiesUNITNAME: TStringField;
    cdsUnconformitiesRANKID: TStringField;
    cdsUnconformitiesAGEYEARS: TFloatField;
    cdsUnconformitiesMAXAGE: TFloatField;
    cdsUnconformitiesUNITRANK: TStringField;
    cdsUnconformitiesCONSTRAINTLEVELID: TSmallintField;
    cdsUnconformitiesAGECONSTRAINTLEVEL: TStringField;
    cdsUnconformitiesRANKWIDTH: TSmallintField;
    cdsUnconformitiesPREREL: TStringField;
    cdsUnconformitiesPRECEDEDBY: TIntegerField;
    cdsUnconformitiesRELATIONSHIP: TStringField;
    qChartMapLIPs: TSQLQuery;
    dspChartMapLIPs: TDataSetProvider;
    cdsChartMapLIPs: TClientDataSet;
    dsChartMapLIPs: TDataSource;
    cdsChartMapLIPsCHARTID: TIntegerField;
    cdsChartMapLIPsLIPID: TIntegerField;
    cdsChartMapLIPsLIPNAME: TStringField;
    cdsChartMapLIPsMAPID2: TStringField;
    cdsChartMapLIPsGISINT: TIntegerField;
    cdsChartMapLIPsGISSTR: TStringField;
    cdsChartMapLIPsINCL4MAP: TStringField;
    cdsChartMapLIPsMAPNAME: TStringField;
    cdsChartMapLIPsCONSTRAINTLEVELID: TSmallintField;
    cdsChartMapLIPsAGECONSTRAINTLEVEL: TStringField;
    cdsChartMapLIPsMINPLOTAGE: TFloatField;
    cdsChartMapLIPsMAXPLOTAGE: TFloatField;
    cdsChartMapLIPsBARCODEAGE: TFloatField;
    cdsChartMapLIPsPLOTBARCODE: TStringField;
    cdsChartMapLIPsLIPHEADING: TStringField;
    cdsChartMapLIPsLIPPARENTID: TIntegerField;
    cdsChartMapLIPsLIPSIZEID: TIntegerField;
    cdsChartMapLIPsLIPSIZEDESCRIPTION: TStringField;
    cdsChartMapLIPsLIPRATINGID: TStringField;
    cdsChartMapLIPsLIPRATINGDESCRIPTION: TStringField;
    cdsChartMapLIPsCOMPOSITIONID: TIntegerField;
    cdsChartMapLIPsDOMINANTCOMPOSITION: TStringField;
    cdsChartMapLIPsCONTINENTID: TStringField;
    SQLMonitor1: TSQLMonitor;
    FDMemTableAgeLines: TFDMemTable;
    FDMemTableAgeLinesiLine: TIntegerField;
    FDMemTableAgeLinesi: TIntegerField;
    FDMemTableAgeLinesiX: TIntegerField;
    FDMemTableAgeLinesiY: TIntegerField;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    function GetCurrent_Date: variant;
    function GetCurrentDate: variant;
  public
  published
    property Current_Date: variant read GetCurrent_Date;
    property CurrentDate: variant read GetCurrentDate;
    procedure AddChartDomain(NewContinentID : string;
                             var WasSuccessful : boolean);
    procedure AddChartUser(ChartID : integer; UserID : string;
                             var WasSuccessful : boolean);
    procedure AddPdfToDV(tmpUserID,tmpDomainOrder,tmpCurveOrder,tmpPdfOrder,tmpAge,tmpPDFValue,tmpDomainID : string);
    procedure AddDomain(NewContinentID : string;
                        var WasSuccessful : boolean);
  end;

// Procs
  function dmStratC: TdmStratC;

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

function dmStratC: TdmStratC;
begin
  Result := TUserSession(WebApplication.Data).dmStratC;
end;


procedure TdmStratC.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

function TdmStratC.GetCurrent_Date: variant;
begin
  Result:=dmUser.GetUTCDateTime;
end;

function TdmStratC.GetCurrentDate: variant;
begin
  Result:= double(dmUser.GetUTCDateTime); //Dates should be passed as numbers, and the corresponding cell in excel have Date format.
end;

procedure TdmStratC.AddChartDomain(NewContinentID : string;
                                    var WasSuccessful : boolean);
var
  tmpCount : integer;
  tmpOffset : integer;
  tmpDomainID : integer;
  tmpXMin, tmpXMax : integer;
  tmpDomainHeading : string;
  TD: TDBXTransaction;
begin
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('AddChartDomain '+NewContinentID);
  end;
  tmpCount := dmStratC.cdsChartDomain.RecordCount;
  dmStratC.cdsChartDomain.Last;
  tmpCount := dmStratC.cdsChartDomainDOMAINORDER.AsInteger;
  tmpXMin := dmStratC.cdsChartDomainDOMAINXMAX.AsInteger;
  tmpOffset := dmStratC.cdsChartDEFAULTDOMAINOFFSET.AsInteger;
  tmpXMax := tmpXMin + tmpOffset;
  dmStratC.cdsContinents.Open;
  dmStratC.cdsContinents.Locate('CONTINENTID',NewContinentID,[]);
  tmpDomainID := dmStratC.cdsContinentsDEFAULTDOMAINID.AsInteger;
  tmpDomainHeading := 'Not defined';
  dmStratC.cdsContinents.Close;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('AddChartDomain '+IntToStr(tmpDomainID));
  end;
  WasSuccessful := true;
  try
    dmStratC.qNewChartDomain.Close;
    dmStratC.qNewChartDomain.ParamByName('CHARTID').AsString := UserSession.ChartValue;
    dmStratC.qNewChartDomain.ParamByName('DOMAINORDER').AsInteger := tmpCount + 1;
    dmStratC.qNewChartDomain.ParamByName('OFFSET_MM').AsInteger := tmpOffset;
    dmStratC.qNewChartDomain.ParamByName('DOMAINID').AsInteger := tmpDomainID;
    dmStratC.qNewChartDomain.ParamByName('DOMAINXMIN').AsInteger := tmpXMin;
    dmStratC.qNewChartDomain.ParamByName('DOMAINXMAX').AsInteger := tmpXMax;
    dmStratC.qNewChartDomain.ParamByName('DOMAINHEADING').AsString := tmpDomainHeading;

    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmStratC.qNewChartDomain.SQL.Text);
    end;


    //if not dmStratC.sqlcStrat.InTransaction then
    //begin
      TD := dmStratC.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratC.qNewChartDomain.ExecSQL(false);
        dmStratC.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratC.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
    if WasSuccessful then
    begin
      UserSession.ParameterChosen := IntToStr(tmpDomainID);
    end else
    begin
      UserSession.ParameterChosen := IntToStr(0);
    end;
  except
  end;
end;

procedure TdmStratC.AddChartUser(ChartID : integer; UserID : string;
                             var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  try
    dmStratC.qNewChartUser.Close;
    dmStratC.qNewChartUser.ParamByName('CHARTID').AsInteger := ChartID;
    dmStratC.qNewChartUser.ParamByName('USERID').AsString := UserID;

    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmStratC.qNewChartUser.SQL.Text);
    end;


    //if not dmStratC.sqlcStrat.InTransaction then
    //begin
      TD := dmStratC.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratC.qNewChartUser.ExecSQL(false);
        dmStratC.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratC.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
    if WasSuccessful then
    begin
      UserSession.ParameterChosen := UserID;
    end else
    begin
      UserSession.ParameterChosen := IntToStr(0);
    end;
  except
  end;
end;

procedure TdmStratC.AddPdfToDV(tmpUserID,tmpDomainOrder,tmpCurveOrder,tmpPdfOrder,tmpAge,tmpPDFValue,tmpDomainID : string);
var
  TD: TDBXTransaction;
begin
  {insert the PDFvalue}
  UserSession.WhereAmI := 'AddPdfCurve start';
  try
    dmStratC.qAddToPDF.Close;
    dmStratC.qAddToPDF.SQL.Clear;
    dmStratC.qAddToPDF.SQL.Add('Insert into USERDVPDF');
    dmStratC.qAddToPDF.SQL.Add('(USERID, DOMAINORDER, CURVEORDER, PDFORDER, AGE, PDFVALUE, DOMAINID)');
    dmStratC.qAddToPDF.SQL.Add('VALUES ('+''''+tmpUserID+''''+', '+''''+tmpDomainOrder+''''+', '+''''+tmpCurveOrder+''''+', '+''''+tmpPdfOrder+''''+', '+''''+tmpAge+''''+', ');
    dmStratC.qAddToPDF.SQL.Add(' '+''''+tmpPdfValue+''''+', '+''''+tmpDomainID+''''+')');

    //if not dmStratC.sqlcStrat.InTransaction then
    //begin
      TD := dmStratC.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratC.qAddToPDF.ExecSQL(false);
        dmStratC.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratC.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
      end;
    //end;
  except
    //WebApplication.ShowMessage('Unable to append PDF value to DV table '+UserSession.WhereAmI);
  end;
  //if WasSuccessful then WebApplication.ShowMessage('PDF information successfully transferred to DateView');
end;

procedure TdmStratC.AddDomain(NewContinentID : string;
                              var WasSuccessful : boolean);
var
  tmpDomainID : integer;
  tmpDomainName : string;
  TD: TDBXTransaction;
begin
  tmpDomainName := 'NEW'+UserSession.UserID;
  WasSuccessful := true;
  try
    dmStratC.qDeleteDomain.Close;
    dmStratC.qDeleteDomain.SQL.Clear;
    dmStratC.qDeleteDomain.SQL.Add('DELETE FROM DOMAINS');
    dmStratC.qDeleteDomain.SQL.Add('WHERE DOMAINS.DOMAINNAME = '+''''+tmpDomainName+'''');
    //if not dmStratC.sqlcStrat.InTransaction then
    //begin
      TD := dmStratC.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratC.qDeleteDomain.ExecSQL(false);
        dmStratC.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratC.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
    dmStratC.qInsertDomain.Close;
    dmStratC.qInsertDomain.SQL.Clear;
    dmStratC.qInsertDomain.SQL.Add('INSERT INTO DOMAINS');
    dmStratC.qInsertDomain.SQL.Add('(ContinentID, DomainName, DomainParentID, DomainTypeID)');
    dmStratC.qInsertDomain.SQL.Add('Values ('+''''+NewContinentID+''''+','+''''+tmpDomainName+''''+','+'0,'+''''+'nd'+''''+')');
    //if not dmStratC.sqlcStrat.InTransaction then
    //begin
      TD := dmStratC.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmStratC.qInsertDomain.ExecSQL(false);
        dmStratC.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmStratC.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
        WasSuccessful := false;
      end;
    //end;
    tmpDomainID := 0;
    if WasSuccessful then
    begin
      dmStratC.qNewDomainName.Close;
      dmStratC.qNewDomainName.ParamByName('NewDomainName').AsString := tmpDomainName;
      dmStratC.cdsNewDomainName.Close;
      dmStratC.cdsNewDomainName.Open;
      tmpDomainID := dmStratC.cdsNewDomainNameDOMAINID.AsInteger;
    end else
    begin
      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData('Insert new domain was not successful for '+tmpDomainName);
      end;
    end;
    if WasSuccessful then
    begin
      dmStratC.qInsertDomain.Close;
      dmStratC.qInsertDomain.SQL.Clear;
      dmStratC.qInsertDomain.SQL.Add('INSERT INTO DOMAINFOR');
      dmStratC.qInsertDomain.SQL.Add('(DOMAINID, WHOFORID)');
      dmStratC.qInsertDomain.SQL.Add('Values ('+IntToStr(tmpDomainID)+','+''''+'PUBL'+''''+')');
      //if not dmStratC.sqlcStrat.InTransaction then
      //begin
        TD := dmStratC.sqlcStrat.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmStratC.qInsertDomain.ExecSQL(false);
          //update NeedsChange value so that replication occurs properly
          try
            //first do so for new record in Domains
            dmStratC.qInsertDomain.Close;
            dmStratC.qInsertDomain.SQL.Clear;
            dmStratC.qInsertDomain.SQL.Add('UPDATE DOMAINS');
            dmStratC.qInsertDomain.SQL.Add('SET DOMAINS.NEEDSCHANGE = '+QuotedStr('N'));
            dmStratC.qInsertDomain.SQL.Add('WHERE DOMAINS.DOMAINID = :DomainID');
            dmStratC.qInsertDomain.ParamByName('DomainID').AsString := tmpDomainName;
            dmStratC.qInsertDomain.ExecSQL(false);
            //then do so for all new DomainFor records for this new Domain
            dmStratC.qInsertDomain.Close;
            dmStratC.qInsertDomain.SQL.Clear;
            dmStratC.qInsertDomain.SQL.Add('UPDATE DOMAINFOR');
            dmStratC.qInsertDomain.SQL.Add('SET DOMAINFOR.NEEDSCHANGE = '+QuotedStr('N'));
            dmStratC.qInsertDomain.SQL.Add('WHERE DOMAINFOR.DOMAINID = :DomainID');
            dmStratC.qInsertDomain.ParamByName('DomainID').AsString := tmpDomainName;
            dmStratC.qInsertDomain.ExecSQL(false);
          except
          end;
          dmStratC.sqlcStrat.CommitFreeAndNil(TD); {on success, commit the changes};
        except
          dmStratC.sqlcStrat.RollbackFreeAndNil(TD); {on failure, undo the changes};
          WasSuccessful := false;
        end;
      //end;
    end;
  except
  end;
end;


end.
