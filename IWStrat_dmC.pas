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
    qRefDetailSOURCEID: TWideStringField;
    qRefDetailSOURCEDES: TBlobField;
    dspRefDetail: TDataSetProvider;
    cdsRefDetail: TClientDataSet;
    cdsRefDetailSOURCEID: TWideStringField;
    cdsRefDetailSOURCEDES: TBlobField;
    dspRefFull: TDataSetProvider;
    cdsRefFull: TClientDataSet;
    cdsRefFullSOURCEID: TWideStringField;
    cdsRefFullSOURCEDES: TBlobField;
    dsCharts: TDataSource;
    dsRefFull: TDataSource;
    dsRefDetail: TDataSource;
    qYesNo: TSQLQuery;
    dspYesNo: TDataSetProvider;
    cdsYesNo: TClientDataSet;
    dsYesNo: TDataSource;
    qYesNoYESNOID: TWideStringField;
    qYesNoYESNO: TWideStringField;
    cdsYesNoYESNOID: TWideStringField;
    cdsYesNoYESNO: TWideStringField;
    cdsRefFullCONTINENTID: TWideStringField;
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
    cdsValidFullVALIDSTATUSID: TWideStringField;
    cdsValidFullDATEDONE: TSQLTimeStampField;
    cdsValidFullDONEBY: TWideStringField;
    cdsValidFullCOMMENTS: TBlobField;
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
    cdsChartDomainDOMAINNAME: TWideStringField;
    cdsChartDomainCONTINENTID: TWideStringField;
    cdsChartsCHARTID: TIntegerField;
    cdsChartsCHART: TWideStringField;
    cdsChartsCHARTOFFSET_MM: TIntegerField;
    cdsChartsDEFAULTDOMAINOFFSET: TIntegerField;
    cdsChartsUSERID: TWideStringField;
    qDomains: TSQLQuery;
    dspDomains: TDataSetProvider;
    cdsDomains: TClientDataSet;
    dsDomains: TDataSource;
    cdsDomainsDOMAINID: TIntegerField;
    cdsDomainsCONTINENTID: TWideStringField;
    cdsDomainsDOMAINNAME: TWideStringField;
    cdsDomainsSPOTLATITUDE: TFloatField;
    cdsDomainsSPOTLONGITUDE: TFloatField;
    cdsChartDomainDOMAINORDER: TSmallintField;
    qNewChartDomain: TSQLQuery;
    qOrogenies: TSQLQuery;
    dspOrogenies: TDataSetProvider;
    cdsOrogenies: TClientDataSet;
    dsOrogenies: TDataSource;
    cdsOrogeniesOROGENYID: TIntegerField;
    cdsOrogeniesOROGENY: TWideStringField;
    cdsOrogeniesCONTINENTID: TWideStringField;
    qDomain: TSQLQuery;
    dspDomain: TDataSetProvider;
    cdsDomain: TClientDataSet;
    dsDomain: TDataSource;
    dsqDomain: TDataSource;
    cdsDomainDOMAINID: TIntegerField;
    cdsDomainDOMAINNAME: TWideStringField;
    cdsDomainCONTINENTID: TWideStringField;
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
    cdsMetamorphicGradeGRADEID: TWideStringField;
    cdsMetamorphicGradeGRADE: TWideStringField;
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
    cdsTimeSpaceUNITNAME: TWideStringField;
    cdsTimeSpaceUNITRANK: TWideStringField;
    cdsTimeSpaceDOMAINNAME: TWideStringField;
    cdsTimeSpaceROCKCLASS: TWideStringField;
    cdsTimeSpaceSETTING: TWideStringField;
    qDomainTypes: TSQLQuery;
    dspDomainTypes: TDataSetProvider;
    cdsDomainTypes: TClientDataSet;
    dsDomainTypes: TDataSource;
    cdsDomainTypesDOMAINTYPEID: TWideStringField;
    cdsDomainTypesDOMAINTYPE: TWideStringField;
    cdsDomainsDOMAINPARENTID: TIntegerField;
    cdsDomainsDOMAINTYPEID: TWideStringField;
    qOrogeniesCont: TSQLQuery;
    dspOrogeniesCont: TDataSetProvider;
    cdsOrogeniesCont: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TWideStringField;
    StringField2: TWideStringField;
    dsOrogeniesCont: TDataSource;
    qChartDomainsCHARTID: TIntegerField;
    qChartDomainsDOMAINORDER: TSmallintField;
    qChartDomainsOFFSET_MM: TIntegerField;
    qChartDomainsDOMAINID: TIntegerField;
    qChartDomainsDOMAINNAME: TWideStringField;
    qChartDomainsCONTINENTID: TWideStringField;
    cdsDomainTypesDVLEVEL: TIntegerField;
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
    cdsTimeSpaceDeformationDOMAINNAME: TWideStringField;
    cdsTimeSpaceDeformationDOMAINTYPE: TWideStringField;
    cdsTimeSpaceDeformationOROGENY: TWideStringField;
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
    cdsTimeSpaceSETTINGID: TWideStringField;
    cdsTimeSpaceROCKCLASSID: TWideStringField;
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
    cdsTimeSpaceINC4CHTYN: TWideStringField;
    cdsTimeSpaceDeformationDOMAINXMIN: TIntegerField;
    cdsTimeSpaceDeformationDOMAINXMAX: TIntegerField;
    cdsTimeSpaceDeformationCONSTRAINTLEVELID: TSmallintField;
    cdsTimeSpaceDeformationAGECONSTRAINTLEVEL: TWideStringField;
    cdsTimeSpaceDeformationDUCTILITYTYPEID: TWideStringField;
    cdsTimeSpaceDeformationDUCTILITYTYPE: TWideStringField;
    cdsTimeSpaceDeformationDEFORMATIONTYPEID: TIntegerField;
    cdsTimeSpaceDeformationDEFORMATIONTYPE: TWideStringField;
    cdsTimeSpaceDeformationVERGENCEANGLE: TIntegerField;
    cdsTimeSpaceDeformationDIRECTIONNAME: TWideStringField;
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
    cdsTimeSpaceMetamorphismDOMAINNAME: TWideStringField;
    cdsTimeSpaceMetamorphismOROGENY: TWideStringField;
    cdsTimeSpaceMetamorphismGRADEID: TWideStringField;
    cdsTimeSpaceMetamorphismGRADE: TWideStringField;
    cdsTimeSpaceMetamorphismCONSTRAINTLEVELID: TSmallintField;
    cdsTimeSpaceMetamorphismAGECONSTRAINTLEVEL: TWideStringField;
    cdsTimeSpaceMetamorphismPEAKTMIN: TFloatField;
    cdsTimeSpaceMetamorphismPEAKTMAX: TFloatField;
    cdsTimeSpaceMetamorphismPEAKPMIN: TFloatField;
    cdsTimeSpaceMetamorphismPEAKPMAX: TFloatField;
    cdsTimeSpaceMetamorphismDOMAINTYPE: TWideStringField;
    qMapUnitsGIS: TSQLQuery;
    dsqMapUnitsGIS: TDataSource;
    dspMapUnitsGIS: TDataSetProvider;
    cdsMapUnitsGIS: TClientDataSet;
    dsMapUnitsGIS: TDataSource;
    cdsMapUnitsGISMAPID2: TWideStringField;
    cdsMapUnitsGISMAPNAME: TWideStringField;
    cdsMapUnitsGISUNITID: TIntegerField;
    cdsMapUnitsGISGISINT: TIntegerField;
    cdsMapUnitsGISGISSTR: TWideStringField;
    qDomainUnits: TSQLQuery;
    dsqDomainUnits: TDataSource;
    dspDomainUnits: TDataSetProvider;
    cdsDomainUnits: TClientDataSet;
    dsDomainUnits: TDataSource;
    cdsDomainUnitsDOMAINID: TIntegerField;
    cdsDomainUnitsUNITID: TIntegerField;
    cdsDomainUnitsINC4CHTYN: TWideStringField;
    cdsDomainUnitsDOMAINNAME: TWideStringField;
    cdsDomainUnitsCOUNTRYID: TWideStringField;
    cdsDomainUnitsUNITNAME: TWideStringField;
    cdsDomainUnitsRANKID: TWideStringField;
    cdsDomainUnitsMINAGE: TFloatField;
    cdsDomainUnitsMAXAGE: TFloatField;
    cdsDomainUnitsUNITRANK: TWideStringField;
    qChartDomainUnits: TSQLQuery;
    dsqChartDomainUnits: TDataSource;
    cdsChartDomainUnits: TClientDataSet;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField3: TWideStringField;
    StringField4: TWideStringField;
    StringField5: TWideStringField;
    StringField6: TWideStringField;
    StringField7: TWideStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField8: TWideStringField;
    dsChartDomainUnits: TDataSource;
    cdsChartDomainUnitsDOMAINORDER: TSmallintField;
    cdsTimeSpaceROCKCLASSID2: TWideStringField;
    cdsTimeSpaceSETTINGIDCOMBINED: TWideStringField;
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
    cdsTimeSpaceFeatureINC4CHTYN: TWideStringField;
    cdsTimeSpaceFeatureDOMAINID: TIntegerField;
    cdsTimeSpaceFeatureCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceFeatureDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceFeatureDOMAINXMIN: TIntegerField;
    cdsTimeSpaceFeatureDOMAINXMAX: TIntegerField;
    cdsTimeSpaceFeatureUNITOFFSET_MM: TIntegerField;
    cdsTimeSpaceFeatureMINAGE: TFloatField;
    cdsTimeSpaceFeatureMAXAGE: TFloatField;
    cdsTimeSpaceFeatureRANKWIDTH: TSmallintField;
    cdsTimeSpaceFeatureUNITNAME: TWideStringField;
    cdsTimeSpaceFeatureUNITRANK: TWideStringField;
    cdsTimeSpaceFeatureDOMAINNAME: TWideStringField;
    cdsTimeSpaceFeatureSPECIALFEATURE: TWideStringField;
    cdsTimeSpaceFeatureLEGENDORDER: TSmallintField;
    cdsTimeSpaceFeatureSPECIALFEATUREID: TIntegerField;
    cdsTimeSpaceDepositCHARTID: TIntegerField;
    cdsTimeSpaceDepositDOMAINORDER: TSmallintField;
    cdsTimeSpaceDepositSBDEPOSITID: TIntegerField;
    cdsTimeSpaceDepositDEPOSITNAME: TWideStringField;
    cdsTimeSpaceDepositDOMAINID: TIntegerField;
    cdsTimeSpaceDepositCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceDepositDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceDepositDOMAINXMIN: TIntegerField;
    cdsTimeSpaceDepositDOMAINXMAX: TIntegerField;
    cdsTimeSpaceDepositAPPROXAGE: TFloatField;
    cdsTimeSpaceDepositAPPROXAGEUNCERTAINTY: TFloatField;
    cdsTimeSpaceDepositDOMAINNAME: TWideStringField;
    cdsTimeSpaceDepositCOMMODITYID: TWideStringField;
    cdsTimeSpaceDepositCOMMODITY: TWideStringField;
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
    cdsTimeSpaceDomainHeadingsDOMAINNAME: TWideStringField;
    cdsTimeSpaceDomainHeadingsDOMAINTYPE: TWideStringField;
    cdsTimeSpaceDomainHeadingsMINPLOTAGE: TFloatField;
    cdsTimeSpaceDomainHeadingsMAXPLOTAGE: TFloatField;
    cdsTimeSpaceCONSTRAINTLEVELID: TSmallintField;
    cdsTimeSpaceAGECONSTRAINTLEVEL: TWideStringField;
    cdsTimeSpaceDepositHOSTUNITID: TIntegerField;
    cdsTimeSpaceDepositUNITNAME: TWideStringField;
    cdsTimeSpaceDepositHOSTMINAGE: TFloatField;
    cdsTimeSpaceDepositHOSTMAXAGE: TFloatField;
    cdsTimeSpaceDEPOSITIONENVIRONMENTID: TWideStringField;
    cdsTimeSpaceDEPOSITIONENVIRONMENT: TWideStringField;
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
    cdsTimeSpaceDepositDEPOSITCLAN: TWideStringField;
    qChartDomainsDOMAINHEADING: TWideStringField;
    cdsTimeSpaceDomainHeadingsDOMAINHEADING: TWideStringField;
    cdsChartDomainDOMAINHEADING: TWideStringField;
    cdsTimeSpaceROCKCLASSFUNDAMENTAL: TWideStringField;
    cdsChartDomainUnitsCONSTRAINTLEVELID: TSmallintField;
    cdsChartDomainUnitsAGECONSTRAINTLEVEL: TWideStringField;
    cdsChartDomainUnitsRANKWIDTH: TSmallintField;
    cdsChartDomainUnitsROCKCLASS: TWideStringField;
    cdsChartDomainUnitsROCKCLASSID2: TWideStringField;
    cdsChartDomainUnitsROCKCLASSFUNDAMENTAL: TWideStringField;
    cdsChartDomainUnitsSETTING: TWideStringField;
    cdsChartDomainUnitsSETTINGIDCOMBINED: TWideStringField;
    cdsChartDomainUnitsSETTINGID: TWideStringField;
    cdsChartDomainUnitsROCKCLASSID: TWideStringField;
    cdsChartDomainUnitsDEPOSITIONENVIRONMENTID: TWideStringField;
    cdsChartDomainUnitsDEPOSITIONENVIRONMENT: TWideStringField;
    qChartDomainDomains: TSQLQuery;
    dsqChartDomainDomains: TDataSource;
    dspChartDomainDomains: TDataSetProvider;
    cdsChartDomainDomains: TClientDataSet;
    dsChartDomainDomains: TDataSource;
    cdsChartDomainDomainsDOMAINORDER: TSmallintField;
    cdsChartDomainDomainsDOMAINID: TIntegerField;
    cdsChartDomainDomainsDOMAINNAME: TWideStringField;
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
    qTimeSpaceLIPINC4CHTYN: TWideStringField;
    qTimeSpaceLIPPOINTID: TSmallintField;
    qTimeSpaceLIPDOMAINID: TIntegerField;
    qTimeSpaceLIPCHARTOFFSET_MM: TIntegerField;
    qTimeSpaceLIPDOMAINOFFSET_MM: TIntegerField;
    qTimeSpaceLIPDOMAINXMIN: TIntegerField;
    qTimeSpaceLIPDOMAINXMAX: TIntegerField;
    qTimeSpaceLIPCONSTRAINTLEVELID: TSmallintField;
    qTimeSpaceLIPAGECONSTRAINTLEVEL: TWideStringField;
    qTimeSpaceLIPMINPLOTAGE: TFloatField;
    qTimeSpaceLIPMAXPLOTAGE: TFloatField;
    qTimeSpaceLIPLIPNAME: TWideStringField;
    qTimeSpaceLIPDOMAINNAME: TWideStringField;
    cdsTimeSpaceLIPCHARTID: TIntegerField;
    cdsTimeSpaceLIPDOMAINORDER: TSmallintField;
    cdsTimeSpaceLIPLIPID: TIntegerField;
    cdsTimeSpaceLIPINC4CHTYN: TWideStringField;
    cdsTimeSpaceLIPPOINTID: TSmallintField;
    cdsTimeSpaceLIPDOMAINID: TIntegerField;
    cdsTimeSpaceLIPCHARTOFFSET_MM: TIntegerField;
    cdsTimeSpaceLIPDOMAINOFFSET_MM: TIntegerField;
    cdsTimeSpaceLIPDOMAINXMIN: TIntegerField;
    cdsTimeSpaceLIPDOMAINXMAX: TIntegerField;
    cdsTimeSpaceLIPCONSTRAINTLEVELID: TSmallintField;
    cdsTimeSpaceLIPAGECONSTRAINTLEVEL: TWideStringField;
    cdsTimeSpaceLIPMINPLOTAGE: TFloatField;
    cdsTimeSpaceLIPMAXPLOTAGE: TFloatField;
    cdsTimeSpaceLIPLIPNAME: TWideStringField;
    cdsTimeSpaceLIPDOMAINNAME: TWideStringField;
    cdsDomainsAllDOMAINCONTINENTID: TWideStringField;
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
    cdsTimeSpaceDomainBoxesDOMAINNAME: TWideStringField;
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
    cdsUserChartDomainLIPINC4CHTYN: TWideStringField;
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
    cdsTimeSpaceDomainCurvesDOMAINNAME: TWideStringField;
    cdsTimeSpaceDomainCurvesCURVEORDER: TSmallintField;
    cdsTimeSpaceDomainCurvesPDFORDER: TIntegerField;
    cdsTimeSpaceDomainCurvesAGE: TFloatField;
    cdsTimeSpaceDomainCurvesPDFVALUE: TFloatField;
    cdsUserChartDomainMINPLOTAGE: TFloatField;
    cdsUserChartDomainMAXPLOTAGE: TFloatField;
    cdsTimeSpaceDomainHeadingsDEFAULTMINAGE: TFloatField;
    cdsTimeSpaceDomainHeadingsDEFAULTMAXAGE: TFloatField;
    qTimeSpaceLIPLIPHEADING: TWideStringField;
    cdsTimeSpaceLIPLIPHEADING: TWideStringField;
    qTimeSpaceLIPLIPPARENTID: TIntegerField;
    cdsTimeSpaceLIPLIPPARENTID: TIntegerField;
    qChartUsers: TSQLQuery;
    cdsChartUsers: TClientDataSet;
    dsChartUsers: TDataSource;
    qChartUsersCHARTID: TIntegerField;
    qChartUsersUSERID: TWideStringField;
    cdsChartUsersCHARTID: TIntegerField;
    cdsChartUsersUSERID: TWideStringField;
    qNewChartUser: TSQLQuery;
    qTimeSpaceLIPPLOTBARCODE: TWideStringField;
    cdsTimeSpaceLIPPLOTBARCODE: TWideStringField;
    qTimeSpaceLIPCOMPOSITIONID: TIntegerField;
    qTimeSpaceLIPDOMINANTCOMPOSITION: TWideStringField;
    cdsTimeSpaceLIPCOMPOSITIONID: TIntegerField;
    cdsTimeSpaceLIPDOMINANTCOMPOSITION: TWideStringField;
    qTimeSpaceLIPLIPSIZEID: TIntegerField;
    qTimeSpaceLIPLIPSIZEDESCRIPTION: TWideStringField;
    qTimeSpaceLIPLIPRATINGID: TWideStringField;
    qTimeSpaceLIPLIPRATINGDESCRIPTION: TWideStringField;
    cdsTimeSpaceLIPLIPSIZEID: TIntegerField;
    cdsTimeSpaceLIPLIPSIZEDESCRIPTION: TWideStringField;
    cdsTimeSpaceLIPLIPRATINGID: TWideStringField;
    cdsTimeSpaceLIPLIPRATINGDESCRIPTION: TWideStringField;
    qChartCHARTID: TIntegerField;
    qChartCHART: TWideStringField;
    qChartCHARTOFFSET_MM: TIntegerField;
    qChartDEFAULTDOMAINOFFSET: TIntegerField;
    qChartXMIN: TIntegerField;
    qChartYMIN: TIntegerField;
    qChartXMAX: TIntegerField;
    qChartYMAX: TIntegerField;
    qChartDEFAULTMINAGE: TFloatField;
    qChartDEFAULTMAXAGE: TFloatField;
    qChartDESCRIPTION: TBlobField;
    qChartOWNERID: TWideStringField;
    cdsChartCHARTID: TIntegerField;
    cdsChartCHART: TWideStringField;
    cdsChartOWNERID: TWideStringField;
    cdsChartCHARTOFFSET_MM: TIntegerField;
    cdsChartDEFAULTDOMAINOFFSET: TIntegerField;
    cdsChartXMIN: TIntegerField;
    cdsChartYMIN: TIntegerField;
    cdsChartXMAX: TIntegerField;
    cdsChartYMAX: TIntegerField;
    cdsChartDEFAULTMINAGE: TFloatField;
    cdsChartDEFAULTMAXAGE: TFloatField;
    cdsChartDESCRIPTION: TBlobField;
    cdsChartqChartUsers: TDataSetField;
    cdsChartqChartDomains: TDataSetField;
    cdsChartsOWNERID: TWideStringField;
    qDomainsDOMAINID: TIntegerField;
    qDomainsCONTINENTID: TWideStringField;
    qDomainsDOMAINNAME: TWideStringField;
    qDomainsSPOTLATITUDE: TFloatField;
    qDomainsSPOTLONGITUDE: TFloatField;
    qDomainsDOMAINPARENTID: TIntegerField;
    qDomainsDOMAINTYPEID: TWideStringField;
    qDomainsMINPLOTAGE: TFloatField;
    qDomainsMAXPLOTAGE: TFloatField;
    qDeleteDomain: TSQLQuery;
    qInsertDomain: TSQLQuery;
    qNewDomainName: TSQLQuery;
    dspNewDomainName: TDataSetProvider;
    cdsNewDomainName: TClientDataSet;
    dsNewDomainName: TDataSource;
    cdsNewDomainNameDOMAINID: TIntegerField;
    cdsNewDomainNameCONTINENTID: TWideStringField;
    cdsNewDomainNameDOMAINNAME: TWideStringField;
    qChartsList: TSQLQuery;
    dspChartsList: TDataSetProvider;
    cdsChartsList: TClientDataSet;
    dsChartsList: TDataSource;
    cdsChartsListCHARTID: TIntegerField;
    cdsChartsListCHART: TWideStringField;
    cdsChartsListCHARTOFFSET_MM: TIntegerField;
    cdsChartsListDEFAULTDOMAINOFFSET: TIntegerField;
    cdsChartsListOWNERID: TWideStringField;
    cdsChartsListXMIN: TIntegerField;
    cdsChartsListXMAX: TIntegerField;
    cdsChartsListYMIN: TIntegerField;
    cdsChartsListYMAX: TIntegerField;
    cdsChartsListDEFAULTMINAGE: TFloatField;
    cdsChartsListDEFAULTMAXAGE: TFloatField;
    qChartsCHARTID: TIntegerField;
    qChartsCHART: TWideStringField;
    qChartsCHARTOFFSET_MM: TIntegerField;
    qChartsDEFAULTDOMAINOFFSET: TIntegerField;
    qChartsOWNERID: TWideStringField;
    qChartsXMIN: TIntegerField;
    qChartsXMAX: TIntegerField;
    qChartsYMIN: TIntegerField;
    qChartsYMAX: TIntegerField;
    qChartsDEFAULTMINAGE: TFloatField;
    qChartsDEFAULTMAXAGE: TFloatField;
    qChartsUSERID: TWideStringField;
    qUserChartDomainUnit: TSQLQuery;
    dsqUserChartDomainUnit: TDataSource;
    dspUserChartDomainUnit: TDataSetProvider;
    cdsUserChartDomainUnit: TClientDataSet;
    cdsUserChartDomainUnitDOMAINORDER: TSmallintField;
    cdsUserChartDomainUnitDOMAINID: TIntegerField;
    cdsUserChartDomainUnitUNITID: TIntegerField;
    cdsUserChartDomainUnitINC4CHTYN: TWideStringField;
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
    cdsChartDomainDomainsLIPDOMAINNAME: TWideStringField;
    qChartDomainLIPs: TSQLQuery;
    cdsChartDomainLIPs: TClientDataSet;
    dsChartDomainLIPs: TDataSource;
    cdsChartDomainDomainsLIPqChartDomainLIPs: TDataSetField;
    cdsChartDomainLIPsDOMAINORDER: TSmallintField;
    cdsChartDomainLIPsDOMAINID: TIntegerField;
    cdsChartDomainLIPsLIPID: TIntegerField;
    cdsChartDomainLIPsINC4CHTYN: TWideStringField;
    cdsChartDomainLIPsDOMAINNAME: TWideStringField;
    cdsChartDomainLIPsCONTINENTID: TWideStringField;
    cdsChartDomainLIPsLIPNAME: TWideStringField;
    cdsChartDomainLIPsLIPHEADING: TWideStringField;
    cdsChartDomainLIPsLIPPARENTID: TIntegerField;
    cdsChartDomainLIPsCONTOCEANID: TWideStringField;
    cdsChartDomainLIPsLIPSIZEID: TIntegerField;
    cdsChartDomainLIPsMINPLOTAGE: TFloatField;
    cdsChartDomainLIPsMAXPLOTAGE: TFloatField;
    cdsChartDomainLIPsBARCODEAGE: TFloatField;
    cdsChartDomainLIPsLIPSIZEDESCRIPTION: TWideStringField;
    cdsChartDomainLIPsPLOTBARCODE: TWideStringField;
    cdsChartDomainLIPsCONSTRAINTLEVELID: TSmallintField;
    cdsChartDomainLIPsAGECONSTRAINTLEVEL: TWideStringField;
    cdsChartDomainLIPsLIPRATINGID: TWideStringField;
    cdsChartDomainLIPsAREALEXTENT: TFloatField;
    cdsChartDomainLIPsVOLUMEESTIMATE: TFloatField;
    cdsChartDomainLIPsLIPRATINGDESCRIPTION: TWideStringField;
    cdsChartDomainLIPsCOMPOSITIONID: TIntegerField;
    cdsChartDomainLIPsDOMINANTCOMPOSITION: TWideStringField;
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
    cdsChartDomainDomainsLIPUnitsDOMAINNAME: TWideStringField;
    cdsChartDomainDomainsLIPUnitsqChartDomainLIPsUnits: TDataSetField;
    cdsChartDomainLIPsUnitsDOMAINORDER: TSmallintField;
    cdsChartDomainLIPsUnitsDOMAINID: TIntegerField;
    cdsChartDomainLIPsUnitsLIPID: TIntegerField;
    cdsChartDomainLIPsUnitsINC4CHTYN: TWideStringField;
    cdsChartDomainLIPsUnitsDOMAINNAME: TWideStringField;
    cdsChartDomainLIPsUnitsCONTINENTID: TWideStringField;
    cdsChartDomainLIPsUnitsLIPNAME: TWideStringField;
    cdsChartDomainLIPsUnitsLIPHEADING: TWideStringField;
    cdsChartDomainLIPsUnitsLIPPARENTID: TIntegerField;
    cdsChartDomainLIPsUnitsCONTOCEANID: TWideStringField;
    cdsChartDomainLIPsUnitsLIPSIZEID: TIntegerField;
    cdsChartDomainLIPsUnitsMINPLOTAGE: TFloatField;
    cdsChartDomainLIPsUnitsMAXPLOTAGE: TFloatField;
    cdsChartDomainLIPsUnitsBARCODEAGE: TFloatField;
    cdsChartDomainLIPsUnitsLIPSIZEDESCRIPTION: TWideStringField;
    cdsChartDomainLIPsUnitsPLOTBARCODE: TWideStringField;
    cdsChartDomainLIPsUnitsCONSTRAINTLEVELID: TSmallintField;
    cdsChartDomainLIPsUnitsAGECONSTRAINTLEVEL: TWideStringField;
    cdsChartDomainLIPsUnitsLIPRATINGID: TWideStringField;
    cdsChartDomainLIPsUnitsAREALEXTENT: TFloatField;
    cdsChartDomainLIPsUnitsVOLUMEESTIMATE: TFloatField;
    cdsChartDomainLIPsUnitsLIPRATINGDESCRIPTION: TWideStringField;
    cdsChartDomainLIPsUnitsCOMPOSITIONID: TIntegerField;
    cdsChartDomainLIPsUnitsDOMINANTCOMPOSITION: TWideStringField;
    cdsChartDomainLIPsUnitsqChartLIPUnits: TDataSetField;
    cdsChartLIPUnitsDOMAINORDER: TSmallintField;
    cdsChartLIPUnitsDOMAINID: TIntegerField;
    cdsChartLIPUnitsUNITID: TIntegerField;
    cdsChartLIPUnitsINC4CHTYN: TWideStringField;
    cdsChartLIPUnitsLIPID: TIntegerField;
    cdsChartLIPUnitsCOUNTRYID: TWideStringField;
    cdsChartLIPUnitsUNITNAME: TWideStringField;
    cdsChartLIPUnitsRANKID: TWideStringField;
    cdsChartLIPUnitsAGEYEARS: TFloatField;
    cdsChartLIPUnitsMINAGE: TFloatField;
    cdsChartLIPUnitsMAXAGE: TFloatField;
    cdsChartLIPUnitsUNITRANK: TWideStringField;
    cdsChartLIPUnitsCONSTRAINTLEVELID: TSmallintField;
    cdsChartLIPUnitsAGECONSTRAINTLEVEL: TWideStringField;
    cdsChartDomainDomainsLIPUnitsCHARTID: TIntegerField;
    cdsChartDomainLIPsUnitsCHARTID: TIntegerField;
    cdsChartLIPUnitsCHARTID: TIntegerField;
    qChartMapUnits: TSQLQuery;
    dspChartMapUnits: TDataSetProvider;
    cdsChartMapUnits: TClientDataSet;
    dsChartMapUnits: TDataSource;
    cdsChartMapUnitsCHARTID: TIntegerField;
    cdsChartMapUnitsUNITID: TIntegerField;
    cdsChartMapUnitsMAPID2: TWideStringField;
    cdsChartMapUnitsGISINT: TIntegerField;
    cdsChartMapUnitsGISSTR: TWideStringField;
    cdsChartMapUnitsINCL4MAP: TWideStringField;
    cdsChartMapUnitsMAPNAME: TWideStringField;
    cdsChartMapUnitsCOUNTRYID: TWideStringField;
    cdsChartMapUnitsUNITNAME: TWideStringField;
    cdsChartMapUnitsRANKID: TWideStringField;
    cdsChartMapUnitsAGEYEARS: TFloatField;
    cdsChartMapUnitsMINAGE: TFloatField;
    cdsChartMapUnitsMAXAGE: TFloatField;
    cdsChartMapUnitsUNITRANK: TWideStringField;
    cdsChartMapUnitsCONSTRAINTLEVELID: TSmallintField;
    cdsChartMapUnitsAGECONSTRAINTLEVEL: TWideStringField;
    cdsChartMapUnitsRANKWIDTH: TSmallintField;
    cdsChartMapUnitsROCKCLASS: TWideStringField;
    cdsChartMapUnitsROCKCLASSID2: TWideStringField;
    cdsChartMapUnitsROCKCLASSFUNDAMENTAL: TWideStringField;
    cdsChartMapUnitsSETTING: TWideStringField;
    cdsChartMapUnitsSETTINGIDCOMBINED: TWideStringField;
    cdsChartMapUnitsSETTINGID: TWideStringField;
    cdsChartMapUnitsROCKCLASSID: TWideStringField;
    cdsChartMapUnitsDEPOSITIONENVIRONMENTID: TWideStringField;
    cdsChartMapUnitsDEPOSITIONENVIRONMENT: TWideStringField;
    cdsChartMapUnitsPARENTID: TIntegerField;
    qUnconformities: TSQLQuery;
    dspUnconformities: TDataSetProvider;
    cdsUnconformities: TClientDataSet;
    dsUnconformities: TDataSource;
    cdsUnconformitiesCHARTID: TIntegerField;
    cdsUnconformitiesDOMAINORDER: TSmallintField;
    cdsUnconformitiesUNITID: TIntegerField;
    cdsUnconformitiesINC4CHTYN: TWideStringField;
    cdsUnconformitiesDOMAINID: TIntegerField;
    cdsUnconformitiesCHARTOFFSET_MM: TIntegerField;
    cdsUnconformitiesDOMAINOFFSET_MM: TIntegerField;
    cdsUnconformitiesDOMAINXMIN: TIntegerField;
    cdsUnconformitiesDOMAINXMAX: TIntegerField;
    cdsUnconformitiesUNITOFFSET_MM: TIntegerField;
    cdsUnconformitiesDOMAINNAME: TWideStringField;
    cdsUnconformitiesCOUNTRYID: TWideStringField;
    cdsUnconformitiesUNITNAME: TWideStringField;
    cdsUnconformitiesRANKID: TWideStringField;
    cdsUnconformitiesAGEYEARS: TFloatField;
    cdsUnconformitiesMAXAGE: TFloatField;
    cdsUnconformitiesUNITRANK: TWideStringField;
    cdsUnconformitiesCONSTRAINTLEVELID: TSmallintField;
    cdsUnconformitiesAGECONSTRAINTLEVEL: TWideStringField;
    cdsUnconformitiesRANKWIDTH: TSmallintField;
    cdsUnconformitiesPREREL: TWideStringField;
    cdsUnconformitiesPRECEDEDBY: TIntegerField;
    cdsUnconformitiesRELATIONSHIP: TWideStringField;
    qChartMapLIPs: TSQLQuery;
    dspChartMapLIPs: TDataSetProvider;
    cdsChartMapLIPs: TClientDataSet;
    dsChartMapLIPs: TDataSource;
    cdsChartMapLIPsCHARTID: TIntegerField;
    cdsChartMapLIPsLIPID: TIntegerField;
    cdsChartMapLIPsLIPNAME: TWideStringField;
    cdsChartMapLIPsMAPID2: TWideStringField;
    cdsChartMapLIPsGISINT: TIntegerField;
    cdsChartMapLIPsGISSTR: TWideStringField;
    cdsChartMapLIPsINCL4MAP: TWideStringField;
    cdsChartMapLIPsMAPNAME: TWideStringField;
    cdsChartMapLIPsCONSTRAINTLEVELID: TSmallintField;
    cdsChartMapLIPsAGECONSTRAINTLEVEL: TWideStringField;
    cdsChartMapLIPsMINPLOTAGE: TFloatField;
    cdsChartMapLIPsMAXPLOTAGE: TFloatField;
    cdsChartMapLIPsBARCODEAGE: TFloatField;
    cdsChartMapLIPsPLOTBARCODE: TWideStringField;
    cdsChartMapLIPsLIPHEADING: TWideStringField;
    cdsChartMapLIPsLIPPARENTID: TIntegerField;
    cdsChartMapLIPsLIPSIZEID: TIntegerField;
    cdsChartMapLIPsLIPSIZEDESCRIPTION: TWideStringField;
    cdsChartMapLIPsLIPRATINGID: TWideStringField;
    cdsChartMapLIPsLIPRATINGDESCRIPTION: TWideStringField;
    cdsChartMapLIPsCOMPOSITIONID: TIntegerField;
    cdsChartMapLIPsDOMINANTCOMPOSITION: TWideStringField;
    cdsChartMapLIPsCONTINENTID: TWideStringField;
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
  Variants, IWStrat_constants, usrIW_dm, UserSessionUnit;

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
  Result := TIWUserSession(WebApplication.Data).dmStratC;
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
