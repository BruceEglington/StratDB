unit IWStrat_dmRB;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  PsRBExport_Main, PsRBExport_PDF, ppBands, ppSubRpt, ppCtrls, ppStrtch,
  ppRegion, ppVar, ppPrnabl, ppCache;

type
  TdmStratRB = class(TDataModule)
    sqlcRBStrat: TSQLConnection;
    ppReport1: TppReport;
    Query1: TSQLQuery;
    dspQuery1: TDataSetProvider;
    cdsQuery1: TClientDataSet;
    cdsQuery1UNITID: TIntegerField;
    cdsQuery1COUNTRYID: TStringField;
    cdsQuery1UNITNAME: TStringField;
    cdsQuery1RANKID: TStringField;
    cdsQuery1PARENTID: TIntegerField;
    cdsQuery1MINAGE: TFloatField;
    cdsQuery1MAXAGE: TFloatField;
    cdsQuery1AGEUNITS: TStringField;
    cdsQuery1COUNTRY: TStringField;
    cdsQuery1UNITRANK: TStringField;
    cdsQuery1AGEYEARS: TFloatField;
    cdsQuery1APPROVALSTATUS: TStringField;
    dsQuery1: TDataSource;
    qList1: TSQLQuery;
    dspList1: TDataSetProvider;
    dsqQuery1: TDataSource;
    cdsList1: TClientDataSet;
    dsList1: TDataSource;
    Query1UNITID: TIntegerField;
    Query1COUNTRYID: TStringField;
    Query1UNITNAME: TStringField;
    Query1PARENTID: TIntegerField;
    Query1RANKID: TStringField;
    Query1AGEYEARS: TFloatField;
    Query1MINAGE: TFloatField;
    Query1MAXAGE: TFloatField;
    Query1AGEUNITS: TStringField;
    Query1UNITRANK: TStringField;
    Query1COUNTRY: TStringField;
    Query1APPROVALID: TStringField;
    Query1APPROVALSTATUS: TStringField;
    PsRBExportPDF1: TPsRBExportPDF;
    ppDBPipeline1: TppDBPipeline;
    dsqList1: TDataSource;
    qList1AGEYEARS: TFloatField;
    qList1UNITID: TIntegerField;
    qList1UNITNAME: TStringField;
    qList1RANKID: TStringField;
    qList1PARENTID: TIntegerField;
    qList1APPROVALID: TStringField;
    qList1UNITRANK: TStringField;
    qList1APPROVALSTATUS: TStringField;
    qList1UNAME: TStringField;
    ppDBPipeline2: TppDBPipeline;
    qList2: TSQLQuery;
    dsqList2: TDataSource;
    qList3: TSQLQuery;
    dsqList3: TDataSource;
    qList2AGEYEARS: TFloatField;
    qList2UNITID: TIntegerField;
    qList2UNITNAME: TStringField;
    qList2RANKID: TStringField;
    qList2PARENTID: TIntegerField;
    qList2APPROVALID: TStringField;
    qList2UNITRANK: TStringField;
    qList2APPROVALSTATUS: TStringField;
    qList2UNAME: TStringField;
    qList3AGEYEARS: TFloatField;
    qList3UNITID: TIntegerField;
    qList3UNITNAME: TStringField;
    qList3RANKID: TStringField;
    qList3PARENTID: TIntegerField;
    qList3APPROVALID: TStringField;
    qList3UNITRANK: TStringField;
    qList3APPROVALSTATUS: TStringField;
    qList3UNAME: TStringField;
    ppDBPipeline3: TppDBPipeline;
    ppDBPipeline4: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppRegion1: TppRegion;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBtName: TppDBText;
    ppRegion2: TppRegion;
    ppLine3: TppLine;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    ppLabel9: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmStratRB: TdmStratRB;

implementation

{$R *.dfm}

end.
