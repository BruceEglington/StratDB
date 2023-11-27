object dmStratC: TdmStratC
  Height = 817
  Width = 1001
  object qCharts: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTS2.CHARTID,CHARTS2.CHART,'
      '  CHARTS2.CHARTOFFSET_MM,CHARTS2.DEFAULTDOMAINOFFSET,'
      '  CHARTS2.OWNERID,CHARTS2.XMIN,CHARTS2.XMAX,'
      '  CHARTS2.YMIN,CHARTS2.YMAX,'
      '  CHARTS2.DEFAULTMINAGE,CHARTS2.DEFAULTMAXAGE,'
      '  CHARTUSER.USERID'
      'FROM CHARTS2,CHARTUSER'
      'WHERE CHARTUSER.USERID=:UserID'
      'AND CHARTS2.CHARTID=CHARTUSER.CHARTID'
      'ORDER by CHARTS2.CHART')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 58
    object qChartsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qChartsCHART: TStringField
      FieldName = 'CHART'
      Required = True
      Size = 50
    end
    object qChartsCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object qChartsDEFAULTDOMAINOFFSET: TIntegerField
      FieldName = 'DEFAULTDOMAINOFFSET'
      Required = True
    end
    object qChartsOWNERID: TStringField
      FieldName = 'OWNERID'
      Required = True
    end
    object qChartsXMIN: TIntegerField
      FieldName = 'XMIN'
      Required = True
    end
    object qChartsXMAX: TIntegerField
      FieldName = 'XMAX'
      Required = True
    end
    object qChartsYMIN: TIntegerField
      FieldName = 'YMIN'
      Required = True
    end
    object qChartsYMAX: TIntegerField
      FieldName = 'YMAX'
      Required = True
    end
    object qChartsDEFAULTMINAGE: TFloatField
      FieldName = 'DEFAULTMINAGE'
      Required = True
    end
    object qChartsDEFAULTMAXAGE: TFloatField
      FieldName = 'DEFAULTMAXAGE'
      Required = True
    end
    object qChartsUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dspCharts: TDataSetProvider
    DataSet = qCharts
    Left = 58
    Top = 58
  end
  object cdsCharts: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCharts'
    Left = 86
    Top = 58
    object cdsChartsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartsCHART: TStringField
      FieldName = 'CHART'
      Required = True
      Size = 50
    end
    object cdsChartsCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsChartsDEFAULTDOMAINOFFSET: TIntegerField
      FieldName = 'DEFAULTDOMAINOFFSET'
      Required = True
    end
    object cdsChartsUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsChartsXMIN: TIntegerField
      FieldName = 'XMIN'
      Required = True
    end
    object cdsChartsXMAX: TIntegerField
      FieldName = 'XMAX'
      Required = True
    end
    object cdsChartsYMIN: TIntegerField
      FieldName = 'YMIN'
      Required = True
    end
    object cdsChartsYMAX: TIntegerField
      FieldName = 'YMAX'
      Required = True
    end
    object cdsChartsDEFAULTMINAGE: TFloatField
      FieldName = 'DEFAULTMINAGE'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsChartsDEFAULTMAXAGE: TFloatField
      FieldName = 'DEFAULTMAXAGE'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsChartsOWNERID: TStringField
      FieldName = 'OWNERID'
      Required = True
    end
  end
  object qRefDetail: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SOURCEID'
        ParamType = ptInput
        Size = 101
      end>
    SQL.Strings = (
      'select * from SOURCELISTB'
      'where SOURCELISTB.SourceID=:SourceID')
    Left = 744
    Top = 92
    object qRefDetailREFNUM: TIntegerField
      FieldName = 'REFNUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRefDetailSOURCEID: TStringField
      FieldName = 'SOURCEID'
      Required = True
      Size = 100
    end
    object qRefDetailSOURCEDES: TMemoField
      FieldName = 'SOURCEDES'
      BlobType = ftMemo
    end
  end
  object dspRefDetail: TDataSetProvider
    DataSet = qRefDetail
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 772
    Top = 92
  end
  object cdsRefDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefDetail'
    Left = 800
    Top = 92
    object cdsRefDetailREFNUM: TIntegerField
      FieldName = 'REFNUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefDetailSOURCEID: TStringField
      DisplayLabel = 'Reference ID'
      DisplayWidth = 90
      FieldName = 'SOURCEID'
      Required = True
      Size = 100
    end
    object cdsRefDetailSOURCEDES: TMemoField
      DisplayLabel = 'Reference details'
      DisplayWidth = 90
      FieldName = 'SOURCEDES'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspRefFull: TDataSetProvider
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 772
    Top = 246
  end
  object cdsRefFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefFull'
    Left = 800
    Top = 246
    object cdsRefFullREFNUM: TIntegerField
      FieldName = 'REFNUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefFullSOURCEID: TStringField
      DisplayLabel = 'Reference ID'
      FieldName = 'SOURCEID'
      Required = True
      Size = 100
    end
    object cdsRefFullSOURCEDES: TMemoField
      DisplayLabel = 'Reference'
      FieldName = 'SOURCEDES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsRefFullCONTINENTID: TStringField
      DisplayLabel = 'Continent ID'
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object dsCharts: TDataSource
    AutoEdit = False
    DataSet = cdsCharts
    Left = 114
    Top = 58
  end
  object dsRefFull: TDataSource
    DataSet = cdsRefFull
    Left = 826
    Top = 246
  end
  object dsRefDetail: TDataSource
    DataSet = cdsRefDetail
    Left = 828
    Top = 92
  end
  object qYesNo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from YesNo')
    Left = 742
    Top = 8
    object qYesNoYESNOID: TStringField
      FieldName = 'YESNOID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qYesNoYESNO: TStringField
      FieldName = 'YESNO'
      Required = True
      Size = 3
    end
  end
  object dspYesNo: TDataSetProvider
    DataSet = qYesNo
    Left = 770
    Top = 8
  end
  object cdsYesNo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspYesNo'
    Left = 798
    Top = 8
    object cdsYesNoYESNOID: TStringField
      DisplayLabel = 'Y / N'
      FieldName = 'YESNOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsYesNoYESNO: TStringField
      DisplayLabel = 'Yes / No'
      FieldName = 'YESNO'
      Required = True
      Size = 3
    end
  end
  object dsYesNo: TDataSource
    DataSet = cdsYesNo
    Left = 826
    Top = 8
  end
  object Query1Rec: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select DISTINCT STRATUNITS.UNITID, STRATUNITS.COUNTRYID,'
      '  STRATUNITS.UNITNAME,  STRATUNITS.PARENTID,'
      '  STRATUNITS.UNITRANK,  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,  STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK, COUNTRIES.COUNTRY'
      'from STRATUNITS, COUNTRIES, RANKS'
      'where STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'and STRATUNITS.UNITRANK=RANKS.RANKID')
    Left = 748
    Top = 50
  end
  object dspQuery1Rec: TDataSetProvider
    DataSet = Query1Rec
    Options = [poReadOnly]
    Left = 776
    Top = 50
  end
  object cdsQuery1Rec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1Rec'
    Left = 804
    Top = 50
    object cdsQuery1RecUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qValidFull: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select STRATVALID.UNITID, STRATVALID.VALIDSTATUSID,'
      '  STRATVALID.DATEDONE, STRATVALID.DONEBY,'
      '  STRATVALID.COMMENTS'
      'from STRATVALID'
      'where STRATVALID.UNITID = :UnitID')
    Left = 776
    Top = 296
  end
  object dspValidFull: TDataSetProvider
    DataSet = qValidFull
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 804
    Top = 296
  end
  object cdsValidFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValidFull'
    Left = 832
    Top = 296
    object cdsValidFullUNITID: TIntegerField
      DisplayLabel = 'Unit ID'
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsValidFullVALIDSTATUSID: TStringField
      DisplayLabel = 'Valid. Status ID'
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsValidFullDATEDONE: TSQLTimeStampField
      DisplayLabel = 'Date Done'
      FieldName = 'DATEDONE'
      Required = True
    end
    object cdsValidFullDONEBY: TStringField
      DisplayLabel = 'Done By'
      FieldName = 'DONEBY'
      Required = True
    end
    object cdsValidFullCOMMENTS: TMemoField
      DisplayLabel = 'Comments'
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
  end
  object dsValidFull: TDataSource
    DataSet = cdsValidFull
    Left = 860
    Top = 296
  end
  object qStratRef: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SourceNum'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'delete from UNITREFS'
      'where UNITREFS.UNITID = :UnitID'
      'and UNITREFS.SOURCENUM = :SourceNum')
    Left = 776
    Top = 364
  end
  object qDeleteStratDomain: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from STRATDOMAIN2'
      'where STRATDOMAIN2.UNITID = :UnitID'
      'and STRATDOMAIN2.DOMAINID = :DomainID'
      '')
    Left = 776
    Top = 412
  end
  object qDeleteLinkToApplication: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'UnitID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ApplicationID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'delete from APPLICLINK'
      'where APPLICLINK.UNITID = :UnitID'
      'and APPLICLINK.APPLICATIONID = :ApplicationID'
      '')
    Left = 876
    Top = 412
  end
  object qChart: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTS2.CHARTID, CHARTS2.CHART, '
      '  CHARTS2.CHARTOFFSET_MM,CHARTS2.DEFAULTDOMAINOFFSET,'
      '  CHARTS2.XMIN,CHARTS2.YMIN,CHARTS2.XMAX,CHARTS2.YMAX,'
      '  CHARTS2.DEFAULTMINAGE,CHARTS2.DEFAULTMAXAGE,'
      '  CHARTS2.DESCRIPTION,'
      '  CHARTS2.OWNERID'
      'FROM CHARTS2'
      'WHERE CHARTS2.CHARTID=:ChartID'
      '')
    SQLConnection = sqlcStrat
    Left = 194
    Top = 10
    object qChartCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qChartCHART: TStringField
      FieldName = 'CHART'
      Required = True
      Size = 50
    end
    object qChartOWNERID: TStringField
      FieldName = 'OWNERID'
      Required = True
    end
    object qChartCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object qChartDEFAULTDOMAINOFFSET: TIntegerField
      FieldName = 'DEFAULTDOMAINOFFSET'
      Required = True
    end
    object qChartXMIN: TIntegerField
      FieldName = 'XMIN'
      Required = True
    end
    object qChartYMIN: TIntegerField
      FieldName = 'YMIN'
      Required = True
    end
    object qChartXMAX: TIntegerField
      FieldName = 'XMAX'
      Required = True
    end
    object qChartYMAX: TIntegerField
      FieldName = 'YMAX'
      Required = True
    end
    object qChartDEFAULTMINAGE: TFloatField
      FieldName = 'DEFAULTMINAGE'
      Required = True
    end
    object qChartDEFAULTMAXAGE: TFloatField
      FieldName = 'DEFAULTMAXAGE'
      Required = True
    end
    object qChartDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
    end
  end
  object dspChart: TDataSetProvider
    DataSet = qChart
    Options = [poFetchBlobsOnDemand, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poUseQuoteChar]
    Left = 250
    Top = 10
  end
  object cdsChart: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChart'
    Left = 278
    Top = 10
    object cdsChartCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartCHART: TStringField
      FieldName = 'CHART'
      Required = True
      Size = 50
    end
    object cdsChartOWNERID: TStringField
      FieldName = 'OWNERID'
      Required = True
    end
    object cdsChartCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsChartDEFAULTDOMAINOFFSET: TIntegerField
      FieldName = 'DEFAULTDOMAINOFFSET'
      Required = True
    end
    object cdsChartXMIN: TIntegerField
      FieldName = 'XMIN'
      Required = True
    end
    object cdsChartYMIN: TIntegerField
      FieldName = 'YMIN'
      Required = True
    end
    object cdsChartXMAX: TIntegerField
      FieldName = 'XMAX'
      Required = True
    end
    object cdsChartYMAX: TIntegerField
      FieldName = 'YMAX'
      Required = True
    end
    object cdsChartDEFAULTMINAGE: TFloatField
      FieldName = 'DEFAULTMINAGE'
      Required = True
    end
    object cdsChartDEFAULTMAXAGE: TFloatField
      FieldName = 'DEFAULTMAXAGE'
      Required = True
    end
    object cdsChartDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
    end
    object cdsChartqChartUsers: TDataSetField
      FieldName = 'qChartUsers'
    end
    object cdsChartqChartDomains: TDataSetField
      FieldName = 'qChartDomains'
    end
  end
  object dsChart: TDataSource
    AutoEdit = False
    DataSet = cdsChart
    Left = 306
    Top = 10
  end
  object dsqChart: TDataSource
    AutoEdit = False
    DataSet = qChart
    Left = 222
    Top = 10
  end
  object qChartDomains: TSQLQuery
    DataSource = dsqChart
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTDOMAIN.CHARTID, CHARTDOMAIN.DOMAINORDER,'
      '  CHARTDOMAIN.OFFSET_MM, CHARTDOMAIN.DOMAINHEADING,'
      '  CHARTDOMAIN.DOMAINXMIN, CHARTDOMAIN.DOMAINXMAX,'
      '  CHARTDOMAIN.DOMAINID,DOMAINS.DOMAINNAME, '
      '  DOMAINS.MINPLOTAGE, DOMAINS.MAXPLOTAGE,'
      '  DOMAINS.CONTINENTID'
      'FROM CHARTDOMAIN, DOMAINS'
      'WHERE CHARTDOMAIN.CHARTID=:ChartID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'ORDER by CHARTDOMAIN.DOMAINORDER')
    SQLConnection = sqlcStrat
    Left = 222
    Top = 58
    object qChartDomainsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qChartDomainsDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qChartDomainsOFFSET_MM: TIntegerField
      FieldName = 'OFFSET_MM'
      Required = True
    end
    object qChartDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object qChartDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qChartDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qChartDomainsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
      Required = True
    end
    object qChartDomainsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
      Required = True
    end
    object qChartDomainsDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object qChartDomainsDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object qChartDomainsDOMAINHEADING: TStringField
      FieldName = 'DOMAINHEADING'
      Size = 90
    end
  end
  object cdsChartDomain: TClientDataSet
    Aggregates = <>
    DataSetField = cdsChartqChartDomains
    Params = <>
    Left = 250
    Top = 58
    object cdsChartDomainCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainOFFSET_MM: TIntegerField
      FieldName = 'OFFSET_MM'
      Required = True
    end
    object cdsChartDomainDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsChartDomainCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsChartDomainDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsChartDomainMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsChartDomainMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsChartDomainDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object cdsChartDomainDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object cdsChartDomainDOMAINHEADING: TStringField
      FieldName = 'DOMAINHEADING'
      Size = 90
    end
  end
  object dsChartDomain: TDataSource
    AutoEdit = False
    DataSet = cdsChartDomain
    Left = 278
    Top = 58
  end
  object qDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ContinentID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMAINS.DOMAINID, DOMAINS.CONTINENTID, '
      'DOMAINS.DOMAINNAME, '
      'DOMAINS.SPOTLATITUDE, DOMAINS.SPOTLONGITUDE,'
      'DOMAINS.DOMAINPARENTID, DOMAINS.DOMAINTYPEID, '
      'DOMAINS.MINPLOTAGE, DOMAINS.MAXPLOTAGE'
      'FROM DOMAINS,DOMAINFOR,USERSWHOFOR'
      'WHERE DOMAINS.CONTINENTID=:ContinentID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINS.DOMAINID = DOMAINFOR.DOMAINID'
      'ORDER BY DOMAINS.DOMAINNAME')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 106
    object qDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object qDomainsSPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object qDomainsSPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
    end
    object qDomainsDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object qDomainsDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object qDomainsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object qDomainsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
  end
  object dspDomains: TDataSetProvider
    DataSet = qDomains
    Left = 58
    Top = 106
  end
  object cdsDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomains'
    Left = 86
    Top = 106
    object cdsDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainsSPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainsSPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainsDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDomainsDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDomainsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
  end
  object dsDomains: TDataSource
    AutoEdit = False
    DataSet = cdsDomains
    Left = 114
    Top = 106
  end
  object qNewChartDomain: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainOrder'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OffSet_MM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DomainXMin'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DomainXMax'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DomainHeading'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO CHARTDOMAIN'
      
        '(ChartID, DomainOrder, OffSet_MM, DomainID,DomainXMin,DomainXMax' +
        ',DomainHeading)'
      
        'Values (:ChartID, :DomainOrder, :Offset_MM, :DomainID, :DomainXM' +
        'in, :DomainXMax, :DomainHeading)')
    SQLConnection = sqlcStrat
    Left = 196
    Top = 335
  end
  object qOrogenies: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ContinentID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM OROGENIES'
      'WHERE OROGENIES.CONTINENTID=:ContinentID'
      'ORDER by OROGENIES.OROGENY')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 158
  end
  object dspOrogenies: TDataSetProvider
    DataSet = qOrogenies
    Left = 58
    Top = 158
  end
  object cdsOrogenies: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrogenies'
    Left = 86
    Top = 158
    object cdsOrogeniesOROGENYID: TIntegerField
      FieldName = 'OROGENYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrogeniesOROGENY: TStringField
      FieldName = 'OROGENY'
      Required = True
      Size = 50
    end
    object cdsOrogeniesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object dsOrogenies: TDataSource
    AutoEdit = False
    DataSet = cdsOrogenies
    Left = 114
    Top = 158
  end
  object qDomain: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMAINS.DOMAINID,DOMAINS.DOMAINNAME,'
      '  DOMAINS.CONTINENTID'
      'FROM DOMAINS,DOMAINFOR,USERSWHOFOR'
      'WHERE DOMAINS.DOMAINID=:DomainID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINS.DOMAINID = DOMAINFOR.DOMAINID'
      'ORDER by DOMAINS.DOMAINNAME')
    SQLConnection = sqlcStrat
    Left = 190
    Top = 189
  end
  object dspDomain: TDataSetProvider
    DataSet = qDomain
    Left = 246
    Top = 189
  end
  object cdsDomain: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomain'
    Left = 274
    Top = 189
    object cdsDomainDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainqDomainMetamorphism: TDataSetField
      FieldName = 'qDomainMetamorphism'
    end
  end
  object dsDomain: TDataSource
    AutoEdit = False
    DataSet = cdsDomain
    Left = 302
    Top = 189
  end
  object dsqDomain: TDataSource
    AutoEdit = False
    DataSet = qDomain
    Left = 218
    Top = 189
  end
  object qDomainMetamorphism: TSQLQuery
    DataSource = dsqDomain
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMANMETAMORPHISM.DOMAINID,'
      '  DOMANMETAMORPHISM.METAMORPHISMORDER,'
      '  DOMANMETAMORPHISM.GRADEID,'
      '  DOMANMETAMORPHISM.PEAKAGE,'
      '  DOMANMETAMORPHISM.AGEPLUS,'
      '  DOMANMETAMORPHISM.AGEMINUS,'
      '  DOMANMETAMORPHISM.OROGENYID,'
      '  OROGENIES.OROGENY,METAMORPHICGRADE.GRADE'
      'FROM DOMANMETAMORPHISM,OROGENIES,METAMORPHICGRADE'
      'WHERE DOMANMETAMORPHISM.DOMAINID=:DomainID'
      'AND DOMANMETAMORPHISM.OROGENYID=OROGENIES.OROGENYID'
      'AND METAMORPHICGRADE.GRADEID=DOMANMETAMORPHISM.GRADEID'
      'ORDER by DOMANMETAMORPHISM.DOMAINID,'
      '  DOMANMETAMORPHISM.METAMORPHISMORDER')
    SQLConnection = sqlcStrat
    Left = 218
    Top = 237
  end
  object cdsDomainMetamorphism: TClientDataSet
    Aggregates = <>
    ObjectView = False
    Params = <>
    Left = 246
    Top = 237
  end
  object dsDomainMetamorphism: TDataSource
    AutoEdit = False
    DataSet = cdsDomainMetamorphism
    Left = 274
    Top = 237
  end
  object qDomainDeformation: TSQLQuery
    DataSource = dsqDomain
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMANMETAMORPHISM.DOMAINID,'
      '  DOMANMETAMORPHISM.METAMORPHISMORDER,'
      '  DOMANMETAMORPHISM.GRADEID,'
      '  DOMANMETAMORPHISM.PEAKAGE,'
      '  DOMANMETAMORPHISM.AGEPLUS,'
      '  DOMANMETAMORPHISM.AGEMINUS,'
      '  DOMANMETAMORPHISM.OROGENYID,'
      '  OROGENIES.OROGENY,METAMORPHICGRADE.GRADE'
      'FROM DOMANMETAMORPHISM,OROGENIES,METAMORPHICGRADE'
      'WHERE DOMANMETAMORPHISM.DOMAINID=:DomainID'
      'AND DOMANMETAMORPHISM.OROGENYID=OROGENIES.OROGENYID'
      'AND METAMORPHICGRADE.GRADEID=DOMANMETAMORPHISM.GRADEID'
      'ORDER by DOMANMETAMORPHISM.DOMAINID,'
      '  DOMANMETAMORPHISM.METAMORPHISMORDER')
    SQLConnection = sqlcStrat
    Left = 218
    Top = 285
  end
  object cdsDomainDeformation: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainqDomainMetamorphism
    ObjectView = False
    Params = <>
    Left = 246
    Top = 285
  end
  object dsDomainDeformation: TDataSource
    AutoEdit = False
    DataSet = cdsDomainDeformation
    Left = 274
    Top = 285
  end
  object qMetamorphicGrade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM METAMORPHICGRADE'
      '')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 206
  end
  object dspMetamorphicGrade: TDataSetProvider
    DataSet = qMetamorphicGrade
    Left = 58
    Top = 206
  end
  object cdsMetamorphicGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMetamorphicGrade'
    Left = 86
    Top = 206
    object cdsMetamorphicGradeGRADEID: TStringField
      FieldName = 'GRADEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsMetamorphicGradeGRADE: TStringField
      FieldName = 'GRADE'
      Required = True
      Size = 30
    end
  end
  object dsMetamorphicGrade: TDataSource
    AutoEdit = False
    DataSet = cdsMetamorphicGrade
    Left = 114
    Top = 206
  end
  object qTimeSpace: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ChartMinAge'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ChartMaxAge'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      '  STRATDOMAIN.UNITID,STRATDOMAIN.INC4CHTYN,'
      '  CHARTPOINTS.POINTID, STRATDOMAIN.DOMAINID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  STRATUNITS.UNITOFFSET_MM AS UNITOFFSET_MM,'
      '  STRATUNITS.CONSTRAINTLEVELID,CONSTRAINTS.AGECONSTRAINTLEVEL,'
      
        '  STRATUNITS.MINAGE,STRATUNITS.MAXAGE,RANKS.RANKWIDTH,STRATUNITS' +
        '.AGEYEARS,'
      '  STRATUNITS.UNITNAME,RANKS.UNITRANK,DOMAINS.DOMAINNAME,'
      '  ROCKCLASSES.ROCKCLASS,ROCKCLASSES.ROCKCLASSID2,'
      '  ROCKCLASSES.ROCKCLASSFUNDAMENTAL,'
      '  SETTINGS.SETTING,SETTINGS.SETTINGIDCOMBINED,'
      '  UNITSETTING.SETTINGID,UNITROCKCLASS.ROCKCLASSID,'
      '  STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID,'
      '  DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT'
      'FROM CHARTS2, CHARTDOMAIN,STRATUNITS,RANKS,DOMAINS,STRATDOMAIN,'
      '  ROCKCLASSES,SETTINGS,UNITROCKCLASS,UNITSETTING,CHARTPOINTS,'
      '  CONSTRAINTS,STRATSEDENVIRONMENT,DEPOSITIONNVIRONMENT,'
      '  USERSWHOFOR,UNITFOR'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=STRATDOMAIN.DOMAINID'
      'AND USERSWHOFOR.USERID=:USERID'
      'AND USERSWHOFOR.WHOFORID=UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID=STRATUNITS.UNITID'
      'AND STRATDOMAIN.UNITID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND ( '
      '  (STRATUNITS.MINAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MINAGE<=:CHARTMAXAGE) OR'
      '  (STRATUNITS.MAXAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MAXAGE<=:CHARTMAXAGE))'
      'AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID'
      'AND STRATUNITS.UNITID=UNITSETTING.UNITID'
      'AND UNITROCKCLASS.ROCKCLASSID=ROCKCLASSES.ROCKCLASSID'
      'AND UNITSETTING.SETTINGID=SETTINGS.SETTINGID'
      'AND STRATUNITS.APPROVALID <> '#39'HS'#39
      'AND STRATUNITS.APPROVALID <> '#39'NA'#39
      
        'AND STRATUNITS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELI' +
        'D'
      'AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID'
      
        'AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRON' +
        'MENT.DEPOSITIONENVIRONMENTID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER,STRATUNITS.UNITID')
    SQLConnection = sqlcStrat
    Left = 474
    Top = 146
  end
  object dsqTimeSpace: TDataSource
    AutoEdit = False
    DataSet = qTimeSpace
    Left = 502
    Top = 146
  end
  object dspTimeSpace: TDataSetProvider
    DataSet = qTimeSpace
    Left = 530
    Top = 146
  end
  object cdsTimeSpace: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpace'
    Left = 558
    Top = 146
    object cdsTimeSpaceCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpacePOINTID: TSmallintField
      FieldName = 'POINTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceUNITOFFSET_MM: TIntegerField
      FieldName = 'UNITOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsTimeSpaceMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsTimeSpaceRANKWIDTH: TSmallintField
      FieldName = 'RANKWIDTH'
    end
    object cdsTimeSpaceAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '########0'
    end
    object cdsTimeSpaceUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsTimeSpaceUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsTimeSpaceDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object cdsTimeSpaceSETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object cdsTimeSpaceSETTINGID: TStringField
      FieldName = 'SETTINGID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsTimeSpaceROCKCLASSID: TStringField
      FieldName = 'ROCKCLASSID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTimeSpaceDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object cdsTimeSpaceDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object cdsTimeSpaceINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTimeSpaceROCKCLASSID2: TStringField
      FieldName = 'ROCKCLASSID2'
      Required = True
      Size = 2
    end
    object cdsTimeSpaceSETTINGIDCOMBINED: TStringField
      FieldName = 'SETTINGIDCOMBINED'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsTimeSpaceCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsTimeSpaceAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 105
    end
    object cdsTimeSpaceDEPOSITIONENVIRONMENTID: TStringField
      FieldName = 'DEPOSITIONENVIRONMENTID'
      Required = True
      Size = 1
    end
    object cdsTimeSpaceDEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
      Size = 15
    end
    object cdsTimeSpaceROCKCLASSFUNDAMENTAL: TStringField
      FieldName = 'ROCKCLASSFUNDAMENTAL'
      Required = True
      Size = 2
    end
  end
  object dsTimeSpace: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpace
    Left = 586
    Top = 146
  end
  object qDomainTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DOMAINTYPES'
      'ORDER by DOMAINTYPES.DOMAINTYPEID')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 258
  end
  object dspDomainTypes: TDataSetProvider
    DataSet = qDomainTypes
    Left = 58
    Top = 258
  end
  object cdsDomainTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainTypes'
    Left = 86
    Top = 258
    object cdsDomainTypesDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsDomainTypesDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsDomainTypesDVLEVEL: TIntegerField
      FieldName = 'DVLEVEL'
      Required = True
    end
  end
  object dsDomainTypes: TDataSource
    AutoEdit = False
    DataSet = cdsDomainTypes
    Left = 114
    Top = 258
  end
  object qOrogeniesCont: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM OROGENIES'
      'ORDER by OROGENIES.OROGENY')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 310
  end
  object dspOrogeniesCont: TDataSetProvider
    DataSet = qOrogeniesCont
    Left = 58
    Top = 310
  end
  object cdsOrogeniesCont: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrogeniesCont'
    Left = 86
    Top = 310
    object IntegerField1: TIntegerField
      FieldName = 'OROGENYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'OROGENY'
      Required = True
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object dsOrogeniesCont: TDataSource
    AutoEdit = False
    DataSet = cdsOrogeniesCont
    Left = 114
    Top = 310
  end
  object qContinents: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Continents'
      'where Continents.HasData='#39'Y'#39)
    SQLConnection = sqlcStrat
    Left = 30
    Top = 362
    object qContinentsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qContinentsCONTINENT: TStringField
      FieldName = 'CONTINENT'
    end
    object qContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
    end
  end
  object dsContinents: TDataSource
    AutoEdit = False
    DataSet = cdsContinents
    Left = 114
    Top = 362
  end
  object cdsContinents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContinents'
    Left = 86
    Top = 362
    object cdsContinentsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsContinentsCONTINENT: TStringField
      FieldName = 'CONTINENT'
    end
    object cdsContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
    end
  end
  object dspContinents: TDataSetProvider
    DataSet = qContinents
    Left = 58
    Top = 362
  end
  object qDomainsAll: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME,DOMAINS.DOMAINPARENTID,'
      '  DOMAINS.DOMAINTYPEID,'
      
        '  DOMAINS.DOMAINNAME || '#39'  '#39' || DOMAINS.CONTINENTID AS DOMAINCON' +
        'TINENTID'
      'FROM DOMAINS,DOMAINFOR,USERSWHOFOR'
      'WHERE USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINS.DOMAINID = DOMAINFOR.DOMAINID'
      'ORDER by DOMAINS.DOMAINNAME')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 410
  end
  object dspDomainsAll: TDataSetProvider
    DataSet = qDomainsAll
    Left = 58
    Top = 410
  end
  object cdsDomainsAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainsAll'
    Left = 86
    Top = 410
    object cdsDomainsAllDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainsAllCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainsAllDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainsAllDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDomainsAllDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDomainsAllDOMAINCONTINENTID: TStringField
      FieldName = 'DOMAINCONTINENTID'
      ReadOnly = True
      Required = True
      Size = 165
    end
  end
  object dsDomainsAll: TDataSource
    AutoEdit = False
    DataSet = cdsDomainsAll
    Left = 114
    Top = 410
  end
  object qTimeSpaceMetamorphism: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,CHARTDOM' +
        'AIN.DOMAINID,DOMANMETAMORPHISM.METAMORPHISMORDER,'
      '  CHARTPOINTS.POINTID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  DOMANMETAMORPHISM.PEAKAGE,'
      
        '  DOMANMETAMORPHISM.PEAKAGE-DOMANMETAMORPHISM.AGEMINUS AS MINAGE' +
        ','
      '  DOMANMETAMORPHISM.PEAKAGE+DOMANMETAMORPHISM.AGEPLUS AS MAXAGE,'
      '  DOMAINS.DOMAINNAME,DOMAINTYPES.DOMAINTYPE,'
      '  OROGENIES.OROGENY, DOMANMETAMORPHISM.GRADEID,'
      '  METAMORPHICGRADE.GRADE,'
      '  DOMANMETAMORPHISM.CONSTRAINTLEVELID,'
      '  CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  DOMANMETAMORPHISM.PEAKTMIN, DOMANMETAMORPHISM.PEAKTMAX,'
      '  DOMANMETAMORPHISM.PEAKPMIN, DOMANMETAMORPHISM.PEAKPMAX'
      
        'FROM CHARTS2, CHARTDOMAIN, DOMANMETAMORPHISM, DOMAINTYPES,  DOMA' +
        'INS,'
      '  OROGENIES,CHARTPOINTS,METAMORPHICGRADE,CONSTRAINTS,'
      '  USERSWHOFOR,DOMAINFOR'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND USERSWHOFOR.USERID=:USERID'
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINS.DOMAINID=DOMAINFOR.DOMAINID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND CHARTDOMAIN.DOMAINID=DOMANMETAMORPHISM.DOMAINID'
      'AND DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'AND DOMANMETAMORPHISM.GRADEID=METAMORPHICGRADE.GRADEID'
      'AND DOMANMETAMORPHISM.OROGENYID=OROGENIES.OROGENYID'
      
        'AND DOMANMETAMORPHISM.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAIN' +
        'TLEVELID'
      'AND DOMANMETAMORPHISM.PEAKAGE >= :CHARTMINAGE'
      'AND DOMANMETAMORPHISM.PEAKAGE <= :CHARTMAXAGE'
      'ORDER BY CHARTDOMAIN.DOMAINID,DOMANMETAMORPHISM.PEAKAGE')
    SQLConnection = sqlcStrat
    Left = 474
    Top = 194
  end
  object dsqTimeSpaceMetamorphism: TDataSource
    AutoEdit = False
    DataSet = qTimeSpaceMetamorphism
    Left = 502
    Top = 194
  end
  object dspTimeSpaceMetamorphism: TDataSetProvider
    DataSet = qTimeSpaceMetamorphism
    Left = 530
    Top = 194
  end
  object cdsTimeSpaceMetamorphism: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpaceMetamorphism'
    Left = 558
    Top = 194
    object cdsTimeSpaceMetamorphismCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceMetamorphismDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceMetamorphismDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsTimeSpaceMetamorphismMETAMORPHISMORDER: TIntegerField
      FieldName = 'METAMORPHISMORDER'
      Required = True
    end
    object cdsTimeSpaceMetamorphismPOINTID: TSmallintField
      FieldName = 'POINTID'
      Required = True
    end
    object cdsTimeSpaceMetamorphismCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceMetamorphismDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceMetamorphismDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object cdsTimeSpaceMetamorphismDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object cdsTimeSpaceMetamorphismPEAKAGE: TFloatField
      FieldName = 'PEAKAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceMetamorphismMINAGE: TFloatField
      FieldName = 'MINAGE'
      ReadOnly = True
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceMetamorphismMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ReadOnly = True
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceMetamorphismDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ReadOnly = True
      Required = True
      Size = 150
    end
    object cdsTimeSpaceMetamorphismOROGENY: TStringField
      FieldName = 'OROGENY'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object cdsTimeSpaceMetamorphismGRADEID: TStringField
      FieldName = 'GRADEID'
      ReadOnly = True
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTimeSpaceMetamorphismGRADE: TStringField
      FieldName = 'GRADE'
      ReadOnly = True
      Required = True
      Size = 30
    end
    object cdsTimeSpaceMetamorphismCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      ReadOnly = True
      Required = True
    end
    object cdsTimeSpaceMetamorphismAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      ReadOnly = True
      Required = True
      Size = 105
    end
    object cdsTimeSpaceMetamorphismPEAKTMIN: TFloatField
      FieldName = 'PEAKTMIN'
      ReadOnly = True
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceMetamorphismPEAKTMAX: TFloatField
      FieldName = 'PEAKTMAX'
      ReadOnly = True
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceMetamorphismPEAKPMIN: TFloatField
      FieldName = 'PEAKPMIN'
      ReadOnly = True
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceMetamorphismPEAKPMAX: TFloatField
      FieldName = 'PEAKPMAX'
      ReadOnly = True
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceMetamorphismDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      ReadOnly = True
      Required = True
      Size = 30
    end
  end
  object dsTimeSpaceMetamorphism: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpaceMetamorphism
    Left = 586
    Top = 194
  end
  object qTimeSpaceDeformation: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,CHARTDOM' +
        'AIN.DOMAINID,DOMAINDEFORMATION.DEFORMATIONORDER,'
      '  CHARTPOINTS.POINTID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN, CHARTDOMAIN.DOMAINXMAX,'
      '  DOMAINDEFORMATION.AGEMIN,'
      '  DOMAINDEFORMATION.AGEMAX,'
      '  DOMAINS.DOMAINNAME,DOMAINTYPES.DOMAINTYPE,'
      '  OROGENIES.OROGENY,'
      '  DOMAINDEFORMATION.CONSTRAINTLEVELID,'
      '  CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  DOMAINDEFORMATION.DUCTILITYTYPEID,DUCTILITIES.DUCTILITYTYPE,'
      
        '  DOMAINDEFORMATION.DEFORMATIONTYPEID,DEFORMATIONTYPES.DEFORMATI' +
        'ONTYPE,'
      '  DOMAINDEFORMATION.VERGENCEANGLE,DIRECTIONS.DIRECTIONNAME'
      
        'FROM CHARTS2, CHARTDOMAIN, DOMAINDEFORMATION, DOMAINTYPES,  DOMA' +
        'INS,'
      '  OROGENIES,CHARTPOINTS,CONSTRAINTS,DEFORMATIONTYPES,'
      '  DUCTILITIES,DIRECTIONS,USERSWHOFOR,DOMAINFOR'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND USERSWHOFOR.USERID=:USERID'
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINFOR.DOMAINID=DOMAINS.DOMAINID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINDEFORMATION.DOMAINID'
      'AND DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'AND DOMAINDEFORMATION.OROGENYID=OROGENIES.OROGENYID'
      
        'AND DOMAINDEFORMATION.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAIN' +
        'TLEVELID'
      
        'AND DOMAINDEFORMATION.DUCTILITYTYPEID=DUCTILITIES.DUCTILITYTYPEI' +
        'D'
      
        'AND DOMAINDEFORMATION.DEFORMATIONTYPEID=DEFORMATIONTYPES.DEFORMA' +
        'TIONTYPEID'
      'AND DOMAINDEFORMATION.VERGENCEANGLE=DIRECTIONS.DIRECTIONANGLE'
      'AND DOMAINDEFORMATION.AGEMIN >= :CHARTMINAGE'
      'AND DOMAINDEFORMATION.AGEMAX <= :CHARTMAXAGE'
      'ORDER BY CHARTDOMAIN.DOMAINID,DOMAINDEFORMATION.AGEMIN')
    SQLConnection = sqlcStrat
    Left = 474
    Top = 242
  end
  object dsqTimeSpaceDeformation: TDataSource
    AutoEdit = False
    DataSet = qTimeSpaceDeformation
    Left = 502
    Top = 242
  end
  object dspTimeSpaceDeformation: TDataSetProvider
    DataSet = qTimeSpaceDeformation
    Left = 530
    Top = 242
  end
  object cdsTimeSpaceDeformation: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpaceDeformation'
    Left = 558
    Top = 242
    object cdsTimeSpaceDeformationCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDeformationDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDeformationDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDeformationDEFORMATIONORDER: TIntegerField
      FieldName = 'DEFORMATIONORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDeformationPOINTID: TSmallintField
      FieldName = 'POINTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDeformationCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceDeformationDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceDeformationAGEMIN: TFloatField
      FieldName = 'AGEMIN'
      Required = True
    end
    object cdsTimeSpaceDeformationAGEMAX: TFloatField
      FieldName = 'AGEMAX'
      Required = True
    end
    object cdsTimeSpaceDeformationDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceDeformationDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsTimeSpaceDeformationOROGENY: TStringField
      FieldName = 'OROGENY'
      Required = True
      Size = 50
    end
    object cdsTimeSpaceDeformationDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
      DisplayFormat = '####0'
    end
    object cdsTimeSpaceDeformationDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
      DisplayFormat = '####0'
    end
    object cdsTimeSpaceDeformationCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsTimeSpaceDeformationAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 105
    end
    object cdsTimeSpaceDeformationDUCTILITYTYPEID: TStringField
      FieldName = 'DUCTILITYTYPEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTimeSpaceDeformationDUCTILITYTYPE: TStringField
      FieldName = 'DUCTILITYTYPE'
      Size = 60
    end
    object cdsTimeSpaceDeformationDEFORMATIONTYPEID: TIntegerField
      FieldName = 'DEFORMATIONTYPEID'
      Required = True
    end
    object cdsTimeSpaceDeformationDEFORMATIONTYPE: TStringField
      FieldName = 'DEFORMATIONTYPE'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceDeformationVERGENCEANGLE: TIntegerField
      FieldName = 'VERGENCEANGLE'
      Required = True
    end
    object cdsTimeSpaceDeformationDIRECTIONNAME: TStringField
      FieldName = 'DIRECTIONNAME'
      Required = True
    end
  end
  object dsTimeSpaceDeformation: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpaceDeformation
    Left = 586
    Top = 242
  end
  object qChartPosition: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID, '
      '  CHARTS2.XMIN,CHARTS2.YMIN,CHARTS2.XMAX,CHARTS2.YMAX'
      'FROM CHARTS2'
      'WHERE CHARTS2.CHARTID= :CHARTID')
    SQLConnection = sqlcStrat
    Left = 474
    Top = 294
  end
  object dsqChartPosition: TDataSource
    AutoEdit = False
    DataSet = qChartPosition
    Left = 502
    Top = 294
  end
  object dspChartPosition: TDataSetProvider
    DataSet = qChartPosition
    Left = 530
    Top = 294
  end
  object cdsChartPosition: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChartPosition'
    Left = 558
    Top = 294
    object cdsChartPositionCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartPositionXMIN: TIntegerField
      FieldName = 'XMIN'
      Required = True
    end
    object cdsChartPositionYMIN: TIntegerField
      FieldName = 'YMIN'
      Required = True
    end
    object cdsChartPositionXMAX: TIntegerField
      FieldName = 'XMAX'
      Required = True
    end
    object cdsChartPositionYMAX: TIntegerField
      FieldName = 'YMAX'
      Required = True
    end
  end
  object dsChartPosition: TDataSource
    AutoEdit = False
    DataSet = cdsChartPosition
    Left = 586
    Top = 294
  end
  object qMaxChart: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT max(CHARTS2.CHARTID) FROM CHARTS2')
    SQLConnection = sqlcStrat
    Left = 194
    Top = 141
    object qMaxChartMAX: TIntegerField
      FieldName = 'MAX'
      ReadOnly = True
    end
  end
  object dspMaxChart: TDataSetProvider
    DataSet = qMaxChart
    Left = 222
    Top = 141
  end
  object cdsMaxChart: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaxChart'
    Left = 250
    Top = 141
    object cdsMaxChartMAX: TIntegerField
      FieldName = 'MAX'
      ReadOnly = True
    end
  end
  object dsMaxChart: TDataSource
    AutoEdit = False
    DataSet = cdsMaxChart
    Left = 278
    Top = 141
  end
  object qMapUnitsGIS: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'MAPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT MAPS2.MAPID2,MAPS2.MAPNAME, '
      '  STRATMAPS2.UNITID,STRATMAPS2.GISINT,STRATMAPS2.GISSTR'
      'FROM MAPS2,STRATMAPS2'
      'WHERE MAPS2.MAPID2= :MAPID'
      'AND MAPS2.MAPID2=STRATMAPS2.MAPID2'
      'ORDER BY STRATMAPS2.UNITID')
    SQLConnection = sqlcStrat
    Left = 22
    Top = 466
  end
  object dsqMapUnitsGIS: TDataSource
    AutoEdit = False
    DataSet = qMapUnitsGIS
    Left = 50
    Top = 466
  end
  object dspMapUnitsGIS: TDataSetProvider
    DataSet = qMapUnitsGIS
    Left = 78
    Top = 466
  end
  object cdsMapUnitsGIS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMapUnitsGIS'
    Left = 106
    Top = 466
    object cdsMapUnitsGISMAPID2: TStringField
      FieldName = 'MAPID2'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMapUnitsGISUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMapUnitsGISMAPNAME: TStringField
      FieldName = 'MAPNAME'
      Required = True
      Size = 150
    end
    object cdsMapUnitsGISGISINT: TIntegerField
      FieldName = 'GISINT'
      Required = True
    end
    object cdsMapUnitsGISGISSTR: TStringField
      FieldName = 'GISSTR'
      Required = True
    end
  end
  object dsMapUnitsGIS: TDataSource
    AutoEdit = False
    DataSet = cdsMapUnitsGIS
    Left = 134
    Top = 466
  end
  object qDomainUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select STRATDOMAIN.DOMAINID,STRATDOMAIN.UNITID,'
      '  STRATDOMAIN.INC4CHTYN,'
      '  DOMAINS.DOMAINNAME,'
      '  STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME,'
      '  STRATUNITS.RANKID, STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK'
      'from STRATDOMAIN,STRATUNITS,RANKS,DOMAINS,UNITFOR,USERSWHOFOR'
      'where STRATDOMAIN.DOMAINID = :DomainID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID=UNITFOR.WHOFORID'
      'AND STRATUNITS.UNITID=UNITFOR.UNITID'
      'and STRATDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'and STRATDOMAIN.UNITID=STRATUNITS.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATDOMAIN.INC4CHTYN='#39'Y'#39
      'order by STRATUNITS.MINAGE')
    SQLConnection = sqlcStrat
    Left = 478
    Top = 498
  end
  object dsqDomainUnits: TDataSource
    AutoEdit = False
    DataSet = qDomainUnits
    Left = 506
    Top = 498
  end
  object dspDomainUnits: TDataSetProvider
    DataSet = qDomainUnits
    Left = 534
    Top = 498
  end
  object cdsDomainUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainUnits'
    Left = 562
    Top = 498
    object cdsDomainUnitsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainUnitsINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainUnitsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainUnitsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDomainUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsDomainUnitsRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsDomainUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '########0'
    end
    object cdsDomainUnitsMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsDomainUnitsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsDomainUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
  end
  object dsDomainUnits: TDataSource
    AutoEdit = False
    DataSet = cdsDomainUnits
    Left = 590
    Top = 498
  end
  object qChartDomainUnits: TSQLQuery
    DataSource = dsqChartDomainDomains
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTDOMAIN.DOMAINORDER,'
      '  STRATDOMAIN.DOMAINID,STRATDOMAIN.UNITID,'
      '  STRATDOMAIN.INC4CHTYN,'
      '  DOMAINS.DOMAINNAME,'
      '  STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME,'
      '  STRATUNITS.RANKID, STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,'
      '  STRATUNITS.CONSTRAINTLEVELID,CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  STRATUNITS.MINAGE,STRATUNITS.MAXAGE,RANKS.RANKWIDTH,'
      '  STRATUNITS.AGEYEARS, RANKS.UNITRANK,'
      '  ROCKCLASSES.ROCKCLASS,ROCKCLASSES.ROCKCLASSID2,'
      '  ROCKCLASSES.ROCKCLASSFUNDAMENTAL,'
      '  SETTINGS.SETTING,SETTINGS.SETTINGIDCOMBINED,'
      '  UNITSETTING.SETTINGID,UNITROCKCLASS.ROCKCLASSID,'
      '  STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID,'
      '  DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT'
      'from CHARTDOMAIN,STRATDOMAIN,STRATUNITS,RANKS,DOMAINS,'
      '  ROCKCLASSES,SETTINGS,UNITROCKCLASS,UNITSETTING,'
      '  CONSTRAINTS,STRATSEDENVIRONMENT,DEPOSITIONNVIRONMENT,'
      '  USERSWHOFOR,UNITFOR'
      'WHERE CHARTDOMAIN.DOMAINID = :DomainID'
      'AND USERSWHOFOR.USERID=:UserID'
      'AND CHARTDOMAIN.CHARTID = :ChartID'
      'AND USERSWHOFOR.WHOFORID=UNITFOR.WHOFORID'
      'AND STRATUNITS.UNITID=UNITFOR.UNITID'
      'AND CHARTDOMAIN.DOMAINID=STRATDOMAIN.DOMAINID'
      'AND STRATDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND STRATDOMAIN.UNITID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND ( '
      '  (STRATUNITS.MINAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MINAGE<=:CHARTMAXAGE) OR'
      '  (STRATUNITS.MAXAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MAXAGE<=:CHARTMAXAGE))'
      'AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID'
      'AND STRATUNITS.UNITID=UNITSETTING.UNITID'
      'AND UNITROCKCLASS.ROCKCLASSID=ROCKCLASSES.ROCKCLASSID'
      'AND UNITSETTING.SETTINGID=SETTINGS.SETTINGID'
      'AND STRATUNITS.APPROVALID <> '#39'HS'#39
      'AND STRATUNITS.APPROVALID <> '#39'NA'#39
      
        'AND STRATUNITS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELI' +
        'D'
      'AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID'
      
        'AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRON' +
        'MENT.DEPOSITIONENVIRONMENTID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER,STRATUNITS.MINAGE')
    SQLConnection = sqlcStrat
    Left = 14
    Top = 550
  end
  object dsqChartDomainUnits: TDataSource
    AutoEdit = False
    DataSet = qChartDomainUnits
    Left = 42
    Top = 550
  end
  object cdsChartDomainUnits: TClientDataSet
    Aggregates = <>
    DataSetField = cdsChartDomainDomainsqChartDomainUnits
    Params = <>
    Left = 98
    Top = 550
    object cdsChartDomainUnitsDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object StringField5: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object FloatField1: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object StringField8: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsChartDomainUnitsCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsChartDomainUnitsAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 35
    end
    object cdsChartDomainUnitsRANKWIDTH: TSmallintField
      FieldName = 'RANKWIDTH'
    end
    object cdsChartDomainUnitsROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object cdsChartDomainUnitsROCKCLASSID2: TStringField
      FieldName = 'ROCKCLASSID2'
      Required = True
      Size = 2
    end
    object cdsChartDomainUnitsROCKCLASSFUNDAMENTAL: TStringField
      FieldName = 'ROCKCLASSFUNDAMENTAL'
      Required = True
      Size = 2
    end
    object cdsChartDomainUnitsSETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object cdsChartDomainUnitsSETTINGIDCOMBINED: TStringField
      FieldName = 'SETTINGIDCOMBINED'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsChartDomainUnitsSETTINGID: TStringField
      FieldName = 'SETTINGID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsChartDomainUnitsROCKCLASSID: TStringField
      FieldName = 'ROCKCLASSID'
      Required = True
      Size = 2
    end
    object cdsChartDomainUnitsDEPOSITIONENVIRONMENTID: TStringField
      FieldName = 'DEPOSITIONENVIRONMENTID'
      Required = True
      Size = 1
    end
    object cdsChartDomainUnitsDEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object cdsChartDomainUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '#########0'
    end
  end
  object dsChartDomainUnits: TDataSource
    AutoEdit = False
    DataSet = cdsChartDomainUnits
    Left = 126
    Top = 550
  end
  object qTimeSpaceFeature: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ChartMinAge'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ChartMaxAge'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      '  STRATDOMAIN.UNITID,STRATDOMAIN.INC4CHTYN,'
      '  STRATDOMAIN.DOMAINID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  STRATUNITS.UNITOFFSET_MM AS UNITOFFSET_MM,'
      '  STRATUNITS.MINAGE,STRATUNITS.MAXAGE,RANKS.RANKWIDTH,'
      '  STRATUNITS.UNITNAME,RANKS.UNITRANK,DOMAINS.DOMAINNAME,'
      '  SPECIALFEATURES.SPECIALFEATURE,SPECIALFEATURES.LEGENDORDER,'
      '  UNITFEATURES.SPECIALFEATUREID'
      'FROM CHARTS2, CHARTDOMAIN,STRATUNITS,RANKS,DOMAINS,STRATDOMAIN,'
      '  SPECIALFEATURES,UNITFEATURES,USERSWHOFOR,UNITFOR'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND USERSWHOFOR.USERID=:USERID'
      'AND USERSWHOFOR.WHOFORID=UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID=STRATUNITS.UNITID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=STRATDOMAIN.DOMAINID'
      'AND STRATDOMAIN.UNITID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND STRATUNITS.MINAGE>=:CHARTMINAGE'
      'AND STRATUNITS.MAXAGE<=:CHARTMAXAGE'
      'AND STRATUNITS.UNITID=UNITFEATURES.UNITID'
      
        'AND UNITFEATURES.SPECIALFEATUREID=SPECIALFEATURES.SPECIALFEATURE' +
        'ID'
      
        'ORDER BY CHARTDOMAIN.DOMAINORDER,STRATUNITS.MINAGE, STRATUNITS.U' +
        'NITID,SPECIALFEATURES.LEGENDORDER')
    SQLConnection = sqlcStrat
    Left = 474
    Top = 98
  end
  object dsqTimeSpaceFeature: TDataSource
    AutoEdit = False
    DataSet = qTimeSpaceFeature
    Left = 502
    Top = 98
  end
  object dspTimeSpaceFeature: TDataSetProvider
    DataSet = qTimeSpaceFeature
    Left = 530
    Top = 98
  end
  object cdsTimeSpaceFeature: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpaceFeature'
    Left = 558
    Top = 98
    object cdsTimeSpaceFeatureCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceFeatureDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceFeatureUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceFeatureLEGENDORDER: TSmallintField
      FieldName = 'LEGENDORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceFeatureINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTimeSpaceFeatureDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsTimeSpaceFeatureCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceFeatureDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceFeatureDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceFeatureDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceFeatureUNITOFFSET_MM: TIntegerField
      FieldName = 'UNITOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceFeatureMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceFeatureMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceFeatureRANKWIDTH: TSmallintField
      FieldName = 'RANKWIDTH'
    end
    object cdsTimeSpaceFeatureUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsTimeSpaceFeatureUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsTimeSpaceFeatureDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceFeatureSPECIALFEATURE: TStringField
      FieldName = 'SPECIALFEATURE'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceFeatureSPECIALFEATUREID: TIntegerField
      FieldName = 'SPECIALFEATUREID'
      Required = True
    end
  end
  object dsTimeSpaceFeature: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpaceFeature
    Left = 586
    Top = 98
  end
  object qTimeSpaceDeposit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ChartMinAge'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ChartMaxAge'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      '  DOMAINDEPOSITS.SBDEPOSITID,DEPOSITS.DEPOSITNAME,'
      '  CHARTDOMAIN.DOMAINID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  DEPOSITS.HOSTUNITID,STRATUNITS.UNITNAME,'
      
        '  STRATUNITS.MINAGE AS HOSTMINAGE,STRATUNITS.MAXAGE AS HOSTMAXAG' +
        'E,'
      '  DOMAINS.DOMAINNAME,'
      '  DEPOSITCOMMODITIES.COMMODITYID,'
      '  COMMODITIES.COMMODITY,'
      '  DEPOSITS.DEPOSITCLANID,DEPOSITCLANS.DEPOSITCLAN'
      'FROM CHARTS2, CHARTDOMAIN,DOMAINDEPOSITS,DOMAINS,DEPOSITS,'
      '  DEPOSITCOMMODITIES,COMMODITIES,STRATUNITS,DEPOSITCLANS,'
      '  USERSWHOFOR,UNITFOR,DEPOSITFOR'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID=DEPOSITFOR.WHOFORID'
      'AND DEPOSITS.SDBDEPOSITID=DEPOSITFOR.SDBDEPOSITID'
      'AND USERSWHOFOR.WHOFORID=UNITFOR.WHOFORID'
      'AND STRATUNITS.UNITID=UNITFOR.UNITID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINDEPOSITS.DOMAINID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND DEPOSITS.APPROXAGE>=:CHARTMINAGE'
      'AND DEPOSITS.APPROXAGE<=:CHARTMAXAGE'
      'AND DEPOSITS.HOSTUNITID=STRATUNITS.UNITID'
      'AND DOMAINDEPOSITS.SBDEPOSITID=DEPOSITS.SDBDEPOSITID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID=DEPOSITS.SDBDEPOSITID'
      'AND DEPOSITCOMMODITIES.COMMODITYID=COMMODITIES.COMMODITYID'
      'AND DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      
        'ORDER BY CHARTDOMAIN.DOMAINORDER,DEPOSITS.APPROXAGE,DEPOSITCOMMO' +
        'DITIES.COMMODITYORDER')
    SQLConnection = sqlcStrat
    Left = 474
    Top = 54
  end
  object dsqTimeSpaceDeposit: TDataSource
    AutoEdit = False
    DataSet = qTimeSpaceDeposit
    Left = 502
    Top = 54
  end
  object dspTimeSpaceDeposit: TDataSetProvider
    DataSet = qTimeSpaceDeposit
    Left = 530
    Top = 54
  end
  object cdsTimeSpaceDeposit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpaceDeposit'
    Left = 558
    Top = 54
    object cdsTimeSpaceDepositCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDepositDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDepositSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDepositCOMMODITYID: TStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsTimeSpaceDepositDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceDepositDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsTimeSpaceDepositCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceDepositDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceDepositDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceDepositDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceDepositAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      DisplayFormat = '###0'
    end
    object cdsTimeSpaceDepositAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0'
    end
    object cdsTimeSpaceDepositDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceDepositCOMMODITY: TStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsTimeSpaceDepositHOSTUNITID: TIntegerField
      FieldName = 'HOSTUNITID'
      Required = True
    end
    object cdsTimeSpaceDepositUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsTimeSpaceDepositHOSTMINAGE: TFloatField
      FieldName = 'HOSTMINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceDepositHOSTMAXAGE: TFloatField
      FieldName = 'HOSTMAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsTimeSpaceDepositDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsTimeSpaceDepositDEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 150
    end
  end
  object dsTimeSpaceDeposit: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpaceDeposit
    Left = 586
    Top = 54
  end
  object qTimeSpaceDomainHeadings: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      '  CHARTDOMAIN.DOMAINID,CHARTDOMAIN.DOMAINHEADING,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTS2.DEFAULTMINAGE,CHARTS2.DEFAULTMAXAGE,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  DOMAINS.DOMAINNAME,DOMAINTYPES.DOMAINTYPE,'
      '  DOMAINS.MINPLOTAGE,DOMAINS.MAXPLOTAGE'
      'FROM CHARTS2, CHARTDOMAIN, DOMAINTYPES,  DOMAINS'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER')
    SQLConnection = sqlcStrat
    Left = 478
    Top = 342
  end
  object dsqTimeSpaceDomainHeadings: TDataSource
    AutoEdit = False
    DataSet = qTimeSpaceDomainHeadings
    Left = 506
    Top = 342
  end
  object dspTimeSpaceDomainHeadings: TDataSetProvider
    DataSet = qTimeSpaceDomainHeadings
    Left = 534
    Top = 342
  end
  object cdsTimeSpaceDomainHeadings: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpaceDomainHeadings'
    Left = 562
    Top = 342
    object cdsTimeSpaceDomainHeadingsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDomainHeadingsDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDomainHeadingsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsTimeSpaceDomainHeadingsCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceDomainHeadingsDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceDomainHeadingsDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceDomainHeadingsDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
      DisplayFormat = '#####0'
    end
    object cdsTimeSpaceDomainHeadingsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceDomainHeadingsDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsTimeSpaceDomainHeadingsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '###0'
    end
    object cdsTimeSpaceDomainHeadingsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0'
    end
    object cdsTimeSpaceDomainHeadingsDOMAINHEADING: TStringField
      FieldName = 'DOMAINHEADING'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceDomainHeadingsDEFAULTMINAGE: TFloatField
      FieldName = 'DEFAULTMINAGE'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsTimeSpaceDomainHeadingsDEFAULTMAXAGE: TFloatField
      FieldName = 'DEFAULTMAXAGE'
      Required = True
      DisplayFormat = '####0.00'
    end
  end
  object dsTimeSpaceDomainHeadings: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpaceDomainHeadings
    Left = 590
    Top = 342
  end
  object qTimeSpaceDomainColumns: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  CHARTS2.XMIN,CHARTS2.XMAX,CHARTS2.YMIN,CHARTS2.YMAX,'
      '  CHARTS2.DEFAULTMINAGE, CHARTS2.DEFAULTMAXAGE'
      'FROM CHARTS2, CHARTDOMAIN'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER')
    SQLConnection = sqlcStrat
    Left = 478
    Top = 390
  end
  object dsqTimeSpaceDomainColumns: TDataSource
    AutoEdit = False
    DataSet = qTimeSpaceDomainColumns
    Left = 506
    Top = 390
  end
  object dspTimeSpaceDomainColumns: TDataSetProvider
    DataSet = qTimeSpaceDomainColumns
    Left = 534
    Top = 390
  end
  object cdsTimeSpaceDomainColumns: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpaceDomainColumns'
    Left = 562
    Top = 390
    object cdsTimeSpaceDomainColumnsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDomainColumnsDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDomainColumnsCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceDomainColumnsDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceDomainColumnsDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object cdsTimeSpaceDomainColumnsDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object cdsTimeSpaceDomainColumnsXMIN: TIntegerField
      FieldName = 'XMIN'
      Required = True
    end
    object cdsTimeSpaceDomainColumnsXMAX: TIntegerField
      FieldName = 'XMAX'
      Required = True
    end
    object cdsTimeSpaceDomainColumnsYMIN: TIntegerField
      FieldName = 'YMIN'
      Required = True
    end
    object cdsTimeSpaceDomainColumnsYMAX: TIntegerField
      FieldName = 'YMAX'
      Required = True
    end
    object cdsTimeSpaceDomainColumnsDEFAULTMINAGE: TFloatField
      FieldName = 'DEFAULTMINAGE'
      Required = True
    end
    object cdsTimeSpaceDomainColumnsDEFAULTMAXAGE: TFloatField
      FieldName = 'DEFAULTMAXAGE'
      Required = True
    end
  end
  object dsTimeSpaceDomainColumns: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpaceDomainColumns
    Left = 590
    Top = 390
  end
  object qChartDomainDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTDOMAIN.DOMAINORDER,'
      '  CHARTDOMAIN.DOMAINID,'
      '  DOMAINS.DOMAINNAME'
      'from CHARTDOMAIN,DOMAINS'
      'WHERE CHARTDOMAIN.CHARTID = :ChartID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER')
    SQLConnection = sqlcStrat
    Left = 14
    Top = 510
  end
  object dsqChartDomainDomains: TDataSource
    AutoEdit = False
    DataSet = qChartDomainDomains
    Left = 42
    Top = 510
  end
  object dspChartDomainDomains: TDataSetProvider
    DataSet = qChartDomainDomains
    Left = 70
    Top = 510
  end
  object cdsChartDomainDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChartDomainDomains'
    Left = 98
    Top = 510
    object cdsChartDomainDomainsDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsChartDomainDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object cdsChartDomainDomainsqChartDomainUnits: TDataSetField
      FieldName = 'qChartDomainUnits'
    end
  end
  object dsChartDomainDomains: TDataSource
    AutoEdit = False
    DataSet = cdsChartDomainDomains
    Left = 126
    Top = 510
  end
  object sqlcStrat: TSQLConnection
    ConnectionName = 'StratDB_bromo2'
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=fbclient.dll'
      'DataBase=bromo2.usask.ca:s:\data\firebird\stratdb2015v25.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver260.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartInterBaseMetaDataCommandFactory,' +
        'DbxDevartInterBaseDriver260.bpl'
      'DriverUnit=DbxDevartInterBase')
    Left = 36
    Top = 8
  end
  object qTimeSpaceLIP: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ChartMinAge'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ChartMaxAge'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      '  LIPDOMAIN.LIPID,LIPDOMAIN.INC4CHTYN,'
      '  CHARTPOINTS.POINTID, LIPDOMAIN.DOMAINID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  LIPS.CONSTRAINTLEVELID,CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  LIPS.MINPLOTAGE,LIPS.MAXPLOTAGE,LIPS.BARCODEAGE,'
      '  LIPS.LIPNAME,DOMAINS.DOMAINNAME,LIPS.PLOTBARCODE,'
      '  LIPS.LIPHEADING,LIPS.LIPPARENTID,'
      '  LIPS.LIPSIZEID,LIPSIZES.LIPSIZEDESCRIPTION,'
      '  LIPS.LIPRATINGID,LIPRATINGS.LIPRATINGDESCRIPTION,'
      
        '  LIPCOMPOSITIONS.COMPOSITIONID,DOMINANTCOMPOSITION.DOMINANTCOMP' +
        'OSITION'
      'FROM CHARTS2, CHARTDOMAIN,LIPS,DOMAINS,LIPDOMAIN,'
      '  CHARTPOINTS,CONSTRAINTS,USERSWHOFOR,LIPFOR,'
      '  LIPCOMPOSITIONS,DOMINANTCOMPOSITION,LIPRATINGS,LIPSIZES'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=LIPDOMAIN.DOMAINID'
      'AND LIPDOMAIN.LIPID=LIPS.LIPID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND USERSWHOFOR.USERID=:USERID'
      'AND USERSWHOFOR.WHOFORID=LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID=LIPS.LIPID'
      'AND ( '
      '  (LIPS.MINPLOTAGE>=:CHARTMINAGE'
      '   AND LIPS.MINPLOTAGE<=:CHARTMAXAGE) OR'
      '  (LIPS.MAXPLOTAGE>=:CHARTMINAGE'
      '   AND LIPS.MAXPLOTAGE<=:CHARTMAXAGE))'
      'AND LIPS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELID'
      'AND LIPS.LIPID=LIPCOMPOSITIONS.LIPID'
      
        'AND LIPCOMPOSITIONS.COMPOSITIONID=DOMINANTCOMPOSITION.COMPOSITIO' +
        'NID'
      'AND LIPSIZES.LIPSIZEID=LIPS.LIPSIZEID'
      'AND LIPRATINGS.LIPRATINGID=LIPS.LIPRATINGID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER,LIPS.LIPID')
    SQLConnection = sqlcStrat
    Left = 478
    Top = 442
    object qTimeSpaceLIPCHARTID: TIntegerField
      FieldName = 'CHARTID'
      Required = True
    end
    object qTimeSpaceLIPDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      Required = True
    end
    object qTimeSpaceLIPLIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object qTimeSpaceLIPINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qTimeSpaceLIPPOINTID: TSmallintField
      FieldName = 'POINTID'
      Required = True
    end
    object qTimeSpaceLIPDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object qTimeSpaceLIPCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object qTimeSpaceLIPDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
    end
    object qTimeSpaceLIPDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object qTimeSpaceLIPDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object qTimeSpaceLIPCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object qTimeSpaceLIPAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 105
    end
    object qTimeSpaceLIPMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object qTimeSpaceLIPMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object qTimeSpaceLIPLIPNAME: TStringField
      FieldName = 'LIPNAME'
      Required = True
      Size = 150
    end
    object qTimeSpaceLIPDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object qTimeSpaceLIPBARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
    object qTimeSpaceLIPLIPHEADING: TStringField
      FieldName = 'LIPHEADING'
      Size = 60
    end
    object qTimeSpaceLIPLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object qTimeSpaceLIPPLOTBARCODE: TStringField
      FieldName = 'PLOTBARCODE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qTimeSpaceLIPCOMPOSITIONID: TIntegerField
      FieldName = 'COMPOSITIONID'
      Required = True
    end
    object qTimeSpaceLIPDOMINANTCOMPOSITION: TStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      Size = 50
    end
    object qTimeSpaceLIPLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object qTimeSpaceLIPLIPSIZEDESCRIPTION: TStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      Size = 50
    end
    object qTimeSpaceLIPLIPRATINGID: TStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qTimeSpaceLIPLIPRATINGDESCRIPTION: TStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      Size = 30
    end
  end
  object dsqTimeSpaceLIP: TDataSource
    AutoEdit = False
    DataSet = qTimeSpaceLIP
    Left = 506
    Top = 442
  end
  object dspTimeSpaceLIP: TDataSetProvider
    DataSet = qTimeSpaceLIP
    Left = 534
    Top = 442
  end
  object cdsTimeSpaceLIP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpaceLIP'
    Left = 562
    Top = 442
    object cdsTimeSpaceLIPCHARTID: TIntegerField
      FieldName = 'CHARTID'
      Required = True
    end
    object cdsTimeSpaceLIPDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      Required = True
    end
    object cdsTimeSpaceLIPLIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object cdsTimeSpaceLIPINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTimeSpaceLIPPOINTID: TSmallintField
      FieldName = 'POINTID'
      Required = True
    end
    object cdsTimeSpaceLIPDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsTimeSpaceLIPCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceLIPDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceLIPDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object cdsTimeSpaceLIPDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object cdsTimeSpaceLIPCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsTimeSpaceLIPAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 105
    end
    object cdsTimeSpaceLIPMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object cdsTimeSpaceLIPMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object cdsTimeSpaceLIPLIPNAME: TStringField
      FieldName = 'LIPNAME'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceLIPDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceLIPBARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
    object cdsTimeSpaceLIPLIPHEADING: TStringField
      FieldName = 'LIPHEADING'
      Size = 60
    end
    object cdsTimeSpaceLIPLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsTimeSpaceLIPPLOTBARCODE: TStringField
      FieldName = 'PLOTBARCODE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTimeSpaceLIPCOMPOSITIONID: TIntegerField
      FieldName = 'COMPOSITIONID'
      Required = True
    end
    object cdsTimeSpaceLIPDOMINANTCOMPOSITION: TStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      Size = 50
    end
    object cdsTimeSpaceLIPLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsTimeSpaceLIPLIPSIZEDESCRIPTION: TStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsTimeSpaceLIPLIPRATINGID: TStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsTimeSpaceLIPLIPRATINGDESCRIPTION: TStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      Size = 30
    end
  end
  object dsTimeSpaceLIP: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpaceLIP
    Left = 590
    Top = 442
  end
  object qTimeSpaceDomainBoxes: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  DOMAINS.MINPLOTAGE,DOMAINS.MAXPLOTAGE,'
      '  DOMAINS.DOMAINNAME,'
      '  CHARTS2.XMIN,CHARTS2.XMAX,CHARTS2.YMIN,CHARTS2.YMAX'
      'FROM CHARTS2, CHARTDOMAIN,DOMAINS'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER')
    SQLConnection = sqlcStrat
    Left = 222
    Top = 457
  end
  object dsqTimeSpaceDomainBoxes: TDataSource
    AutoEdit = False
    DataSet = qTimeSpaceDomainBoxes
    Left = 250
    Top = 457
  end
  object dspTimeSpaceDomainBoxes: TDataSetProvider
    DataSet = qTimeSpaceDomainBoxes
    Left = 278
    Top = 457
  end
  object cdsTimeSpaceDomainBoxes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpaceDomainBoxes'
    Left = 306
    Top = 457
    object IntegerField4: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
    end
    object IntegerField7: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
      DisplayFormat = '####0.000'
    end
    object IntegerField8: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
      DisplayFormat = '####0.000'
    end
    object IntegerField9: TIntegerField
      FieldName = 'XMIN'
      Required = True
      DisplayFormat = '####0.000'
    end
    object IntegerField10: TIntegerField
      FieldName = 'XMAX'
      Required = True
      DisplayFormat = '####0.000'
    end
    object IntegerField11: TIntegerField
      FieldName = 'YMIN'
      Required = True
      DisplayFormat = '####0.000'
    end
    object IntegerField12: TIntegerField
      FieldName = 'YMAX'
      Required = True
      DisplayFormat = '####0.000'
    end
    object cdsTimeSpaceDomainBoxesMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsTimeSpaceDomainBoxesMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsTimeSpaceDomainBoxesDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
  end
  object dsTimeSpaceDomainBoxes: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpaceDomainBoxes
    Left = 334
    Top = 457
  end
  object qUserChartDomainLIP: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainOrder'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTDOMAIN.DOMAINORDER,'
      '  CHARTDOMAIN.DOMAINID,'
      '  LIPDOMAIN.LIPID,LIPDOMAIN.INC4CHTYN'
      'FROM CHARTDOMAIN, LIPDOMAIN,LIPFOR,USERSWHOFOR'
      'WHERE CHARTDOMAIN.CHARTID=:ChartID'
      'AND CHARTDOMAIN.DOMAINORDER=:DomainOrder'
      'AND CHARTDOMAIN.DOMAINID=LIPDOMAIN.DOMAINID'
      'AND LIPDOMAIN.INC4CHTYN='#39'Y'#39
      'AND LIPFOR.LIPID=LIPDOMAIN.LIPID'
      'AND LIPFOR.WHOFORID=USERSWHOFOR.WHOFORID'
      'AND USERSWHOFOR.USERID=:UserID'
      'ORDER by CHARTDOMAIN.DOMAINORDER,LIPDOMAIN.LIPID')
    SQLConnection = sqlcStrat
    Left = 198
    Top = 414
  end
  object cdsUserChartDomainLIP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserChartDomainLIP'
    Left = 282
    Top = 414
    object cdsUserChartDomainLIPDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      Required = True
    end
    object cdsUserChartDomainLIPDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsUserChartDomainLIPLIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object cdsUserChartDomainLIPINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsUserChartDomainLIP: TDataSource
    AutoEdit = False
    DataSet = cdsUserChartDomainLIP
    Left = 310
    Top = 414
  end
  object dsqUserChartDomainLIP: TDataSource
    AutoEdit = False
    DataSet = qUserChartDomainLIP
    Left = 226
    Top = 414
  end
  object dspUserChartDomainLIP: TDataSetProvider
    DataSet = qUserChartDomainLIP
    Left = 254
    Top = 414
  end
  object qUserChartDomain: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTDOMAIN.DOMAINORDER,'
      '  CHARTDOMAIN.DOMAINID,'
      '  DOMAINS.MINPLOTAGE,DOMAINS.MAXPLOTAGE'
      'FROM CHARTDOMAIN,DOMAINS'
      'WHERE CHARTDOMAIN.CHARTID=:ChartID'
      'AND DOMAINS.DOMAINID=CHARTDOMAIN.DOMAINID'
      'ORDER by CHARTDOMAIN.DOMAINORDER')
    SQLConnection = sqlcStrat
    Left = 198
    Top = 378
  end
  object dsqUserChartDomain: TDataSource
    AutoEdit = False
    DataSet = qUserChartDomain
    Left = 226
    Top = 378
  end
  object dspUserChartDomain: TDataSetProvider
    DataSet = qUserChartDomain
    Left = 254
    Top = 378
  end
  object cdsUserChartDomain: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserChartDomain'
    Left = 282
    Top = 378
    object cdsUserChartDomainDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserChartDomainDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsUserChartDomainMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object cdsUserChartDomainMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
  end
  object dsUserChartDomain: TDataSource
    AutoEdit = False
    DataSet = cdsUserChartDomain
    Left = 310
    Top = 378
  end
  object qTimeSpaceDomainCurves: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CHARTID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomOrderGE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomOrderLT'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      '  CHARTDOMAIN.DOMAINID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  DOMAINS.DOMAINNAME,'
      '  USERDVPDF.CURVEORDER,USERDVPDF.PDFORDER,'
      '  USERDVPDF.AGE,USERDVPDF.PDFVALUE'
      'FROM CHARTS2, CHARTDOMAIN,DOMAINS,USERDVPDF'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND USERDVPDF.USERID = :USERID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND CHARTDOMAIN.DOMAINORDER=USERDVPDF.DOMAINORDER'
      'AND USERDVPDF.CURVEORDER<5'
      'AND USERDVPDF.DOMAINORDER >= :DomOrderGE'
      'AND USERDVPDF.DOMAINORDER <  :DomOrderLT'
      'AND USERDVPDF.PDFVALUE > 2.0'
      
        'ORDER BY CHARTDOMAIN.DOMAINORDER,USERDVPDF.CURVEORDER,USERDVPDF.' +
        'PDFORDER')
    SQLConnection = sqlcStrat
    Left = 470
    Top = 6
  end
  object dsqTimeSpaceDomainCurves: TDataSource
    AutoEdit = False
    DataSet = qTimeSpaceDomainCurves
    Left = 498
    Top = 6
  end
  object dspTimeSpaceDomainCurves: TDataSetProvider
    DataSet = qTimeSpaceDomainCurves
    Left = 526
    Top = 6
  end
  object cdsTimeSpaceDomainCurves: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTimeSpaceDomainCurves'
    Left = 554
    Top = 6
    object cdsTimeSpaceDomainCurvesCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDomainCurvesDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDomainCurvesCURVEORDER: TSmallintField
      FieldName = 'CURVEORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDomainCurvesPDFORDER: TIntegerField
      FieldName = 'PDFORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTimeSpaceDomainCurvesDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsTimeSpaceDomainCurvesCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceDomainCurvesDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
    end
    object cdsTimeSpaceDomainCurvesDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object cdsTimeSpaceDomainCurvesDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object cdsTimeSpaceDomainCurvesDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsTimeSpaceDomainCurvesAGE: TFloatField
      FieldName = 'AGE'
      Required = True
    end
    object cdsTimeSpaceDomainCurvesPDFVALUE: TFloatField
      FieldName = 'PDFVALUE'
      Required = True
    end
  end
  object dsTimeSpaceDomainCurves: TDataSource
    AutoEdit = False
    DataSet = cdsTimeSpaceDomainCurves
    Left = 582
    Top = 6
  end
  object qDeleteUserDVCurves: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM USERDVPDF'
      'WHERE USERDVPDF.USERID=:UserID')
    SQLConnection = sqlcStrat
    Left = 660
    Top = 4
  end
  object qAddToPDF: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcStrat
    Left = 372
    Top = 56
  end
  object qChartUsers: TSQLQuery
    DataSource = dsqChart
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTUSER.CHARTID, CHARTUSER.USERID'
      'FROM CHARTUSER'
      'WHERE CHARTUSER.CHARTID=:ChartID'
      'ORDER by CHARTUSER.USERID')
    SQLConnection = sqlcStrat
    Left = 222
    Top = 102
    object qChartUsersCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qChartUsersUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object cdsChartUsers: TClientDataSet
    Aggregates = <>
    DataSetField = cdsChartqChartUsers
    Params = <>
    Left = 250
    Top = 102
    object cdsChartUsersCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartUsersUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsChartUsers: TDataSource
    AutoEdit = False
    DataSet = cdsChartUsers
    Left = 278
    Top = 102
  end
  object qNewChartUser: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO CHARTUSER'
      '(ChartID, UserID)'
      'Values (:ChartID, :UserID)')
    SQLConnection = sqlcStrat
    Left = 288
    Top = 335
  end
  object qDeleteDomain: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM STRATDOMAIN2'
      'WHERE STRATDOMAIN2.UNITID = :UnitID'
      'and STRATDOMAIN2.DOMAINID = :DomainID'
      '')
    SQLConnection = sqlcStrat
    Left = 776
    Top = 460
  end
  object qInsertDomain: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'DomainID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ContinentID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DomainName'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DomainParentID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DomainTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO DOMAINS'
      
        '(DomainID, ContinentID, DomainName, DomainParentID, DomainTypeID' +
        ')'
      
        'Values (:DomainID, :ContinentID, :DomainName, :DomainParentID, :' +
        'DomainTypeID)'
      '')
    SQLConnection = sqlcStrat
    Left = 848
    Top = 460
  end
  object qNewDomainName: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NewDomainName'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME'
      'FROM DOMAINS'
      'WHERE DOMAINS.DOMAINNAME = :NewDomainName ')
    SQLConnection = sqlcStrat
    Left = 774
    Top = 506
  end
  object dspNewDomainName: TDataSetProvider
    DataSet = qNewDomainName
    Left = 802
    Top = 506
  end
  object cdsNewDomainName: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNewDomainName'
    Left = 830
    Top = 506
    object cdsNewDomainNameDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNewDomainNameCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsNewDomainNameDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
  end
  object dsNewDomainName: TDataSource
    AutoEdit = False
    DataSet = cdsNewDomainName
    Left = 858
    Top = 506
  end
  object qChartsList: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'OwnerID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTS2.CHARTID,CHARTS2.CHART,'
      '  CHARTS2.CHARTOFFSET_MM,CHARTS2.DEFAULTDOMAINOFFSET,'
      '  CHARTS2.OWNERID,CHARTS2.XMIN,CHARTS2.XMAX,'
      '  CHARTS2.YMIN,CHARTS2.YMAX,'
      '  CHARTS2.DEFAULTMINAGE,CHARTS2.DEFAULTMAXAGE'
      'FROM CHARTS2'
      'WHERE CHARTS2.OWNERID=:OwnerID'
      'ORDER by CHARTS2.CHARTID')
    SQLConnection = sqlcStrat
    Left = 326
    Top = 138
  end
  object dspChartsList: TDataSetProvider
    DataSet = qChartsList
    Left = 354
    Top = 138
  end
  object cdsChartsList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChartsList'
    Left = 382
    Top = 138
    object cdsChartsListCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartsListCHART: TStringField
      FieldName = 'CHART'
      Required = True
      Size = 50
    end
    object cdsChartsListCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsChartsListDEFAULTDOMAINOFFSET: TIntegerField
      FieldName = 'DEFAULTDOMAINOFFSET'
      Required = True
    end
    object cdsChartsListOWNERID: TStringField
      FieldName = 'OWNERID'
      Required = True
    end
    object cdsChartsListXMIN: TIntegerField
      FieldName = 'XMIN'
      Required = True
    end
    object cdsChartsListXMAX: TIntegerField
      FieldName = 'XMAX'
      Required = True
    end
    object cdsChartsListYMIN: TIntegerField
      FieldName = 'YMIN'
      Required = True
    end
    object cdsChartsListYMAX: TIntegerField
      FieldName = 'YMAX'
      Required = True
    end
    object cdsChartsListDEFAULTMINAGE: TFloatField
      FieldName = 'DEFAULTMINAGE'
      Required = True
    end
    object cdsChartsListDEFAULTMAXAGE: TFloatField
      FieldName = 'DEFAULTMAXAGE'
      Required = True
    end
  end
  object dsChartsList: TDataSource
    AutoEdit = False
    DataSet = cdsChartsList
    Left = 410
    Top = 138
  end
  object qUserChartDomainUnit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainOrder'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTDOMAIN.DOMAINORDER,'
      '  CHARTDOMAIN.DOMAINID,'
      '  STRATDOMAIN.UNITID,  STRATDOMAIN.INC4CHTYN'
      'FROM CHARTDOMAIN, STRATDOMAIN,UNITFOR,USERSWHOFOR'
      'WHERE CHARTDOMAIN.CHARTID=:ChartID'
      'AND CHARTDOMAIN.DOMAINORDER=:DomainOrder'
      'AND CHARTDOMAIN.DOMAINID=STRATDOMAIN.DOMAINID'
      'AND STRATDOMAIN.INC4CHTYN='#39'Y'#39
      'AND UNITFOR.UNITID=STRATDOMAIN.UNITID'
      'AND UNITFOR.WHOFORID=USERSWHOFOR.WHOFORID'
      'AND USERSWHOFOR.USERID=:UserID'
      'ORDER by CHARTDOMAIN.DOMAINORDER,STRATDOMAIN.UNITID'
      '')
    SQLConnection = sqlcStrat
    Left = 472
    Top = 552
  end
  object dsqUserChartDomainUnit: TDataSource
    AutoEdit = False
    DataSet = qUserChartDomainUnit
    Left = 506
    Top = 550
  end
  object dspUserChartDomainUnit: TDataSetProvider
    DataSet = qUserChartDomainUnit
    Left = 534
    Top = 550
  end
  object cdsUserChartDomainUnit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserChartDomainUnit'
    Left = 562
    Top = 550
    object cdsUserChartDomainUnitDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      Required = True
    end
    object cdsUserChartDomainUnitDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsUserChartDomainUnitUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsUserChartDomainUnitINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsUserChartDomainUnit: TDataSource
    AutoEdit = False
    DataSet = cdsUserChartDomainUnit
    Left = 590
    Top = 550
  end
  object qAAA: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcStrat
    Left = 464
    Top = 616
  end
  object qChartDomainDomainsLIP: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTDOMAIN.DOMAINORDER,'
      '  CHARTDOMAIN.DOMAINID,'
      '  DOMAINS.DOMAINNAME'
      'from CHARTDOMAIN,DOMAINS'
      'WHERE CHARTDOMAIN.CHARTID = :ChartID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER'
      '')
    SQLConnection = sqlcStrat
    Left = 248
    Top = 528
  end
  object dsqChartDomainDomainsLIP: TDataSource
    DataSet = qChartDomainDomainsLIP
    Left = 280
    Top = 528
  end
  object dspChartDomainDomainsLIP: TDataSetProvider
    DataSet = qChartDomainDomainsLIP
    Left = 312
    Top = 528
  end
  object cdsChartDomainDomainsLIP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChartDomainDomainsLIP'
    Left = 344
    Top = 528
    object cdsChartDomainDomainsLIPDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainDomainsLIPDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsChartDomainDomainsLIPDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object cdsChartDomainDomainsLIPqChartDomainLIPs: TDataSetField
      FieldName = 'qChartDomainLIPs'
    end
  end
  object dsChartDomainDomainsLIP: TDataSource
    DataSet = cdsChartDomainDomainsLIP
    Left = 376
    Top = 528
  end
  object qChartDomainLIPs: TSQLQuery
    DataSource = dsqChartDomainDomainsLIP
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainOrder'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTDOMAIN.DOMAINORDER,'
      '  LIPDOMAIN.DOMAINID,LIPDOMAIN.LIPID,'
      '  LIPDOMAIN.INC4CHTYN,'
      '  DOMAINS.DOMAINNAME,'
      '  LIPS.CONTINENTID,LIPS.LIPNAME,'
      '  LIPS.LIPHEADING,LIPS.LIPPARENTID,'
      '  LIPS.CONTOCEANID, LIPS.LIPSIZEID,'
      '  LIPS.MINPLOTAGE,LIPS.MAXPLOTAGE,LIPS.BARCODEAGE,'
      '  LIPSIZES.LIPSIZEDESCRIPTION,LIPS.PLOTBARCODE,'
      '  LIPS.CONSTRAINTLEVELID,CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  LIPS.LIPRATINGID,LIPS.AREALEXTENT,LIPS.VOLUMEESTIMATE,'
      '  LIPRATINGS.LIPRATINGDESCRIPTION,'
      
        '  LIPCOMPOSITIONS.COMPOSITIONID,DOMINANTCOMPOSITION.DOMINANTCOMP' +
        'OSITION'
      'from CHARTDOMAIN,LIPDOMAIN,LIPS,LIPSIZES,DOMAINS,'
      '  CONSTRAINTS,LIPRATINGS,'
      '  USERSWHOFOR,LIPFOR,LIPCOMPOSITIONS,DOMINANTCOMPOSITION'
      'WHERE CHARTDOMAIN.DOMAINID = :DomainID'
      'AND CHARTDOMAIN.DOMAINORDER = :DomainOrder'
      'AND USERSWHOFOR.USERID=:UserID'
      'AND USERSWHOFOR.WHOFORID=LIPFOR.WHOFORID'
      'AND LIPS.LIPID=LIPFOR.LIPID'
      'AND CHARTDOMAIN.DOMAINID=LIPDOMAIN.DOMAINID'
      'AND LIPDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND LIPDOMAIN.LIPID=LIPS.LIPID'
      'AND LIPS.LIPSIZEID=LIPSIZES.LIPSIZEID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND ( '
      '  (LIPS.MINPLOTAGE>=:CHARTMINAGE '
      '   AND LIPS.MINPLOTAGE<=:CHARTMAXAGE) OR'
      '  (LIPS.MAXPLOTAGE>=:CHARTMINAGE '
      '   AND LIPS.MAXPLOTAGE<=:CHARTMAXAGE))'
      'AND LIPS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELID'
      'AND LIPS.LIPRATINGID=LIPRATINGS.LIPRATINGID'
      'AND LIPS.LIPID=LIPCOMPOSITIONS.LIPID'
      
        'AND LIPCOMPOSITIONS.COMPOSITIONID=DOMINANTCOMPOSITION.COMPOSITIO' +
        'NID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER,LIPS.MINPLOTAGE'
      '')
    SQLConnection = sqlcStrat
    Left = 248
    Top = 576
  end
  object cdsChartDomainLIPs: TClientDataSet
    Aggregates = <>
    DataSetField = cdsChartDomainDomainsLIPqChartDomainLIPs
    Params = <>
    Left = 280
    Top = 576
    object cdsChartDomainLIPsDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainLIPsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsChartDomainLIPsLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainLIPsINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartDomainLIPsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object cdsChartDomainLIPsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsChartDomainLIPsLIPNAME: TStringField
      FieldName = 'LIPNAME'
      Required = True
      Size = 50
    end
    object cdsChartDomainLIPsLIPHEADING: TStringField
      FieldName = 'LIPHEADING'
      Size = 25
    end
    object cdsChartDomainLIPsLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsChartDomainLIPsCONTOCEANID: TStringField
      FieldName = 'CONTOCEANID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartDomainLIPsLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsChartDomainLIPsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object cdsChartDomainLIPsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object cdsChartDomainLIPsBARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
    object cdsChartDomainLIPsLIPSIZEDESCRIPTION: TStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsChartDomainLIPsPLOTBARCODE: TStringField
      FieldName = 'PLOTBARCODE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartDomainLIPsCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsChartDomainLIPsAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 35
    end
    object cdsChartDomainLIPsLIPRATINGID: TStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartDomainLIPsAREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
    end
    object cdsChartDomainLIPsVOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
    end
    object cdsChartDomainLIPsLIPRATINGDESCRIPTION: TStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      Size = 30
    end
    object cdsChartDomainLIPsCOMPOSITIONID: TIntegerField
      FieldName = 'COMPOSITIONID'
      Required = True
    end
    object cdsChartDomainLIPsDOMINANTCOMPOSITION: TStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      Size = 50
    end
  end
  object dsChartDomainLIPs: TDataSource
    DataSet = cdsChartDomainLIPs
    Left = 312
    Top = 576
  end
  object qChartDomainDomainsLIPUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTDOMAIN.CHARTID, CHARTDOMAIN.DOMAINORDER,'
      '  CHARTDOMAIN.DOMAINID,'
      '  DOMAINS.DOMAINNAME'
      'from CHARTDOMAIN,DOMAINS'
      'WHERE CHARTDOMAIN.CHARTID = :ChartID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER')
    SQLConnection = sqlcStrat
    Left = 288
    Top = 632
  end
  object qChartDomainLIPsUnits: TSQLQuery
    DataSource = dsqChartDomainDomainsLIPUnits
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DomainOrder'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTDOMAIN.CHARTID,'
      '  CHARTDOMAIN.DOMAINORDER,'
      '  LIPDOMAIN.DOMAINID,LIPDOMAIN.LIPID,'
      '  LIPDOMAIN.INC4CHTYN,'
      '  DOMAINS.DOMAINNAME,'
      '  LIPS.CONTINENTID,LIPS.LIPNAME,'
      '  LIPS.LIPHEADING,LIPS.LIPPARENTID,'
      '  LIPS.CONTOCEANID, LIPS.LIPSIZEID,'
      '  LIPS.MINPLOTAGE,LIPS.MAXPLOTAGE,LIPS.BARCODEAGE,'
      '  LIPSIZES.LIPSIZEDESCRIPTION,LIPS.PLOTBARCODE,'
      '  LIPS.CONSTRAINTLEVELID,CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  LIPS.LIPRATINGID,LIPS.AREALEXTENT,LIPS.VOLUMEESTIMATE,'
      '  LIPRATINGS.LIPRATINGDESCRIPTION,'
      
        '  LIPCOMPOSITIONS.COMPOSITIONID,DOMINANTCOMPOSITION.DOMINANTCOMP' +
        'OSITION'
      'from CHARTDOMAIN,LIPDOMAIN,LIPS,LIPSIZES,DOMAINS,'
      '  CONSTRAINTS,LIPRATINGS,'
      '  USERSWHOFOR,LIPFOR,LIPCOMPOSITIONS,DOMINANTCOMPOSITION'
      'WHERE CHARTDOMAIN.CHARTID = :ChartID'
      'AND CHARTDOMAIN.DOMAINID = :DomainID'
      'AND CHARTDOMAIN.DOMAINORDER = :DomainOrder'
      'AND USERSWHOFOR.USERID=:UserID'
      'AND USERSWHOFOR.WHOFORID=LIPFOR.WHOFORID'
      'AND LIPS.LIPID=LIPFOR.LIPID'
      'AND CHARTDOMAIN.DOMAINID=LIPDOMAIN.DOMAINID'
      'AND LIPDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND LIPDOMAIN.LIPID=LIPS.LIPID'
      'AND LIPS.LIPSIZEID=LIPSIZES.LIPSIZEID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND ( '
      '  (LIPS.MINPLOTAGE>=:CHARTMINAGE '
      '   AND LIPS.MINPLOTAGE<=:CHARTMAXAGE) OR'
      '  (LIPS.MAXPLOTAGE>=:CHARTMINAGE '
      '   AND LIPS.MAXPLOTAGE<=:CHARTMAXAGE))'
      'AND LIPS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELID'
      'AND LIPS.LIPRATINGID=LIPRATINGS.LIPRATINGID'
      'AND LIPS.LIPID=LIPCOMPOSITIONS.LIPID'
      
        'AND LIPCOMPOSITIONS.COMPOSITIONID=DOMINANTCOMPOSITION.COMPOSITIO' +
        'NID'
      
        'ORDER BY CHARTDOMAIN.DOMAINORDER,LIPS.LIPPARENTID,LIPS.MINPLOTAG' +
        'E')
    SQLConnection = sqlcStrat
    Left = 288
    Top = 680
  end
  object qChartLIPUnits: TSQLQuery
    DataSource = dsqChartDomainLIPsUnits
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTDOMAIN.CHARTID,'
      '  CHARTDOMAIN.DOMAINORDER,'
      '  STRATDOMAIN.DOMAINID,STRATDOMAIN.UNITID,'
      '  STRATDOMAIN.INC4CHTYN,'
      '  LIPDOMAIN.DOMAINID,LIPDOMAIN.LIPID,'
      '  STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME,'
      '  STRATUNITS.RANKID, STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,'
      '  STRATUNITS.CONSTRAINTLEVELID,CONSTRAINTS.AGECONSTRAINTLEVEL'
      'FROM CHARTDOMAIN,STRATDOMAIN,STRATUNITS,RANKS,'
      '  CONSTRAINTS,LIPDOMAIN,STRATLIP,'
      '  USERSWHOFOR,UNITFOR'
      'WHERE CHARTDOMAIN.CHARTID = :ChartID '
      'AND CHARTDOMAIN.DOMAINID = :DomainID'
      'AND USERSWHOFOR.USERID=:UserID'
      'AND LIPDOMAIN.LIPID = :LIPID'
      'AND USERSWHOFOR.WHOFORID=UNITFOR.WHOFORID'
      'AND LIPDOMAIN.DOMAINID = CHARTDOMAIN.DOMAINID'
      'AND STRATLIP.UNITID = STRATUNITS.UNITID'
      'AND STRATLIP.LIPID = LIPDOMAIN.LIPID'
      'AND STRATUNITS.UNITID=UNITFOR.UNITID'
      'AND CHARTDOMAIN.DOMAINID=STRATDOMAIN.DOMAINID'
      'AND STRATDOMAIN.UNITID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND ('
      '  (STRATUNITS.MINAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MINAGE<=:CHARTMAXAGE) OR'
      '  (STRATUNITS.MAXAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MAXAGE<=:CHARTMAXAGE))'
      'AND STRATUNITS.APPROVALID <> '#39'HS'#39
      'AND STRATUNITS.APPROVALID <> '#39'NA'#39
      
        'AND STRATUNITS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELI' +
        'D'
      
        'ORDER BY CHARTDOMAIN.DOMAINORDER,LIPDOMAIN.LIPID,STRATUNITS.MINA' +
        'GE')
    SQLConnection = sqlcStrat
    Left = 288
    Top = 728
  end
  object dsqChartDomainDomainsLIPUnits: TDataSource
    DataSet = qChartDomainDomainsLIPUnits
    Left = 320
    Top = 632
  end
  object dsqChartDomainLIPsUnits: TDataSource
    DataSet = qChartDomainLIPsUnits
    Left = 320
    Top = 680
  end
  object dspChartDomainDomainsLIPUnits: TDataSetProvider
    DataSet = qChartDomainDomainsLIPUnits
    Left = 352
    Top = 632
  end
  object cdsChartDomainDomainsLIPUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChartDomainDomainsLIPUnits'
    Left = 384
    Top = 632
    object cdsChartDomainDomainsLIPUnitsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainDomainsLIPUnitsDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainDomainsLIPUnitsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsChartDomainDomainsLIPUnitsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object cdsChartDomainDomainsLIPUnitsqChartDomainLIPsUnits: TDataSetField
      FieldName = 'qChartDomainLIPsUnits'
    end
  end
  object cdsChartDomainLIPsUnits: TClientDataSet
    Aggregates = <>
    DataSetField = cdsChartDomainDomainsLIPUnitsqChartDomainLIPsUnits
    Params = <>
    Left = 352
    Top = 680
    object cdsChartDomainLIPsUnitsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainLIPsUnitsDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainLIPsUnitsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsChartDomainLIPsUnitsLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartDomainLIPsUnitsINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartDomainLIPsUnitsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object cdsChartDomainLIPsUnitsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsChartDomainLIPsUnitsLIPNAME: TStringField
      FieldName = 'LIPNAME'
      Required = True
      Size = 50
    end
    object cdsChartDomainLIPsUnitsLIPHEADING: TStringField
      FieldName = 'LIPHEADING'
      Size = 25
    end
    object cdsChartDomainLIPsUnitsLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsChartDomainLIPsUnitsCONTOCEANID: TStringField
      FieldName = 'CONTOCEANID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartDomainLIPsUnitsLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsChartDomainLIPsUnitsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object cdsChartDomainLIPsUnitsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object cdsChartDomainLIPsUnitsBARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
    object cdsChartDomainLIPsUnitsLIPSIZEDESCRIPTION: TStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsChartDomainLIPsUnitsPLOTBARCODE: TStringField
      FieldName = 'PLOTBARCODE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartDomainLIPsUnitsCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsChartDomainLIPsUnitsAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 35
    end
    object cdsChartDomainLIPsUnitsLIPRATINGID: TStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartDomainLIPsUnitsAREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
    end
    object cdsChartDomainLIPsUnitsVOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
    end
    object cdsChartDomainLIPsUnitsLIPRATINGDESCRIPTION: TStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      Size = 30
    end
    object cdsChartDomainLIPsUnitsCOMPOSITIONID: TIntegerField
      FieldName = 'COMPOSITIONID'
      Required = True
    end
    object cdsChartDomainLIPsUnitsDOMINANTCOMPOSITION: TStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      Size = 50
    end
    object cdsChartDomainLIPsUnitsqChartLIPUnits: TDataSetField
      FieldName = 'qChartLIPUnits'
    end
  end
  object cdsChartLIPUnits: TClientDataSet
    Aggregates = <>
    DataSetField = cdsChartDomainLIPsUnitsqChartLIPUnits
    Params = <>
    Left = 320
    Top = 728
    object cdsChartLIPUnitsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartLIPUnitsDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartLIPUnitsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsChartLIPUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartLIPUnitsINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartLIPUnitsLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartLIPUnitsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsChartLIPUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsChartLIPUnitsRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsChartLIPUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
    object cdsChartLIPUnitsMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsChartLIPUnitsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsChartLIPUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsChartLIPUnitsCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsChartLIPUnitsAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 35
    end
  end
  object dsChartDomainDomainsLIPUnits: TDataSource
    DataSet = cdsChartDomainDomainsLIPUnits
    Left = 416
    Top = 632
  end
  object dsChartDomainLIPsUnits: TDataSource
    DataSet = cdsChartDomainLIPsUnits
    Left = 384
    Top = 680
  end
  object dsChartLIPUnits: TDataSource
    DataSet = cdsChartLIPUnits
    Left = 352
    Top = 728
  end
  object qChartMapUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTDOMAIN.CHARTID,'
      '  STRATMAPS2.UNITID, STRATMAPS2.MAPID2,'
      '  STRATMAPS2.GISINT, STRATMAPS2.GISSTR,'
      '  STRATMAPS2.INCL4MAP,'
      '  MAPS2.MAPNAME,'
      '  STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME,'
      '  STRATUNITS.RANKID, STRATUNITS.AGEYEARS,STRATUNITS.PARENTID,'
      '  STRATUNITS.MINAGE,STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,'
      '  STRATUNITS.CONSTRAINTLEVELID,CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  STRATUNITS.MINAGE,STRATUNITS.MAXAGE,RANKS.RANKWIDTH,'
      '  STRATUNITS.AGEYEARS, RANKS.UNITRANK,'
      '  ROCKCLASSES.ROCKCLASS,ROCKCLASSES.ROCKCLASSID2,'
      '  ROCKCLASSES.ROCKCLASSFUNDAMENTAL,'
      '  SETTINGS.SETTING,SETTINGS.SETTINGIDCOMBINED,'
      '  UNITSETTING.SETTINGID,UNITROCKCLASS.ROCKCLASSID,'
      '  STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID,'
      '  DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT'
      
        'from MAPS2,CHARTDOMAIN,STRATMAPS2,STRATUNITS,RANKS,APPROVALSTATU' +
        'S,'
      '  ROCKCLASSES,SETTINGS,UNITROCKCLASS,UNITSETTING,'
      '  CONSTRAINTS,STRATSEDENVIRONMENT,DEPOSITIONNVIRONMENT,'
      '  USERSWHOFOR,UNITFOR,STRATDOMAIN'
      'WHERE CHARTDOMAIN.CHARTID = :ChartID'
      'AND USERSWHOFOR.USERID=:UserID'
      'AND USERSWHOFOR.WHOFORID=UNITFOR.WHOFORID'
      'AND CHARTDOMAIN.DOMAINID=STRATDOMAIN.DOMAINID'
      'AND STRATDOMAIN.UNITID=STRATMAPS2.UNITID'
      'AND STRATMAPS2.MAPID2=MAPS2.MAPID2'
      'AND STRATUNITS.UNITID=UNITFOR.UNITID'
      'AND STRATMAPS2.UNITID=UNITFOR.UNITID'
      'AND STRATMAPS2.UNITID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND ('
      '  (STRATUNITS.MINAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MINAGE<=:CHARTMAXAGE) OR'
      '  (STRATUNITS.MAXAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MAXAGE<=:CHARTMAXAGE))'
      'AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID'
      'AND STRATUNITS.UNITID=UNITSETTING.UNITID'
      'AND UNITROCKCLASS.ROCKCLASSID=ROCKCLASSES.ROCKCLASSID'
      'AND UNITSETTING.SETTINGID=SETTINGS.SETTINGID'
      'AND STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'AND APPROVALSTATUS.INC4MAP = '#39'Y'#39
      
        'AND STRATUNITS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELI' +
        'D'
      'AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID'
      
        'AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRON' +
        'MENT.DEPOSITIONENVIRONMENTID'
      'ORDER BY STRATMAPS2.MAPID2,STRATUNITS.MINAGE')
    SQLConnection = sqlcStrat
    Left = 16
    Top = 632
  end
  object dspChartMapUnits: TDataSetProvider
    DataSet = qChartMapUnits
    Left = 48
    Top = 632
  end
  object cdsChartMapUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChartMapUnits'
    Left = 80
    Top = 632
    object cdsChartMapUnitsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartMapUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartMapUnitsMAPID2: TStringField
      FieldName = 'MAPID2'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartMapUnitsGISINT: TIntegerField
      FieldName = 'GISINT'
      Required = True
    end
    object cdsChartMapUnitsGISSTR: TStringField
      FieldName = 'GISSTR'
      Required = True
    end
    object cdsChartMapUnitsINCL4MAP: TStringField
      FieldName = 'INCL4MAP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartMapUnitsMAPNAME: TStringField
      FieldName = 'MAPNAME'
      Required = True
      Size = 50
    end
    object cdsChartMapUnitsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsChartMapUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsChartMapUnitsRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsChartMapUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
    object cdsChartMapUnitsMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsChartMapUnitsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsChartMapUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsChartMapUnitsCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsChartMapUnitsAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 35
    end
    object cdsChartMapUnitsRANKWIDTH: TSmallintField
      FieldName = 'RANKWIDTH'
    end
    object cdsChartMapUnitsROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object cdsChartMapUnitsROCKCLASSID2: TStringField
      FieldName = 'ROCKCLASSID2'
      Required = True
      Size = 2
    end
    object cdsChartMapUnitsROCKCLASSFUNDAMENTAL: TStringField
      FieldName = 'ROCKCLASSFUNDAMENTAL'
      Required = True
      Size = 2
    end
    object cdsChartMapUnitsSETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object cdsChartMapUnitsSETTINGIDCOMBINED: TStringField
      FieldName = 'SETTINGIDCOMBINED'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsChartMapUnitsSETTINGID: TStringField
      FieldName = 'SETTINGID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsChartMapUnitsROCKCLASSID: TStringField
      FieldName = 'ROCKCLASSID'
      Required = True
      Size = 2
    end
    object cdsChartMapUnitsDEPOSITIONENVIRONMENTID: TStringField
      FieldName = 'DEPOSITIONENVIRONMENTID'
      Required = True
      Size = 1
    end
    object cdsChartMapUnitsDEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object cdsChartMapUnitsPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
  end
  object dsChartMapUnits: TDataSource
    DataSet = cdsChartMapUnits
    Left = 112
    Top = 632
  end
  object qUnconformities: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      '  STRATDOMAIN.UNITID,STRATDOMAIN.INC4CHTYN,'
      '  STRATDOMAIN.DOMAINID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  STRATUNITS.UNITOFFSET_MM AS UNITOFFSET_MM,'
      '  DOMAINS.DOMAINNAME,'
      '  STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME,'
      '  STRATUNITS.RANKID, STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,'
      '  STRATUNITS.CONSTRAINTLEVELID,CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  RANKS.RANKWIDTH,'
      '  PRECEDING.PREREL, PRECEDING.PRECEDEDBY, STRATREL.RELATIONSHIP'
      
        'from CHARTS2,CHARTDOMAIN,STRATDOMAIN,STRATUNITS,RANKS,DOMAINS,ST' +
        'RATREL,'
      '  CONSTRAINTS,USERSWHOFOR,UNITFOR,PRECEDING'
      'WHERE CHARTDOMAIN.CHARTID = :ChartID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND USERSWHOFOR.USERID=:UserID'
      'AND USERSWHOFOR.WHOFORID=UNITFOR.WHOFORID'
      'AND STRATUNITS.UNITID=UNITFOR.UNITID'
      'AND CHARTDOMAIN.DOMAINID=STRATDOMAIN.DOMAINID'
      'AND STRATDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND STRATDOMAIN.UNITID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND ( '
      '  (STRATUNITS.MINAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MINAGE<=:CHARTMAXAGE) OR'
      '  (STRATUNITS.MAXAGE>=:CHARTMINAGE '
      '   AND STRATUNITS.MAXAGE<=:CHARTMAXAGE))'
      'AND STRATUNITS.APPROVALID <> '#39'HS'#39
      'AND STRATUNITS.APPROVALID <> '#39'NA'#39
      
        'AND STRATUNITS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELI' +
        'D'
      'AND STRATUNITS.UNITID=PRECEDING.UNITID'
      'AND PRECEDING.PREREL=STRATREL.RELATIONSHIPID'
      'AND STRATREL.RELPOSID='#39'P'#39
      
        'AND ((STRATREL.RELATIONSHIPID='#39'UNCO'#39') or (STRATREL.RELATIONSHIPI' +
        'D='#39'DISO'#39'))'
      'ORDER BY CHARTDOMAIN.DOMAINORDER,STRATUNITS.MAXAGE')
    SQLConnection = sqlcStrat
    Left = 16
    Top = 688
  end
  object dspUnconformities: TDataSetProvider
    DataSet = qUnconformities
    Left = 48
    Top = 688
  end
  object cdsUnconformities: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnconformities'
    Left = 80
    Top = 688
    object cdsUnconformitiesCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnconformitiesDOMAINORDER: TSmallintField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnconformitiesUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnconformitiesINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsUnconformitiesDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsUnconformitiesCHARTOFFSET_MM: TIntegerField
      FieldName = 'CHARTOFFSET_MM'
      Required = True
    end
    object cdsUnconformitiesDOMAINOFFSET_MM: TIntegerField
      FieldName = 'DOMAINOFFSET_MM'
      Required = True
    end
    object cdsUnconformitiesDOMAINXMIN: TIntegerField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object cdsUnconformitiesDOMAINXMAX: TIntegerField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object cdsUnconformitiesUNITOFFSET_MM: TIntegerField
      FieldName = 'UNITOFFSET_MM'
      Required = True
    end
    object cdsUnconformitiesDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object cdsUnconformitiesCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsUnconformitiesUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsUnconformitiesRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsUnconformitiesAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
    object cdsUnconformitiesMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsUnconformitiesUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsUnconformitiesCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsUnconformitiesAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 35
    end
    object cdsUnconformitiesRANKWIDTH: TSmallintField
      FieldName = 'RANKWIDTH'
    end
    object cdsUnconformitiesPREREL: TStringField
      FieldName = 'PREREL'
      Required = True
      Size = 5
    end
    object cdsUnconformitiesPRECEDEDBY: TIntegerField
      FieldName = 'PRECEDEDBY'
      Required = True
    end
    object cdsUnconformitiesRELATIONSHIP: TStringField
      FieldName = 'RELATIONSHIP'
      Required = True
      Size = 30
    end
  end
  object dsUnconformities: TDataSource
    DataSet = cdsUnconformities
    Left = 112
    Top = 688
  end
  object qChartMapLIPs: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ChartID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTDOMAIN.CHARTID,'
      '  LIPS.CONTINENTID,'
      '  LIPMAPS2.LIPID,LIPS.LIPNAME,LIPMAPS2.MAPID2,'
      '  LIPMAPS2.GISINT, LIPMAPS2.GISSTR,'
      '  LIPMAPS2.INCL4MAP,'
      '  MAPS2.MAPNAME,'
      '  LIPS.CONSTRAINTLEVELID,CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  LIPS.MINPLOTAGE,LIPS.MAXPLOTAGE,LIPS.BARCODEAGE,'
      '  LIPS.PLOTBARCODE,'
      '  LIPS.LIPHEADING,LIPS.LIPPARENTID,'
      '  LIPS.LIPSIZEID,LIPSIZES.LIPSIZEDESCRIPTION,'
      '  LIPS.LIPRATINGID,LIPRATINGS.LIPRATINGDESCRIPTION,'
      
        '  LIPCOMPOSITIONS.COMPOSITIONID,DOMINANTCOMPOSITION.DOMINANTCOMP' +
        'OSITION'
      'FROM CHARTDOMAIN,LIPS,LIPDOMAIN,'
      '  CONSTRAINTS,USERSWHOFOR,LIPFOR,MAPS2,LIPMAPS2,'
      '  LIPCOMPOSITIONS,DOMINANTCOMPOSITION,LIPRATINGS,LIPSIZES'
      'WHERE CHARTDOMAIN.CHARTID= :CHARTID'
      'AND CHARTDOMAIN.DOMAINID=LIPDOMAIN.DOMAINID'
      'AND LIPDOMAIN.LIPID=LIPMAPS2.LIPID'
      'AND LIPDOMAIN.LIPID=LIPS.LIPID'
      'AND USERSWHOFOR.USERID=:USERID'
      'AND USERSWHOFOR.WHOFORID=LIPFOR.WHOFORID'
      'AND LIPMAPS2.MAPID2=MAPS2.MAPID2'
      'AND LIPFOR.LIPID=LIPS.LIPID'
      'AND ( '
      '  (LIPS.MINPLOTAGE>=:CHARTMINAGE'
      '   AND LIPS.MINPLOTAGE<=:CHARTMAXAGE) OR'
      '  (LIPS.MAXPLOTAGE>=:CHARTMINAGE'
      '   AND LIPS.MAXPLOTAGE<=:CHARTMAXAGE))'
      'AND LIPS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELID'
      'AND LIPS.LIPID=LIPCOMPOSITIONS.LIPID'
      
        'AND LIPCOMPOSITIONS.COMPOSITIONID=DOMINANTCOMPOSITION.COMPOSITIO' +
        'NID'
      'AND LIPSIZES.LIPSIZEID=LIPS.LIPSIZEID'
      'AND LIPRATINGS.LIPRATINGID=LIPS.LIPRATINGID'
      'ORDER BY CHARTDOMAIN.DOMAINORDER,LIPS.MINPLOTAGE')
    SQLConnection = sqlcStrat
    Left = 16
    Top = 736
  end
  object dspChartMapLIPs: TDataSetProvider
    DataSet = qChartMapLIPs
    Left = 48
    Top = 736
  end
  object cdsChartMapLIPs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChartMapLIPs'
    Left = 80
    Top = 736
    object cdsChartMapLIPsCHARTID: TIntegerField
      FieldName = 'CHARTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartMapLIPsLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartMapLIPsLIPNAME: TStringField
      FieldName = 'LIPNAME'
      Required = True
      Size = 50
    end
    object cdsChartMapLIPsMAPID2: TStringField
      FieldName = 'MAPID2'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartMapLIPsGISINT: TIntegerField
      FieldName = 'GISINT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartMapLIPsGISSTR: TStringField
      FieldName = 'GISSTR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChartMapLIPsINCL4MAP: TStringField
      FieldName = 'INCL4MAP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartMapLIPsMAPNAME: TStringField
      FieldName = 'MAPNAME'
      Required = True
      Size = 50
    end
    object cdsChartMapLIPsCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsChartMapLIPsAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 35
    end
    object cdsChartMapLIPsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object cdsChartMapLIPsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object cdsChartMapLIPsBARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
    object cdsChartMapLIPsPLOTBARCODE: TStringField
      FieldName = 'PLOTBARCODE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartMapLIPsLIPHEADING: TStringField
      FieldName = 'LIPHEADING'
      Size = 25
    end
    object cdsChartMapLIPsLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsChartMapLIPsLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsChartMapLIPsLIPSIZEDESCRIPTION: TStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsChartMapLIPsLIPRATINGID: TStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsChartMapLIPsLIPRATINGDESCRIPTION: TStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      Size = 30
    end
    object cdsChartMapLIPsCOMPOSITIONID: TIntegerField
      FieldName = 'COMPOSITIONID'
      Required = True
    end
    object cdsChartMapLIPsDOMINANTCOMPOSITION: TStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      Size = 50
    end
    object cdsChartMapLIPsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object dsChartMapLIPs: TDataSource
    DataSet = cdsChartMapLIPs
    Left = 112
    Top = 736
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcStrat
    Left = 104
    Top = 8
  end
  object FDMemTableAgeLines: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 552
    Top = 616
    object FDMemTableAgeLinesiLine: TIntegerField
      FieldName = 'iLine'
      KeyFields = 'iLine;i'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDMemTableAgeLinesi: TIntegerField
      FieldName = 'i'
      KeyFields = 'iLine;i'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDMemTableAgeLinesiX: TIntegerField
      FieldName = 'iX'
    end
    object FDMemTableAgeLinesiY: TIntegerField
      FieldName = 'iY'
    end
  end
end
