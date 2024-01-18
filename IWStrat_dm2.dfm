object dmStrat: TdmStrat
  OldCreateOrder = False
  Left = 47
  Top = 167
  Height = 530
  Width = 1001
  object Query1: TSQLQuery
    NoMetadata = True
    ObjectView = True
    SQLConnection = sqlcStrat
    Params = <>
    SQL.Strings = (
      'select DISTINCT STRATUNITS.UNITID, STRATUNITS.COUNTRYID,'
      '  STRATUNITS.UNITNAME,  STRATUNITS.PARENTID,'
      '  STRATUNITS.RANKID,  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,  STRATUNITS.MAXAGE,'
      '  STRATUNITS.AGEUNITS,'
      '  RANKS.UNITRANK, COUNTRIES.COUNTRY,'
      '  STRATUNITS.APPROVALID, '
      '  APPROVALSTATUS.APPROVALID, APPROVALSTATUS.APPROVALSTATUS,'
      '  APPLICLINK.UNITID, APPLICLINK.APPLICATIONID'
      'from STRATUNITS, COUNTRIES, RANKS, APPROVALSTATUS, APPLICLINK'
      'where STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'AND STRATUNITS.UNITID=APPLICLINK.UNITID')
    Left = 236
    Top = 18
  end
  object dspQuery1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 266
    Top = 18
  end
  object cdsQuery1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1'
    Left = 294
    Top = 18
    object cdsQuery1UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsQuery1COUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsQuery1UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsQuery1RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsQuery1PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsQuery1MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsQuery1MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsQuery1AGEUNITS: TStringField
      DisplayLabel = 'Age Units'
      FieldName = 'AGEUNITS'
      Required = True
      Size = 6
    end
    object cdsQuery1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsQuery1UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsQuery1AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '#########0'
    end
    object cdsQuery1APPROVALSTATUS: TStringField
      DisplayLabel = 'Approval Status'
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
  end
  object dsQuery1: TDataSource
    DataSet = cdsQuery1
    Left = 322
    Top = 18
  end
  object SQLMonitor1: TSQLMonitor
    AutoSave = True
    FileName = 'C:\Dev\DateViewWeb2\sqlcDateView.txt'
    Left = 160
    Top = 14
  end
  object qContinents: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <>
    SQL.Strings = (
      'select * from Continents'
      'where Continents.HasData='#39'Y'#39)
    Left = 30
    Top = 58
    object qContinentsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qContinentsCONTINENT: TStringField
      FieldName = 'CONTINENT'
    end
  end
  object dspContinents: TDataSetProvider
    DataSet = qContinents
    Constraints = True
    Left = 58
    Top = 58
  end
  object cdsContinents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContinents'
    Left = 86
    Top = 58
    object cdsContinentsCONTINENTID: TStringField
      DisplayLabel = 'Continent ID'
      FieldName = 'CONTINENTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsContinentsCONTINENT: TStringField
      DisplayLabel = 'Continent'
      FieldName = 'CONTINENT'
    end
  end
  object qCountries: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <>
    SQL.Strings = (
      'select  COUNTRIES.CONTINENTID, COUNTRIES.COUNTRYID,'
      '  COUNTRIES.COUNTRY,'
      '  CONTINENTS.CONTINENT, COUNTRIES.COUNTRYHASRECORDS'
      'from COUNTRIES, CONTINENTS'
      'where COUNTRIES.CONTINENTID=CONTINENTS.CONTINENTID'
      'and COUNTRIES.COUNTRYHASRECORDS = '#39'Y'#39
      'order by COUNTRIES.COUNTRY')
    Left = 28
    Top = 104
  end
  object dspCountries: TDataSetProvider
    DataSet = qCountries
    Constraints = True
    Left = 56
    Top = 104
  end
  object cdsCountries: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountries'
    Left = 84
    Top = 104
    object cdsCountriesCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCountriesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsCountriesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsCountriesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
    object cdsCountriesCOUNTRYHASRECORDS: TStringField
      FieldName = 'COUNTRYHASRECORDS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qUnits: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <>
    SQL.Strings = (
      'SELECT DISTINCT STRATUNITS.UNITID, STRATUNITS.UNITNAME, '
      '   STRATUNITS.COUNTRYID, STRATUNITS.PARENTID,'
      '   STRATUNITS.RANKID, STRATUNITS.AGEYEARS,'
      '   APPLICLINK.APPLICATIONID'
      'FROM STRATUNITS,COUNTRIES,CONTINENTS,APPLICLINK'
      'WHERE CONTINENTS.CONTINENTID = COUNTRIES.CONTINENTID'
      'AND COUNTRIES.COUNTRYID = STRATUNITS.COUNTRYID'
      'AND STRATUNITS.UNITID=APPLICLINK.UNITID'
      'AND ( CONTINENTS.CONTINENTID = '#39'AFR'#39
      ' ) '
      'AND ( STRATUNITS.COUNTRYID = '#39'ZAF'#39
      ' ) '
      'ORDER BY STRATUNITS.UNITNAME, STRATUNITS.UNITID')
    Left = 30
    Top = 146
  end
  object dspUnits: TDataSetProvider
    DataSet = qUnits
    Constraints = True
    Left = 60
    Top = 148
  end
  object cdsUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnits'
    Left = 88
    Top = 148
    object cdsUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsUnitsPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsUnitsRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '#########0'
    end
  end
  object qReferences: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <>
    SQL.Strings = (
      'SELECT DISTINCT SOURCELIST.SOURCENUM, '
      '  SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,'
      '  CONTINENTS.CONTINENT'
      'FROM SOURCELIST,CONTINENTS'
      'WHERE CONTINENTS.CONTINENTID = SOURCELIST.CONTINENTID')
    Left = 24
    Top = 286
    object qReferencesSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qReferencesSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 255
    end
    object qReferencesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qReferencesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dspReferences: TDataSetProvider
    DataSet = qReferences
    Constraints = True
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 52
    Top = 286
  end
  object cdsReferences: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReferences'
    Left = 82
    Top = 286
    object cdsReferencesSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsReferencesSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 255
    end
    object cdsReferencesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsReferencesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qValidationStatus: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <>
    SQL.Strings = (
      'select * from ValidationStatus')
    Left = 20
    Top = 238
    object qValidationStatusVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      Required = True
      Size = 5
    end
    object qValidationStatusVALIDATIONSTATUS: TStringField
      FieldName = 'VALIDATIONSTATUS'
      Required = True
      Size = 30
    end
  end
  object dspValidationStatus: TDataSetProvider
    DataSet = qValidationStatus
    Constraints = True
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 48
    Top = 238
  end
  object cdsValidationStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValidationStatus'
    Left = 74
    Top = 238
    object cdsValidationStatusVALIDSTATUSID: TStringField
      DisplayLabel = 'Validation Status ID'
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsValidationStatusVALIDATIONSTATUS: TStringField
      DisplayLabel = 'Validation Status'
      FieldName = 'VALIDATIONSTATUS'
      Required = True
      Size = 30
    end
  end
  object qRefDetail: TSQLQuery
    NoMetadata = True
    MaxBlobSize = 0
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
    Constraints = True
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
    Constraints = True
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
  object dsContinents: TDataSource
    AutoEdit = False
    DataSet = cdsContinents
    Left = 114
    Top = 58
  end
  object dsCountries: TDataSource
    DataSet = cdsCountries
    Left = 112
    Top = 104
  end
  object dsUnits: TDataSource
    DataSet = cdsUnits
    Left = 116
    Top = 148
  end
  object dsReferences: TDataSource
    DataSet = cdsReferences
    Left = 110
    Top = 286
  end
  object dsValidationStatus: TDataSource
    DataSet = cdsValidationStatus
    Left = 102
    Top = 236
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
  object qUnitCountry: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <
      item
        DataType = ftString
        Name = 'CountryAbr'
        ParamType = ptInput
        Value = 'TST'
      end>
    SQL.Strings = (
      'select * from SUITECOUNTRY'
      'where COUNTRYABR=:COUNTRYABR'
      'order by UNITNAME, COUNTRYABR')
    Left = 32
    Top = 187
    object qUnitCountryUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qUnitCountryCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
  end
  object dspUnitCountry: TDataSetProvider
    DataSet = qUnitCountry
    Constraints = True
    Left = 62
    Top = 192
  end
  object cdsUnitCountry: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitCountry'
    Left = 90
    Top = 192
    object cdsUnitCountryUNITNAME: TStringField
      DisplayLabel = 'Stratigraphic Unit'
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsUnitCountryCOUNTRYABR: TStringField
      DisplayLabel = 'Area ID'
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
  end
  object dsUnitCountry: TDataSource
    DataSet = cdsUnitCountry
    Left = 118
    Top = 190
  end
  object qYesNo: TSQLQuery
    NoMetadata = True
    MaxBlobSize = 0
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
    Constraints = True
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
  object qUsers: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from Users'
      'where USERS.USERID=:UserID')
    Left = 30
    Top = 340
    object qUsersUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dspUsers: TDataSetProvider
    DataSet = qUsers
    Constraints = True
    Left = 58
    Top = 340
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsers'
    Left = 86
    Top = 340
    object cdsUsersUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsUsers: TDataSource
    DataSet = cdsUsers
    Left = 114
    Top = 340
  end
  object sqlcStrat: TSQLConnection
    Connected = True
    ConnectionName = 'StratDB_Opus'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=opus:/opt/firebird/firebirddata/stratdb.fdb'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=1'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'fbclient.dll'
    Left = 76
    Top = 14
  end
  object qUnitQ: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  STRATUNITS.AGEUNITS,'
      '  STRATUNITS.AGEYEARS, STRATUNITS.DESCRIPTION,'
      '  STRATUNITS.COUNTRYID, '
      '  COUNTRIES.COUNTRYID, COUNTRIES.COUNTRY,'
      '  RANKS.UNITRANK, APPROVALSTATUS.APPROVALSTATUS,'
      'STRATUNITS.APPROVALID,APPROVALSTATUS.APPROVALID'
      'from STRATUNITS, RANKS,COUNTRIES, APPROVALSTATUS'
      'where STRATUNITS.UNITID = :UnitID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'and STRATUNITS.APPROVALID=APPROVALSTATUS.APPROVALID'
      '')
    Left = 388
    Top = 72
    object qUnitQUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitQUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qUnitQPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qUnitQRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qUnitQMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qUnitQMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qUnitQAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 6
    end
    object qUnitQAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
    object qUnitQDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object qUnitQCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qUnitQCOUNTRYID_1: TStringField
      FieldName = 'COUNTRYID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qUnitQCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qUnitQUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
    object qUnitQAPPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qUnitQAPPROVALID: TStringField
      FieldName = 'APPROVALID'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qUnitQAPPROVALID_1: TStringField
      FieldName = 'APPROVALID_1'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
  end
  object cdsUnitQ: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitQ'
    Left = 472
    Top = 72
    object cdsUnitQUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitQUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Required = True
      Size = 50
    end
    object cdsUnitQPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsUnitQAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '#########0'
    end
    object cdsUnitQMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsUnitQMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsUnitQAGEUNITS: TStringField
      DisplayLabel = 'Age Units'
      FieldName = 'AGEUNITS'
      Required = True
      Size = 6
    end
    object cdsUnitQDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object cdsUnitQCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsUnitQUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQAPPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsUnitQqSubUnits: TDataSetField
      FieldName = 'qSubUnits'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqParent: TDataSetField
      FieldName = 'qParent'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqValid: TDataSetField
      FieldName = 'qValid'
    end
    object cdsUnitQqPreceeding: TDataSetField
      FieldName = 'qPreceeding'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqRefs: TDataSetField
      FieldName = 'qRefs'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqSucceeding: TDataSetField
      FieldName = 'qSucceeding'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqCorrelatives: TDataSetField
      FieldName = 'qCorrelatives'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqSynonyms: TDataSetField
      FieldName = 'qSynonyms'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqRecords: TDataSetField
      FieldName = 'qRecords'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqStratMaps: TDataSetField
      FieldName = 'qStratMaps'
    end
    object cdsUnitQqStratDomain: TDataSetField
      FieldName = 'qStratDomain'
    end
    object cdsUnitQCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsUnitQRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsUnitQqLinkedApplications: TDataSetField
      FieldName = 'qLinkedApplications'
    end
  end
  object dspUnitQ: TDataSetProvider
    DataSet = qUnitQ
    Constraints = True
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 444
    Top = 72
  end
  object dsqUnitQ: TDataSource
    DataSet = qUnitQ
    Left = 416
    Top = 72
  end
  object dsUnitQ: TDataSource
    DataSet = cdsUnitQ
    Left = 500
    Top = 72
  end
  object qParent: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'PARENTID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK'
      'from STRATUNITS, RANKS'
      'where STRATUNITS.UNITID = :ParentID'
      'and STRATUNITS.RANKID=RANKS.RANKID')
    Left = 420
    Top = 124
  end
  object qSubUnits: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK'
      'from STRATUNITS, RANKS'
      'where STRATUNITS.PARENTID = :UnitID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.APPROVALID <> '#39'HS'#39
      'and STRATUNITS.APPROVALID <> '#39'NA'#39
      'order by STRATUNITS.AGEYEARS, STRATUNITS.UNITID')
    Left = 424
    Top = 172
  end
  object cdsParent: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqParent
    Params = <>
    Left = 448
    Top = 124
    object cdsParentUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParentUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsParentPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsParentRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsParentMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsParentMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsParentUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
  end
  object cdsSubUnits: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqSubUnits
    Params = <>
    Left = 452
    Top = 172
    object cdsSubUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSubUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsSubUnitsPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsSubUnitsRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsSubUnitsMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsSubUnitsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsSubUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsSubUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '#########0'
    end
  end
  object dsParent: TDataSource
    DataSet = cdsParent
    Left = 476
    Top = 124
  end
  object dsSubUnits: TDataSource
    DataSet = cdsSubUnits
    Left = 480
    Top = 172
  end
  object Query1Rec: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
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
    Constraints = True
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
  object qSucceeding: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,'
      '  SUCCEEDING.UNITID, SUCCEEDING.SUCCEEDEDBY,'
      '  SUCCEEDING.SUCREL, STRATREL.RELATIONSHIPID,'
      '  STRATREL.RELPOSID, STRATREL.RELATIONSHIP'
      'from STRATUNITS, RANKS, STRATREL, SUCCEEDING'
      'where SUCCEEDING.UNITID = :UnitID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and SUCCEEDING.SUCCEEDEDBY=STRATUNITS.UNITID'
      'and SUCCEEDING.SUCREL=STRATREL.RELATIONSHIPID'
      'and STRATREL.RELPOSID='#39'S'#39
      'order by STRATUNITS.AGEYEARS, STRATUNITS.UNITID')
    Left = 424
    Top = 220
  end
  object cdsSucceeding: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqSucceeding
    Params = <>
    Left = 452
    Top = 220
    object cdsSucceedingUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsSucceedingUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsSucceedingPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsSucceedingRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsSucceedingMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsSucceedingMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsSucceedingUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsSucceedingUNITID_1: TIntegerField
      FieldName = 'UNITID_1'
      Required = True
    end
    object cdsSucceedingSUCCEEDEDBY: TIntegerField
      FieldName = 'SUCCEEDEDBY'
      Required = True
    end
    object cdsSucceedingSUCREL: TStringField
      FieldName = 'SUCREL'
      Required = True
      Size = 5
    end
    object cdsSucceedingRELATIONSHIPID: TStringField
      FieldName = 'RELATIONSHIPID'
      Required = True
      Size = 5
    end
    object cdsSucceedingRELPOSID: TStringField
      FieldName = 'RELPOSID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsSucceedingRELATIONSHIP: TStringField
      FieldName = 'RELATIONSHIP'
      Required = True
    end
    object cdsSucceedingAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '#########0'
    end
  end
  object dsSucceeding: TDataSource
    DataSet = cdsSucceeding
    Left = 480
    Top = 220
  end
  object qPreceeding: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,'
      '  PRECEDING.UNITID, PRECEDING.PRECEDEDBY,'
      '  PRECEDING.PREREL, STRATREL.RELATIONSHIPID,'
      '  STRATREL.RELPOSID, STRATREL.RELATIONSHIP'
      'from STRATUNITS, RANKS, STRATREL, PRECEDING'
      'where PRECEDING.UNITID = :UnitID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and PRECEDING.PRECEDEDBY=STRATUNITS.UNITID'
      'and PRECEDING.PREREL=STRATREL.RELATIONSHIPID'
      'and STRATREL.RELPOSID='#39'P'#39
      'order by STRATUNITS.AGEYEARS, STRATUNITS.UNITID'
      '')
    Left = 428
    Top = 268
  end
  object cdsPreceeding: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqPreceeding
    Params = <>
    Left = 456
    Top = 268
    object cdsPreceedingUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreceedingUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsPreceedingPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsPreceedingRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsPreceedingMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsPreceedingMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsPreceedingUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsPreceedingUNITID_1: TIntegerField
      FieldName = 'UNITID_1'
      Required = True
    end
    object cdsPreceedingPRECEDEDBY: TIntegerField
      FieldName = 'PRECEDEDBY'
      Required = True
    end
    object cdsPreceedingPREREL: TStringField
      FieldName = 'PREREL'
      Required = True
      Size = 5
    end
    object cdsPreceedingRELATIONSHIPID: TStringField
      FieldName = 'RELATIONSHIPID'
      Required = True
      Size = 5
    end
    object cdsPreceedingRELPOSID: TStringField
      FieldName = 'RELPOSID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPreceedingRELATIONSHIP: TStringField
      FieldName = 'RELATIONSHIP'
      Required = True
    end
    object cdsPreceedingAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '#########0'
    end
  end
  object dsPreceeding: TDataSource
    DataSet = cdsPreceeding
    Left = 484
    Top = 268
  end
  object cdsRefs: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqRefs
    Params = <>
    Left = 456
    Top = 316
    object cdsRefsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefsSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefsSOURCENUM_1: TIntegerField
      FieldName = 'SOURCENUM_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRefsSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object cdsRefsSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsRefs: TDataSource
    DataSet = cdsRefs
    Left = 484
    Top = 316
  end
  object qValid: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select STRATVALID.UNITID, STRATVALID.VALIDSTATUSID,'
      '  STRATVALID.DATEDONE, STRATVALID.DONEBY,'
      '  VALIDATIONSTATUS.VALIDSTATUSID,'
      '  VALIDATIONSTATUS.VALIDATIONSTATUS'
      'from STRATVALID, VALIDATIONSTATUS'
      'where STRATVALID.UNITID = :UnitID'
      'and STRATVALID.VALIDSTATUSID=VALIDATIONSTATUS.VALIDSTATUSID'
      'order by STRATVALID.VALIDSTATUSID')
    Left = 424
    Top = 364
    object qValidUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qValidVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qValidDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
    end
    object qValidDONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object qValidVALIDSTATUSID_1: TStringField
      FieldName = 'VALIDSTATUSID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qValidVALIDATIONSTATUS: TStringField
      FieldName = 'VALIDATIONSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsValid: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqValid
    Params = <>
    Left = 456
    Top = 364
    object cdsValidUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsValidVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsValidDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
      DisplayFormat = 'ddddd'
    end
    object cdsValidDONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object cdsValidVALIDSTATUSID_1: TStringField
      FieldName = 'VALIDSTATUSID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsValidVALIDATIONSTATUS: TStringField
      FieldName = 'VALIDATIONSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsValid: TDataSource
    DataSet = cdsValid
    Left = 480
    Top = 364
  end
  object qRefs: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select UNITREFS.UNITID, '
      '  UNITREFS.SOURCENUM,'
      '  SOURCELIST.SOURCENUM,'
      '  SOURCELIST.SOURCESHORT, SOURCELIST.SOURCEYEAR'
      'from UNITREFS,SOURCELIST'
      'where UNITREFS.UNITID = :UnitID'
      'and UNITREFS.SOURCENUM=SOURCELIST.SOURCENUM'
      'order by UNITREFS.SOURCENUM')
    Left = 428
    Top = 316
    object qRefsUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qRefsSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      Required = True
    end
    object qRefsSOURCENUM_1: TIntegerField
      FieldName = 'SOURCENUM_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRefsSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qRefsSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qRecords: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <>
    Left = 424
    Top = 408
  end
  object cdsRecords: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqRecords
    Params = <>
    Left = 452
    Top = 408
  end
  object dsRecords: TDataSource
    DataSet = cdsRecords
    Left = 480
    Top = 408
  end
  object qSynonyms: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select SYNONYMS.UNITID, SYNONYMS.SYNONYMID,'
      '  SYNONYMS.COMMENTS, STRATUNITS.UNITID,'
      '  STRATUNITS.UNITNAME, STRATUNITS.RANKID,'
      '  RANKS.RANKID, RANKS.UNITRANK, '
      '  STRATUNITS.APPROVALID, APPROVALSTATUS.APPROVALID,'
      '  APPROVALSTATUS.APPROVALSTATUS'
      'from SYNONYMS,STRATUNITS,RANKS,APPROVALSTATUS'
      'where SYNONYMS.UNITID=:UnitID'
      'and SYNONYMS.SYNONYMID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND STRATUNITS.APPROVALID=APPROVALSTATUS.APPROVALID')
    Left = 560
    Top = 128
  end
  object qCorrelatives: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select CORRELATIVES.UNITID, CORRELATIVES.CORRELATIVEID,'
      '  CORRELATIVES.COMMENTS, STRATUNITS.UNITID,'
      '  STRATUNITS.UNITNAME, STRATUNITS.RANKID,'
      '  STRATUNITS.COUNTRYID, COUNTRIES.COUNTRYID,'
      '  COUNTRIES.COUNTRY,'
      '  RANKS.RANKID, RANKS.UNITRANK'
      'from CORRELATIVES,STRATUNITS,RANKS,COUNTRIES'
      'where CORRELATIVES.UNITID=:UnitID'
      'and CORRELATIVES.CORRELATIVEID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID')
    Left = 560
    Top = 176
  end
  object qUnitPeriods: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <
      item
        DataType = ftUnknown
        Name = 'UnitID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select UNITPERIODS.UNITID, UNITPERIODS.PERIODID,'
      '  PERIODS.PERIODID, PERIODS.PERIODNAME,'
      '  PERIODS.PERIODRANKID,PERIODRANKS.PERIODRANKID,'
      '  PERIODRANKS.PERIODRANKID'
      'from UNITPERIODS,PERIODS,PERIODRANKS'
      'where UNITPERIODS.UNITID=:UnitID'
      'and PERIODS.PERIODID=UNITPERIODS.PERIODID'
      'AND PERIODS.PERIODRANKID=PERIODRANKS.PERIODRANKID')
    Left = 564
    Top = 224
  end
  object cdsSynonyms: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqSynonyms
    Params = <>
    Left = 588
    Top = 128
    object cdsSynonymsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSynonymsSYNONYMID: TIntegerField
      FieldName = 'SYNONYMID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSynonymsCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object cdsSynonymsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsSynonymsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsSynonymsAPPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
  end
  object cdsCorrelatives: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqCorrelatives
    Params = <>
    Left = 588
    Top = 176
    object cdsCorrelativesUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCorrelativesCORRELATIVEID: TIntegerField
      FieldName = 'CORRELATIVEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCorrelativesCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object cdsCorrelativesUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsCorrelativesUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsCorrelativesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
  end
  object cdsUnitPeriods: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 224
  end
  object dsSynonyms: TDataSource
    DataSet = cdsSynonyms
    Left = 616
    Top = 128
  end
  object dsCorrelatives: TDataSource
    DataSet = cdsCorrelatives
    Left = 616
    Top = 176
  end
  object dsUnitPeriods: TDataSource
    DataSet = cdsUnitPeriods
    Left = 620
    Top = 224
  end
  object qValidFull: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
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
    Constraints = True
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
  object qMaps: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <>
    SQL.Strings = (
      'select * from Maps'
      '')
    Left = 26
    Top = 388
  end
  object dspMaps: TDataSetProvider
    DataSet = qMaps
    Constraints = True
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 54
    Top = 388
  end
  object cdsMaps: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaps'
    Left = 82
    Top = 388
    object cdsMapsMAPID: TStringField
      DisplayLabel = 'Map ID'
      FieldName = 'MAPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsMapsMAPNAME: TStringField
      DisplayLabel = 'Compilation Name'
      FieldName = 'MAPNAME'
      Required = True
      Size = 150
    end
    object cdsMapsSHAPEFILENAME: TStringField
      DisplayLabel = 'ArcView Shapefile'
      FieldName = 'SHAPEFILENAME'
      Required = True
      Size = 50
    end
  end
  object dsMaps: TDataSource
    DataSet = cdsMaps
    Left = 110
    Top = 388
  end
  object qStratMaps: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select STRATMAPS.UNITID, STRATMAPS.MAPID, STRATMAPS.GISID,'
      '  MAPS.MAPID, MAPS.MAPNAME'
      'from STRATMAPS, MAPS'
      'where STRATMAPS.UNITID = :UnitID'
      'and STRATMAPS.MAPID = MAPS.MAPID'
      'order by STRATMAPS.MAPID, STRATMAPS.GISID')
    Left = 564
    Top = 268
    object qStratMapsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qStratMapsMAPID: TStringField
      FieldName = 'MAPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object qStratMapsGISID: TIntegerField
      FieldName = 'GISID'
      Required = True
    end
    object qStratMapsMAPID_1: TStringField
      FieldName = 'MAPID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qStratMapsMAPNAME: TStringField
      FieldName = 'MAPNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
  end
  object cdsStratMaps: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 268
    object cdsStratMapsUNITID: TIntegerField
      DisplayLabel = 'Unit ID'
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsStratMapsMAPID: TStringField
      DisplayLabel = 'Map ID'
      FieldName = 'MAPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsStratMapsGISID: TIntegerField
      DisplayLabel = 'GIS ID'
      FieldName = 'GISID'
      Required = True
    end
    object cdsStratMapsMAPNAME: TStringField
      DisplayLabel = 'Map Name'
      FieldName = 'MAPNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsStratMapsMAPID_1: TStringField
      FieldName = 'MAPID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsStratMaps: TDataSource
    DataSet = cdsStratMaps
    Left = 620
    Top = 268
  end
  object qStratDomain: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select STRATDOMAIN.UNITID, STRATDOMAIN.DOMAINID, '
      '  DOMAINS.DOMAINID, DOMAINS.DOMAINNAME,'
      '  DOMAINS.COUNTRYID, '
      '  COUNTRIES.COUNTRYID, COUNTRIES.COUNTRY'
      'from STRATDOMAIN, DOMAINS, COUNTRIES'
      'where STRATDOMAIN.UNITID = :UnitID'
      'and STRATDOMAIN.DOMAINID = DOMAINS.DOMAINID'
      'and DOMAINS.COUNTRYID = COUNTRIES.COUNTRYID'
      'order by STRATDOMAIN.DOMAINID')
    Left = 564
    Top = 312
    object qStratDomainUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qStratDomainDOMAINID: TStringField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object qStratDomainDOMAINID_1: TStringField
      FieldName = 'DOMAINID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qStratDomainDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qStratDomainCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qStratDomainCOUNTRYID_1: TStringField
      FieldName = 'COUNTRYID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qStratDomainCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsStratDomain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 312
    object cdsStratDomainUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsStratDomainDOMAINID: TStringField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsStratDomainDOMAINID_1: TStringField
      FieldName = 'DOMAINID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsStratDomainDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsStratDomainCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsStratDomainCOUNTRYID_1: TStringField
      FieldName = 'COUNTRYID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsStratDomainCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsStratDomain: TDataSource
    DataSet = cdsStratDomain
    Left = 620
    Top = 312
  end
  object qDomains: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <>
    SQL.Strings = (
      'select * from Domains'
      '')
    Left = 26
    Top = 436
  end
  object dspDomains: TDataSetProvider
    DataSet = qDomains
    Constraints = True
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 54
    Top = 436
  end
  object cdsDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomains'
    Left = 82
    Top = 436
    object cdsDomainsDOMAINID: TStringField
      DisplayLabel = 'Domain ID'
      FieldName = 'DOMAINID'
      Required = True
      Size = 30
    end
    object cdsDomainsDOMAINNAME: TStringField
      DisplayLabel = 'Domain Name'
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainsCOUNTRYID: TStringField
      DisplayLabel = 'Country ID'
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
  end
  object dsDomains: TDataSource
    DataSet = cdsDomains
    Left = 110
    Top = 436
  end
  object qStratRef: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
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
    NoMetadata = True
    SQLConnection = sqlcStrat
    Params = <
      item
        DataType = ftUnknown
        Name = 'UnitID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DomainID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'delete from STRATDOMAIN'
      'where STRATDOMAIN.UNITID = :UnitID'
      'and STRATDOMAIN.DOMAINID = :DomainID'
      '')
    Left = 776
    Top = 412
  end
  object qLinkedApplications: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcStrat
    DataSource = dsqUnitQ
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select APPLICLINK.UNITID,APPLICLINK.APPLICATIONID,'
      '  APPLICATIONS.APPLICATIONID, APPLICATIONS.APPLICATION'
      'from APPLICLINK, APPLICATIONS'
      'where APPLICLINK.UNITID = :UnitID'
      'and APPLICLINK.APPLICATIONID = APPLICATIONS.APPLICATIONID'
      'order by APPLICLINK.APPLICATIONID')
    Left = 564
    Top = 356
    object IntegerField1: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'DOMAINID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object StringField4: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object StringField5: TStringField
      FieldName = 'COUNTRYID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsLinkedApplications: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsUnitQqStratDomain
    Params = <>
    Left = 592
    Top = 356
    object IntegerField2: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField7: TStringField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object StringField8: TStringField
      FieldName = 'DOMAINID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object StringField9: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object StringField10: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object StringField11: TStringField
      FieldName = 'COUNTRYID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object StringField12: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsLinkedApplications: TDataSource
    DataSet = cdsLinkedApplications
    Left = 620
    Top = 356
  end
  object SQLQuery1: TSQLQuery
    NoMetadata = True
    MaxBlobSize = 0
    Params = <
      item
        DataType = ftUnknown
        Name = 'UnitID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select STRATDOMAIN.UNITID, STRATDOMAIN.DOMAINID, '
      '  DOMAINS.DOMAINID, DOMAINS.DOMAINNAME,'
      '  DOMAINS.COUNTRYID, '
      '  COUNTRIES.COUNTRYID, COUNTRIES.COUNTRY'
      'from STRATDOMAIN, DOMAINS, COUNTRIES'
      'where STRATDOMAIN.UNITID = :UnitID'
      'and STRATDOMAIN.DOMAINID = DOMAINS.DOMAINID'
      'and DOMAINS.COUNTRYID = COUNTRIES.COUNTRYID'
      'order by STRATDOMAIN.DOMAINID')
    Left = 560
    Top = 444
  end
end
