object dmDV: TdmDV
  OldCreateOrder = False
  Height = 846
  Width = 1071
  object QueryDV: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  ISORGR30.COUNTRYABR, ISORGR30.UNITID,SUITE.UNITNAME, '
      '  ISORGR30.MATERIALABR,  ISORGR30.ISOTOPESYSTEM, '
      '  ISORGR30.APPROACHABR,  ISORGR30.TECHABR,'
      '  ISORGR30.INTERPABR, ISORGR30.IAGE, ISORGR30.IAGEPERROR, '
      '  ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,    '
      '  ISORGR30.LITHOLOGY, ISORGR30.RECORDID, '
      '  COUNTRY.COUNTRY, MATERIAL.MATERIALDESCRIPTION, '
      '  INTERPRETATION.INTERPRETATION, TECHNIQUE.TECHNIQUE,'
      '  APPROACH.APPROACHDESCRIPTION, ISOSYSTEM.ISOSYSTEMNAME,  '
      '  ISORGR30.RAGE, ISORGR30.RAGEPERROR, '
      '  ISORGR30.RAGEMERROR,'
      '  ISOFOR.WHOFORID'
      'FROM ISORGR30, COUNTRY, INTERPRETATION, APPROACH,MATERIAL,'
      '      ISOSYSTEM,ISOFOR,TECHNIQUE,SUITE,USERSWHOFOR'
      'WHERE  ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR '
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = ISOFOR.WHOFORID'
      'AND SUITE.UNITID=ISORGR30.UNITID'
      'AND ISORGR30.MATERIALABR = MATERIAL.MATERIALABR '
      'AND ISORGR30.APPROACHABR = APPROACH.APPROACHABR '
      'AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR '
      'AND ISORGR30.TECHABR=TECHNIQUE.TECHABR'
      'AND ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM '
      'AND ISORGR30.PREFLEVEL >= '#39'1'#39
      'AND ISOFOR.RECORDID=ISORGR30.RECORDID'
      'AND ISOFOR.WHOFORID='#39'PUBL'#39
      
        'ORDER BY ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.MATERIALABR' +
        ','
      'ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,'
      '  ISORGR30.PREFLEVEL,ISORGR30.IAGE')
    SQLConnection = sqlcDateView
    Left = 124
    Top = 14
  end
  object dspQueryDV: TDataSetProvider
    DataSet = QueryDV
    Left = 154
    Top = 14
  end
  object cdsQueryDV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQueryDV'
    Left = 182
    Top = 14
    object cdsQueryDVCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsQueryDVUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsQueryDVMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQueryDVISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQueryDVAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQueryDVINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQueryDVIAGE: TIntegerField
      FieldName = 'IAGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQueryDVIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQueryDVIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object cdsQueryDVAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsQueryDVLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsQueryDVRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsQueryDVCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsQueryDVMATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQueryDVINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
    object cdsQueryDVAPPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQueryDVISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object cdsQueryDVWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object cdsQueryDVTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object cdsQueryDVTECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object cdsQueryDVUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsQueryDVRAGE: TFloatField
      FieldName = 'RAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsQueryDVRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsQueryDVRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      Required = True
      DisplayFormat = '###0.000'
    end
  end
  object dsQueryDV: TDataSource
    DataSet = cdsQueryDV
    Left = 210
    Top = 14
  end
  object qAddToDV: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcDateView
    Left = 328
    Top = 68
  end
  object qDVMinMax: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT MIN(1.0*(ISORGR30.rage-isorgr30.ragemerror)) as MinAge,'
      '  max(1.0*(isorgr30.rage+isorgr30.rageperror)) as MaxAge'
      'from ISORGR30,SUITE,UsersWhoFor,ISOFOR'
      'WHERE USERSWHOFOR.USERID=:UserID'
      'AND USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID'
      'AND ISOFOR.RECORDID=ISORGR30.RECORDID'
      'AND ISORGR30.UNITID = SUITE.UNITID'
      'AND (SUITE.GISID=:UnitID or SUITE.parentid=:UnitID)'
      'AND  (ISORGR30.INTERPABR = '#39'CrysI'#39' '
      '    OR ISORGR30.INTERPABR = '#39'CrysV'#39
      '    OR ISORGR30.INTERPABR = '#39'Detri'#39' '
      '    OR ISORGR30.INTERPABR = '#39'Depos'#39' '
      '    OR ISORGR30.INTERPABR = '#39'Diag'#39')'
      'AND ISORGR30.PREFLEVEL >= '#39'1'#39)
    SQLConnection = sqlcDateView
    Left = 124
    Top = 62
  end
  object dspDVMinMax: TDataSetProvider
    DataSet = qDVMinMax
    Left = 154
    Top = 62
  end
  object cdsDVMinMax: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDVMinMax'
    Left = 182
    Top = 62
    object cdsDVMinMaxMINAGE: TFloatField
      FieldName = 'MINAGE'
    end
    object cdsDVMinMaxMAXAGE: TFloatField
      FieldName = 'MAXAGE'
    end
  end
  object dsDVMinMax: TDataSource
    DataSet = cdsDVMinMax
    Left = 210
    Top = 62
  end
  object qDomainDates: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CHARTID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CHARTMINAGE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CHARTMAXAGE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      '  STRATDOMAIN.DOMAINID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  DOMAINS.DOMAINNAME,'
      '  SPECIALFEATURES.SPECIALFEATURE,SPECIALFEATURES.LEGENDORDER,'
      '  UNITFEATURES.SPECIALFEATUREID'
      'FROM CHARTS2, CHARTDOMAIN,STRATUNITS,RANKS,DOMAINS,STRATDOMAIN,'
      '  SPECIALFEATURES,UNITFEATURES'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINID=STRATDOMAIN.DOMAINID'
      'AND STRATDOMAIN.UNITID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND CHARTDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'AND STRATUNITS.MINAGE>:CHARTMINAGE'
      'AND STRATUNITS.MAXAGE<:CHARTMAXAGE'
      'AND STRATUNITS.UNITID=UNITFEATURES.UNITID'
      
        'AND UNITFEATURES.SPECIALFEATUREID=SPECIALFEATURES.SPECIALFEATURE' +
        'ID'
      
        'ORDER BY CHARTDOMAIN.DOMAINORDER,STRATUNITS.MINAGE, STRATUNITS.U' +
        'NITID,SPECIALFEATURES.LEGENDORDER'
      ''
      ''
      '')
    SQLConnection = sqlcDateView
    Left = 126
    Top = 222
  end
  object dsqDomainDates: TDataSource
    AutoEdit = False
    DataSet = qDomainDates
    Left = 154
    Top = 222
  end
  object dspDomainDates: TDataSetProvider
    DataSet = qDomainDates
    Left = 182
    Top = 222
  end
  object cdsDomainDates: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainDates'
    Left = 210
    Top = 222
    object cdsDomainDatesDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainDatesUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainDatesINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainDatesDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainDatesCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDomainDatesUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsDomainDatesRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsDomainDatesAGEYEARS: TFMTBCDField
      FieldName = 'AGEYEARS'
      Required = True
      Precision = 15
      Size = 0
    end
    object cdsDomainDatesMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsDomainDatesMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsDomainDatesUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
  end
  object dsDomainDates: TDataSource
    AutoEdit = False
    DataSet = cdsDomainDates
    Left = 238
    Top = 222
  end
  object qDVUserDomains: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM USERDOMAINS'
      'WHERE USERDOMAINS.USERID=:UserID')
    SQLConnection = sqlcDateView
    Left = 124
    Top = 114
  end
  object dspDVUserDomains: TDataSetProvider
    DataSet = qDVUserDomains
    Left = 154
    Top = 114
  end
  object cdsDVUserDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDVUserDomains'
    Left = 182
    Top = 114
    object cdsDVUserDomainsUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDVUserDomainsDOMAINORDER: TIntegerField
      FieldName = 'DOMAINORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDVUserDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsDVUserDomainsDOMAINXMIN: TFloatField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object cdsDVUserDomainsDOMAINXMAX: TFloatField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
  end
  object dsDVUserDomains: TDataSource
    DataSet = cdsDVUserDomains
    Left = 210
    Top = 114
  end
  object qDeleteDVUserDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM USERDOMAINS'
      'WHERE USERDOMAINS.USERID=:UserID')
    SQLConnection = sqlcDateView
    Left = 328
    Top = 116
  end
  object qDVUser: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM USERS'
      'WHERE USERS.USERID=:UserID')
    SQLConnection = sqlcDateView
    Left = 124
    Top = 162
  end
  object dspDVUser: TDataSetProvider
    DataSet = qDVUser
    Left = 154
    Top = 162
  end
  object cdsDVUser: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDVUser'
    Left = 182
    Top = 162
    object cdsDVUserUSERNAMEID: TStringField
      FieldName = 'USERNAMEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDVUserNUMCONTRIBUTED: TIntegerField
      FieldName = 'NUMCONTRIBUTED'
    end
  end
  object dsDVUser: TDataSource
    DataSet = cdsDVUser
    Left = 210
    Top = 162
  end
  object qDVDomainDatesProvinces: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
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
      end
      item
        DataType = ftInteger
        Name = 'PrefLevel'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  USERDOMAINS.DOMAINORDER,USERDOMAINS.DOMAINID,'
      '  USERDOMAINS.DOMAINXMIN,USERDOMAINS.DOMAINXMAX,'
      '  ISORGR30.COUNTRYABR, SUITE.UNITNAME, ISORGR30.UNITID, '
      '  ISORGR30.MATERIALABR,  ISORGR30.ISOTOPESYSTEM, '
      '  ISORGR30.APPROACHABR,  ISORGR30.TECHABR,'
      '  ISORGR30.PREFLEVEL,'
      '  ISORGR30.INTERPABR, ISORGR30.IAGE, ISORGR30.IAGEPERROR, '
      '  ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,    '
      '  ISORGR30.LITHOLOGY, ISORGR30.RECORDID, '
      '  ISORGR30.RAGE, ISORGR30.RAGEPERROR, '
      '  ISORGR30.RAGEMERROR,'
      '  ISOPROVTERR.DOMAINID,DOMAINS.DOMAINNAME'
      
        'FROM ISORGR30,ISOFOR,USERDOMAINS,DOMAINS,ISOPROVTERR,SUITE,USERS' +
        'WHOFOR'
      'WHERE USERDOMAINS.USERID=:UserID'
      'AND ISORGR30.RAGE >= :ChartMinAge'
      'AND ISORGR30.RAGE <= :ChartMaxAge'
      'AND USERSWHOFOR.USERID=USERDOMAINS.USERID'
      'and USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID'
      'AND ISOFOR.RECORDID=ISORGR30.RECORDID'
      'AND SUITE.UNITID=ISORGR30.UNITID'
      'AND ISORGR30.PREFLEVEL >=  :PrefLevel'
      'AND USERDOMAINS.DOMAINID=DOMAINS.DOMAINID'
      'AND DOMAINS.DOMAINID=ISOPROVTERR.DOMAINID'
      'AND ISOPROVTERR.RECORDID=ISORGR30.RECORDID'
      'ORDER BY USERDOMAINS.DOMAINORDER,ISORGR30.IAGE')
    SQLConnection = sqlcDateView
    Left = 124
    Top = 274
  end
  object dspDVDomainDatesProvinces: TDataSetProvider
    DataSet = qDVDomainDatesProvinces
    Left = 154
    Top = 274
  end
  object cdsDVDomainDatesProvinces: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDVDomainDatesProvinces'
    Left = 182
    Top = 274
    object cdsDVDomainDatesProvincesDOMAINORDER: TIntegerField
      FieldName = 'DOMAINORDER'
      Required = True
    end
    object cdsDVDomainDatesProvincesDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object cdsDVDomainDatesProvincesDOMAINXMIN: TFloatField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object cdsDVDomainDatesProvincesDOMAINXMAX: TFloatField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object cdsDVDomainDatesProvincesCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsDVDomainDatesProvincesUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsDVDomainDatesProvincesMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsDVDomainDatesProvincesISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsDVDomainDatesProvincesAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object cdsDVDomainDatesProvincesTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object cdsDVDomainDatesProvincesINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsDVDomainDatesProvincesIAGE: TIntegerField
      FieldName = 'IAGE'
      Required = True
    end
    object cdsDVDomainDatesProvincesIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      Required = True
    end
    object cdsDVDomainDatesProvincesIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object cdsDVDomainDatesProvincesAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsDVDomainDatesProvincesLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsDVDomainDatesProvincesRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsDVDomainDatesProvincesRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object cdsDVDomainDatesProvincesRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object cdsDVDomainDatesProvincesRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
    object cdsDVDomainDatesProvincesPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object cdsDVDomainDatesProvincesDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 30
    end
    object cdsDVDomainDatesProvincesUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
  end
  object dsDVDomainDatesProvinces: TDataSource
    DataSet = cdsDVDomainDatesProvinces
    Left = 210
    Top = 274
  end
  object sqlcDateView: TSQLConnection
    ConnectionName = 'DateView_bromo2'
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=fbclient.dll'
      'DataBase=bromo2.usask.ca:s:\data\firebird\dateview2021v30.fdb'
      'User_Name=SYSDBA'
      'Password=V0lcano3^'
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
    Left = 24
    Top = 16
  end
  object qDomainCurves: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CHARTID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT CHARTS2.CHARTID,CHARTDOMAIN.DOMAINORDER,'
      '  LIPDOMAIN.DOMAINID,'
      
        '  CHARTS2.CHARTOFFSET_MM,CHARTDOMAIN.OFFSET_MM AS DOMAINOFFSET_M' +
        'M,'
      '  CHARTDOMAIN.DOMAINXMIN,CHARTDOMAIN.DOMAINXMAX,'
      '  DOMAINS.DOMAINNAME,'
      '  USERDVPDF.CURVEORDER,USERDVPDF.PDFORDER,'
      '  USERDVPDF.AGE,USERDVPDF.PDFVALUE'
      'FROM CHARTS2, CHARTDOMAIN,USERSPDF'
      'WHERE CHARTS2.CHARTID= :CHARTID'
      'AND USERDVPDF.USERID = :USERID'
      'AND CHARTS2.CHARTID=CHARTDOMAIN.CHARTID'
      'AND CHARTDOMAIN.DOMAINORDER=USERDVPDF.DOMAINORDER'
      
        'ORDER BY CHARTDOMAIN.DOMAINORDER,USERDVPDF.CURVEORDER,USERDVPDF.' +
        'PDFORDER')
    SQLConnection = sqlcDateView
    Left = 114
    Top = 334
  end
  object dsqDomainCurves: TDataSource
    AutoEdit = False
    DataSet = qDomainCurves
    Left = 142
    Top = 334
  end
  object dspDomainCurves: TDataSetProvider
    DataSet = qDomainCurves
    Left = 170
    Top = 334
  end
  object cdsDomainCurves: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainDates'
    Left = 198
    Top = 334
    object IntegerField1: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField2: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object StringField3: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'AGEYEARS'
      Required = True
      Precision = 15
      Size = 0
    end
    object FloatField1: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object StringField6: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
  end
  object dsDomainCurves: TDataSource
    AutoEdit = False
    DataSet = cdsDomainCurves
    Left = 226
    Top = 334
  end
  object qSuite: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SUITE'
      'WHERE SUITE.UNITID=:UnitID')
    SQLConnection = sqlcDateView
    Left = 420
    Top = 58
  end
  object dspSuite: TDataSetProvider
    DataSet = qSuite
    Left = 450
    Top = 58
  end
  object cdsSuite: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSuite'
    Left = 478
    Top = 58
    object cdsSuiteUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSuiteUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsSuiteUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
      Size = 5
    end
    object cdsSuiteGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
    object cdsSuiteFORMATIONOFFSET: TFloatField
      FieldName = 'FORMATIONOFFSET'
    end
    object cdsSuiteFORMATIONOFFSET2: TFloatField
      FieldName = 'FORMATIONOFFSET2'
    end
    object cdsSuiteFORMATIONOFFSET3: TFloatField
      FieldName = 'FORMATIONOFFSET3'
    end
    object cdsSuitePARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
  end
  object dsSuite: TDataSource
    DataSet = cdsSuite
    Left = 506
    Top = 58
  end
  object qSuiteName: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UnitName'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SUITE.UNITID '
      'FROM SUITE'
      'WHERE SUITE.UNITNAME=:UnitName')
    SQLConnection = sqlcDateView
    Left = 420
    Top = 114
  end
  object dspSuiteName: TDataSetProvider
    DataSet = qSuiteName
    Left = 450
    Top = 114
  end
  object cdsSuiteName: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSuiteName'
    Left = 478
    Top = 114
    object cdsSuiteNameUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
  end
  object dsSuiteName: TDataSource
    DataSet = cdsSuiteName
    Left = 506
    Top = 114
  end
  object qCount: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT '
      '  ISORGR30.COUNTRYABR, ISORGR30.UNITID,SUITE.UNITNAME, '
      '  ISORGR30.MATERIALABR,  ISORGR30.ISOTOPESYSTEM, '
      '  ISORGR30.APPROACHABR,  ISORGR30.TECHABR,'
      '  ISORGR30.INTERPABR, ISORGR30.IAGE, ISORGR30.IAGEPERROR, '
      '  ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,    '
      '  ISORGR30.LITHOLOGY, ISORGR30.RECORDID, '
      '  COUNTRY.COUNTRY, MATERIAL.MATERIALDESCRIPTION, '
      '  INTERPRETATION.INTERPRETATION, TECHNIQUE.TECHNIQUE,'
      '  APPROACH.APPROACHDESCRIPTION, ISOSYSTEM.ISOSYSTEMNAME,  '
      '  ISORGR30.RAGE, ISORGR30.RAGEPERROR, '
      '  ISORGR30.RAGEMERROR,'
      '  ISOFOR.WHOFORID'
      'FROM ISORGR30, COUNTRY, INTERPRETATION, APPROACH,MATERIAL,'
      '      ISOSYSTEM,ISOFOR,TECHNIQUE,SUITE,USERSWHOFOR'
      'WHERE  ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR '
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = ISOFOR.WHOFORID'
      'AND SUITE.UNITID=ISORGR30.UNITID'
      'AND ISORGR30.MATERIALABR = MATERIAL.MATERIALABR '
      'AND ISORGR30.APPROACHABR = APPROACH.APPROACHABR '
      'AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR '
      'AND ISORGR30.TECHABR=TECHNIQUE.TECHABR'
      'AND ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM '
      'AND ISORGR30.PREFLEVEL >= '#39'1'#39
      'AND ISOFOR.RECORDID=ISORGR30.RECORDID'
      'AND ISOFOR.WHOFORID='#39'PUBL'#39
      
        'ORDER BY ISORGR30.COUNTRYABR,SUITE.UNITNAME,ISORGR30.MATERIALABR' +
        ','
      'ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,'
      '  ISORGR30.PREFLEVEL,ISORGR30.IAGE'
      ')')
    SQLConnection = sqlcDateView
    Left = 444
    Top = 14
  end
  object dspCount: TDataSetProvider
    DataSet = qCount
    Left = 474
    Top = 14
  end
  object cdsCount: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCount'
    Left = 502
    Top = 14
    object cdsCountCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object dsCount: TDataSource
    DataSet = cdsCount
    Left = 530
    Top = 14
  end
  object qDVpdf: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PrefLevel'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  ISORGR30.COUNTRYABR, ISORGR30.UNITID, '
      '  ISORGR30.MATERIALABR,  ISORGR30.ISOTOPESYSTEM, '
      '  ISORGR30.APPROACHABR,  ISORGR30.TECHABR,'
      '  ISORGR30.INTERPABR, ISORGR30.AGEUNITS,'
      '  ISORGR30.LITHOLOGY, ISORGR30.RECORDID, '
      '  ISORGR30.RAGE, ISORGR30.RAGEPERROR, '
      '  ISORGR30.RAGEMERROR,'
      '  ISOFOR.WHOFORID'
      'FROM ISORGR30, ISOFOR,USERSWHOFOR'
      'WHERE  USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = ISOFOR.WHOFORID'
      'AND ISORGR30.PREFLEVEL >= :PrefLevel'
      'and ISORGR30.AGEUNITS = '#39'Ma'#39
      'AND ISOFOR.RECORDID=ISORGR30.RECORDID'
      'ORDER BY ISORGR30.COUNTRYABR,ISORGR30.MATERIALABR,'
      'ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,'
      '  ISORGR30.PREFLEVEL,ISORGR30.RAGE')
    SQLConnection = sqlcDateView
    Left = 116
    Top = 382
  end
  object dspDVpdf: TDataSetProvider
    DataSet = qDVpdf
    Left = 146
    Top = 382
  end
  object cdsDVpdf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDVpdf'
    Left = 174
    Top = 382
    object cdsDVpdfCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsDVpdfUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsDVpdfMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsDVpdfISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsDVpdfAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object cdsDVpdfTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object cdsDVpdfINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsDVpdfAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsDVpdfRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDVpdfRAGE: TFloatField
      FieldName = 'RAGE'
      Required = True
    end
    object cdsDVpdfRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      Required = True
    end
    object cdsDVpdfRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      Required = True
    end
    object cdsDVpdfWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
  end
  object dsDVpdf: TDataSource
    DataSet = cdsDVpdf
    Left = 202
    Top = 382
  end
  object qUserUnitSuites: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select userswhofor.userid, suite.unitid,suite.gisid as stratdbid' +
        ','
      '  smpreg.sampleno'
      
        'from userswhofor, suite, smpreg, smpdata, isofor, isorgr30, user' +
        'unitsuites'
      'where userswhofor.userid = :UserID'
      'and userswhofor.whoforid = isofor.whoforid'
      'and userswhofor.userid = userunitsuites.userid'
      'and userunitsuites.unitid = suite.unitid'
      'and isofor.recordid = isorgr30.recordid'
      'and suite.unitid = isorgr30.unitid'
      'and suite.gisid > 0'
      'and isorgr30.recordid = smpreg.recordid'
      'and smpreg.sampleno = smpdata.sampleno'
      'and isorgr30.isotopesystem = smpdata.isosystem'
      'and smpdata.variableid = '#39'AgePreferred'#39)
    SQLConnection = sqlcDateView
    Left = 112
    Top = 432
  end
  object dspUserUnitSuites: TDataSetProvider
    DataSet = qUserUnitSuites
    Left = 144
    Top = 432
  end
  object cdsUserUnitSUites: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserUnitSuites'
    Left = 176
    Top = 432
  end
  object dsUserUnitSUites: TDataSource
    DataSet = cdsUserUnitSUites
    Left = 208
    Top = 432
  end
  object qUserUnitSuiteSamples: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ProjectID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT USERUNITSUITESAMPLES.userprojectid,'
      '  USERUNITSUITESAMPLES.unitid, USERUNITSUITESAMPLES.sampleno,'
      '  USERUNITSUITESAMPLES.userid,'
      
        '  USERUNITSUITESAMPLES.stratdbunitid, USERUNITSUITESAMPLES.strat' +
        'dbunitname,'
      
        '  USERUNITSUITESAMPLES.stratdbunitrank, USERUNITSUITESAMPLES.str' +
        'atdbunitage,'
      
        '  SMPLOC.continentid,SMPLOC.countryabr as COUNTRYID, SMPLOC.long' +
        'itude, SMPLOC.latitude,'
      
        '  USERUNITSUITESAMPLES.numfractotal,USERUNITSUITESAMPLES.numfrac' +
        'inclage,'
      '  USERUNITSUITESAMPLES.numfracinclisorat'
      'FROM USERUNITSUITESAMPLES, SMPLOC'
      'WHERE USERUNITSUITESAMPLES.USERPROJECTID = :ProjectID'
      'AND USERUNITSUITESAMPLES.SAMPLENO=SMPLOC.SAMPLENO'
      
        'ORDER BY USERUNITSUITESAMPLES.STRATDBUNITAGE, USERUNITSUITESAMPL' +
        'ES.SAMPLENO')
    SQLConnection = sqlcDateView
    Left = 32
    Top = 552
  end
  object dspUserUnitSuiteSamples: TDataSetProvider
    DataSet = qUserUnitSuiteSamples
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 64
    Top = 552
  end
  object cdsUserUnitSuiteSamples: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserUnitSuiteSamples'
    OnReconcileError = cdsAnyReconcileError
    Left = 96
    Top = 552
    object cdsUserUnitSuiteSamplesUSERPROJECTID: TIntegerField
      FieldName = 'USERPROJECTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserUnitSuiteSamplesUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserUnitSuiteSamplesSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserUnitSuiteSamplesSTRATDBUNITID: TIntegerField
      FieldName = 'STRATDBUNITID'
      Required = True
    end
    object cdsUserUnitSuiteSamplesSTRATDBUNITNAME: TStringField
      FieldName = 'STRATDBUNITNAME'
      Required = True
      Size = 50
    end
    object cdsUserUnitSuiteSamplesSTRATDBUNITRANK: TStringField
      FieldName = 'STRATDBUNITRANK'
      Required = True
      Size = 5
    end
    object cdsUserUnitSuiteSamplesSTRATDBUNITAGE: TFloatField
      FieldName = 'STRATDBUNITAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsUserUnitSuiteSamplesLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsUserUnitSuiteSamplesLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsUserUnitSuiteSamplesCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsUserUnitSuiteSamplesUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUserUnitSuiteSamplesNUMFRACTOTAL: TIntegerField
      FieldName = 'NUMFRACTOTAL'
      Required = True
    end
    object cdsUserUnitSuiteSamplesNUMFRACINCLAGE: TIntegerField
      FieldName = 'NUMFRACINCLAGE'
      Required = True
    end
    object cdsUserUnitSuiteSamplesNUMFRACINCLISORAT: TIntegerField
      FieldName = 'NUMFRACINCLISORAT'
      Required = True
    end
  end
  object dsUserUnitSuiteSamples: TDataSource
    DataSet = cdsUserUnitSuiteSamples
    Left = 128
    Top = 552
  end
  object qUserSuiteForUnit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'StratDBUnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SUITE.UNITID'
      'FROM SUITE'
      'WHERE SUITE.GISID = :StratDBUnitID')
    SQLConnection = sqlcDateView
    Left = 32
    Top = 600
  end
  object dspUserSuiteForUnit: TDataSetProvider
    DataSet = qUserSuiteForUnit
    Left = 64
    Top = 600
  end
  object cdsUserSuiteForUnit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserSuiteForUnit'
    OnReconcileError = cdsAnyReconcileError
    Left = 96
    Top = 600
    object cdsUserSuiteForUnitUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsUserSuiteForUnit: TDataSource
    DataSet = cdsUserSuiteForUnit
    Left = 128
    Top = 600
  end
  object qUserSamplesForUnit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VariableID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IsotopeSystemID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT USERSWHOFOR.USERID,'
      '  ISORGR30.UNITID, SMPLOC.SAMPLENO,'
      '  SMPLOC.LONGITUDE,SMPLOC.LATITUDE,SMPLOC.ELEVATION'
      'FROM SMPLOC,SMPREG,ISORGR30,SMPDATA,userswhofor, ISOFOR'
      'WHERE USERSWHOFOR.USERID = :UserID'
      'AND ISORGR30.UNITID = :UnitID'
      'AND USERSWHOFOR.WHOFORID = ISOFOR.WHOFORID'
      'AND ISOFOR.RECORDID = ISORGR30.RECORDID'
      'AND ISORGR30.RECORDID = SMPREG.RECORDID'
      'AND SMPREG.SAMPLENO = SMPLOC.SAMPLENO'
      'AND SMPLOC.SAMPLENO = SMPDATA.SAMPLENO'
      'AND SMPDATA.VARIABLEID = :VariableID'
      'AND SMPDATA.ISOSYSTEM = ISORGR30.ISOTOPESYSTEM'
      'AND SMPDATA.ISOSYSTEM = :IsotopeSystemID'
      'ORDER BY ISORGR30.UNITID, SMPLOC.SAMPLENO')
    SQLConnection = sqlcDateView
    Left = 32
    Top = 648
  end
  object dspUserSamplesForUnit: TDataSetProvider
    DataSet = qUserSamplesForUnit
    Left = 64
    Top = 648
  end
  object cdsUserSamplesForUnit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserSamplesForUnit'
    OnReconcileError = cdsAnyReconcileError
    Left = 96
    Top = 648
    object cdsUserSamplesForUnitUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUserSamplesForUnitUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsUserSamplesForUnitSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsUserSamplesForUnitLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsUserSamplesForUnitLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsUserSamplesForUnitELEVATION: TFloatField
      FieldName = 'ELEVATION'
      Required = True
      DisplayFormat = '####0.00'
    end
  end
  object dsUserSamplesForUnit: TDataSource
    DataSet = cdsUserSamplesForUnit
    Left = 128
    Top = 648
  end
  object qInsertUserUnitSamples: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'UserProjectID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitName'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitRank'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitAge'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Longitude'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Latitude'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CountryID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO USERUNITSUITESAMPLES'
      
        '(UserProjectID,UserID,UnitID,SampleNo,StratDBUnitID,StratDBUnitN' +
        'ame,StratDBUnitRank,StratDBUnitAge,Longitude,Latitude,CountryID)'
      
        'Values (:UserProjectID,:UserID, :UnitID, :SampleNo, :StratDBUnit' +
        'ID, :StratDBUnitName, :StratDBUnitRank, :StratDBUnitAge, :Longit' +
        'ude, :Latitude, :CountryID)')
    SQLConnection = sqlcDateView
    Left = 216
    Top = 552
  end
  object qDeleteAny: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'UserProjectID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from USERUNITSUITESAMPLES'
      'where USERUNITSUITESAMPLES.USERID = :UserProjectID')
    SQLConnection = sqlcDateView
    Left = 312
    Top = 552
  end
  object qRawSmp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT SMPDATA.SAMPLENO, SMPDATA.FRAC,'
      '  SMPFRAC.ZONEID, '
      '  VARREGASSOC.REGASSOCID'
      'from SMPDATA,SMPFRAC,VARREGASSOC'
      'where VARREGASSOC.REGASSOCID=:REGASSOCID'
      'AND SMPFRAC.SAMPLENO=SMPDATA.SAMPLENO'
      'AND SMPFRAC.FRAC=SMPDATA.FRAC'
      'and SMPDATA.SAMPLENO='#39'A'#39
      'Order by SMPDATA.SAMPLENO, SMPDATA.FRAC')
    SQLConnection = sqlcDateView
    Left = 554
    Top = 134
    object qRawSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRawSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRawSmpZONEID: TStringField
      FieldName = 'ZONEID'
      Required = True
      Size = 2
    end
    object qRawSmpREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsqRawSmp: TDataSource
    DataSet = qRawSmp
    Left = 582
    Top = 134
  end
  object dspRawSmp: TDataSetProvider
    DataSet = qRawSmp
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 610
    Top = 134
  end
  object cdsRawSmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRawSmp'
    Left = 638
    Top = 132
    object cdsRawSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRawSmpFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsRawSmpZONEID: TStringField
      FieldName = 'ZONEID'
      Required = True
      Size = 2
    end
    object cdsRawSmpREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawSmpqRawDataXerr: TDataSetField
      FieldName = 'qRawDataXerr'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataX: TDataSetField
      FieldName = 'qRawDataX'
    end
    object cdsRawSmpqRawDataR: TDataSetField
      FieldName = 'qRawDataR'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawErrTypeX: TDataSetField
      FieldName = 'qRawErrTypeX'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawErrTypeY: TDataSetField
      FieldName = 'qRawErrTypeY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawErrTypeZ: TDataSetField
      FieldName = 'qRawErrTypeZ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawNormalisedValueZ: TDataSetField
      FieldName = 'qRawNormalisedValueZ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawNormalisedValueY: TDataSetField
      FieldName = 'qRawNormalisedValueY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataPrecZ: TDataSetField
      FieldName = 'qRawDataPrecZ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataZerr: TDataSetField
      FieldName = 'qRawDataZerr'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataZ: TDataSetField
      FieldName = 'qRawDataZ'
    end
    object cdsRawSmpqRawDataPrecY: TDataSetField
      FieldName = 'qRawDataPrecY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataYerr: TDataSetField
      FieldName = 'qRawDataYerr'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataY: TDataSetField
      FieldName = 'qRawDataY'
    end
    object cdsRawSmpqRawDataPrecX: TDataSetField
      FieldName = 'qRawDataPrecX'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawNormalisedValueX: TDataSetField
      FieldName = 'qRawNormalisedValueX'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawAgePref: TDataSetField
      FieldName = 'qRawAgePref'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDiscordance: TDataSetField
      FieldName = 'qRawDiscordance'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawRef: TDataSetField
      FieldName = 'qRawRef'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawSmpLoc: TDataSetField
      FieldName = 'qRawSmpLoc'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataDM: TDataSetField
      FieldName = 'qRawDataDM'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawSmpqRawDataInclude: TDataSetField
      FieldName = 'qRawDataInclude'
    end
    object cdsRawSmpqRawDataVar3: TDataSetField
      FieldName = 'qRawDataVar3'
    end
    object cdsRawSmpqRawDataVar2: TDataSetField
      FieldName = 'qRawDataVar2'
    end
    object cdsRawSmpqRawDataVar1: TDataSetField
      FieldName = 'qRawDataVar1'
    end
  end
  object dsRawSmp: TDataSource
    DataSet = cdsRawSmp
    Left = 664
    Top = 134
  end
  object qRawDataX: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME,VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 552
    Top = 184
    object qRawDataXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRawDataXFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRawDataXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRawDataXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRawDataXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRawDataXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRawDataXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRawDataXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object qRawDataXREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsqRawDataX: TDataSource
    DataSet = qRawDataX
    Left = 580
    Top = 184
  end
  object cdsRawDataX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataX
    Params = <>
    Left = 604
    Top = 184
    object cdsRawDataXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRawDataXFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRawDataXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRawDataXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRawDataXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRawDataXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRawDataXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRawDataXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsRawDataXqRawStandardValueX: TDataSetField
      FieldName = 'qRawStandardValueX'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataXREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawDataX: TDataSource
    DataSet = cdsRawDataX
    Left = 632
    Top = 184
  end
  object qRawStandardValueX: TSQLQuery
    DataSource = dsqRawDataX
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 686
    Top = 186
    object qRawStandardValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawStandardValueX: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 714
    Top = 186
    object cdsRawStandardValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawStandardValueX: TDataSource
    DataSet = cdsRawStandardValueX
    Left = 742
    Top = 186
  end
  object qRawNormalisedValueX: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'3X'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 790
    Top = 186
    object qRawNormalisedValueXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawNormalisedValueXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueXNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawNormalisedValueX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawNormalisedValueX
    Params = <>
    Left = 818
    Top = 186
    object cdsRawNormalisedValueXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawNormalisedValueXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueXACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueXNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawNormalisedValueX: TDataSource
    DataSet = cdsRawNormalisedValueX
    Left = 846
    Top = 186
  end
  object qRawDataXerr: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftUnknown
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'4Xerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 550
    Top = 232
    object qRawDataXerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataXerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataXerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataXerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataXerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataXerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataXerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataXerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRawDataXerr: TDataSource
    DataSet = qRawDataXerr
    Left = 580
    Top = 232
  end
  object cdsRawDataXerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataXerr
    Params = <>
    Left = 606
    Top = 232
    object cdsRawDataXerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataXerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataXerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataXerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataXerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataXerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataXerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataXerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataXerr: TDataSource
    DataSet = cdsRawDataXerr
    Left = 630
    Top = 232
  end
  object qRawErrTypeX: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'CXert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 686
    Top = 234
    object qRawErrTypeXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawErrTypeXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawErrTypeX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawErrTypeX
    Params = <>
    Left = 714
    Top = 234
    object cdsRawErrTypeXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeXNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawErrTypeXSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeXVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawErrTypeX: TDataSource
    DataSet = cdsRawErrTypeX
    Left = 742
    Top = 234
  end
  object qRawDataPrecX: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'AXpre'#39)
    SQLConnection = sqlcDateView
    Left = 552
    Top = 278
    object qRawDataPrecXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataPrecXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawDataPrecX: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataPrecX
    Params = <>
    Left = 604
    Top = 278
    object cdsRawDataPrecXSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataPrecXFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecXISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecXVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecXDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawDataPrecX: TDataSource
    DataSet = cdsRawDataPrecX
    Left = 632
    Top = 278
  end
  object qRawDataY: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME,VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 552
    Top = 322
    object qRawDataYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRawDataYFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRawDataYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRawDataYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRawDataYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRawDataYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRawDataYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRawDataYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object qRawDataYREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsqRawDataY: TDataSource
    DataSet = qRawDataY
    Left = 582
    Top = 322
  end
  object cdsRawDataY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataY
    Params = <>
    Left = 604
    Top = 322
    object cdsRawDataYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRawDataYFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRawDataYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRawDataYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRawDataYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRawDataYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRawDataYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRawDataYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsRawDataYqRawStandardValueY: TDataSetField
      FieldName = 'qRawStandardValueY'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataYREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawDataY: TDataSource
    DataSet = cdsRawDataY
    Left = 632
    Top = 322
  end
  object qRawStandardValueY: TSQLQuery
    DataSource = dsqRawDataY
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 686
    Top = 324
    object qRawStandardValueYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawStandardValueY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawDataYqRawStandardValueY
    Params = <>
    Left = 714
    Top = 324
    object cdsRawStandardValueYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawStandardValueY: TDataSource
    DataSet = cdsRawStandardValueY
    Left = 742
    Top = 324
  end
  object qRawNormalisedValueY: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'5Y'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 794
    Top = 324
    object qRawNormalisedValueYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawNormalisedValueYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawNormalisedValueY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawNormalisedValueY
    Params = <>
    Left = 822
    Top = 324
    object cdsRawNormalisedValueYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawNormalisedValueYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueYACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueYNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawNormalisedValueY: TDataSource
    DataSet = cdsRawNormalisedValueY
    Left = 850
    Top = 324
  end
  object qRawDataYerr: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'6Yerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 554
    Top = 368
    object qRawDataYerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataYerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataYerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataYerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataYerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataYerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataYerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataYerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRawDataYerr: TDataSource
    DataSet = qRawDataYerr
    Left = 580
    Top = 368
  end
  object cdsRawDataYerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataYerr
    Params = <>
    Left = 606
    Top = 368
    object cdsRawDataYerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataYerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataYerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataYerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataYerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataYerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataYerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataYerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataYerr: TDataSource
    DataSet = cdsRawDataYerr
    Left = 634
    Top = 368
  end
  object qRawDataR: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'7R'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 688
    Top = 372
    object qRawDataRSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataRFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataRISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataRVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataRDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataRNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataRSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataRVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawErrTypeY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawErrTypeY
    Params = <>
    Left = 714
    Top = 370
    object cdsRawErrTypeYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawErrTypeYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawErrTypeY: TDataSource
    DataSet = cdsRawErrTypeY
    Left = 742
    Top = 370
  end
  object qRawDataPrecY: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'BYpre'#39)
    SQLConnection = sqlcDateView
    Left = 552
    Top = 414
    object qRawDataPrecYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataPrecYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawDataPrecY: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataPrecY
    Params = <>
    Left = 604
    Top = 414
    object cdsRawDataPrecYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataPrecYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawDataPrecY: TDataSource
    DataSet = cdsRawDataPrecY
    Left = 632
    Top = 414
  end
  object qRawErrTypeY: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'DYert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 686
    Top = 410
    object qRawErrTypeYSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeYFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeYISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeYVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeYDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeYNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawErrTypeYSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeYVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawDataR: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataR
    Params = <>
    Left = 716
    Top = 412
    object cdsRawDataRSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataRFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataRISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataRVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataRDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataRNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataRSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataRVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataR: TDataSource
    DataSet = cdsRawDataR
    Left = 744
    Top = 412
  end
  object qRawDataZ: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftUnknown
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME,VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'8Z'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 556
    Top = 457
    object qRawDataZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qRawDataZFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qRawDataZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object qRawDataZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object qRawDataZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object qRawDataZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object qRawDataZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object qRawDataZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object qRawDataZREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsqRawDataZ: TDataSource
    DataSet = qRawDataZ
    Left = 586
    Top = 457
  end
  object cdsRawDataZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataZ
    Params = <>
    Left = 608
    Top = 457
    object cdsRawDataZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsRawDataZFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsRawDataZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object cdsRawDataZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
    object cdsRawDataZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
    end
    object cdsRawDataZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsRawDataZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      Required = True
    end
    object cdsRawDataZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Size = 30
    end
    object cdsRawDataZqRawStandardValueZ: TDataSetField
      FieldName = 'qRawStandardValueZ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataZREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawDataZ: TDataSource
    DataSet = cdsRawDataZ
    Left = 636
    Top = 457
  end
  object qRawStandardValueZ: TSQLQuery
    DataSource = dsqRawDataZ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NORMALISINGSTANDARD'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'VARIABLEID'
        ParamType = ptInput
        Size = 16
      end>
    SQL.Strings = (
      'SELECT STANDARDVALUES.ACCEPTEDVALUE'
      'FROM STANDARDVALUES'
      'WHERE STANDARDVALUES.STANDARDID = :NORMALISINGSTANDARD'
      'AND STANDARDVALUES.VARIABLEID = :VARIABLEID'
      '')
    SQLConnection = sqlcDateView
    Left = 690
    Top = 459
    object qRawStandardValueZACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawStandardValueZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawDataZqRawStandardValueZ
    Params = <>
    Left = 718
    Top = 459
    object cdsRawStandardValueZACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawStandardValueZ: TDataSource
    DataSet = cdsRawStandardValueZ
    Left = 746
    Top = 459
  end
  object qRawNormalisedValueZ: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,STANDARDVALUES.ACCEPTEDVALUE,'
      
        '  (SMPDATA.DATAVALUE*STANDARDVALUES.ACCEPTEDVALUE/SMPDATA.STANDA' +
        'RDVALUE) AS NORMALISEDVALUE'
      'FROM SMPDATA,VARREG,STANDARDVALUES'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'8Z'#39
      'AND SMPDATA.VARIABLEID=STANDARDVALUES.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD = STANDARDVALUES.STANDARDID')
    SQLConnection = sqlcDateView
    Left = 798
    Top = 459
    object qRawNormalisedValueZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawNormalisedValueZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawNormalisedValueZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueZACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawNormalisedValueZNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawNormalisedValueZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawNormalisedValueZ
    Params = <>
    Left = 826
    Top = 459
    object cdsRawNormalisedValueZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawNormalisedValueZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawNormalisedValueZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueZACCEPTEDVALUE: TFloatField
      FieldName = 'ACCEPTEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawNormalisedValueZNORMALISEDVALUE: TFloatField
      FieldName = 'NORMALISEDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawNormalisedValueZ: TDataSource
    DataSet = cdsRawNormalisedValueZ
    Left = 854
    Top = 459
  end
  object qRawDataZerr: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'9Zerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 558
    Top = 507
    object qRawDataZerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataZerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataZerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataZerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataZerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataZerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataZerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataZerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawDataZerr: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 610
    Top = 507
    object cdsRawDataZerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataZerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataZerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataZerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataZerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataZerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataZerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataZerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataZerr: TDataSource
    DataSet = cdsRawDataZerr
    Left = 638
    Top = 507
  end
  object qRawErrTypeZ: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'HZert'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 690
    Top = 509
    object qRawErrTypeZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawErrTypeZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawErrTypeZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawErrTypeZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawErrTypeZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawErrTypeZ
    Params = <>
    Left = 718
    Top = 509
    object cdsRawErrTypeZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawErrTypeZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeZNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawErrTypeZSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawErrTypeZVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawErrTypeZ: TDataSource
    DataSet = cdsRawErrTypeZ
    Left = 746
    Top = 509
  end
  object qRawDataPrecZ: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftUnknown
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'GZpre'#39)
    SQLConnection = sqlcDateView
    Left = 560
    Top = 557
    object qRawDataPrecZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataPrecZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataPrecZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawDataPrecZ: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataPrecZ
    Params = <>
    Left = 612
    Top = 557
    object cdsRawDataPrecZSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataPrecZFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecZISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecZVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataPrecZDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawDataPrecZ: TDataSource
    DataSet = cdsRawDataPrecZ
    Left = 640
    Top = 557
  end
  object qRawDiscordance: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'IDisc'#39)
    SQLConnection = sqlcDateView
    Left = 560
    Top = 598
    object qRawDiscordanceSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDiscordanceFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDiscordanceISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDiscordanceVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDiscordanceDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawDiscordance: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDiscordance
    Params = <>
    Left = 612
    Top = 598
    object cdsRawDiscordanceSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDiscordanceFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDiscordanceISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDiscordanceVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDiscordanceDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRawDiscordance: TDataSource
    DataSet = cdsRawDiscordance
    Left = 640
    Top = 598
  end
  object qRawRef: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  DISTINCT SMPDATA.SAMPLENO,'
      '  SMPDATA.REFNUM,'
      '  SOURCELIST.SOURCESHORT'
      'FROM SMPDATA,VARREG,SOURCELIST'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'JAge'#39
      'AND SMPDATA.REFNUM=SOURCELIST.SOURCENUM')
    SQLConnection = sqlcDateView
    Left = 712
    Top = 598
    object qRawRefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawRefREFNUM: TIntegerField
      FieldName = 'REFNUM'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawRefSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object cdsRawRef: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawRef
    Params = <>
    Left = 740
    Top = 598
    object cdsRawRefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawRefREFNUM: TIntegerField
      FieldName = 'REFNUM'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawRefSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dsRawRef: TDataSource
    DataSet = cdsRawRef
    Left = 768
    Top = 598
  end
  object qRawDataDM: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE,VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'LDM'#39)
    SQLConnection = sqlcDateView
    Left = 832
    Top = 558
    object qRawDataDMSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
    end
    object qRawDataDMFRAC: TStringField
      FieldName = 'FRAC'
      Size = 15
    end
    object qRawDataDMISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Size = 15
    end
    object qRawDataDMVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Size = 15
    end
    object qRawDataDMDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
    end
    object qRawDataDMREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsqRawDataDM: TDataSource
    DataSet = qRawDataDM
    Left = 860
    Top = 560
  end
  object cdsRawDataDM: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataDM
    Params = <>
    Left = 884
    Top = 558
    object cdsRawDataDMSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
    end
    object cdsRawDataDMFRAC: TStringField
      FieldName = 'FRAC'
      Size = 15
    end
    object cdsRawDataDMISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Size = 15
    end
    object cdsRawDataDMVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Size = 15
    end
    object cdsRawDataDMDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
    end
    object cdsRawDataDMqRawDataDMerr: TDataSetField
      FieldName = 'qRawDataDMerr'
    end
    object cdsRawDataDMREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawDataDM: TDataSource
    DataSet = cdsRawDataDM
    Left = 912
    Top = 558
  end
  object qRawDataDMerr: TSQLQuery
    DataSource = dsqRawDataDM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'MDMer'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 830
    Top = 600
    object qRawDataDMerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataDMerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataDMerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataDMerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataDMerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataDMerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataDMerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataDMerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRawDataDMerr: TDataSource
    DataSet = qRawDataDMerr
    Left = 860
    Top = 600
  end
  object cdsRawDataDMerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawDataDMqRawDataDMerr
    Params = <>
    Left = 886
    Top = 600
    object cdsRawDataDMerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataDMerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataDMerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataDMerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataDMerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataDMerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataDMerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataDMerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataDMerr: TDataSource
    DataSet = cdsRawDataDMerr
    Left = 910
    Top = 600
  end
  object qExisting: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IsotopeSystem'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select distinct isorgr30.recordid,  isorgr30.countryabr,'
      '  isorgr30.unitid, isorgr30.materialabr, isorgr30.isotopesystem,'
      '  isorgr30.approachabr, isorgr30.techabr, isorgr30.interpabr,'
      '  isorgr30.rage, isorgr30.rageperror, isorgr30.ragemerror,'
      '  suite.unitname, suite.unitrank, country.continentid,'
      '  material.materialdescription, approach.approachdescription,'
      '  technique.technique, interpretation.interpretation'
      
        'from isorgr30, smpreg, suite, country, material, technique,appro' +
        'ach,interpretation'
      'where smpreg.sampleno = :SampleNo'
      'and smpreg.recordid=isorgr30.recordid'
      'and country.countryabr=isorgr30.countryabr'
      'and isorgr30.isotopesystem = :IsotopeSystem'
      'and isorgr30.unitid=suite.unitid'
      'and isorgr30.materialabr=material.materialabr'
      'and isorgr30.approachabr=approach.approachabr'
      'and isorgr30.techabr=technique.techabr'
      'and isorgr30.interpabr=interpretation.interpabr')
    SQLConnection = sqlcDateView
    Left = 832
    Top = 240
  end
  object dspExisting: TDataSetProvider
    DataSet = qExisting
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 864
    Top = 240
  end
  object cdsExisting: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExisting'
    Left = 896
    Top = 240
    object cdsExistingRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsExistingCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsExistingUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsExistingMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsExistingISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsExistingAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object cdsExistingTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object cdsExistingINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsExistingRAGE: TFloatField
      FieldName = 'RAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsExistingRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsExistingRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsExistingUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsExistingUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
      Size = 5
    end
    object cdsExistingCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsExistingMATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsExistingAPPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsExistingTECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
    object cdsExistingINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
  end
  object dsExisting: TDataSource
    DataSet = cdsExisting
    Left = 928
    Top = 240
  end
  object qRawAgePref: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE,VARREG.REGASSOCID'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'JAge'#39)
    SQLConnection = sqlcDateView
    Left = 560
    Top = 646
    object qRawAgePrefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawAgePrefFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawAgePrefISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawAgePrefVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawAgePrefDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawAgePrefREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsqRawAgePref: TDataSource
    DataSet = qRawAgePref
    Left = 588
    Top = 648
  end
  object cdsRawAgePref: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawAgePref
    Params = <>
    Left = 612
    Top = 646
    object cdsRawAgePrefSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawAgePrefFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawAgePrefISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawAgePrefVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawAgePrefDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawAgePrefqRawDataAgeerr: TDataSetField
      FieldName = 'qRawDataAgeerr'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawAgePrefREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
  end
  object dsRawAgePref: TDataSource
    DataSet = cdsRawAgePref
    Left = 640
    Top = 646
  end
  object qRawSmpLoc: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPLOC.COUNTRYABR, SMPLOC.CONTINENTID,'
      '  SMPLOC.LONGITUDE, SMPLOC.LATITUDE,SMPLOC.ELEVATION'
      'FROM SMPLOC'
      'WHERE SMPLOC.SAMPLENO = :SampleNo')
    SQLConnection = sqlcDateView
    Left = 832
    Top = 520
    object qRawSmpLocCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qRawSmpLocCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qRawSmpLocLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawSmpLocLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawSmpLocELEVATION: TFloatField
      FieldName = 'ELEVATION'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsRawSmpLoc: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawSmpLoc
    Params = <>
    Left = 864
    Top = 520
    object cdsRawSmpLocCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsRawSmpLocCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsRawSmpLocLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00000'
    end
    object cdsRawSmpLocLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00000'
    end
    object cdsRawSmpLocELEVATION: TFloatField
      FieldName = 'ELEVATION'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '####0.000'
    end
  end
  object dsRawSmpLoc: TDataSource
    DataSet = cdsRawSmpLoc
    Left = 896
    Top = 520
  end
  object qRawDataAgeerr: TSQLQuery
    DataSource = dsqRawAgePref
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftUnknown
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'KAerr'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 558
    Top = 696
    object qRawDataAgeerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataAgeerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataAgeerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataAgeerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qRawDataAgeerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataAgeerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qRawDataAgeerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRawDataAgeerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsqRawDataAgeerr: TDataSource
    DataSet = qRawDataAgeerr
    Left = 588
    Top = 696
  end
  object cdsRawDataAgeerr: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawAgePrefqRawDataAgeerr
    Params = <>
    Left = 614
    Top = 696
    object cdsRawDataAgeerrSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataAgeerrFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataAgeerrISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataAgeerrVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataAgeerrDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataAgeerrNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataAgeerrSTANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataAgeerrVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataAgeerr: TDataSource
    DataSet = cdsRawDataAgeerr
    Left = 638
    Top = 696
  end
  object cdsSamplePDF: TClientDataSet
    PersistDataPacket.Data = {
      4D0000009619E0BD0100000018000000030000000000030000004D0004537465
      7004000100000000000C5044464461746156616C756508000400000000000850
      444656616C756508000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Step'
        DataType = ftInteger
      end
      item
        Name = 'PDFDataValue'
        DataType = ftFloat
      end
      item
        Name = 'PDFValue'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsSamplePDFIndex1'
        Fields = 'Step'
        Options = [ixUnique]
      end>
    IndexName = 'cdsSamplePDFIndex1'
    Params = <>
    StoreDefs = True
    OnReconcileError = cdsAnyReconcileError
    Left = 736
    Top = 72
    object cdsSamplePDFStep: TIntegerField
      FieldName = 'Step'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '###0'
    end
    object cdsSamplePDFPDFDataValue: TFloatField
      FieldName = 'PDFDataValue'
      DisplayFormat = '####0.000'
    end
    object cdsSamplePDFPDFValue: TFloatField
      FieldName = 'PDFValue'
      DisplayFormat = '##0.00000'
    end
  end
  object dsSamplePDF: TDataSource
    DataSet = cdsSamplePDF
    Left = 764
    Top = 72
  end
  object cdsData: TClientDataSet
    PersistDataPacket.Data = {
      AD0100009619E0BD010000001800000013000000000003000000AD0104745265
      6304000100000000000853616D706C654E6F0100490000000100055749445448
      0200020014000446726163010049000000010005574944544802000200140006
      5A6F6E6549440100490000000100055749445448020002000200095062323037
      5532333508000400000000000E5062323037553233355369676D610800040000
      0000000950623230365532333808000400000000000E50623230365532333853
      69676D6108000400000000000955323338506232303608000400000000000E55
      32333850623230365369676D6108000400000000000A50623230375062323036
      08000400000000000F506232303750623230365369676D610800040000000000
      09496E636C756465594E01004900000001000557494454480200020001001250
      657263656E74436F6E636F7264616E636508000400000000000C507265666572
      7265644167650800040000000000115072656665727265644167655369676D61
      0800040000000000045661723108000400000000000456617232080004000000
      0000045661723308000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 736
    Top = 120
    object cdsDatatRec: TIntegerField
      FieldName = 'tRec'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDataSampleNo: TStringField
      FieldName = 'SampleNo'
    end
    object cdsDataFrac: TStringField
      FieldName = 'Frac'
    end
    object cdsDataZoneID: TStringField
      FieldName = 'ZoneID'
      Size = 2
    end
    object cdsDataPb207U235: TFloatField
      FieldName = 'Pb207U235'
      DisplayFormat = '###0.000'
    end
    object cdsDataPb207U235Sigma: TFloatField
      FieldName = 'Pb207U235Sigma'
      DisplayFormat = '###0.000'
    end
    object cdsDataPb206U238: TFloatField
      FieldName = 'Pb206U238'
      DisplayFormat = '###0.000'
    end
    object cdsDataPb206U238Sigma: TFloatField
      FieldName = 'Pb206U238Sigma'
      DisplayFormat = '###0.000'
    end
    object cdsDataU238Pb206: TFloatField
      FieldName = 'U238Pb206'
      DisplayFormat = '###0.00'
    end
    object cdsDataU238Pb206Sigma: TFloatField
      FieldName = 'U238Pb206Sigma'
      DisplayFormat = '###0.00'
    end
    object cdsDataPb207Pb206: TFloatField
      FieldName = 'Pb207Pb206'
      DisplayFormat = '#0.00000'
    end
    object cdsDataPb207Pb206Sigma: TFloatField
      FieldName = 'Pb207Pb206Sigma'
      DisplayFormat = '#0.00000'
    end
    object cdsDataIncludeYN: TStringField
      FieldName = 'IncludeYN'
      Size = 1
    end
    object cdsDataPercentConcordance: TFloatField
      FieldName = 'PercentConcordance'
      DisplayFormat = '###0.0'
    end
    object cdsDataPreferredAge: TFloatField
      FieldName = 'PreferredAge'
      DisplayFormat = '###0.00'
    end
    object cdsDataPreferredAgeSigma: TFloatField
      FieldName = 'PreferredAgeSigma'
      DisplayFormat = '###0.00'
    end
    object cdsDataVar1: TFloatField
      DisplayLabel = 'Var 1'
      FieldName = 'Var1'
      DisplayFormat = '####0.000'
    end
    object cdsDataVar2: TFloatField
      DisplayLabel = 'Var 2'
      FieldName = 'Var2'
      DisplayFormat = '####0.000'
    end
    object cdsDataVar3: TFloatField
      DisplayLabel = 'Var 3'
      FieldName = 'Var3'
      DisplayFormat = '####0.000'
    end
  end
  object dsData: TDataSource
    DataSet = cdsData
    Left = 768
    Top = 120
  end
  object cdsUnitPDF: TClientDataSet
    PersistDataPacket.Data = {
      C20000009619E0BD010000001800000008000000000003000000C20009436F75
      6E7472794944010049000000010005574944544802000200030006556E697449
      44040001000000000006537465704944040001000000000008556E69744E616D
      65010049000000010005574944544802000200320008556E697452616E6B0100
      490000000100055749445448020002001E0007556E6974416765080004000000
      000008477261696E41676508000400000000000850444676616C756508000400
      000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CountryID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UnitID'
        DataType = ftInteger
      end
      item
        Name = 'StepID'
        DataType = ftInteger
      end
      item
        Name = 'UnitName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UnitRank'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UnitAge'
        DataType = ftFloat
      end
      item
        Name = 'GrainAge'
        DataType = ftFloat
      end
      item
        Name = 'PDFvalue'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsUnitPDFIndex1'
        Fields = 'CountryID;UnitID;StepID'
        Options = [ixUnique]
      end>
    IndexName = 'cdsUnitPDFIndex1'
    Params = <>
    StoreDefs = True
    OnReconcileError = cdsAnyReconcileError
    Left = 824
    Top = 72
    object cdsUnitPDFCountryID: TStringField
      FieldName = 'CountryID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cdsUnitPDFUnitID: TIntegerField
      FieldName = 'UnitID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsUnitPDFStepID: TIntegerField
      FieldName = 'StepID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsUnitPDFUnitName: TStringField
      FieldName = 'UnitName'
      Size = 50
    end
    object cdsUnitPDFUnitRank: TStringField
      FieldName = 'UnitRank'
      Size = 30
    end
    object cdsUnitPDFUnitAge: TFloatField
      FieldName = 'UnitAge'
      DisplayFormat = '###0.000'
    end
    object cdsUnitPDFGrainAge: TFloatField
      FieldName = 'GrainAge'
      DisplayFormat = '###0.000'
    end
    object cdsUnitPDFPDFvalue: TFloatField
      FieldName = 'PDFvalue'
      DisplayFormat = '##0.000'
    end
  end
  object dsUnitPDF: TDataSource
    DataSet = cdsUnitPDF
    Left = 848
    Top = 72
  end
  object qRawDataInclude: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE'
      'FROM SMPDATA,VARREG'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'NIncl'#39)
    SQLConnection = sqlcDateView
    Left = 558
    Top = 739
    object qRawDataIncludeSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRawDataIncludeFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object qRawDataIncludeISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object qRawDataIncludeVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object qRawDataIncludeDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#0.0'
    end
  end
  object cdsRawDataInclude: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataInclude
    Params = <>
    Left = 610
    Top = 739
    object cdsRawDataIncludeSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object cdsRawDataIncludeFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Size = 15
    end
    object cdsRawDataIncludeISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Size = 15
    end
    object cdsRawDataIncludeVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Size = 15
    end
    object cdsRawDataIncludeDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#0.0'
    end
  end
  object dsRawDataInclude: TDataSource
    DataSet = cdsRawDataInclude
    Left = 638
    Top = 739
  end
  object cdsUnitGrainAgeData: TClientDataSet
    PersistDataPacket.Data = {
      950100009619E0BD010000001800000011000000000003000000950109436F75
      6E7472794944010049000000010005574944544802000200140006556E697449
      4404000100000000000853616D706C654E6F0100490000000100055749445448
      0200020014000446726163010049000000010005574944544802000200140006
      5A6F6E65494401004900000001000557494454480200020002000A416E616C79
      7369734E6F040001000000000008556E69744E616D6501004900000001000557
      4944544802000200140008556E697452616E6B01004900000001000557494454
      4802000200140007556E6974416765080004000000000008477261696E416765
      080004000000000013477261696E416765556E6365727461696E747908000400
      0000000009496E636C756465594E010049000000010005574944544802000200
      14001250657263656E74436F6E636F7264616E636508000400000000000A5265
      674173736F634944080004000000000004566172310800040000000000045661
      72320800040000000000045661723308000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 824
    Top = 120
    object cdsUnitGrainAgeDataCountryID: TStringField
      FieldName = 'CountryID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsUnitGrainAgeDataUnitID: TIntegerField
      FieldName = 'UnitID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsUnitGrainAgeDataSampleNo: TStringField
      FieldName = 'SampleNo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsUnitGrainAgeDataFrac: TStringField
      FieldName = 'Frac'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsUnitGrainAgeDataZoneID: TStringField
      FieldName = 'ZoneID'
      Size = 2
    end
    object cdsUnitGrainAgeDataAnalysisNo: TIntegerField
      FieldName = 'AnalysisNo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsUnitGrainAgeDataUnitName: TStringField
      FieldName = 'UnitName'
    end
    object cdsUnitGrainAgeDataUnitRank: TStringField
      FieldName = 'UnitRank'
    end
    object cdsUnitGrainAgeDataUnitAge: TFloatField
      FieldName = 'UnitAge'
      DisplayFormat = '###0.000'
    end
    object cdsUnitGrainAgeDataGrainAge: TFloatField
      FieldName = 'GrainAge'
      DisplayFormat = '###0.000'
    end
    object cdsUnitGrainAgeDataGrainAgeUncertainty: TFloatField
      FieldName = 'GrainAgeUncertainty'
      DisplayFormat = '###0.000'
    end
    object cdsUnitGrainAgeDataIncludeYN: TStringField
      FieldName = 'IncludeYN'
    end
    object cdsUnitGrainAgeDataPercentConcordance: TFloatField
      FieldName = 'PercentConcordance'
      DisplayFormat = '###0.00'
    end
    object cdsUnitGrainAgeDataRegAssocID: TFloatField
      FieldName = 'RegAssocID'
    end
    object cdsUnitGrainAgeDataVar1: TFloatField
      FieldName = 'Var1'
      DisplayFormat = '####0.000'
    end
    object cdsUnitGrainAgeDataVar2: TFloatField
      FieldName = 'Var2'
      DisplayFormat = '####0.000'
    end
    object cdsUnitGrainAgeDataVar3: TFloatField
      FieldName = 'Var3'
      DisplayFormat = '####0.000'
    end
  end
  object dsUnitGrainAgeData: TDataSource
    DataSet = cdsUnitGrainAgeData
    Left = 856
    Top = 120
  end
  object qSampleDetritalAges: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SampleID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IsotopeSystemID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT distinct ISORGR30.recordid, isorgr30.countryabr, isorgr30' +
        '.materialabr,'
      '  isorgr30.isotopesystem, isorgr30.interpabr,'
      '  isorgr30.rage, isorgr30.rageperror, isorgr30.ragemerror'
      'FROM isorgr30, isofor, userswhofor, smpreg'
      'WHERE userswhofor.userid = :UserID'
      'and isorgr30.interpabr = '#39'Detri'#39
      'and isorgr30.recordid = smpreg.recordid'
      'and isorgr30.recordid = isofor.recordid'
      'and isofor.whoforid = userswhofor.whoforid'
      'and smpreg.isosystem = isorgr30.isotopesystem'
      'and smpreg.sampleno = :SampleID'
      'and isorgr30.isotopesystem = :IsotopeSystemID')
    SQLConnection = sqlcDateView
    Left = 32
    Top = 704
  end
  object dspSampleDetritalAges: TDataSetProvider
    DataSet = qSampleDetritalAges
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 64
    Top = 704
  end
  object cdsSampleDetritalAges: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSampleDetritalAges'
    OnReconcileError = cdsAnyReconcileError
    Left = 96
    Top = 704
    object cdsSampleDetritalAgesRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSampleDetritalAgesCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsSampleDetritalAgesMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsSampleDetritalAgesISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsSampleDetritalAgesINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsSampleDetritalAgesRAGE: TFloatField
      FieldName = 'RAGE'
      Required = True
    end
    object cdsSampleDetritalAgesRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      Required = True
    end
    object cdsSampleDetritalAgesRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      Required = True
    end
  end
  object dsSampleDetritalAges: TDataSource
    DataSet = cdsSampleDetritalAges
    Left = 128
    Top = 704
  end
  object qMatchingAges: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'AgeMin'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'AgeMax'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT distinct ISORGR30.recordid, isorgr30.countryabr, isorgr30' +
        '.materialabr,'
      '  isorgr30.isotopesystem, isorgr30.interpabr,'
      '  isorgr30.rage, isorgr30.rageperror, isorgr30.ragemerror,'
      '  smploc.sampleno, smploc.longitude,smploc.latitude,'
      
        '  suite.unitname, suite.unitrank,suite.unitid, interpretation.in' +
        'terpmatching'
      
        'FROM isorgr30, isofor, userswhofor, smpreg, smploc, interpretati' +
        'on, suite'
      'WHERE userswhofor.userid = :UserID'
      'and isorgr30.rage >= :AgeMin'
      'and isorgr30.rage <= :AgeMax'
      'and isorgr30.unitid = suite.unitid'
      'and isorgr30.recordid = smpreg.recordid'
      'and isorgr30.recordid = isofor.recordid'
      'and isofor.whoforid = userswhofor.whoforid'
      'and smpreg.isosystem = isorgr30.isotopesystem'
      'and smpreg.sampleno = smploc.sampleno'
      'and isorgr30.interpabr = interpretation.interpabr'
      'and interpretation.interpmatching > 0'
      'and isorgr30.countryabr = '#39'ZAF'#39)
    SQLConnection = sqlcDateView
    Left = 32
    Top = 752
  end
  object dspMatchingAges: TDataSetProvider
    DataSet = qMatchingAges
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 64
    Top = 752
  end
  object cdsMatchingAges: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMatchingAges'
    OnReconcileError = cdsAnyReconcileError
    Left = 96
    Top = 752
    object cdsMatchingAgesRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMatchingAgesCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsMatchingAgesMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsMatchingAgesISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object cdsMatchingAgesINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsMatchingAgesRAGE: TFloatField
      FieldName = 'RAGE'
      Required = True
    end
    object cdsMatchingAgesRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      Required = True
    end
    object cdsMatchingAgesRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      Required = True
    end
    object cdsMatchingAgesSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsMatchingAgesLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object cdsMatchingAgesLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
    end
    object cdsMatchingAgesUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsMatchingAgesUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
      Size = 5
    end
    object cdsMatchingAgesINTERPMATCHING: TIntegerField
      FieldName = 'INTERPMATCHING'
      Required = True
    end
    object cdsMatchingAgesUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
  end
  object dsMatchingAges: TDataSource
    DataSet = cdsMatchingAges
    Left = 128
    Top = 752
  end
  object qInsertUserSourceSamples: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'UserProjectID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitName'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitRank'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitAge'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Longitude'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Latitude'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CountryID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO USERUNITSUITESAMPLES'
      
        '(UserProjectID,UserID,UnitID,SampleNo,StratDBUnitID,StratDBUnitN' +
        'ame,StratDBUnitRank,StratDBUnitAge,Longitude,Latitude,CountryID)'
      
        'Values (:UserProjectID,:UserID, :UnitID, :SampleNo, :StratDBUnit' +
        'ID, :StratDBUnitName, :StratDBUnitRank, :StratDBUnitAge, :Longit' +
        'ude, :Latitude, :CountryID)')
    SQLConnection = sqlcDateView
    Left = 216
    Top = 616
  end
  object qUserSourceSamples: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ProjectID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT u.userprojectid,u.userid,u.unitid, u.stratdbunitid,u.stra' +
        'tdbunitname,'
      
        '  u.stratdbunitrank,u.stratdbunitage,u.sampleno,u.longitude,u.la' +
        'titude,'
      '  u.sourcerecordid,'
      
        '  u.countryid,u.srcunitid,s.unitname as srcunitname,s.unitrank a' +
        's srcunitrank,'
      '  u.srcsampleno,u.srcinterpabr,'
      '  u.srcage,u.srcageplus95,u.srcageminus95,'
      '  u.srcsampleno, u.srclongitude,u.srclatitude,'
      '  u.sourcenuma as srcrefnum,a.sourceshort as srcrefshort,'
      '  u.sourcenumc as srcrefnumcompiled'
      'FROM userunitsuitesources u,SUITE s,sourcelist a'
      'WHERE u.userprojectid = :ProjectID'
      'AND U.srcunitid = S.UNITID'
      'and u.sourcenuma=a.sourcenum'
      'ORDER BY U.STRATDBUNITAGE,U.SRCAGE')
    SQLConnection = sqlcDateView
    Left = 224
    Top = 664
  end
  object dspUserSourceSamples: TDataSetProvider
    DataSet = qUserSourceSamples
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 256
    Top = 664
  end
  object cdsUserSourceSamples: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserSourceSamples'
    OnReconcileError = cdsAnyReconcileError
    Left = 288
    Top = 664
    object cdsUserSourceSamplesUSERPROJECTID: TIntegerField
      FieldName = 'USERPROJECTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserSourceSamplesUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserSourceSamplesSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserSourceSamplesSOURCERECORDID: TIntegerField
      FieldName = 'SOURCERECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserSourceSamplesUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUserSourceSamplesSTRATDBUNITID: TIntegerField
      FieldName = 'STRATDBUNITID'
      Required = True
    end
    object cdsUserSourceSamplesSTRATDBUNITNAME: TStringField
      FieldName = 'STRATDBUNITNAME'
      Required = True
      Size = 50
    end
    object cdsUserSourceSamplesSTRATDBUNITRANK: TStringField
      FieldName = 'STRATDBUNITRANK'
      Required = True
      Size = 30
    end
    object cdsUserSourceSamplesSTRATDBUNITAGE: TFloatField
      FieldName = 'STRATDBUNITAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsUserSourceSamplesLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
      DisplayFormat = '##0.00000'
    end
    object cdsUserSourceSamplesLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
      DisplayFormat = '##0.00000'
    end
    object cdsUserSourceSamplesCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsUserSourceSamplesSRCAGE: TFloatField
      FieldName = 'SRCAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsUserSourceSamplesSRCAGEPLUS95: TFloatField
      FieldName = 'SRCAGEPLUS95'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsUserSourceSamplesSRCAGEMINUS95: TFloatField
      FieldName = 'SRCAGEMINUS95'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsUserSourceSamplesSRCSAMPLENO: TStringField
      FieldName = 'SRCSAMPLENO'
      Required = True
    end
    object cdsUserSourceSamplesSRCLONGITUDE: TFloatField
      FieldName = 'SRCLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsUserSourceSamplesSRCLATITUDE: TFloatField
      FieldName = 'SRCLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsUserSourceSamplesSRCUNITID: TIntegerField
      FieldName = 'SRCUNITID'
      Required = True
    end
    object cdsUserSourceSamplesSRCINTERPABR: TStringField
      FieldName = 'SRCINTERPABR'
      Required = True
      Size = 5
    end
    object cdsUserSourceSamplesSRCUNITNAME: TStringField
      FieldName = 'SRCUNITNAME'
      Required = True
      Size = 50
    end
    object cdsUserSourceSamplesSRCUNITRANK: TStringField
      FieldName = 'SRCUNITRANK'
      Required = True
      Size = 5
    end
    object cdsUserSourceSamplesSRCREFNUM: TIntegerField
      FieldName = 'SRCREFNUM'
      Required = True
    end
    object cdsUserSourceSamplesSRCREFSHORT: TStringField
      FieldName = 'SRCREFSHORT'
      Required = True
      Size = 100
    end
    object cdsUserSourceSamplesSRCREFNUMCOMPILED: TIntegerField
      FieldName = 'SRCREFNUMCOMPILED'
      Required = True
    end
  end
  object dsUserSourceSamples: TDataSource
    DataSet = cdsUserSourceSamples
    Left = 320
    Top = 664
  end
  object qUserProjects: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM userprojects '
      'WHERE userprojects.userid = :UserID')
    SQLConnection = sqlcDateView
    Left = 224
    Top = 720
  end
  object dspUserProjects: TDataSetProvider
    DataSet = qUserProjects
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 256
    Top = 720
  end
  object cdsUserProjects: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserProjects'
    OnReconcileError = cdsAnyReconcileError
    Left = 288
    Top = 720
    object cdsUserProjectsUSERPROJECTID: TIntegerField
      FieldName = 'USERPROJECTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserProjectsUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUserProjectsUSERPROJECTNAME: TStringField
      FieldName = 'USERPROJECTNAME'
      Required = True
      Size = 50
    end
  end
  object dsUserProjects: TDataSource
    DataSet = cdsUserProjects
    Left = 320
    Top = 720
  end
  object qUserUnitGrainAgePDF: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ProjectID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT USERGRAINAGEPDF.projectid, USERGRAINAGEPDF.unitid,'
      '  USERGRAINAGEPDF.stratdbunitage, USERGRAINAGEPDF.regassocid,'
      
        '  USERUNITSUITESAMPLES.stratdbunitname, USERUNITSUITESAMPLES.str' +
        'atdbunitrank,'
      
        '  USERGRAINAGEPDF.stepno, USERGRAINAGEPDF.pdfage, USERGRAINAGEPD' +
        'F.pdfvalue'
      'FROM USERGRAINAGEPDF,USERUNITSUITESAMPLES'
      'WHERE USERGRAINAGEPDF.PROJECTID = :ProjectID'
      'AND USERGRAINAGEPDF.unitid = USERUNITSUITESAMPLES.stratdbunitid'
      
        'ORDER BY USERGRAINAGEPDF.unitid,USERGRAINAGEPDF.stratdbunitage,U' +
        'SERGRAINAGEPDF.stepno ')
    SQLConnection = sqlcDateView
    Left = 732
    Top = 18
  end
  object dspUserUnitGrainAgePDF: TDataSetProvider
    DataSet = qUserUnitGrainAgePDF
    Left = 762
    Top = 18
  end
  object cdsUserUnitGrainAgePDF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserUnitGrainAgePDF'
    Left = 790
    Top = 18
    object cdsUserUnitGrainAgePDFPROJECTID: TIntegerField
      FieldName = 'PROJECTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserUnitGrainAgePDFUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserUnitGrainAgePDFSTEPNO: TIntegerField
      FieldName = 'STEPNO'
      Required = True
    end
    object cdsUserUnitGrainAgePDFPDFAGE: TFloatField
      FieldName = 'PDFAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsUserUnitGrainAgePDFPDFVALUE: TFloatField
      FieldName = 'PDFVALUE'
      Required = True
      DisplayFormat = '##0.00'
    end
    object cdsUserUnitGrainAgePDFSTRATDBUNITAGE: TFloatField
      FieldName = 'STRATDBUNITAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsUserUnitGrainAgePDFREGASSOCID: TStringField
      FieldName = 'REGASSOCID'
      Required = True
      Size = 15
    end
    object cdsUserUnitGrainAgePDFSTRATDBUNITNAME: TStringField
      FieldName = 'STRATDBUNITNAME'
      Required = True
      Size = 50
    end
    object cdsUserUnitGrainAgePDFSTRATDBUNITRANK: TStringField
      FieldName = 'STRATDBUNITRANK'
      Required = True
      Size = 30
    end
  end
  object dsUserUnitGrainAgePDF: TDataSource
    DataSet = cdsUserUnitGrainAgePDF
    Left = 818
    Top = 18
  end
  object qDeleteGrainAgePDF: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ProjectID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'Delete FROM USERGRAINAGEPDF'
      'where usergrainagepdf.projectid = :ProjectID')
    SQLConnection = sqlcDateView
    Left = 360
    Top = 616
  end
  object qInsertUserGrainPDF: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'UserProjectID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StepNo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitName'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitRank'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'StratDBUnitAge'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IsotopeSystemID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO USERGRAINAGEPDF'
      
        '(ProjectID,UnitID,StepNo,PDFAge,PDFValue,StratDBUnitName,StratDB' +
        'UnitRank,StratDBUnitAge,IsotopeSystemID)'
      
        'Values (:UserProjectID, :UnitID, :StepNo, :StratDBUnitName, :Str' +
        'atDBUnitRank, :StratDBUnitAge, :IsotopeSystemID)')
    SQLConnection = sqlcDateView
    Left = 288
    Top = 616
  end
  object cdsGrainUnits: TClientDataSet
    PersistDataPacket.Data = {
      290000009619E0BD010000001800000001000000000003000000290006556E69
      74494404000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 16
    object cdsGrainUnitsUnitID: TIntegerField
      FieldName = 'UnitID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object dsGrainUnits: TDataSource
    DataSet = cdsGrainUnits
    Left = 632
    Top = 16
  end
  object qSamplesForUnit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ProjectID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM USERUNITSUITESAMPLES'
      'WHERE USERUNITSUITESAMPLES.USERPROJECTID = :ProjectID'
      'AND USERUNITSUITESAMPLES.STRATDBUNITID = :UnitID'
      
        'ORDER BY USERUNITSUITESAMPLES.STRATDBUNITAGE, USERUNITSUITESAMPL' +
        'ES.SAMPLENO')
    SQLConnection = sqlcDateView
    Left = 32
    Top = 504
  end
  object dspSamplesForUnit: TDataSetProvider
    DataSet = qSamplesForUnit
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 64
    Top = 504
  end
  object cdsSamplesForUnit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSamplesForUnit'
    OnReconcileError = cdsAnyReconcileError
    Left = 96
    Top = 504
    object cdsSamplesForUnitUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSamplesForUnitSTRATDBUNITID: TIntegerField
      FieldName = 'STRATDBUNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSamplesForUnitSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSamplesForUnitUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsSamplesForUnitSTRATDBUNITNAME: TStringField
      FieldName = 'STRATDBUNITNAME'
      Required = True
      Size = 50
    end
    object cdsSamplesForUnitSTRATDBUNITRANK: TStringField
      FieldName = 'STRATDBUNITRANK'
      Required = True
      Size = 30
    end
    object cdsSamplesForUnitSTRATDBUNITAGE: TFloatField
      FieldName = 'STRATDBUNITAGE'
      Required = True
    end
    object cdsSamplesForUnitLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object cdsSamplesForUnitLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
    end
    object cdsSamplesForUnitCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
  end
  object dsSamplesForUnit: TDataSource
    DataSet = cdsSamplesForUnit
    Left = 128
    Top = 504
  end
  object qUserUnitSuiteSamplesUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ProjectID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT USERUNITSUITESAMPLES.STRATDBUNITID'
      'FROM USERUNITSUITESAMPLES'
      'WHERE USERUNITSUITESAMPLES.USERPROJECTID = :ProjectID'
      'ORDER BY USERUNITSUITESAMPLES.STRATDBUNITAGE')
    SQLConnection = sqlcDateView
    Left = 208
    Top = 504
  end
  object dspUserUnitSuiteSamplesUnits: TDataSetProvider
    DataSet = qUserUnitSuiteSamplesUnits
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 240
    Top = 504
  end
  object cdsUserUnitSuiteSamplesUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserUnitSuiteSamplesUnits'
    OnReconcileError = cdsAnyReconcileError
    Left = 272
    Top = 504
    object cdsUserUnitSuiteSamplesUnitsSTRATDBUNITID: TIntegerField
      FieldName = 'STRATDBUNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsUserUnitSuiteSamplesUnits: TDataSource
    DataSet = cdsUserUnitSuiteSamplesUnits
    Left = 304
    Top = 504
  end
  object qStratDBUnitIDforDVUnitID: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT distinct suite.unitid,suite.gisid'
      'FROM suite'
      'WHERE suite.unitid = :UnitID')
    SQLConnection = sqlcDateView
    Left = 312
    Top = 440
  end
  object dspStratDBUnitIDforDVUnitID: TDataSetProvider
    DataSet = qStratDBUnitIDforDVUnitID
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 344
    Top = 440
  end
  object cdsStratDBUnitIDforDVUnitID: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStratDBUnitIDforDVUnitID'
    OnReconcileError = cdsAnyReconcileError
    Left = 376
    Top = 440
    object cdsStratDBUnitIDforDVUnitIDUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsStratDBUnitIDforDVUnitIDGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
  end
  object dsStratDBUnitIDforDVUnitID: TDataSource
    DataSet = cdsStratDBUnitIDforDVUnitID
    Left = 408
    Top = 440
  end
  object qUpdateUserUnitSuiteSamples: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'revisedage'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'update userunitsuitesamples'
      'set userUNITsuitesamples.stratdbunitage=:revisedage'
      'where userunitsuitesamples.stratdbunitid=:unitid')
    SQLConnection = sqlcDateView
    Left = 248
    Top = 592
  end
  object qDVLIPDomainDatesProvinces: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
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
      end
      item
        DataType = ftInteger
        Name = 'PrefLevel'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  USERDOMAINS.DOMAINORDER,USERDOMAINS.DOMAINID,'
      '  USERDOMAINS.DOMAINXMIN,USERDOMAINS.DOMAINXMAX,'
      '  DOMAINS.DOMAINNAME,ISOLIP.LIPID,LIPS.LIPNAME,'
      '  ISORGR30.COUNTRYABR, SUITE.UNITNAME, ISORGR30.UNITID, '
      '  ISORGR30.MATERIALABR,  ISORGR30.ISOTOPESYSTEM, '
      '  ISORGR30.APPROACHABR,  ISORGR30.TECHABR,'
      '  ISORGR30.PREFLEVEL,'
      '  ISORGR30.INTERPABR, ISORGR30.IAGE, ISORGR30.IAGEPERROR, '
      '  ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,    '
      '  ISORGR30.LITHOLOGY, ISORGR30.RECORDID, '
      '  ISORGR30.RAGE, ISORGR30.RAGEPERROR, '
      '  ISORGR30.RAGEMERROR'
      
        'FROM ISORGR30,ISOFOR,USERDOMAINS,DOMAINS,SUITE,USERSWHOFOR,ISOLI' +
        'P,LIPDOMAIN,LIPS'
      'WHERE USERDOMAINS.USERID=:UserID'
      'AND ISORGR30.RAGE >= :ChartMinAge'
      'AND ISORGR30.RAGE <= :ChartMaxAge'
      'AND USERSWHOFOR.USERID=USERDOMAINS.USERID'
      'and USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID'
      'AND ISOFOR.RECORDID=ISORGR30.RECORDID'
      'AND SUITE.UNITID=ISORGR30.UNITID'
      'AND ISORGR30.PREFLEVEL >=  :PrefLevel'
      'AND USERDOMAINS.DOMAINID=DOMAINS.DOMAINID'
      'AND DOMAINS.DOMAINID=LIPDOMAIN.DOMAINID'
      'AND ISOLIP.RECORDID=ISORGR30.RECORDID'
      'AND ISOLIP.LIPID=LIPDOMAIN.LIPID'
      'AND LIPDOMAIN.LIPID=LIPS.LIPID'
      'AND LIPDOMAIN.INC4CHTYN='#39'Y'#39
      'ORDER BY USERDOMAINS.DOMAINORDER,ISORGR30.IAGE')
    SQLConnection = sqlcDateView
    Left = 220
    Top = 770
  end
  object dspDVLIPDomainDatesProvinces: TDataSetProvider
    DataSet = qDVLIPDomainDatesProvinces
    Left = 250
    Top = 770
  end
  object cdsDVLIPDomainDatesProvinces: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDVLIPDomainDatesProvinces'
    Left = 278
    Top = 770
    object IntegerField3: TIntegerField
      FieldName = 'DOMAINORDER'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object FloatField3: TFloatField
      FieldName = 'DOMAINXMIN'
      Required = True
    end
    object FloatField4: TFloatField
      FieldName = 'DOMAINXMAX'
      Required = True
    end
    object cdsDVLIPDomainDatesProvincesLIPID: TIntegerField
      FieldName = 'LIPID'
    end
    object cdsDVLIPDomainDatesProvincesLIPNAME: TStringField
      FieldName = 'LIPNAME'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object StringField8: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object StringField9: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object StringField10: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object StringField11: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object StringField12: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object StringField13: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object IntegerField5: TIntegerField
      FieldName = 'IAGE'
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'IAGEPERROR'
      Required = True
    end
    object IntegerField7: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object StringField14: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object StringField15: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object IntegerField8: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object FloatField5: TFloatField
      FieldName = 'RAGE'
    end
    object FloatField6: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object FloatField7: TFloatField
      FieldName = 'RAGEMERROR'
    end
    object SmallintField1: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object StringField16: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 30
    end
    object IntegerField9: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
  end
  object dsDVLIPDomainDatesProvinces: TDataSource
    DataSet = cdsDVLIPDomainDatesProvinces
    Left = 306
    Top = 770
  end
  object qUpdateNumFrac: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'totalnumberfrac'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sampleno'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'projectid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'update userunitsuitesamples'
      'set userUNITsuitesamples.numfractotal=:totalnumberfrac'
      'where userunitsuitesamples.sampleno=:sampleno'
      'and userunitsuitesamples.userprojectid = :projectid')
    SQLConnection = sqlcDateView
    Left = 320
    Top = 592
  end
  object qUserUnitSuiteSampleNumFrac: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ProjectID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VariableID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(SMPDATA.frac) AS NUMFRAC'
      'FROM smpdata,userunitsuitesamples,sourcelist,userswhofor'
      'WHERE USERUNITSUITESAMPLES.USERPROJECTID = :ProjectID'
      'AND USERUNITSUITESAMPLES.SAMPLENO = :SampleNo'
      'and SMPDATA.variableid = :VariableID'
      'AND USERSWHOFOR.userid = :UserID'
      'AND USERUNITSUITESAMPLES.SAMPLENO=SMPDATA.SAMPLENO'
      'AND SMPDATA.refnum = SOURCELIST.sourcenum'
      'AND SOURCELIST.whoforid = USERSWHOFOR.whoforid')
    SQLConnection = sqlcDateView
    Left = 360
    Top = 496
  end
  object dspUserUnitSuiteSampleNumFrac: TDataSetProvider
    DataSet = qUserUnitSuiteSampleNumFrac
    Left = 392
    Top = 496
  end
  object cdsUserUnitSuiteSampleNumFrac: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserUnitSuiteSampleNumFrac'
    Left = 424
    Top = 496
    object cdsUserUnitSuiteSampleNumFracNUMFRAC: TIntegerField
      FieldName = 'NUMFRAC'
    end
  end
  object dsUserUnitSuiteSampleNumFrac: TDataSource
    DataSet = cdsUserUnitSuiteSampleNumFrac
    Left = 456
    Top = 496
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcDateView
    Left = 24
    Top = 80
  end
  object qRawDataVar1: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftUnknown
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'QVar1'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 718
    Top = 643
    object StringField17: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField18: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField19: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField20: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FloatField8: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField21: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object FloatField9: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField22: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawDataVar1: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataVar1
    Params = <>
    Left = 746
    Top = 643
    object cdsRawDataVar1SAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataVar1FRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataVar1ISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataVar1VARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataVar1DATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataVar1NORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataVar1STANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataVar1VARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataVar1: TDataSource
    DataSet = cdsRawDataVar1
    Left = 774
    Top = 643
  end
  object qRawDataVar2: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftUnknown
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'RVar2'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 718
    Top = 699
    object StringField29: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField30: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField31: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField32: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FloatField12: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField33: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object FloatField13: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField34: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawDataVar2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataVar2
    Params = <>
    Left = 746
    Top = 699
    object cdsRawDataVar2SAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataVar2FRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataVar2ISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataVar2VARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataVar2DATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataVar2NORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataVar2STANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataVar2VARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataVar2: TDataSource
    DataSet = cdsRawDataVar2
    Left = 774
    Top = 699
  end
  object qRawDataVar3: TSQLQuery
    DataSource = dsqRawSmp
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SAMPLENO'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'FRAC'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftUnknown
        Name = 'REGASSOCID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '  SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.ISOSYSTEM,'
      
        '  SMPDATA.VARIABLEID, SMPDATA.DATAVALUE, SMPDATA.NORMALISINGSTAN' +
        'DARD,'
      '  SMPDATA.STANDARDVALUE,VARVAR.VARIABLENAME'
      'FROM SMPDATA,VARREG,VARVAR'
      'WHERE SMPDATA.SAMPLENO = :SAMPLENO'
      'AND SMPDATA.FRAC = :FRAC'
      'AND VARREG.REGASSOCID = :REGASSOCID'
      'AND SMPDATA.VARIABLEID=VARREG.VARIABLEID'
      'AND VARREG.VARREGTYPEID='#39'SVar3'#39
      'AND SMPDATA.VARIABLEID=VARVAR.VARIABLEID')
    SQLConnection = sqlcDateView
    Left = 718
    Top = 747
    object StringField41: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField42: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField43: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object StringField44: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object FloatField16: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField45: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object FloatField17: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField46: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsRawDataVar3: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRawSmpqRawDataVar3
    Params = <>
    Left = 746
    Top = 747
    object cdsRawDataVar3SAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataVar3FRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataVar3ISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataVar3VARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsRawDataVar3DATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataVar3NORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsRawDataVar3STANDARDVALUE: TFloatField
      FieldName = 'STANDARDVALUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRawDataVar3VARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsRawDataVar3: TDataSource
    DataSet = cdsRawDataVar3
    Left = 774
    Top = 747
  end
  object qUserDetritalSamples: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ProjectID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM userunitsuitesources,SUITE'
      'WHERE userunitsuitesources.userprojectid = :ProjectID'
      'AND USERUNITSUITESOURCES.srcunitid = SUITE.UNITID'
      
        'ORDER BY USERUNITSUITESOURCES.STRATDBUNITAGE,USERUNITSUITESOURCE' +
        'S.SRCAGE')
    SQLConnection = sqlcDateView
    Left = 24
    Top = 800
  end
  object dspUserDetritalSamples: TDataSetProvider
    DataSet = qUserDetritalSamples
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 56
    Top = 800
  end
  object cdsUserDetritalSamples: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserDetritalSamples'
    OnReconcileError = cdsAnyReconcileError
    Left = 88
    Top = 800
    object IntegerField10: TIntegerField
      FieldName = 'USERPROJECTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField11: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField53: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField12: TIntegerField
      FieldName = 'SOURCERECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField54: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object IntegerField13: TIntegerField
      FieldName = 'STRATDBUNITID'
      Required = True
    end
    object StringField55: TStringField
      FieldName = 'STRATDBUNITNAME'
      Required = True
      Size = 50
    end
    object StringField56: TStringField
      FieldName = 'STRATDBUNITRANK'
      Required = True
      Size = 30
    end
    object FloatField20: TFloatField
      FieldName = 'STRATDBUNITAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object FloatField21: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
      DisplayFormat = '##0.00000'
    end
    object FloatField22: TFloatField
      FieldName = 'LATITUDE'
      Required = True
      DisplayFormat = '##0.00000'
    end
    object StringField57: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object StringField58: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object FloatField23: TFloatField
      FieldName = 'SRCAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object FloatField24: TFloatField
      FieldName = 'SRCAGEPLUS95'
      Required = True
      DisplayFormat = '###0.000'
    end
    object FloatField25: TFloatField
      FieldName = 'SRCAGEMINUS95'
      Required = True
      DisplayFormat = '###0.000'
    end
    object StringField59: TStringField
      FieldName = 'SRCSAMPLENO'
      Required = True
    end
    object FloatField26: TFloatField
      FieldName = 'SRCLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object FloatField27: TFloatField
      FieldName = 'SRCLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object IntegerField14: TIntegerField
      FieldName = 'SRCUNITID'
      Required = True
    end
    object StringField60: TStringField
      FieldName = 'SRCINTERPABR'
      Required = True
      Size = 5
    end
  end
  object dsUserDetritalSamples: TDataSource
    DataSet = cdsUserDetritalSamples
    Left = 120
    Top = 800
  end
  object qSampleZones: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM SAMPLEZONES'
      'ORDER BY SAMPLEZONES.ZONETYPE')
    SQLConnection = sqlcDateView
    Left = 312
    Top = 384
  end
  object dspSampleZones: TDataSetProvider
    DataSet = qSampleZones
    Left = 344
    Top = 384
  end
  object cdsSampleZones: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSampleZones'
    Left = 376
    Top = 384
    object cdsSampleZonesZONEID: TStringField
      FieldName = 'ZONEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsSampleZonesZONETYPE: TStringField
      FieldName = 'ZONETYPE'
      Required = True
    end
  end
  object dsSampleZones: TDataSource
    DataSet = cdsSampleZones
    Left = 408
    Top = 384
  end
  object qUpdateUserUnitSourceReferences: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ProjectID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ProjectID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'update userunitsuitesources s'
      'set s.sourcenuma=(select a.refnum'
      'from sourcea a'
      'where s.sourcerecordid=a.recordid'
      'and a.sourcetypeid='#39'A'#39
      'and s.userprojectid= :ProjectID'
      ')'
      'where exists (select *'
      'from sourcea a2'
      'where a2.recordid=s.sourcerecordid'
      'and s.userprojectid= :ProjectID'
      'and a2.sourcetypeid='#39'A'#39)
    SQLConnection = sqlcDateView
    Left = 392
    Top = 592
  end
  object qRefFull: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'SourceNum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from SOURCELIST'
      'where SOURCELIST.SourceNum=:SourceNum')
    SQLConnection = sqlcDateView
    Left = 344
    Top = 220
    object qRefFullSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRefFullSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object qRefFullSOURCEYEAR: TIntegerField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object qRefFullCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qRefFullWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object qRefFullSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
      Size = 1
    end
    object qRefFullDOI: TStringField
      FieldName = 'DOI'
      Size = 100
    end
  end
  object dspRefFull: TDataSetProvider
    DataSet = qRefFull
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 372
    Top = 218
  end
  object cdsRefFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefFull'
    Left = 400
    Top = 218
    object cdsRefFullSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefFullSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object cdsRefFullSOURCEYEAR: TIntegerField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object cdsRefFullCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsRefFullWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object cdsRefFullSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
      Size = 1
    end
    object cdsRefFullDOI: TStringField
      FieldName = 'DOI'
      Size = 100
    end
  end
  object dsRefFull: TDataSource
    DataSet = cdsRefFull
    Left = 426
    Top = 218
  end
  object qInsertLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'tSourceNum'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tSourceShort'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tSourceYear'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tContinentID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tWhoForID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO SOURCELIST'
      '(SourceNum, SourceShort, SourceYear, ContinentID, WhoForID)'
      
        'Values (:tSourceNum, :tSourceShort, :tSourceYear, :tContinentID,' +
        ' :tWhoForID)')
    SQLConnection = sqlcDateView
    Left = 480
    Top = 220
  end
  object qCompleteUserGrainData: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM UserUnitSuiteSampleData U'
      'WHERE U.UserID=:UserID'
      'ORDER BY U.SampleNo, U.Frac')
    SQLConnection = sqlcDateView
    Left = 316
    Top = 282
  end
  object dspCompleteUserGrainData: TDataSetProvider
    DataSet = qCompleteUserGrainData
    Left = 346
    Top = 282
  end
  object cdsCompleteUserGrainData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCompleteUserGrainData'
    Left = 374
    Top = 282
    object cdsCompleteUserGrainDataUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCompleteUserGrainDataSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCompleteUserGrainDataFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsCompleteUserGrainDataORIGINALNO: TStringField
      FieldName = 'ORIGINALNO'
      Required = True
    end
    object cdsCompleteUserGrainDataLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsCompleteUserGrainDataLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object cdsCompleteUserGrainDataLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
    end
    object cdsCompleteUserGrainDataELEVATION: TFloatField
      FieldName = 'ELEVATION'
      Required = True
    end
    object cdsCompleteUserGrainDataUSERPROJECTID: TIntegerField
      FieldName = 'USERPROJECTID'
      Required = True
    end
    object cdsCompleteUserGrainDataUSERPROJECTNAME: TStringField
      FieldName = 'USERPROJECTNAME'
      Size = 50
    end
    object cdsCompleteUserGrainDataCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsCompleteUserGrainDataUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsCompleteUserGrainDataSTRATDBUNITID: TIntegerField
      FieldName = 'STRATDBUNITID'
      Required = True
    end
    object cdsCompleteUserGrainDataSTRATDBUNITNAME: TStringField
      FieldName = 'STRATDBUNITNAME'
      Required = True
      Size = 50
    end
    object cdsCompleteUserGrainDataSTRATDBUNITRANK: TStringField
      FieldName = 'STRATDBUNITRANK'
      Required = True
      Size = 30
    end
    object cdsCompleteUserGrainDataSTRATDBUNITAGE: TFloatField
      FieldName = 'STRATDBUNITAGE'
      Required = True
    end
    object cdsCompleteUserGrainDataVAR3X: TFloatField
      FieldName = 'VAR3X'
    end
    object cdsCompleteUserGrainDataVAR4XERR: TFloatField
      FieldName = 'VAR4XERR'
    end
    object cdsCompleteUserGrainDataVAR5Y: TFloatField
      FieldName = 'VAR5Y'
    end
    object cdsCompleteUserGrainDataVAR6YERR: TFloatField
      FieldName = 'VAR6YERR'
    end
    object cdsCompleteUserGrainDataVAR7R: TFloatField
      FieldName = 'VAR7R'
    end
    object cdsCompleteUserGrainDataVAR8Z: TFloatField
      FieldName = 'VAR8Z'
    end
    object cdsCompleteUserGrainDataVAR9ZERR: TFloatField
      FieldName = 'VAR9ZERR'
    end
    object cdsCompleteUserGrainDataVARAXPRE: TFloatField
      FieldName = 'VARAXPRE'
    end
    object cdsCompleteUserGrainDataVARBYPRE: TFloatField
      FieldName = 'VARBYPRE'
    end
    object cdsCompleteUserGrainDataVARCXERT: TFloatField
      FieldName = 'VARCXERT'
    end
    object cdsCompleteUserGrainDataVARDYERT: TFloatField
      FieldName = 'VARDYERT'
    end
    object cdsCompleteUserGrainDataVARE: TFloatField
      FieldName = 'VARE'
    end
    object cdsCompleteUserGrainDataVARF: TFloatField
      FieldName = 'VARF'
    end
    object cdsCompleteUserGrainDataVARGZPRE: TFloatField
      FieldName = 'VARGZPRE'
    end
    object cdsCompleteUserGrainDataVARHZERT: TFloatField
      FieldName = 'VARHZERT'
    end
    object cdsCompleteUserGrainDataVARIDISC: TFloatField
      FieldName = 'VARIDISC'
    end
    object cdsCompleteUserGrainDataVARJAGE: TFloatField
      FieldName = 'VARJAGE'
    end
    object cdsCompleteUserGrainDataVARKAERR: TFloatField
      FieldName = 'VARKAERR'
    end
    object cdsCompleteUserGrainDataVARLDM: TFloatField
      FieldName = 'VARLDM'
    end
    object cdsCompleteUserGrainDataVARMDMERR: TFloatField
      FieldName = 'VARMDMERR'
    end
    object cdsCompleteUserGrainDataVARNINCL: TFloatField
      FieldName = 'VARNINCL'
    end
    object cdsCompleteUserGrainDataVAROINIT: TFloatField
      FieldName = 'VAROINIT'
    end
    object cdsCompleteUserGrainDataVARP: TFloatField
      FieldName = 'VARP'
    end
    object cdsCompleteUserGrainDataVARQVAR1: TFloatField
      FieldName = 'VARQVAR1'
    end
    object cdsCompleteUserGrainDataVARRVAR2: TFloatField
      FieldName = 'VARRVAR2'
    end
    object cdsCompleteUserGrainDataVARSVAR3: TFloatField
      FieldName = 'VARSVAR3'
    end
    object cdsCompleteUserGrainDataDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
    end
  end
  object dsCompleteUserGrainData: TDataSource
    DataSet = cdsCompleteUserGrainData
    Left = 402
    Top = 282
  end
end
