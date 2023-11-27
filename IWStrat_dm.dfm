object dmStrat: TdmStrat
  Height = 810
  Width = 1290
  object Query1: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT STRATUNITS.UNITID, STRATUNITS.COUNTRYID,'
      '  STRATUNITS.UNITNAME,  STRATUNITS.PARENTID,'
      '  STRATUNITS.RANKID,  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,  STRATUNITS.MAXAGE,'
      '  STRATUNITS.AGEUNITS,'
      '  RANKS.UNITRANK, COUNTRIES.COUNTRY,'
      '  STRATUNITS.APPROVALID, '
      '  APPROVALSTATUS.APPROVALID, APPROVALSTATUS.APPROVALSTATUS,'
      '  APPLICLINK.UNITID, APPLICLINK.APPLICATIONID,'
      '  UNITROCKCLASS.UNITID, UNITROCKCLASS.ROCKCLASSID,'
      '  UNITSETTING.UNITID,UNITSETTING.SETTINGID,'
      '  ROCKCLASSES.ROCKCLASSID, ROCKCLASSES.ROCKCLASS,'
      '  SETTINGS.SETTINGID, SETTINGS.SETTING,'
      '  DIRECTIONS.SOURCEFROMNAME,'
      '  DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT'
      'from STRATUNITS, COUNTRIES, RANKS, APPROVALSTATUS, APPLICLINK,'
      '  UNITROCKCLASS,UNITSETTING,ROCKCLASSES,SETTINGS,'
      '  STRATSEDENVIRONMENT,STRATCURRENT,DIRECTIONS,'
      '  DEPOSITIONNVIRONMENT,UNITFOR,USERSWHOFOR'
      'where STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'and STRATUNITS.UNITID=UNITFOR.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'AND STRATUNITS.UNITID=APPLICLINK.UNITID'
      'AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID'
      'AND STRATUNITS.UNITID=UNITSETTING.UNITID'
      'AND ROCKCLASSES.ROCKCLASSID=UNITROCKCLASS.ROCKCLASSID'
      'AND SETTINGS.SETTINGID=UNITSETTING.SETTINGID'
      'AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID'
      'AND STRATUNITS.UNITID=STRATCURRENT.UNITID'
      
        'AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRON' +
        'MENT.DEPOSITIONENVIRONMENTID'
      'AND STRATCURRENT.CURRENTDIRECTION=DIRECTIONS.DIRECTIONANGLE')
    SQLConnection = sqlcStrat
    Left = 208
    Top = 6
  end
  object dspQuery1: TDataSetProvider
    DataSet = Query1
    Exported = False
    Options = [poFetchDetailsOnDemand, poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 238
    Top = 6
  end
  object cdsQuery1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1'
    Left = 266
    Top = 6
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
    object cdsQuery1AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '########0'
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
    object cdsQuery1APPROVALSTATUS: TStringField
      DisplayLabel = 'Approval Status'
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
  end
  object dsQuery1: TDataSource
    DataSet = cdsQuery1
    Left = 294
    Top = 6
  end
  object qContinents: TSQLQuery
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CONTINENTS'
      'WHERE CONTINENTS.HASDATA='#39'Y'#39
      'ORDER BY CONTINENTS.CONTINENT')
    SQLConnection = sqlcStrat
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
    object qContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
    end
  end
  object dspContinents: TDataSetProvider
    DataSet = qContinents
    Options = [poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
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
    object cdsContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
    end
  end
  object qCountries: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT  COUNTRIES.CONTINENTID, COUNTRIES.COUNTRYID,'
      '  COUNTRIES.COUNTRY,'
      '  CONTINENTS.CONTINENT, COUNTRIES.COUNTRYHASRECORDS,'
      '  COUNTRIES.STARTINGVALUE,COUNTRIES.DEFAULTMAPID'
      'FROM COUNTRIES, CONTINENTS'
      'WHERE COUNTRIES.CONTINENTID=CONTINENTS.CONTINENTID'
      'AND COUNTRIES.COUNTRYHASRECORDS = '#39'Y'#39
      'ORDER BY COUNTRIES.COUNTRY')
    SQLConnection = sqlcStrat
    Left = 28
    Top = 104
  end
  object dspCountries: TDataSetProvider
    DataSet = qCountries
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
    object cdsCountriesSTARTINGVALUE: TIntegerField
      FieldName = 'STARTINGVALUE'
    end
    object cdsCountriesDEFAULTMAPID: TStringField
      FieldName = 'DEFAULTMAPID'
      Required = True
    end
  end
  object qUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select distinct stratunits.unitid, stratunits.unitname,'
      
        '  stratunits.unitname||'#39' ('#39'||stratunits.countryid||'#39' '#39'||stratuni' +
        'ts.unitid||'#39')'#39'  as UnitNameUnitID,'
      '  stratunits.countryid, stratunits.parentid, '
      '  stratunits.rankid, stratunits.ageyears,'
      '  appliclink.applicationid'
      
        'from stratunits,countries, continents, appliclink,unitfor,usersw' +
        'hofor,ranks'
      'where userswhofor.userid= '#39'BRUCEEGLINGTON'#39
      'and userswhofor.whoforid=unitfor.whoforid'
      'and stratunits.unitid=unitfor.unitid'
      'and countries.continentid=continents.continentid'
      'and stratunits.unitid=appliclink.unitid'
      'and appliclink.applicationid=1'
      'and stratunits.rankid=ranks.rankid'
      'and (continents.continentid='#39'AFR'#39
      '  or continents.continentid='#39'UND'#39')'
      'and countries.countryid=stratunits.countryid'
      'and (stratunits.countryid='#39'ZWE'#39' )'
      'order by stratunits.unitname, stratunits.unitid')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 146
  end
  object dspUnits: TDataSetProvider
    DataSet = qUnits
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
      Required = True
    end
    object cdsUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsUnitsUNITNAMEUNITID: TStringField
      FieldName = 'UNITNAMEUNITID'
      Size = 68
    end
    object cdsUnitsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
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
    end
  end
  object qReferences: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'FirstReference'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LastReference'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT SOURCELIST.SOURCENUM, '
      '  SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,'
      '  SOURCELIST.SOURCEYEAR,'
      '  CONTINENTS.CONTINENT'
      'FROM SOURCELIST,CONTINENTS'
      'WHERE CONTINENTS.CONTINENTID = SOURCELIST.CONTINENTID'
      'AND SOURCELIST.SOURCESHORT >= :FirstReference'
      'AND SOURCELIST.SOURCESHORT <= :LastReference'
      'ORDER BY SOURCELIST.SOURCESHORT')
    SQLConnection = sqlcStrat
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
    object qReferencesSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
  end
  object dspReferences: TDataSetProvider
    DataSet = qReferences
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
    object cdsReferencesSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
  end
  object qValidationStatus: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM VALIDATIONSTATUS')
    SQLConnection = sqlcStrat
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
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SourceNum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM SOURCELIST'
      'WHERE SOURCELIST.SOURCENUM=:SourceNum')
    SQLConnection = sqlcStrat
    Left = 744
    Top = 92
    object qRefDetailSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRefDetailSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 255
    end
    object qRefDetailSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
    end
    object qRefDetailSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
    end
    object qRefDetailCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qRefDetailDOI: TStringField
      FieldName = 'DOI'
      Size = 100
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
    DataSet = qRefFull
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 804
    Top = 210
  end
  object cdsRefFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefFull'
    Left = 832
    Top = 210
    object cdsRefFullSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefFullSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 255
    end
    object cdsRefFullSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsRefFullSOURCEDESCRIPTION: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
    end
    object cdsRefFullCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsRefFullDOI: TStringField
      FieldName = 'DOI'
      Size = 100
    end
    object cdsRefFullWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
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
    Left = 858
    Top = 210
  end
  object dsRefDetail: TDataSource
    DataSet = cdsRefDetail
    Left = 828
    Top = 92
  end
  object qUnitCountry: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CountryAbr'
        ParamType = ptInput
        Size = 3
        Value = 'TST'
      end>
    SQL.Strings = (
      'SELECT * FROM STRATUNITS'
      'WHERE STRATUNITS.COUNTRYID=:COUNTRYABR'
      'ORDER BY STRATUNITS.UNITNAME, STRATUNITS.COUNTRYID')
    SQLConnection = sqlcStrat
    Left = 32
    Top = 191
    object qUnitCountryUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qUnitCountryCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
  end
  object dspUnitCountry: TDataSetProvider
    DataSet = qUnitCountry
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
    object cdsUnitCountryCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
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
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM YESNO')
    SQLConnection = sqlcStrat
    Left = 742
    Top = 8
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
      FieldName = 'YESNOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsYesNoYESNO: TStringField
      FieldName = 'YESNO'
      Required = True
      Size = 11
    end
  end
  object dsYesNo: TDataSource
    DataSet = cdsYesNo
    Left = 826
    Top = 8
  end
  object qUsers: TSQLQuery
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
    SQLConnection = sqlcStrat
    Left = 30
    Top = 340
    object qUsersUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUsersLASTUSED: TSQLTimeStampField
      FieldName = 'LASTUSED'
    end
  end
  object dspUsers: TDataSetProvider
    DataSet = qUsers
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
    object cdsUsersLASTUSED: TSQLTimeStampField
      FieldName = 'LASTUSED'
      DisplayFormat = 'yyyy/mm/dd'
    end
  end
  object dsUsers: TDataSource
    DataSet = cdsUsers
    Left = 114
    Top = 340
  end
  object qUnitQ: TSQLQuery
    MaxBlobSize = 8
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  STRATUNITS.AGEUNITS,'
      '  STRATUNITS.AGEYEARS, STRATUNITS.DESCRIPTION,'
      '  STRATUNITS.COUNTRYID, STRATUNITS.CONSTRAINTLEVELID,'
      '  STRATUNITS.APPROVALID,'
      '  COUNTRIES.COUNTRY'
      'FROM STRATUNITS, COUNTRIES,UNITFOR,USERSWHOFOR '
      'WHERE STRATUNITS.UNITID = :UnitID'
      'AND STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'and STRATUNITS.UNITID=UNITFOR.UNITID'
      '')
    SQLConnection = sqlcStrat
    Left = 388
    Top = 72
    object qUnitQUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitQPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qUnitQUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qUnitQRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
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
      Size = 2
    end
    object qUnitQAPPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      Size = 2
    end
    object qUnitQCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object qUnitQDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = -1
    end
    object qUnitQCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object qUnitQCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qUnitQAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '########0'
    end
  end
  object cdsUnitQ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitQ'
    OnReconcileError = cdsAnyReconcileError
    Left = 472
    Top = 72
    object cdsUnitQUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitQUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsUnitQPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsUnitQAPPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      Size = 2
    end
    object cdsUnitQAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '########0'
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
      Size = 2
    end
    object cdsUnitQCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsUnitQCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsUnitQRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsUnitQCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsUnitQDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = 8
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
    end
    object cdsUnitQqRefs: TDataSetField
      FieldName = 'qRefs'
    end
    object cdsUnitQqSucceeding: TDataSetField
      FieldName = 'qSucceeding'
    end
    object cdsUnitQqCorrelatives: TDataSetField
      FieldName = 'qCorrelatives'
    end
    object cdsUnitQqSynonyms: TDataSetField
      FieldName = 'qSynonyms'
    end
    object cdsUnitQqStratMaps: TDataSetField
      FieldName = 'qStratMaps'
    end
    object cdsUnitQqRecords: TDataSetField
      FieldName = 'qRecords'
      ReadOnly = True
    end
    object cdsUnitQqLinkedApplications: TDataSetField
      FieldName = 'qLinkedApplications'
    end
    object cdsUnitQqUnitSetting: TDataSetField
      FieldName = 'qUnitSetting'
    end
    object cdsUnitQqUnitRockClass: TDataSetField
      FieldName = 'qUnitRockClass'
    end
    object cdsUnitQqStratDomain: TDataSetField
      FieldName = 'qStratDomain'
    end
    object cdsUnitQqUnitPeriods: TDataSetField
      FieldName = 'qUnitPeriods'
      Required = True
    end
    object cdsUnitQqUnitFeature: TDataSetField
      FieldName = 'qUnitFeature'
    end
    object cdsUnitQqUnitSedEnv: TDataSetField
      FieldName = 'qUnitSedEnv'
    end
    object cdsUnitQqUnitCurrent: TDataSetField
      FieldName = 'qUnitCurrent'
    end
    object cdsUnitQqUnitFor: TDataSetField
      FieldName = 'qUnitFor'
    end
  end
  object dspUnitQ: TDataSetProvider
    DataSet = qUnitQ
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
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PARENTID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  RANKS.UNITRANK'
      'FROM STRATUNITS, RANKS,USERSWHOFOR,UNITFOR'
      'WHERE STRATUNITS.UNITID = :ParentID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND STRATUNITS.UNITID = UNITFOR.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID')
    SQLConnection = sqlcStrat
    Left = 420
    Top = 124
    object qParentUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
    object qParentUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qParentRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qParentUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qSubUnits: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK'
      'from STRATUNITS, RANKS,UNITFOR,USERSWHOFOR'
      'where STRATUNITS.PARENTID = :UnitID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.APPROVALID <> '#39'HS'#39
      'and STRATUNITS.APPROVALID <> '#39'NA'#39
      'order by STRATUNITS.AGEYEARS, STRATUNITS.UNITID')
    SQLConnection = sqlcStrat
    Left = 424
    Top = 172
    object qSubUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInKey]
    end
    object qSubUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      Size = 50
    end
    object qSubUnitsPARENTID: TIntegerField
      FieldName = 'PARENTID'
      ProviderFlags = []
    end
    object qSubUnitsRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      Size = 5
    end
    object qSubUnitsMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
    end
    object qSubUnitsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
    end
    object qSubUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSubUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object cdsParent: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqParent
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 448
    Top = 124
    object cdsParentUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
    object cdsParentUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsParentRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsParentUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsSubUnits: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqSubUnits
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 452
    Top = 172
    object cdsSubUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInKey]
      Required = True
    end
    object cdsSubUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      Size = 50
    end
    object cdsSubUnitsPARENTID: TIntegerField
      FieldName = 'PARENTID'
      ProviderFlags = []
    end
    object cdsSubUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '########0'
    end
    object cdsSubUnitsRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      Size = 5
    end
    object cdsSubUnitsMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      DisplayFormat = '###0.00'
    end
    object cdsSubUnitsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      DisplayFormat = '###0.00'
    end
    object cdsSubUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
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
  object qSucceeding: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select   SUCCEEDING.UNITID, SUCCEEDING.SUCCEEDEDBY,'
      '  SUCCEEDING.SUCREL, '
      '  STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.RANKID,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,'
      '  STRATREL.RELATIONSHIP,'
      '  STRATREL.RELATIONSHIPREVID'
      'from SUCCEEDING, STRATUNITS, RANKS, STRATREL,USERSWHOFOR,UNITFOR'
      'where SUCCEEDING.UNITID = :UnitID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and SUCCEEDING.SUCCEEDEDBY=STRATUNITS.UNITID'
      'and SUCCEEDING.SUCREL=STRATREL.RELATIONSHIPID'
      'and STRATREL.RELPOSID='#39'S'#39
      'order by STRATUNITS.AGEYEARS, SUCCEEDING.UNITID')
    SQLConnection = sqlcStrat
    Left = 424
    Top = 220
    object qSucceedingUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSucceedingSUCCEEDEDBY: TIntegerField
      FieldName = 'SUCCEEDEDBY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSucceedingSUCREL: TStringField
      FieldName = 'SUCREL'
      Required = True
      Size = 5
    end
    object qSucceedingUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qSucceedingRELATIONSHIP: TStringField
      FieldName = 'RELATIONSHIP'
      ProviderFlags = []
      ReadOnly = True
      Size = 90
    end
    object qSucceedingRELATIONSHIPREVID: TStringField
      FieldName = 'RELATIONSHIPREVID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qSucceedingMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object qSucceedingMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object qSucceedingUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsSucceeding: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqSucceeding
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 452
    Top = 220
    object cdsSucceedingUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSucceedingSUCCEEDEDBY: TIntegerField
      FieldName = 'SUCCEEDEDBY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSucceedingSUCREL: TStringField
      FieldName = 'SUCREL'
      Required = True
      Size = 5
    end
    object cdsSucceedingUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsSucceedingRELATIONSHIP: TStringField
      FieldName = 'RELATIONSHIP'
      ProviderFlags = []
      ReadOnly = True
      Size = 90
    end
    object cdsSucceedingRELATIONSHIPREVID: TStringField
      FieldName = 'RELATIONSHIPREVID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsSucceedingMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object cdsSucceedingMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object cdsSucceedingUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsSucceeding: TDataSource
    DataSet = cdsSucceeding
    Left = 480
    Top = 220
  end
  object qPreceeding: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT   PRECEDING.UNITID, '
      '  PRECEDING.PRECEDEDBY,'
      '  PRECEDING.PREREL, '
      '  STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,'
      '  STRATREL.RELATIONSHIP,'
      '  STRATREL.RELATIONSHIPREVID'
      'FROM PRECEDING, STRATUNITS, RANKS, STRATREL,USERSWHOFOR,UNITFOR'
      'WHERE PRECEDING.UNITID = :UnitID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND PRECEDING.PRECEDEDBY=STRATUNITS.UNITID'
      'and PRECEDING.PREREL=STRATREL.RELATIONSHIPID'
      'and STRATREL.RELPOSID='#39'P'#39
      'order by STRATUNITS.AGEYEARS, PRECEDING.PRECEDEDBY')
    SQLConnection = sqlcStrat
    Left = 428
    Top = 268
    object qPreceedingUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPreceedingPRECEDEDBY: TIntegerField
      FieldName = 'PRECEDEDBY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPreceedingPREREL: TStringField
      FieldName = 'PREREL'
      Required = True
      Size = 5
    end
    object qPreceedingUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qPreceedingRELATIONSHIP: TStringField
      FieldName = 'RELATIONSHIP'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qPreceedingRELATIONSHIPREVID: TStringField
      FieldName = 'RELATIONSHIPREVID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qPreceedingMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qPreceedingMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qPreceedingUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsPreceeding: TClientDataSet
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
    object cdsPreceedingPRECEDEDBY: TIntegerField
      FieldName = 'PRECEDEDBY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreceedingPREREL: TStringField
      FieldName = 'PREREL'
      Required = True
      Size = 5
    end
    object cdsPreceedingUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsPreceedingRELATIONSHIP: TStringField
      FieldName = 'RELATIONSHIP'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsPreceedingRELATIONSHIPREVID: TStringField
      FieldName = 'RELATIONSHIPREVID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsPreceedingMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object cdsPreceedingMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object cdsPreceedingUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsPreceeding: TDataSource
    DataSet = cdsPreceeding
    Left = 484
    Top = 268
  end
  object cdsRefs: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqRefs
    Params = <>
    OnReconcileError = cdsAnyReconcileError
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
    DataSource = dsqUnitQ
    MaxBlobSize = -1
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
    SQLConnection = sqlcStrat
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
    Aggregates = <>
    DataSetField = cdsUnitQqValid
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 452
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
    DataSource = dsqUnitQ
    MaxBlobSize = -1
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
      'order by SOURCELIST.SOURCESHORT')
    SQLConnection = sqlcStrat
    Left = 428
    Top = 316
    object qRefsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRefsSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT UNITRECORDS.UNITID, UNITRECORDS.RECORDID'
      'FROM UNITRECORDS'
      'WHERE UNITRECORDS.UNITID = :UnitID'
      'ORDER BY UNITRECORDS.RECORDID')
    SQLConnection = sqlcStrat
    Left = 424
    Top = 408
    object qRecordsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRecordsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object cdsRecords: TClientDataSet
    Aggregates = <>
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 452
    Top = 408
    object cdsRecordsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRecordsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsRecords: TDataSource
    DataSet = cdsRecords
    Left = 480
    Top = 408
  end
  object qSynonyms: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = 8
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select SYNONYMS.UNITID, SYNONYMS.SYNONYMID,'
      '  SYNONYMS.COMMENTS, STRATUNITS.UNITID,'
      '  STRATUNITS.UNITNAME, STRATUNITS.RANKID,'
      '  RANKS.RANKID, RANKS.UNITRANK, '
      '  STRATUNITS.APPROVALID, APPROVALSTATUS.APPROVALID,'
      '  APPROVALSTATUS.APPROVALSTATUS'
      
        'from SYNONYMS,STRATUNITS,RANKS,APPROVALSTATUS,USERSWHOFOR,UNITFO' +
        'R'
      'where SYNONYMS.UNITID=:UnitID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and SYNONYMS.SYNONYMID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND STRATUNITS.APPROVALID=APPROVALSTATUS.APPROVALID')
    SQLConnection = sqlcStrat
    Left = 560
    Top = 128
    object qSynonymsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSynonymsSYNONYMID: TIntegerField
      FieldName = 'SYNONYMID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSynonymsCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
      Size = -1
    end
    object qSynonymsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qSynonymsRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qSynonymsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
    object qSynonymsAPPROVALID: TStringField
      FieldName = 'APPROVALID'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qSynonymsAPPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qCorrelatives: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = 8
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select CORRELATIVES.UNITID, CORRELATIVES.CORRELATIVEID,'
      '  CORRELATIVES.COMMENTS, STRATUNITS.UNITID,'
      '  STRATUNITS.UNITNAME, STRATUNITS.RANKID,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  STRATUNITS.COUNTRYID, COUNTRIES.COUNTRYID,'
      '  COUNTRIES.COUNTRY,'
      '  RANKS.RANKID, RANKS.UNITRANK'
      'from CORRELATIVES,STRATUNITS,RANKS,COUNTRIES,USERSWHOFOR,UNITFOR'
      'where CORRELATIVES.UNITID=:UnitID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and CORRELATIVES.CORRELATIVEID=STRATUNITS.UNITID'
      'AND STRATUNITS.RANKID=RANKS.RANKID'
      'AND STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID')
    SQLConnection = sqlcStrat
    Left = 560
    Top = 176
    object qCorrelativesUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCorrelativesCORRELATIVEID: TIntegerField
      FieldName = 'CORRELATIVEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCorrelativesCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
      Size = -1
    end
    object qCorrelativesUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qCorrelativesRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qCorrelativesCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qCorrelativesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qCorrelativesUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
    object qCorrelativesMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qCorrelativesMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qUnitPeriods: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT UNITPERIODS.UNITID, UNITPERIODS.PERIODID'
      'FROM UNITPERIODS'
      'WHERE UNITPERIODS.UNITID=:UnitID')
    SQLConnection = sqlcStrat
    Left = 564
    Top = 224
    object qUnitPeriodsUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qUnitPeriodsPERIODID: TIntegerField
      FieldName = 'PERIODID'
      Required = True
    end
  end
  object cdsSynonyms: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqSynonyms
    Params = <>
    OnReconcileError = cdsAnyReconcileError
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
      Size = 8
    end
    object cdsSynonymsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      Size = 50
    end
    object cdsSynonymsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
    end
    object cdsSynonymsAPPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      ProviderFlags = []
      Size = 50
    end
  end
  object cdsCorrelatives: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqCorrelatives
    Params = <>
    OnReconcileError = cdsAnyReconcileError
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
      Size = 8
    end
    object cdsCorrelativesUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsCorrelativesUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsCorrelativesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsCorrelativesMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object cdsCorrelativesMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
  end
  object cdsUnitPeriods: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqUnitPeriods
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 592
    Top = 224
    object cdsUnitPeriodsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitPeriodsPERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
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
    SQLConnection = sqlcStrat
    Left = 776
    Top = 260
  end
  object dspValidFull: TDataSetProvider
    DataSet = qValidFull
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 804
    Top = 260
  end
  object cdsValidFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValidFull'
    Left = 832
    Top = 260
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
    Top = 260
  end
  object qMaps: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM MAPS2'
      '')
    SQLConnection = sqlcStrat
    Left = 26
    Top = 388
  end
  object dspMaps: TDataSetProvider
    DataSet = qMaps
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
    object cdsMapsMAPID2: TStringField
      FieldName = 'MAPID2'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT STRATMAPS2.UNITID, STRATMAPS2.MAPID2, '
      '  STRATMAPS2.DISPLAYORDER,'
      '  STRATMAPS2.GISINT,'
      '  STRATMAPS2.GISSTR,STRATMAPS2.INCL4MAP,'
      '  MAPS2.MAPID2, MAPS2.MAPNAME'
      'FROM STRATMAPS2, MAPS2'
      'WHERE STRATMAPS2.UNITID = :UnitID'
      'and STRATMAPS2.MAPID2 = MAPS2.MAPID2'
      'ORDER BY STRATMAPS2.MAPID2, STRATMAPS2.DISPLAYORDER')
    SQLConnection = sqlcStrat
    Left = 564
    Top = 268
    object qStratMapsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qStratMapsMAPID2: TStringField
      FieldName = 'MAPID2'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qStratMapsDISPLAYORDER: TIntegerField
      FieldName = 'DISPLAYORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qStratMapsGISINT: TIntegerField
      FieldName = 'GISINT'
      Required = True
    end
    object qStratMapsGISSTR: TStringField
      FieldName = 'GISSTR'
      Required = True
    end
    object qStratMapsMAPID2_1: TStringField
      FieldName = 'MAPID2_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qStratMapsMAPNAME: TStringField
      FieldName = 'MAPNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qStratMapsINCL4MAP: TStringField
      FieldName = 'INCL4MAP'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsStratMaps: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqStratMaps
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 592
    Top = 268
    object cdsStratMapsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsStratMapsMAPID2: TStringField
      FieldName = 'MAPID2'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsStratMapsDISPLAYORDER: TIntegerField
      FieldName = 'DISPLAYORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsStratMapsGISINT: TIntegerField
      FieldName = 'GISINT'
      Required = True
    end
    object cdsStratMapsGISSTR: TStringField
      FieldName = 'GISSTR'
      Required = True
    end
    object cdsStratMapsMAPID2_1: TStringField
      FieldName = 'MAPID2_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsStratMapsMAPNAME: TStringField
      FieldName = 'MAPNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsStratMapsINCL4MAP: TStringField
      FieldName = 'INCL4MAP'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsStratMaps: TDataSource
    DataSet = cdsStratMaps
    Left = 620
    Top = 268
  end
  object qStratDomain: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select STRATDOMAIN.UNITID, STRATDOMAIN.DOMAINID, '
      '  STRATDOMAIN.INC4CHTYN,'
      '  DOMAINS.DOMAINID, DOMAINS.DOMAINNAME,'
      '  DOMAINS.CONTINENTID, '
      '  CONTINENTS.CONTINENTID, CONTINENTS.CONTINENT'
      'from STRATDOMAIN, DOMAINS, CONTINENTS'
      'where STRATDOMAIN.UNITID = :UnitID'
      'and STRATDOMAIN.DOMAINID = DOMAINS.DOMAINID'
      'and DOMAINS.CONTINENTID = CONTINENTS.CONTINENTID'
      'order by STRATDOMAIN.DOMAINID')
    SQLConnection = sqlcStrat
    Left = 564
    Top = 312
    object qStratDomainUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qStratDomainDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qStratDomainDOMAINID_1: TIntegerField
      FieldName = 'DOMAINID_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qStratDomainDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qStratDomainCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qStratDomainCONTINENTID_1: TStringField
      FieldName = 'CONTINENTID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qStratDomainCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object qStratDomainINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsStratDomain: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqStratDomain
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 592
    Top = 312
    object cdsStratDomainUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsStratDomainDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsStratDomainDOMAINID_1: TIntegerField
      FieldName = 'DOMAINID_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsStratDomainDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsStratDomainCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsStratDomainCONTINENTID_1: TStringField
      FieldName = 'CONTINENTID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsStratDomainCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsStratDomainINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsStratDomain: TDataSource
    DataSet = cdsStratDomain
    Left = 620
    Top = 312
  end
  object dspDomains: TDataSetProvider
    DataSet = qDomains
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
    object cdsDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainsDOMAINNAME: TStringField
      DisplayLabel = 'Domain Name'
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object cdsDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
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
    object cdsDomainsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
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
    DataSet = cdsDomains
    Left = 110
    Top = 436
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
    SQLConnection = sqlcStrat
    Left = 712
    Top = 408
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
      'delete from STRATDOMAIN'
      'where STRATDOMAIN.UNITID = :UnitID'
      'and STRATDOMAIN.DOMAINID = :DomainID'
      '')
    SQLConnection = sqlcStrat
    Left = 776
    Top = 412
  end
  object qLinkedApplications: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
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
    SQLConnection = sqlcStrat
    Left = 568
    Top = 356
    object qLinkedApplicationsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLinkedApplicationsAPPLICATIONID: TIntegerField
      FieldName = 'APPLICATIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLinkedApplicationsAPPLICATIONID_1: TIntegerField
      FieldName = 'APPLICATIONID_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qLinkedApplicationsAPPLICATION: TStringField
      FieldName = 'APPLICATION'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object cdsLinkedApplications: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqLinkedApplications
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 592
    Top = 356
    object cdsLinkedApplicationsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLinkedApplicationsAPPLICATIONID: TIntegerField
      FieldName = 'APPLICATIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLinkedApplicationsAPPLICATIONID_1: TIntegerField
      FieldName = 'APPLICATIONID_1'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsLinkedApplicationsAPPLICATION: TStringField
      FieldName = 'APPLICATION'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsLinkedApplications: TDataSource
    DataSet = cdsLinkedApplications
    Left = 620
    Top = 356
  end
  object qApplications: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM APPLICATIONS'
      'ORDER BY APPLICATIONS.APPLICATIONID')
    Left = 146
    Top = 627
    object qApplicationsAPPLICATIONID: TIntegerField
      FieldName = 'APPLICATIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qApplicationsAPPLICATION: TStringField
      FieldName = 'APPLICATION'
      Required = True
      Size = 50
    end
  end
  object dspApplications: TDataSetProvider
    DataSet = qApplications
    Left = 174
    Top = 627
  end
  object cdsApplications: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspApplications'
    Left = 202
    Top = 627
    object cdsApplicationsAPPLICATIONID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'APPLICATIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsApplicationsAPPLICATION: TStringField
      DisplayLabel = 'Application'
      FieldName = 'APPLICATION'
      Required = True
      Size = 50
    end
  end
  object dsApplications: TDataSource
    AutoEdit = False
    DataSet = cdsApplications
    Left = 230
    Top = 626
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
    SQLConnection = sqlcStrat
    Left = 820
    Top = 412
  end
  object qRep1: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT STRATUNITS.UNITID, STRATUNITS.COUNTRYID,'
      '  STRATUNITS.UNITNAME,  STRATUNITS.PARENTID,'
      '  STRATUNITS.RANKID,  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,  STRATUNITS.MAXAGE,'
      '  STRATUNITS.AGEUNITS,'
      '  RANKS.UNITRANK, COUNTRIES.COUNTRY,'
      '  STRATUNITS.APPROVALID, '
      '  APPROVALSTATUS.APPROVALID, APPROVALSTATUS.APPROVALSTATUS,'
      '  APPLICLINK.UNITID, APPLICLINK.APPLICATIONID,'
      '  UNITROCKCLASS.UNITID, UNITROCKCLASS.ROCKCLASSID,'
      '  UNITSETTING.UNITID,UNITSETTING.SETTINGID,'
      '  ROCKCLASSES.ROCKCLASSID, ROCKCLASSES.ROCKCLASS,'
      '  SETTINGS.SETTINGID, SETTINGS.SETTING,'
      '   DIRECTIONS.SOURCEFROMNAME,'
      '  DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT'
      
        'from STRATUNITS, COUNTRIES, RANKS, APPROVALSTATUS, APPLICLINK,UN' +
        'ITFOR,USERSWHOFOR,'
      '  UNITROCKCLASS,UNITSETTING,ROCKCLASSES,SETTINGS,'
      '  STRATSEDENVIRONMENT,STRATCURRENT,DIRECTIONS,'
      '  DEPOSITIONNVIRONMENT'
      'where STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'AND STRATUNITS.UNITID=APPLICLINK.UNITID'
      'AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID'
      'AND STRATUNITS.UNITID=UNITSETTING.UNITID'
      'AND ROCKCLASSES.ROCKCLASSID=UNITROCKCLASS.ROCKCLASSID'
      'AND SETTINGS.SETTINGID=UNITSETTING.SETTINGID'
      'AND STRATUNITS.UNITID=57'
      'AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID'
      'AND STRATUNITS.UNITID=STRATCURRENT.UNITID'
      
        'AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRON' +
        'MENT.DEPOSITIONENVIRONMENTID'
      'AND STRATCURRENT.CURRENTDIRECTION=DIRECTIONS.DIRECTIONANGLE'
      'ORDER BY STRATUNITS.AGEYEARS, STRATUNITS.UNITID'
      '')
    SQLConnection = sqlcStrat
    Left = 248
    Top = 29
    object qRep1UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qRep1COUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object qRep1UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qRep1PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qRep1RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object qRep1MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qRep1MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qRep1AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object qRep1UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object qRep1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object qRep1APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qRep1APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object qRep1APPLICATIONID: TIntegerField
      FieldName = 'APPLICATIONID'
      Required = True
    end
    object qRep1ROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object qRep1SETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object qRep1SOURCEFROMNAME: TStringField
      FieldName = 'SOURCEFROMNAME'
      Required = True
    end
    object qRep1DEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object qRep1AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object qRep2: TSQLQuery
    DataSource = dsqRep1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,STRATUNITS.AGEYEARS,'
      '  STRATUNITS.AGEUNITS,'
      '  STRATUNITS.APPROVALID, '
      '  APPROVALSTATUS.APPROVALID, APPROVALSTATUS.APPROVALSTATUS,'
      '  UNITROCKCLASS.UNITID, UNITROCKCLASS.ROCKCLASSID,'
      '  UNITSETTING.UNITID,UNITSETTING.SETTINGID,'
      '  ROCKCLASSES.ROCKCLASSID, ROCKCLASSES.ROCKCLASS,'
      '  SETTINGS.SETTINGID, SETTINGS.SETTING,'
      '  DIRECTIONS.SOURCEFROMNAME,'
      '  DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT'
      'from STRATUNITS, RANKS,APPROVALSTATUS,USERSWHOFOR,UNITFOR, '
      '  UNITROCKCLASS,UNITSETTING,ROCKCLASSES,SETTINGS,'
      '  STRATSEDENVIRONMENT,STRATCURRENT,DIRECTIONS,'
      '  DEPOSITIONNVIRONMENT'
      'where STRATUNITS.PARENTID = :UNITID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'and STRATUNITS.APPROVALID <> '#39'HS'#39
      'and STRATUNITS.APPROVALID <> '#39'NA'#39
      'AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID'
      'AND STRATUNITS.UNITID=UNITSETTING.UNITID'
      'AND ROCKCLASSES.ROCKCLASSID=UNITROCKCLASS.ROCKCLASSID'
      'AND SETTINGS.SETTINGID=UNITSETTING.SETTINGID'
      'AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID'
      'AND STRATUNITS.UNITID=STRATCURRENT.UNITID'
      
        'AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRON' +
        'MENT.DEPOSITIONENVIRONMENTID'
      'AND STRATCURRENT.CURRENTDIRECTION=DIRECTIONS.DIRECTIONANGLE'
      'ORDER BY STRATUNITS.AGEYEARS, STRATUNITS.UNITID'
      '')
    SQLConnection = sqlcStrat
    Left = 248
    Top = 73
    object qRep2UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qRep2UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qRep2PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qRep2RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object qRep2MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qRep2MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qRep2UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object qRep2AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object qRep2APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qRep2APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object qRep2ROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object qRep2SETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object qRep2SOURCEFROMNAME: TStringField
      FieldName = 'SOURCEFROMNAME'
      Required = True
    end
    object qRep2DEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object qRep2AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object qRep3: TSQLQuery
    DataSource = dsqRep2
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,STRATUNITS.AGEYEARS,'
      '  STRATUNITS.AGEUNITS,'
      '  STRATUNITS.APPROVALID, '
      '  APPROVALSTATUS.APPROVALID, APPROVALSTATUS.APPROVALSTATUS,'
      '  UNITROCKCLASS.UNITID, UNITROCKCLASS.ROCKCLASSID,'
      '  UNITSETTING.UNITID,UNITSETTING.SETTINGID,'
      '  ROCKCLASSES.ROCKCLASSID, ROCKCLASSES.ROCKCLASS,'
      '  SETTINGS.SETTINGID, SETTINGS.SETTING,'
      '  DIRECTIONS.SOURCEFROMNAME,'
      '  DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT'
      'from STRATUNITS, RANKS,APPROVALSTATUS, USERSWHOFOR,UNITFOR,'
      '  UNITROCKCLASS,UNITSETTING,ROCKCLASSES,SETTINGS,'
      '  STRATSEDENVIRONMENT,STRATCURRENT,DIRECTIONS,'
      '  DEPOSITIONNVIRONMENT'
      'where STRATUNITS.PARENTID = :UNITID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'and STRATUNITS.APPROVALID <> '#39'HS'#39
      'and STRATUNITS.APPROVALID <> '#39'NA'#39
      'AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID'
      'AND STRATUNITS.UNITID=UNITSETTING.UNITID'
      'AND ROCKCLASSES.ROCKCLASSID=UNITROCKCLASS.ROCKCLASSID'
      'AND SETTINGS.SETTINGID=UNITSETTING.SETTINGID'
      'AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID'
      'AND STRATUNITS.UNITID=STRATCURRENT.UNITID'
      
        'AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRON' +
        'MENT.DEPOSITIONENVIRONMENTID'
      'AND STRATCURRENT.CURRENTDIRECTION=DIRECTIONS.DIRECTIONANGLE'
      'ORDER BY STRATUNITS.AGEYEARS, STRATUNITS.UNITID'
      '')
    SQLConnection = sqlcStrat
    Left = 248
    Top = 117
    object qRep3UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qRep3UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qRep3PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qRep3RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object qRep3MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qRep3MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qRep3UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object qRep3AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object qRep3APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qRep3APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object qRep3ROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object qRep3SETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object qRep3SOURCEFROMNAME: TStringField
      FieldName = 'SOURCEFROMNAME'
      Required = True
    end
    object qRep3DEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object qRep3AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object qRep4: TSQLQuery
    DataSource = dsqRep3
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK,STRATUNITS.AGEYEARS,'
      '  STRATUNITS.AGEUNITS,'
      '  STRATUNITS.APPROVALID, '
      '  APPROVALSTATUS.APPROVALID, APPROVALSTATUS.APPROVALSTATUS,'
      '  UNITROCKCLASS.UNITID, UNITROCKCLASS.ROCKCLASSID,'
      '  UNITSETTING.UNITID,UNITSETTING.SETTINGID,'
      '  ROCKCLASSES.ROCKCLASSID, ROCKCLASSES.ROCKCLASS,'
      '  SETTINGS.SETTINGID, SETTINGS.SETTING,'
      '  DIRECTIONS.SOURCEFROMNAME,'
      '  DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT'
      'from STRATUNITS, RANKS,APPROVALSTATUS,USERSWHOFOR,UNITFOR, '
      '  UNITROCKCLASS,UNITSETTING,ROCKCLASSES,SETTINGS,'
      '  STRATSEDENVIRONMENT,STRATCURRENT,DIRECTIONS,'
      '  DEPOSITIONNVIRONMENT'
      'where STRATUNITS.PARENTID = :UNITID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'and STRATUNITS.APPROVALID <> '#39'HS'#39
      'and STRATUNITS.APPROVALID <> '#39'NA'#39
      'AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID'
      'AND STRATUNITS.UNITID=UNITSETTING.UNITID'
      'AND ROCKCLASSES.ROCKCLASSID=UNITROCKCLASS.ROCKCLASSID'
      'AND SETTINGS.SETTINGID=UNITSETTING.SETTINGID'
      'AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID'
      'AND STRATUNITS.UNITID=STRATCURRENT.UNITID'
      
        'AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRON' +
        'MENT.DEPOSITIONENVIRONMENTID'
      'AND STRATCURRENT.CURRENTDIRECTION=DIRECTIONS.DIRECTIONANGLE'
      'ORDER BY STRATUNITS.AGEYEARS, STRATUNITS.UNITID'
      '')
    SQLConnection = sqlcStrat
    Left = 248
    Top = 161
    object qRep4UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qRep4UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qRep4PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qRep4RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object qRep4MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qRep4MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qRep4UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object qRep4AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object qRep4APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qRep4APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object qRep4ROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object qRep4SETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object qRep4SOURCEFROMNAME: TStringField
      FieldName = 'SOURCEFROMNAME'
      Required = True
    end
    object qRep4DEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object qRep4AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object dsqRep1: TDataSource
    DataSet = qRep1
    Left = 276
    Top = 29
  end
  object dsqRep2: TDataSource
    DataSet = qRep2
    Left = 276
    Top = 73
  end
  object dsqRep3: TDataSource
    DataSet = qRep3
    Left = 276
    Top = 117
  end
  object dsqRep4: TDataSource
    DataSet = qRep4
    Left = 276
    Top = 161
  end
  object dspRep1: TDataSetProvider
    DataSet = qRep1
    Left = 304
    Top = 29
  end
  object cdsRep1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRep1'
    Left = 332
    Top = 29
    object cdsRep1UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsRep1COUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsRep1UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsRep1PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsRep1RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsRep1MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsRep1MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsRep1AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsRep1UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsRep1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsRep1APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsRep1APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object cdsRep1APPLICATIONID: TIntegerField
      FieldName = 'APPLICATIONID'
      Required = True
    end
    object cdsRep1qRep2: TDataSetField
      FieldName = 'qRep2'
    end
    object cdsRep1ROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object cdsRep1SETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object cdsRep1SOURCEFROMNAME: TStringField
      FieldName = 'SOURCEFROMNAME'
      Required = True
    end
    object cdsRep1DEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object cdsRep1AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object cdsRep2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRep1qRep2
    Params = <>
    Left = 304
    Top = 73
    object cdsRep2UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsRep2UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsRep2PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsRep2RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsRep2MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsRep2MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsRep2UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsRep2qRep3: TDataSetField
      FieldName = 'qRep3'
    end
    object cdsRep2AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsRep2APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsRep2APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object cdsRep2ROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object cdsRep2SETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object cdsRep2SOURCEFROMNAME: TStringField
      FieldName = 'SOURCEFROMNAME'
      Required = True
    end
    object cdsRep2DEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object cdsRep2AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object cdsRep3: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRep2qRep3
    Params = <>
    Left = 304
    Top = 117
    object cdsRep3UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsRep3UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsRep3PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsRep3RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsRep3MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsRep3MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsRep3UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsRep3qRep4: TDataSetField
      FieldName = 'qRep4'
    end
    object cdsRep3AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsRep3APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsRep3APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object cdsRep3ROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object cdsRep3SETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object cdsRep3SOURCEFROMNAME: TStringField
      FieldName = 'SOURCEFROMNAME'
      Required = True
    end
    object cdsRep3DEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object cdsRep3AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object cdsRep4: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRep3qRep4
    Params = <>
    Left = 304
    Top = 161
    object cdsRep4UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsRep4UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsRep4PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsRep4RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsRep4MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsRep4MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsRep4UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsRep4AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsRep4APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsRep4APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object cdsRep4ROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object cdsRep4SETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object cdsRep4SOURCEFROMNAME: TStringField
      FieldName = 'SOURCEFROMNAME'
      Required = True
    end
    object cdsRep4DEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
    object cdsRep4AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object dsRep1: TDataSource
    DataSet = cdsRep1
    Left = 360
    Top = 29
  end
  object dsRep2: TDataSource
    DataSet = cdsRep2
    Left = 332
    Top = 73
  end
  object dsRep3: TDataSource
    DataSet = cdsRep3
    Left = 332
    Top = 117
  end
  object dsRep4: TDataSource
    DataSet = cdsRep4
    Left = 332
    Top = 161
  end
  object qDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT DOMAINS.DOMAINID, DOMAINS.DOMAINNAME, '
      '   DOMAINS.CONTINENTID, DOMAINS.DOMAINPARENTID,'
      '   DOMAINS.DOMAINTYPEID, DOMAINS.MAXAGE,'
      '  DOMAINS.MINPLOTAGE,DOMAINS.MAXPLOTAGE,'
      '   DOMAINS.SPOTLATITUDE,DOMAINS.SPOTLONGITUDE'
      'FROM DOMAINS,DOMAINFOR,USERSWHOFOR'
      'WHERE USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINS.DOMAINID=DOMAINFOR.DOMAINID'
      'ORDER BY DOMAINS.DOMAINNAME')
    SQLConnection = sqlcStrat
    Left = 24
    Top = 436
    object qDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object qDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDomainsSPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object qDomainsSPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
    end
    object qDomainsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
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
  object qRockClasses: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM ROCKCLASSES'
      'ORDER BY ROCKCLASSES.LEGENDORDER')
    SQLConnection = sqlcStrat
    Left = 24
    Top = 484
  end
  object dspRockClasses: TDataSetProvider
    DataSet = qRockClasses
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 54
    Top = 484
  end
  object cdsRockClasses: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRockClasses'
    Left = 82
    Top = 484
    object cdsRockClassesROCKCLASSID: TStringField
      FieldName = 'ROCKCLASSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsRockClassesROCKCLASS: TStringField
      FieldName = 'ROCKCLASS'
      Required = True
      Size = 50
    end
    object cdsRockClassesLEGENDORDER: TSmallintField
      FieldName = 'LEGENDORDER'
      Required = True
    end
    object cdsRockClassesROCKCLASSID2: TStringField
      FieldName = 'ROCKCLASSID2'
      Required = True
      Size = 2
    end
    object cdsRockClassesROCKCLASSFUNDAMENTAL: TStringField
      FieldName = 'ROCKCLASSFUNDAMENTAL'
      Required = True
      Size = 2
    end
  end
  object dsRockClasses: TDataSource
    DataSet = cdsRockClasses
    Left = 110
    Top = 484
  end
  object qSettings: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SETTINGS'
      'ORDER BY SETTINGS.LEGENDORDER')
    SQLConnection = sqlcStrat
    Left = 24
    Top = 532
  end
  object dspSettings: TDataSetProvider
    DataSet = qSettings
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 54
    Top = 532
  end
  object cdsSettings: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSettings'
    Left = 82
    Top = 532
    object cdsSettingsSETTINGID: TStringField
      FieldName = 'SETTINGID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsSettingsSETTING: TStringField
      FieldName = 'SETTING'
      Required = True
      Size = 50
    end
    object cdsSettingsLEGENDORDER: TSmallintField
      FieldName = 'LEGENDORDER'
      Required = True
    end
  end
  object dsSettings: TDataSource
    DataSet = cdsSettings
    Left = 110
    Top = 532
  end
  object qUnitRockClass: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT UNITROCKCLASS.UNITID, UNITROCKCLASS.ROCKCLASSID'
      'FROM UNITROCKCLASS'
      'WHERE UNITROCKCLASS.UNITID = :UnitID')
    SQLConnection = sqlcStrat
    Left = 568
    Top = 400
    object qUnitRockClassUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitRockClassROCKCLASSID: TStringField
      DisplayWidth = 2
      FieldName = 'ROCKCLASSID'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object cdsUnitRockClass: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqUnitRockClass
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 592
    Top = 400
    object cdsUnitRockClassUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitRockClassROCKCLASSID: TStringField
      DisplayWidth = 2
      FieldName = 'ROCKCLASSID'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dsUnitRockClass: TDataSource
    DataSet = cdsUnitRockClass
    Left = 620
    Top = 400
  end
  object qUnitSetting: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT UNITSETTING.UNITID,UNITSETTING.SETTINGID'
      'FROM UNITSETTING'
      'WHERE UNITSETTING.UNITID = :UnitID')
    SQLConnection = sqlcStrat
    Left = 568
    Top = 448
    object qUnitSettingUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitSettingSETTINGID: TStringField
      FieldName = 'SETTINGID'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object cdsUnitSetting: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqUnitSetting
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 592
    Top = 448
    object cdsUnitSettingUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitSettingSETTINGID: TStringField
      FieldName = 'SETTINGID'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dsUnitSetting: TDataSource
    DataSet = cdsUnitSetting
    Left = 620
    Top = 448
  end
  object qDomainQ: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
        Value = '14'
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DOMAINS.DOMAINID, DOMAINS.DOMAINNAME,'
      '  DOMAINS.CONTINENTID, DOMAINS.DOMAINPARENTID, '
      '  DOMAINS.DOMAINTYPEID,'
      '  DOMAINS.SPOTLATITUDE, DOMAINS.SPOTLONGITUDE,'
      '  DOMAINS.MINPLOTAGE, DOMAINS.MAXPLOTAGE,'
      '  DOMAINS.MAXAGE,'
      '  DOMAINTYPES.DOMAINTYPEID,DOMAINTYPES.DOMAINTYPE,'
      '  DOMAINTYPES.DVLEVEL,'
      '  CONTINENTS.CONTINENTID,CONTINENTS.CONTINENT'
      'from DOMAINS,DOMAINTYPES,CONTINENTS,DOMAINFOR,USERSWHOFOR'
      'where DOMAINS.DOMAINID = :DomainID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'and DOMAINS.DOMAINID=DOMAINFOR.DOMAINID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'and DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID'
      '')
    SQLConnection = sqlcStrat
    Left = 256
    Top = 213
    object qDomainQDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainQDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object qDomainQCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDomainQDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object qDomainQDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object qDomainQSPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object qDomainQSPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
    end
    object qDomainQDOMAINTYPEID_1: TStringField
      FieldName = 'DOMAINTYPEID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qDomainQDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qDomainQCONTINENTID_1: TStringField
      FieldName = 'CONTINENTID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qDomainQCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDomainQDVLEVEL: TIntegerField
      FieldName = 'DVLEVEL'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDomainQMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qDomainQMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object qDomainQMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
  end
  object dsqDomainQ: TDataSource
    DataSet = qDomainQ
    Left = 284
    Top = 213
  end
  object dspDomainQ: TDataSetProvider
    DataSet = qDomainQ
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 312
    Top = 213
  end
  object cdsDomainQ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainQ'
    Left = 340
    Top = 213
    object cdsDomainQDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainQDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 65
    end
    object cdsDomainQCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainQDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDomainQDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDomainQSPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object cdsDomainQSPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
    end
    object cdsDomainQqDomainParent: TDataSetField
      FieldName = 'qDomainParent'
      ReadOnly = True
    end
    object cdsDomainQqSubDomains: TDataSetField
      FieldName = 'qSubDomains'
      ReadOnly = True
    end
    object cdsDomainQqDomainMetamorphism: TDataSetField
      FieldName = 'qDomainMetamorphism'
    end
    object cdsDomainQqDomainDeformation: TDataSetField
      FieldName = 'qDomainDeformation'
    end
    object cdsDomainQqDomainValid: TDataSetField
      FieldName = 'qDomainValid'
    end
    object cdsDomainQDVLEVEL: TIntegerField
      FieldName = 'DVLEVEL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDomainQqDomainUnits: TDataSetField
      FieldName = 'qDomainUnits'
    end
    object cdsDomainQMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
      MaxValue = 4570.000000000000000000
    end
    object cdsDomainQMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
      MaxValue = 4570.000000000000000000
    end
    object cdsDomainQMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
      MaxValue = 4570.000000000000000000
    end
    object cdsDomainQCONTINENT: TStringField
      FieldName = 'CONTINENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDomainQqDomainDeposits: TDataSetField
      FieldName = 'qDomainDeposits'
    end
    object cdsDomainQqDomainFor: TDataSetField
      FieldName = 'qDomainFor'
    end
    object cdsDomainQqDomainLIP: TDataSetField
      FieldName = 'qDomainLIP'
    end
  end
  object dsDomainQ: TDataSource
    AutoEdit = False
    DataSet = cdsDomainQ
    Left = 368
    Top = 213
  end
  object qDomainParent: TSQLQuery
    DataSource = dsqDomainQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINPARENTID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DOMAINS.DOMAINID, DOMAINS.DOMAINNAME,'
      '  DOMAINS.DOMAINPARENTID, DOMAINS.DOMAINTYPEID,'
      '  DOMAINTYPES.DOMAINTYPE'
      'from DOMAINS,DOMAINTYPES,USERSWHOFOR,DOMAINFOR'
      'where DOMAINS.DOMAINID = :DomainParentID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINS.DOMAINID = DOMAINFOR.DOMAINID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID')
    SQLConnection = sqlcStrat
    Left = 280
    Top = 261
    object qDomainParentDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDomainParentDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qDomainParentDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDomainParentDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qDomainParentDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsDomainParent: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainQqDomainParent
    Params = <>
    Left = 308
    Top = 261
    object cdsDomainParentDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDomainParentDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsDomainParentDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDomainParentDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsDomainParentDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsDomainParent: TDataSource
    DataSet = cdsDomainParent
    Left = 336
    Top = 261
  end
  object qSubDomains: TSQLQuery
    DataSource = dsqDomainQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DOMAINS.DOMAINID, DOMAINS.DOMAINNAME,'
      '  DOMAINS.DOMAINPARENTID, DOMAINS.DOMAINTYPEID,'
      '  DOMAINTYPES.DOMAINTYPE'
      'from DOMAINS,DOMAINTYPES,USERSWHOFOR,DOMAINFOR'
      'where DOMAINS.DOMAINPARENTID = :DomainID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINFOR.DOMAINID = DOMAINS.DOMAINID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'order by DOMAINS.DOMAINNAME')
    SQLConnection = sqlcStrat
    Left = 284
    Top = 309
  end
  object cdsSubDomains: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainQqSubDomains
    Params = <>
    Left = 312
    Top = 309
    object cdsSubDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
    object cdsSubDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = [pfInKey]
      ReadOnly = True
      Size = 150
    end
    object cdsSubDomainsDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
    object cdsSubDomainsDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      ProviderFlags = [pfInKey]
      ReadOnly = True
      Size = 5
    end
    object cdsSubDomainsDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      ProviderFlags = [pfInKey]
      ReadOnly = True
      Size = 30
    end
  end
  object dsSubDomains: TDataSource
    DataSet = cdsSubDomains
    Left = 340
    Top = 309
  end
  object DomainQuery: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME,  DOMAINS.DOMAINPARENTID,'
      '  DOMAINS.DOMAINTYPEID,  DOMAINS.SPOTLATITUDE,'
      '  DOMAINS.SPOTLONGITUDE,'
      '  DOMAINS.MINPLOTAGE, DOMAINS.MAXPLOTAGE,'
      '  DOMAINTYPES.DOMAINTYPE, CONTINENTS.CONTINENT'
      'from DOMAINS, DOMAINTYPES, CONTINENTS,DOMAINFOR,USERSWHOFOR'
      'where DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'and DOMAINS.DOMAINID=DOMAINFOR.DOMAINID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID')
    SQLConnection = sqlcStrat
    Left = 396
    Top = 18
  end
  object dspDomainQuery: TDataSetProvider
    DataSet = DomainQuery
    Left = 426
    Top = 18
  end
  object cdsDomainQuery: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainQuery'
    Left = 454
    Top = 18
    object cdsDomainQueryDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainQueryCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainQueryDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainQueryDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDomainQueryDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDomainQuerySPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainQuerySPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainQueryDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsDomainQueryCONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
    object cdsDomainQueryMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainQueryMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
  end
  object dsDomainQuery: TDataSource
    DataSet = cdsDomainQuery
    Left = 482
    Top = 18
  end
  object qDomainMetamorphism: TSQLQuery
    DataSource = dsqDomainQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMANMETAMORPHISM.DOMAINID, '
      '  DOMANMETAMORPHISM.METAMORPHISMORDER,'
      '  DOMANMETAMORPHISM.GRADEID, '
      '  DOMANMETAMORPHISM.PEAKAGE,'
      '  DOMANMETAMORPHISM.AGEPLUS,'
      '  DOMANMETAMORPHISM.AGEMINUS,'
      '  DOMANMETAMORPHISM.OROGENYID,'
      '  DOMANMETAMORPHISM.PEAKTMIN,DOMANMETAMORPHISM.PEAKTMAX,'
      '  DOMANMETAMORPHISM.PEAKPMIN,DOMANMETAMORPHISM.PEAKPMAX,'
      '  DOMANMETAMORPHISM.CONSTRAINTLEVELID,'
      '  METAMORPHICGRADE.GRADE,CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  OROGENIES.OROGENY'
      'FROM DOMANMETAMORPHISM,METAMORPHICGRADE,OROGENIES,CONSTRAINTS'
      'WHERE DOMANMETAMORPHISM.DOMAINID = :DomainID'
      'AND DOMANMETAMORPHISM.GRADEID=METAMORPHICGRADE.GRADEID'
      'AND DOMANMETAMORPHISM.OROGENYID=OROGENIES.OROGENYID'
      
        'AND DOMANMETAMORPHISM.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAIN' +
        'TLEVELID'
      
        'ORDER BY DOMANMETAMORPHISM.PEAKAGE,DOMANMETAMORPHISM.METAMORPHIS' +
        'MORDER')
    SQLConnection = sqlcStrat
    Left = 284
    Top = 357
    object qDomainMetamorphismDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainMetamorphismMETAMORPHISMORDER: TIntegerField
      FieldName = 'METAMORPHISMORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainMetamorphismGRADEID: TStringField
      FieldName = 'GRADEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDomainMetamorphismPEAKAGE: TFloatField
      FieldName = 'PEAKAGE'
      Required = True
    end
    object qDomainMetamorphismAGEPLUS: TFloatField
      FieldName = 'AGEPLUS'
      Required = True
    end
    object qDomainMetamorphismAGEMINUS: TFloatField
      FieldName = 'AGEMINUS'
      Required = True
    end
    object qDomainMetamorphismPEAKTMIN: TFloatField
      FieldName = 'PEAKTMIN'
      Required = True
    end
    object qDomainMetamorphismPEAKTMAX: TFloatField
      FieldName = 'PEAKTMAX'
      Required = True
    end
    object qDomainMetamorphismPEAKPMIN: TFloatField
      FieldName = 'PEAKPMIN'
      Required = True
    end
    object qDomainMetamorphismPEAKPMAX: TFloatField
      FieldName = 'PEAKPMAX'
      Required = True
    end
    object qDomainMetamorphismCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object qDomainMetamorphismGRADE: TStringField
      FieldName = 'GRADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qDomainMetamorphismAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 105
    end
    object qDomainMetamorphismOROGENY: TStringField
      FieldName = 'OROGENY'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qDomainMetamorphismOROGENYID: TIntegerField
      FieldName = 'OROGENYID'
      Required = True
    end
  end
  object cdsDomainMetamorphism: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainQqDomainMetamorphism
    Params = <>
    Left = 312
    Top = 357
    object cdsDomainMetamorphismDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainMetamorphismMETAMORPHISMORDER: TIntegerField
      FieldName = 'METAMORPHISMORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainMetamorphismGRADEID: TStringField
      FieldName = 'GRADEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainMetamorphismPEAKAGE: TFloatField
      FieldName = 'PEAKAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainMetamorphismAGEPLUS: TFloatField
      FieldName = 'AGEPLUS'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainMetamorphismAGEMINUS: TFloatField
      FieldName = 'AGEMINUS'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainMetamorphismGRADE: TStringField
      FieldName = 'GRADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsDomainMetamorphismOROGENY: TStringField
      FieldName = 'OROGENY'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsDomainMetamorphismPEAKTMIN: TFloatField
      FieldName = 'PEAKTMIN'
      Required = True
      DisplayFormat = '###0.0'
    end
    object cdsDomainMetamorphismPEAKTMAX: TFloatField
      FieldName = 'PEAKTMAX'
      Required = True
      DisplayFormat = '###0.0'
    end
    object cdsDomainMetamorphismPEAKPMIN: TFloatField
      FieldName = 'PEAKPMIN'
      Required = True
      DisplayFormat = '###0.0'
    end
    object cdsDomainMetamorphismPEAKPMAX: TFloatField
      FieldName = 'PEAKPMAX'
      Required = True
      DisplayFormat = '###0.0'
    end
    object cdsDomainMetamorphismCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsDomainMetamorphismAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 105
    end
    object cdsDomainMetamorphismOROGENYID: TIntegerField
      FieldName = 'OROGENYID'
      Required = True
    end
  end
  object dsDomainMetamorphism: TDataSource
    DataSet = cdsDomainMetamorphism
    Left = 340
    Top = 357
  end
  object qDomainDeformation: TSQLQuery
    DataSource = dsqDomainQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DOMAINDEFORMATION.DOMAINID, '
      '  DOMAINDEFORMATION.DEFORMATIONORDER,'
      '  DOMAINDEFORMATION.AGEMIN, '
      '  DOMAINDEFORMATION.AGEMAX,'
      '  DOMAINDEFORMATION.DUCTILITYTYPEID,'
      '  DOMAINDEFORMATION.VERGENCEANGLE,'
      '  DOMAINDEFORMATION.OROGENYID,'
      '  DOMAINDEFORMATION.CONSTRAINTLEVELID,'
      '  DOMAINDEFORMATION.DEFORMATIONTYPEID,'
      '  CONSTRAINTS.AGECONSTRAINTLEVEL,'
      '  OROGENIES.OROGENY'
      'from DOMAINDEFORMATION,OROGENIES,CONSTRAINTS'
      'where DOMAINDEFORMATION.DOMAINID = :DomainID'
      'and DOMAINDEFORMATION.OROGENYID=OROGENIES.OROGENYID'
      
        'and DOMAINDEFORMATION.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAIN' +
        'TLEVELID'
      
        'order by DOMAINDEFORMATION.AGEMIN,DOMAINDEFORMATION.DEFORMATIONO' +
        'RDER')
    SQLConnection = sqlcStrat
    Left = 284
    Top = 405
    object qDomainDeformationDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object qDomainDeformationDEFORMATIONORDER: TIntegerField
      FieldName = 'DEFORMATIONORDER'
      Required = True
    end
    object qDomainDeformationAGEMIN: TFloatField
      FieldName = 'AGEMIN'
      Required = True
    end
    object qDomainDeformationAGEMAX: TFloatField
      FieldName = 'AGEMAX'
      Required = True
    end
    object qDomainDeformationOROGENYID: TIntegerField
      FieldName = 'OROGENYID'
      Required = True
    end
    object qDomainDeformationCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object qDomainDeformationAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 105
    end
    object qDomainDeformationOROGENY: TStringField
      FieldName = 'OROGENY'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qDomainDeformationDUCTILITYTYPEID: TStringField
      FieldName = 'DUCTILITYTYPEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDomainDeformationDEFORMATIONTYPEID: TIntegerField
      FieldName = 'DEFORMATIONTYPEID'
      Required = True
    end
    object qDomainDeformationVERGENCEANGLE: TIntegerField
      FieldName = 'VERGENCEANGLE'
      Required = True
    end
  end
  object cdsDomainDeformation: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainQqDomainDeformation
    Params = <>
    Left = 312
    Top = 405
    object cdsDomainDeformationDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainDeformationDEFORMATIONORDER: TIntegerField
      FieldName = 'DEFORMATIONORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainDeformationAGEMIN: TFloatField
      FieldName = 'AGEMIN'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainDeformationAGEMAX: TFloatField
      FieldName = 'AGEMAX'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainDeformationOROGENYID: TIntegerField
      FieldName = 'OROGENYID'
      Required = True
    end
    object cdsDomainDeformationOROGENY: TStringField
      FieldName = 'OROGENY'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsDomainDeformationCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsDomainDeformationAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 105
    end
    object cdsDomainDeformationDUCTILITYTYPEID: TStringField
      FieldName = 'DUCTILITYTYPEID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainDeformationDEFORMATIONTYPEID: TIntegerField
      FieldName = 'DEFORMATIONTYPEID'
      Required = True
    end
    object cdsDomainDeformationVERGENCEANGLE: TIntegerField
      FieldName = 'VERGENCEANGLE'
      Required = True
    end
  end
  object dsDomainDeformation: TDataSource
    DataSet = cdsDomainDeformation
    Left = 340
    Top = 405
  end
  object DomainQueryRec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME,  DOMAINS.DOMAINPARENTID,'
      '  DOMAINS.DOMAINTYPEID,  DOMAINS.SPOTLATITUDE,'
      '  DOMAINS.SPOTLONGITUDE,'
      '  DOMAINTYPES.DOMAINTYPE, CONTINENTS.CONTINENT'
      'FROM DOMAINS, DOMAINTYPES, CONTINENTS,DOMAINFOR,USERSWHOFOR'
      'WHERE DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID')
    SQLConnection = sqlcStrat
    Left = 748
    Top = 138
  end
  object dspDomainQueryRec: TDataSetProvider
    DataSet = DomainQueryRec
    Options = [poReadOnly]
    Left = 776
    Top = 138
  end
  object cdsDomainQueryRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainQueryRec'
    Left = 804
    Top = 138
    object cdsDomainQueryRecDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
  end
  object qDomainValid: TSQLQuery
    DataSource = dsqDomainQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DOMAINVALID.DOMAINID, DOMAINVALID.VALIDSTATUSID,'
      '  DOMAINVALID.DATEDONE, DOMAINVALID.DONEBY,'
      '  VALIDATIONSTATUS.VALIDSTATUSID,'
      '  VALIDATIONSTATUS.VALIDATIONSTATUS'
      'from DOMAINVALID, VALIDATIONSTATUS'
      'where DOMAINVALID.DOMAINID = :DomainID'
      'and DOMAINVALID.VALIDSTATUSID=VALIDATIONSTATUS.VALIDSTATUSID'
      'order by DOMAINVALID.VALIDSTATUSID')
    SQLConnection = sqlcStrat
    Left = 280
    Top = 453
    object qDomainValidDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainValidVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qDomainValidDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
    end
    object qDomainValidDONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object qDomainValidVALIDSTATUSID_1: TStringField
      FieldName = 'VALIDSTATUSID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qDomainValidVALIDATIONSTATUS: TStringField
      FieldName = 'VALIDATIONSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsDomainValid: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainQqDomainValid
    Params = <>
    Left = 308
    Top = 453
    object cdsDomainValidDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainValidVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsDomainValidDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
      DisplayFormat = 'ddddd'
    end
    object cdsDomainValidDONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object cdsDomainValidVALIDSTATUSID_1: TStringField
      FieldName = 'VALIDSTATUSID_1'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsDomainValidVALIDATIONSTATUS: TStringField
      FieldName = 'VALIDATIONSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsDomainValid: TDataSource
    DataSet = cdsDomainValid
    Left = 336
    Top = 453
  end
  object qDomainValidFull: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DOMAINVALID.DOMAINID, DOMAINVALID.VALIDSTATUSID,'
      '  DOMAINVALID.DATEDONE, DOMAINVALID.DONEBY,'
      '  DOMAINVALID.COMMENTS'
      'from DOMAINVALID'
      'where DOMAINVALID.DOMAINID = :DomainID')
    SQLConnection = sqlcStrat
    Left = 776
    Top = 308
  end
  object dspDomainValidFull: TDataSetProvider
    DataSet = qDomainValidFull
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 804
    Top = 308
  end
  object cdsDomainValidFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainValidFull'
    Left = 832
    Top = 308
    object cdsDomainValidFullDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainValidFullVALIDSTATUSID: TStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsDomainValidFullDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
      DisplayFormat = 'ddddd'
    end
    object cdsDomainValidFullDONEBY: TStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object cdsDomainValidFullCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
  end
  object dsDomainValidFull: TDataSource
    DataSet = cdsDomainValidFull
    Left = 860
    Top = 308
  end
  object qDRep1: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME,  DOMAINS.DOMAINPARENTID,'
      '  DOMAINS.DOMAINTYPEID,  '
      '  DOMAINTYPES.DOMAINTYPE, CONTINENTS.CONTINENT'
      'from DOMAINS, CONTINENTS, DOMAINTYPES, DOMAINFOR,USERSWHOFOR'
      'where DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINFOR.DOMAINID = DOMAINS.DOMAINID'
      'AND DOMAINS.DOMAINID=57')
    SQLConnection = sqlcStrat
    Left = 948
    Top = 277
    object qDRep1DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDRep1CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDRep1DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object qDRep1DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object qDRep1DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object qDRep1DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object qDRep1CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
  end
  object dsqDRep1: TDataSource
    DataSet = qDRep1
    Left = 976
    Top = 277
  end
  object dspDRep1: TDataSetProvider
    DataSet = qDRep1
    Left = 1004
    Top = 277
  end
  object cdsDRep1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDRep1'
    Left = 1032
    Top = 277
    object cdsDRep1DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDRep1CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDRep1DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDRep1DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDRep1DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDRep1DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsDRep1CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
    object cdsDRep1qDRep2: TDataSetField
      FieldName = 'qDRep2'
    end
  end
  object dsDRep1: TDataSource
    DataSet = cdsDRep1
    Left = 1060
    Top = 277
  end
  object qDRep2: TSQLQuery
    DataSource = dsqDRep1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME,  DOMAINS.DOMAINPARENTID,'
      '  DOMAINS.DOMAINTYPEID,  '
      '  DOMAINTYPES.DOMAINTYPE, CONTINENTS.CONTINENT'
      'from DOMAINS, CONTINENTS, DOMAINTYPES,USERSWHOFOR,DOMAINFOR'
      'where DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'and DOMAINS.DOMAINPARENTID = :DOMAINID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINFOR.DOMAINID = DOMAINS.DOMAINID'
      'order by DOMAINS.DOMAINNAME'
      '')
    SQLConnection = sqlcStrat
    Left = 980
    Top = 325
    object qDRep2DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDRep2CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDRep2DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object qDRep2DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object qDRep2DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object qDRep2DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object qDRep2CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
  end
  object dsqDRep2: TDataSource
    DataSet = qDRep2
    Left = 1008
    Top = 325
  end
  object cdsDRep2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDRep1qDRep2
    Params = <>
    Left = 1036
    Top = 325
    object cdsDRep2DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDRep2CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDRep2DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDRep2DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDRep2DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDRep2DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsDRep2CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
    object cdsDRep2qDRep3: TDataSetField
      FieldName = 'qDRep3'
    end
  end
  object dsDRep2: TDataSource
    DataSet = cdsDRep2
    Left = 1064
    Top = 325
  end
  object qDRep3: TSQLQuery
    DataSource = dsqDRep2
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME,  DOMAINS.DOMAINPARENTID,'
      '  DOMAINS.DOMAINTYPEID,  '
      '  DOMAINTYPES.DOMAINTYPE, CONTINENTS.CONTINENT'
      'from DOMAINS, CONTINENTS, DOMAINTYPES,USERSWHOFOR,DOMAINFOR'
      'where DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'and DOMAINS.DOMAINPARENTID = :DOMAINID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINFOR.DOMAINID = DOMAINS.DOMAINID'
      'order by DOMAINS.DOMAINNAME'
      '')
    SQLConnection = sqlcStrat
    Left = 984
    Top = 357
    object qDRep3DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDRep3CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDRep3DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object qDRep3DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object qDRep3DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object qDRep3DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object qDRep3CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
  end
  object dsqDRep3: TDataSource
    DataSet = qDRep3
    Left = 1012
    Top = 357
  end
  object cdsDRep3: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDRep2qDRep3
    Params = <>
    Left = 1040
    Top = 357
    object cdsDRep3DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDRep3CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDRep3DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDRep3DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDRep3DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDRep3DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsDRep3CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
    object cdsDRep3qDRep4: TDataSetField
      FieldName = 'qDRep4'
    end
  end
  object dsDRep3: TDataSource
    DataSet = cdsDRep3
    Left = 1068
    Top = 357
  end
  object qDRep4: TSQLQuery
    DataSource = dsqDRep3
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME,  DOMAINS.DOMAINPARENTID,'
      '  DOMAINS.DOMAINTYPEID,  '
      '  DOMAINTYPES.DOMAINTYPE, CONTINENTS.CONTINENT'
      'from DOMAINS, CONTINENTS, DOMAINTYPES,USERSWHOFOR,DOMAINFOR'
      'where DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'and DOMAINS.DOMAINPARENTID = :DOMAINID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINFOR.DOMAINID = DOMAINS.DOMAINID'
      'order by DOMAINS.DOMAINNAME'
      '')
    SQLConnection = sqlcStrat
    Left = 980
    Top = 400
    object qDRep4DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDRep4CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDRep4DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object qDRep4DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object qDRep4DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object qDRep4DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object qDRep4CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
  end
  object dsqDRep4: TDataSource
    DataSet = qDRep4
    Left = 1008
    Top = 400
  end
  object cdsDRep4: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDRep3qDRep4
    Params = <>
    Left = 1032
    Top = 401
    object cdsDRep4DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDRep4CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDRep4DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDRep4DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDRep4DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDRep4DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsDRep4CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
  end
  object dsDRep4: TDataSource
    DataSet = cdsDRep4
    Left = 1064
    Top = 400
  end
  object qDRep5: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME,  DOMAINS.DOMAINPARENTID,'
      '  DOMAINS.DOMAINTYPEID,  '
      '  DOMAINTYPES.DOMAINTYPE, CONTINENTS.CONTINENT'
      'from DOMAINS, CONTINENTS, DOMAINTYPES,USERSWHOFOR,DOMAINFOR'
      'where DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID'
      'and DOMAINS.DOMAINPARENTID = :DOMAINID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'AND DOMAINFOR.DOMAINID = DOMAINS.DOMAINID'
      'order by DOMAINS.DOMAINNAME'
      '')
    SQLConnection = sqlcStrat
    Left = 980
    Top = 452
    object qDRep5DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDRep5CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDRep5DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object qDRep5DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object qDRep5DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object qDRep5DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object qDRep5CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
  end
  object dsqDRep5: TDataSource
    DataSet = qDRep5
    Left = 1008
    Top = 452
  end
  object cdsDRep5: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1036
    Top = 452
    object cdsDRep5DOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDRep5CONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDRep5DOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDRep5DOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDRep5DOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDRep5DOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsDRep5CONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
  end
  object dsDRep5: TDataSource
    DataSet = cdsDRep5
    Left = 1064
    Top = 452
  end
  object qDomainUnits: TSQLQuery
    DataSource = dsqDomainQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
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
      '  STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME,'
      '  STRATUNITS.RANKID, STRATUNITS.AGEYEARS,'
      '  RANKS.UNITRANK'
      'from STRATDOMAIN,STRATUNITS,RANKS,USERSWHOFOR,UNITFOR'
      'where STRATDOMAIN.DOMAINID = :DomainID'
      'and STRATDOMAIN.UNITID=STRATUNITS.UNITID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'order by STRATUNITS.AGEYEARS')
    SQLConnection = sqlcStrat
    Left = 180
    Top = 341
    object qDomainUnitsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      Required = True
    end
    object qDomainUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qDomainUnitsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qDomainUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qDomainUnitsRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object qDomainUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDomainUnitsINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDomainUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
  end
  object cdsDomainUnits: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainQqDomainUnits
    Params = <>
    Left = 208
    Top = 341
    object cdsDomainUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInKey]
    end
    object cdsDomainUnitsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDomainUnitsINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainUnitsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsDomainUnitsUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsDomainUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '########0'
    end
    object cdsDomainUnitsRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cdsDomainUnitsUNITRANK: TStringField
      FieldName = 'UNITRANK'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsDomainUnits: TDataSource
    DataSet = cdsDomainUnits
    Left = 236
    Top = 341
  end
  object qLinkUnitToParentDomain: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO STRATDOMAIN'
      '(UnitID, DomainID)'
      'Values (:UnitID, :DomainID)'
      ''
      '')
    SQLConnection = sqlcStrat
    Left = 776
    Top = 456
  end
  object qPeriods: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PERIODS, PERIODRANKS '
      'WHERE PERIODS.PERIODRANKID=PERIODRANKS.PERIODRANKID'
      'ORDER BY PERIODS.CPARENTID,PERIODS.MINAGE')
    SQLConnection = sqlcStrat
    Left = 90
    Top = 23
  end
  object dspPeriods: TDataSetProvider
    DataSet = qPeriods
    Left = 116
    Top = 25
  end
  object cdsPeriods: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPeriods'
    Left = 144
    Top = 25
    object cdsPeriodsPERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPeriodsPERIODNAME: TStringField
      FieldName = 'PERIODNAME'
      Required = True
      Size = 30
    end
    object cdsPeriodsPERIODRANKID: TStringField
      FieldName = 'PERIODRANKID'
      Required = True
      Size = 4
    end
    object cdsPeriodsCPARENTID: TIntegerField
      FieldName = 'CPARENTID'
      Required = True
    end
    object cdsPeriodsMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsPeriodsMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsPeriodsPERIODRANK: TStringField
      FieldName = 'PERIODRANK'
      Required = True
    end
  end
  object dsPeriods: TDataSource
    DataSet = cdsPeriods
    Left = 172
    Top = 25
  end
  object qPRep1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select DISTINCT PERIODS.PERIODID, '
      '  PERIODS.PERIODNAME, PERIODS.CPARENTID,'
      '  PERIODS.PERIODRANKID,  '
      '  PERIODS.MINAGE,  PERIODS.MAXAGE,'
      '  PERIODS.MINAGEUNCERTAINTY, PERIODS.MAXAGEUNCERTAINTY,'
      '  PERIODRANKS.PERIODRANK'
      'from PERIODS, PERIODRANKS'
      'where PERIODS.PERIODRANKID=PERIODRANKS.PERIODRANKID'
      'AND PERIODS.CPARENTID=0'
      'AND PERIODS.PERIODID<>0'
      'ORDER BY  PERIODS.MINAGE,PERIODS.CPARENTID')
    SQLConnection = sqlcStrat
    Left = 952
    Top = 60
    object qPRep1PERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPRep1PERIODNAME: TStringField
      FieldName = 'PERIODNAME'
      Required = True
      Size = 30
    end
    object qPRep1CPARENTID: TIntegerField
      FieldName = 'CPARENTID'
      Required = True
    end
    object qPRep1PERIODRANKID: TStringField
      FieldName = 'PERIODRANKID'
      Required = True
      Size = 4
    end
    object qPRep1MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qPRep1MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qPRep1PERIODRANK: TStringField
      FieldName = 'PERIODRANK'
      Required = True
    end
    object qPRep1MINAGEUNCERTAINTY: TFloatField
      FieldName = 'MINAGEUNCERTAINTY'
      Required = True
    end
    object qPRep1MAXAGEUNCERTAINTY: TFloatField
      FieldName = 'MAXAGEUNCERTAINTY'
      Required = True
    end
  end
  object dsqPRep1: TDataSource
    DataSet = qPRep1
    Left = 980
    Top = 60
  end
  object dspPRep1: TDataSetProvider
    DataSet = qPRep1
    Left = 1008
    Top = 60
  end
  object cdsPRep1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPRep1'
    Left = 1036
    Top = 60
    object cdsPRep1PERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPRep1PERIODNAME: TStringField
      FieldName = 'PERIODNAME'
      Required = True
      Size = 30
    end
    object cdsPRep1CPARENTID: TIntegerField
      FieldName = 'CPARENTID'
      Required = True
    end
    object cdsPRep1PERIODRANKID: TStringField
      FieldName = 'PERIODRANKID'
      Required = True
      Size = 4
    end
    object cdsPRep1MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsPRep1MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsPRep1PERIODRANK: TStringField
      FieldName = 'PERIODRANK'
      Required = True
    end
    object cdsPRep1qPRep2: TDataSetField
      FieldName = 'qPRep2'
    end
    object cdsPRep1MINAGEUNCERTAINTY: TFloatField
      FieldName = 'MINAGEUNCERTAINTY'
      Required = True
    end
    object cdsPRep1MAXAGEUNCERTAINTY: TFloatField
      FieldName = 'MAXAGEUNCERTAINTY'
      Required = True
    end
  end
  object dsPRep11: TDataSource
    DataSet = cdsPRep1
    Left = 1064
    Top = 60
  end
  object qPRep2: TSQLQuery
    DataSource = dsqPRep1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PERIODID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT PERIODS.PERIODID, '
      '  PERIODS.PERIODNAME, PERIODS.CPARENTID,'
      '  PERIODS.PERIODRANKID,  '
      '  PERIODS.MINAGE,  PERIODS.MAXAGE,'
      '  PERIODS.MINAGEUNCERTAINTY, PERIODS.MAXAGEUNCERTAINTY,'
      '  PERIODRANKS.PERIODRANK'
      'from PERIODS, PERIODRANKS'
      'where PERIODS.PERIODRANKID=PERIODRANKS.PERIODRANKID'
      'and PERIODS.CPARENTID=:PeriodID'
      'ORDER BY PERIODS.MINAGE, PERIODS.MAXAGE')
    SQLConnection = sqlcStrat
    Left = 952
    Top = 104
    object qPRep2PERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPRep2PERIODNAME: TStringField
      FieldName = 'PERIODNAME'
      Required = True
      Size = 30
    end
    object qPRep2CPARENTID: TIntegerField
      FieldName = 'CPARENTID'
      Required = True
    end
    object qPRep2PERIODRANKID: TStringField
      FieldName = 'PERIODRANKID'
      Required = True
      Size = 4
    end
    object qPRep2MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qPRep2MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qPRep2PERIODRANK: TStringField
      FieldName = 'PERIODRANK'
      Required = True
    end
    object qPRep2MINAGEUNCERTAINTY: TFloatField
      FieldName = 'MINAGEUNCERTAINTY'
      Required = True
    end
    object qPRep2MAXAGEUNCERTAINTY: TFloatField
      FieldName = 'MAXAGEUNCERTAINTY'
      Required = True
    end
  end
  object dsqPRep2: TDataSource
    DataSet = qPRep2
    Left = 980
    Top = 104
  end
  object cdsPRep2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPRep1qPRep2
    Params = <>
    Left = 1008
    Top = 104
    object cdsPRep2PERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPRep2PERIODNAME: TStringField
      FieldName = 'PERIODNAME'
      Required = True
      Size = 30
    end
    object cdsPRep2CPARENTID: TIntegerField
      FieldName = 'CPARENTID'
      Required = True
    end
    object cdsPRep2PERIODRANKID: TStringField
      FieldName = 'PERIODRANKID'
      Required = True
      Size = 4
    end
    object cdsPRep2MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsPRep2MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsPRep2PERIODRANK: TStringField
      FieldName = 'PERIODRANK'
      Required = True
    end
    object cdsPRep2qPRep3: TDataSetField
      FieldName = 'qPRep3'
    end
    object cdsPRep2MINAGEUNCERTAINTY: TFloatField
      FieldName = 'MINAGEUNCERTAINTY'
      Required = True
    end
    object cdsPRep2MAXAGEUNCERTAINTY: TFloatField
      FieldName = 'MAXAGEUNCERTAINTY'
      Required = True
    end
  end
  object dsPRep2: TDataSource
    DataSet = cdsPRep2
    Left = 1036
    Top = 104
  end
  object qPRep3: TSQLQuery
    DataSource = dsqPRep2
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PERIODID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT PERIODS.PERIODID, '
      '  PERIODS.PERIODNAME, PERIODS.CPARENTID,'
      '  PERIODS.PERIODRANKID,  '
      '  PERIODS.MINAGE,  PERIODS.MAXAGE,'
      '  PERIODS.MINAGEUNCERTAINTY, PERIODS.MAXAGEUNCERTAINTY,'
      '  PERIODRANKS.PERIODRANK'
      'from PERIODS, PERIODRANKS'
      'where PERIODS.PERIODRANKID=PERIODRANKS.PERIODRANKID'
      'and PERIODS.CPARENTID=:PeriodID'
      'ORDER BY PERIODS.MINAGE, PERIODS.MAXAGE')
    SQLConnection = sqlcStrat
    Left = 952
    Top = 148
    object qPRep3PERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPRep3PERIODNAME: TStringField
      FieldName = 'PERIODNAME'
      Required = True
      Size = 30
    end
    object qPRep3CPARENTID: TIntegerField
      FieldName = 'CPARENTID'
      Required = True
    end
    object qPRep3PERIODRANKID: TStringField
      FieldName = 'PERIODRANKID'
      Required = True
      Size = 4
    end
    object qPRep3MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qPRep3MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qPRep3PERIODRANK: TStringField
      FieldName = 'PERIODRANK'
      Required = True
    end
    object qPRep3MINAGEUNCERTAINTY: TFloatField
      FieldName = 'MINAGEUNCERTAINTY'
      Required = True
    end
    object qPRep3MAXAGEUNCERTAINTY: TFloatField
      FieldName = 'MAXAGEUNCERTAINTY'
      Required = True
    end
  end
  object dsqPRep3: TDataSource
    DataSet = qPRep3
    Left = 980
    Top = 148
  end
  object cdsPRep3: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPRep2qPRep3
    Params = <>
    Left = 1008
    Top = 148
    object cdsPRep3PERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPRep3PERIODNAME: TStringField
      FieldName = 'PERIODNAME'
      Required = True
      Size = 30
    end
    object cdsPRep3CPARENTID: TIntegerField
      FieldName = 'CPARENTID'
      Required = True
    end
    object cdsPRep3PERIODRANKID: TStringField
      FieldName = 'PERIODRANKID'
      Required = True
      Size = 4
    end
    object cdsPRep3MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsPRep3MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsPRep3PERIODRANK: TStringField
      FieldName = 'PERIODRANK'
      Required = True
    end
    object cdsPRep3qPRep4: TDataSetField
      FieldName = 'qPRep4'
    end
    object cdsPRep3MINAGEUNCERTAINTY: TFloatField
      FieldName = 'MINAGEUNCERTAINTY'
      Required = True
    end
    object cdsPRep3MAXAGEUNCERTAINTY: TFloatField
      FieldName = 'MAXAGEUNCERTAINTY'
      Required = True
    end
  end
  object dsPRep3: TDataSource
    DataSet = cdsPRep3
    Left = 1036
    Top = 148
  end
  object qPRep4: TSQLQuery
    DataSource = dsqPRep3
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PERIODID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT PERIODS.PERIODID, '
      '  PERIODS.PERIODNAME, PERIODS.CPARENTID,'
      '  PERIODS.PERIODRANKID,  '
      '  PERIODS.MINAGE,  PERIODS.MAXAGE,'
      '  PERIODS.MINAGEUNCERTAINTY, PERIODS.MAXAGEUNCERTAINTY,'
      '  PERIODRANKS.PERIODRANK'
      'from PERIODS, PERIODRANKS'
      'where PERIODS.PERIODRANKID=PERIODRANKS.PERIODRANKID'
      'and PERIODS.CPARENTID=:PeriodID'
      'ORDER BY PERIODS.MINAGE, PERIODS.MAXAGE')
    SQLConnection = sqlcStrat
    Left = 952
    Top = 192
    object qPRep4PERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPRep4PERIODNAME: TStringField
      FieldName = 'PERIODNAME'
      Required = True
      Size = 30
    end
    object qPRep4CPARENTID: TIntegerField
      FieldName = 'CPARENTID'
      Required = True
    end
    object qPRep4PERIODRANKID: TStringField
      FieldName = 'PERIODRANKID'
      Required = True
      Size = 4
    end
    object qPRep4MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qPRep4MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qPRep4PERIODRANK: TStringField
      FieldName = 'PERIODRANK'
      Required = True
    end
    object qPRep4MINAGEUNCERTAINTY: TFloatField
      FieldName = 'MINAGEUNCERTAINTY'
      Required = True
    end
    object qPRep4MAXAGEUNCERTAINTY: TFloatField
      FieldName = 'MAXAGEUNCERTAINTY'
      Required = True
    end
  end
  object dsqPRep4: TDataSource
    DataSet = qPRep4
    Left = 980
    Top = 192
  end
  object cdsPRep4: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPRep3qPRep4
    Params = <>
    Left = 1008
    Top = 192
    object cdsPRep4PERIODID: TIntegerField
      FieldName = 'PERIODID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPRep4PERIODNAME: TStringField
      FieldName = 'PERIODNAME'
      Required = True
      Size = 30
    end
    object cdsPRep4CPARENTID: TIntegerField
      FieldName = 'CPARENTID'
      Required = True
    end
    object cdsPRep4PERIODRANKID: TStringField
      FieldName = 'PERIODRANKID'
      Required = True
      Size = 4
    end
    object cdsPRep4MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsPRep4MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsPRep4PERIODRANK: TStringField
      FieldName = 'PERIODRANK'
      Required = True
    end
    object cdsPRep4MINAGEUNCERTAINTY: TFloatField
      FieldName = 'MINAGEUNCERTAINTY'
      Required = True
    end
    object cdsPRep4MAXAGEUNCERTAINTY: TFloatField
      FieldName = 'MAXAGEUNCERTAINTY'
      Required = True
    end
  end
  object dsPRep4: TDataSource
    DataSet = cdsPRep4
    Left = 1036
    Top = 192
  end
  object qRanks: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from RANKS'
      'ORDER by RANKS.UNITRANK')
    SQLConnection = sqlcStrat
    Left = 560
    Top = 4
  end
  object dspRanks: TDataSetProvider
    DataSet = qRanks
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 588
    Top = 4
  end
  object cdsRanks: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRanks'
    Left = 616
    Top = 4
    object cdsRanksRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsRanksUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsRanksRANKWIDTH: TSmallintField
      FieldName = 'RANKWIDTH'
    end
  end
  object dsRanks: TDataSource
    DataSet = cdsRanks
    Left = 644
    Top = 4
  end
  object qAgeConstraints: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * from CONSTRAINTS')
    SQLConnection = sqlcStrat
    Left = 562
    Top = 46
  end
  object dspAgeConstraints: TDataSetProvider
    DataSet = qAgeConstraints
    Left = 592
    Top = 48
  end
  object cdsAgeConstraints: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgeConstraints'
    Left = 620
    Top = 48
    object cdsAgeConstraintsAGECONSTRAINTLEVELID: TSmallintField
      FieldName = 'AGECONSTRAINTLEVELID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAgeConstraintsAGECONSTRAINTLEVEL: TStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      Size = 105
    end
  end
  object dsAgeConstraints: TDataSource
    DataSet = cdsAgeConstraints
    Left = 648
    Top = 48
  end
  object qStatus: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * from APPROVALSTATUS')
    SQLConnection = sqlcStrat
    Left = 562
    Top = 90
  end
  object dspStatus: TDataSetProvider
    DataSet = qStatus
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 592
    Top = 92
  end
  object cdsStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStatus'
    Left = 620
    Top = 92
    object cdsStatusAPPROVALID: TStringField
      FieldName = 'APPROVALID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsStatusAPPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
  end
  object dsStatus: TDataSource
    DataSet = cdsStatus
    Left = 648
    Top = 92
  end
  object qUnitFeature: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UNITID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT UNITFEATURES.UNITID,UNITFEATURES.SPECIALFEATUREID,'
      '  SPECIALFEATURES.SPECIALFEATURE'
      'FROM UNITFEATURES,SPECIALFEATURES'
      'WHERE UNITFEATURES.UNITID = :UnitID'
      
        'AND UNITFEATURES.SPECIALFEATUREID=SPECIALFEATURES.SPECIALFEATURE' +
        'ID')
    SQLConnection = sqlcStrat
    Left = 568
    Top = 496
    object qUnitFeatureUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitFeatureSPECIALFEATUREID: TIntegerField
      FieldName = 'SPECIALFEATUREID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitFeatureSPECIALFEATURE: TStringField
      FieldName = 'SPECIALFEATURE'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
  end
  object cdsUnitFeature: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqUnitFeature
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 592
    Top = 496
    object cdsUnitFeatureUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitFeatureSPECIALFEATUREID: TIntegerField
      FieldName = 'SPECIALFEATUREID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitFeatureSPECIALFEATURE: TStringField
      FieldName = 'SPECIALFEATURE'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
  end
  object dsUnitFeature: TDataSource
    DataSet = cdsUnitFeature
    Left = 620
    Top = 496
  end
  object qDomainDeposits: TSQLQuery
    DataSource = dsqDomainQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT DOMAINDEPOSITS.DOMAINID, '
      '  DOMAINDEPOSITS.SBDEPOSITID,'
      '  DEPOSITS.DEPOSITCLANID, '
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  DEPOSITS.DEPOSITNAME,'
      '  DEPOSITCLANS.DEPOSITCLAN'
      'from DOMAINDEPOSITS, DEPOSITS, '
      '  DEPOSITCLANS'
      'where DOMAINDEPOSITS.DOMAINID = :DomainID'
      'and DOMAINDEPOSITS.SBDEPOSITID=DEPOSITS.SDBDEPOSITID'
      'and DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      'order by  DEPOSITS.DEPOSITCLANID,'
      '  DEPOSITS.DEPOSITNAME')
    SQLConnection = sqlcStrat
    Left = 180
    Top = 386
    object qDomainDepositsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainDepositsSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainDepositsDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDomainDepositsAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDomainDepositsAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDomainDepositsDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qDomainDepositsDEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
  end
  object cdsDomainDeposits: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainQqDomainDeposits
    Params = <>
    Left = 208
    Top = 386
    object cdsDomainDepositsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainDepositsSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainDepositsDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      ProviderFlags = []
      Required = True
    end
    object cdsDomainDepositsAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      ProviderFlags = []
      DisplayFormat = '###0.00'
    end
    object cdsDomainDepositsAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      ProviderFlags = []
      DisplayFormat = '###0.00'
    end
    object cdsDomainDepositsDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      ProviderFlags = []
      Required = True
      Size = 150
    end
    object cdsDomainDepositsDEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
  end
  object dsDomainDeposits: TDataSource
    DataSet = cdsDomainDeposits
    Left = 236
    Top = 386
  end
  object qDomainTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DOMAINTYPES')
    SQLConnection = sqlcStrat
    Left = 144
    Top = 280
  end
  object dspDomainTypes: TDataSetProvider
    DataSet = qDomainTypes
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 170
    Top = 280
  end
  object cdsDomainTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainTypes'
    Left = 198
    Top = 280
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
    DataSet = cdsDomainTypes
    Left = 226
    Top = 280
  end
  object qDeleteSynonymLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SynonymID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from SYNONYMS'
      'where SYNONYMS.UNITID = :UnitID'
      'and SYNONYMS.SYNONYMID = :SynonymID'
      '')
    SQLConnection = sqlcStrat
    Left = 724
    Top = 504
  end
  object qDeleteCorrelativeLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CORRELATIVEID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from CORRELATIVES'
      'where CORRELATIVES.UNITID = :UnitID'
      'and CORRELATIVES.CORRELATIVEID = :CORRELATIVEID'
      '')
    SQLConnection = sqlcStrat
    Left = 776
    Top = 504
  end
  object qDeleteFeatureLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SpecialFeatureID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from UNITFEATURE'
      'where UNITFEATURE.UNITID = :UnitID'
      'and  UNITFEATURE.SPECIALFEATUREID = :SpecialFeatureID'
      '')
    SQLConnection = sqlcStrat
    Left = 836
    Top = 504
  end
  object qDeleteSucceedingLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SucceededBy'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from SUCCEEDING'
      'where SUCCEEDING.UNITID = :UnitID'
      'and SUCCEEDING.SUCCEEDEDBY = :SucceededBy'
      '')
    SQLConnection = sqlcStrat
    Left = 892
    Top = 504
  end
  object qDeletePrecedingLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PrecededBy'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from PRECEDING'
      'where PRECEDING.UNITID = :UnitID'
      'and PRECEDING.PRECEDEDBY = :PrecededBy'
      '')
    SQLConnection = sqlcStrat
    Left = 948
    Top = 504
  end
  object qDeleteSpecialFeatureLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SpecialFeatureID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from UNITFEATURES'
      'where UNITFEATURES.UNITID = :UnitID'
      'and UNITFEATURES.SPECIALFEATUREID = :SpecialFeatureID'
      '')
    SQLConnection = sqlcStrat
    Left = 1004
    Top = 504
  end
  object qInsertLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO STRATDOMAIN'
      '(UnitID, DomainIDID)'
      'Values (:UnitID, :DomainID)')
    SQLConnection = sqlcStrat
    Left = 872
    Top = 452
  end
  object qSpecialFeatures: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT SPECIALFEATURES.SPECIALFEATUREID,'
      '  SPECIALFEATURES.SPECIALFEATURE,'
      '  SPECIALFEATURES.LEGENDORDER'
      'FROM SPECIALFEATURES'
      '')
    SQLConnection = sqlcStrat
    Left = 152
    Top = 528
  end
  object dspSpecialFeatures: TDataSetProvider
    DataSet = qSpecialFeatures
    Options = [poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 180
    Top = 528
  end
  object cdsSpecialFeatures: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSpecialFeatures'
    Left = 208
    Top = 528
    object cdsSpecialFeaturesSPECIALFEATUREID: TIntegerField
      FieldName = 'SPECIALFEATUREID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSpecialFeaturesSPECIALFEATURE: TStringField
      FieldName = 'SPECIALFEATURE'
      Required = True
      Size = 50
    end
    object cdsSpecialFeaturesLEGENDORDER: TSmallintField
      FieldName = 'LEGENDORDER'
      Required = True
    end
  end
  object dsSpecialFeatures: TDataSource
    DataSet = cdsSpecialFeatures
    Left = 236
    Top = 528
  end
  object qWhoFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT FORLIST.WHOFORID,FORLIST.WHOFOR,FORLIST.OWNER'
      'FROM FORLIST, USERSWHOFOR'
      'WHERE FORLIST.WHOFORID=USERSWHOFOR.WHOFORID'
      'AND USERSWHOFOR.USERID=:UserID'
      'ORDER BY FORLIST.WHOFOR'
      '')
    SQLConnection = sqlcStrat
    Left = 304
    Top = 499
  end
  object dspWhoFor: TDataSetProvider
    DataSet = qWhoFor
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 332
    Top = 499
  end
  object cdsWhoFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWhoFor'
    Left = 358
    Top = 499
    object cdsWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      Required = True
      Size = 50
    end
    object cdsWhoForOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
    end
  end
  object dsWhoFor: TDataSource
    DataSet = cdsWhoFor
    Left = 386
    Top = 499
  end
  object qUsersWhoFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT USERSWHOFOR.USERID, USERSWHOFOR.WHOFORID, '
      '  FORLIST.WHOFOR,FORLIST.OWNER'
      'from USERSWHOFOR, FORLIST'
      'where USERSWHOFOR.WHOFORID = FORLIST.WHOFORID'
      'and USERSWHOFOR.USERID=:UserID'
      'order by FORLIST.WHOFOR')
    SQLConnection = sqlcStrat
    Left = 300
    Top = 546
    object qUsersWhoForUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUsersWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qUsersWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      Size = 50
    end
    object qUsersWhoForOWNER: TStringField
      FieldName = 'OWNER'
      ProviderFlags = []
    end
  end
  object dspUsersWhoFor: TDataSetProvider
    DataSet = qUsersWhoFor
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 328
    Top = 546
  end
  object cdsUsersWhoFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsersWhoFor'
    Left = 356
    Top = 546
    object cdsUsersWhoForUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUsersWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object cdsUsersWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsUsersWhoForOWNER: TStringField
      FieldName = 'OWNER'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsUsersWhoFor: TDataSource
    DataSet = cdsUsersWhoFor
    Left = 384
    Top = 546
  end
  object qInsertNew: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO STRATDOMAIN'
      '(UnitID, DomainIDID)'
      'Values (:UnitID, :DomainID)')
    SQLConnection = sqlcStrat
    Left = 860
    Top = 412
  end
  object qMaxID: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CountryID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT MAX(STRATUNITS.UNITID)'
      'FROM STRATUNITS'
      'WHERE STRATUNITS.COUNTRYID = :CountryID')
    SQLConnection = sqlcStrat
    Left = 736
    Top = 360
  end
  object qCountryDefault: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CountryID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNTRIES.STARTINGVALUE, COUNTRIES.COUNTRYHASRECORDS,'
      'COUNTRIES.COUNTRYID'
      'FROM COUNTRIES'
      'WHERE COUNTRIES.COUNTRYID = :CountryID')
    SQLConnection = sqlcStrat
    Left = 852
    Top = 360
  end
  object dspMaxID: TDataSetProvider
    DataSet = qMaxID
    Left = 764
    Top = 360
  end
  object cdsMaxID: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaxID'
    Left = 792
    Top = 360
    object cdsMaxIDMAX: TIntegerField
      FieldName = 'MAX'
      ReadOnly = True
    end
  end
  object dsMaxID: TDataSource
    DataSet = cdsMaxID
    Left = 820
    Top = 360
  end
  object dspCountryDefault: TDataSetProvider
    DataSet = qCountryDefault
    Left = 880
    Top = 360
  end
  object cdsCountryDefault: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountryDefault'
    Left = 908
    Top = 360
    object cdsCountryDefaultSTARTINGVALUE: TIntegerField
      FieldName = 'STARTINGVALUE'
    end
    object cdsCountryDefaultCOUNTRYHASRECORDS: TStringField
      FieldName = 'COUNTRYHASRECORDS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCountryDefaultCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
  end
  object dsCountryDefault: TDataSource
    DataSet = cdsCountryDefault
    Left = 936
    Top = 360
  end
  object qDepositTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITTYPES'
      '')
    SQLConnection = sqlcStrat
    Left = 156
    Top = 488
  end
  object dspDepsoitTypes: TDataSetProvider
    DataSet = qDepositTypes
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 186
    Top = 488
  end
  object cdsDepositTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepsoitTypes'
    Left = 214
    Top = 488
    object cdsDepositTypesDEPOSITTYPEID: TStringField
      FieldName = 'DEPOSITTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsDepositTypesDEPOSITTYPE: TStringField
      FieldName = 'DEPOSITTYPE'
      Required = True
      Size = 90
    end
  end
  object dsDepositTypes: TDataSource
    DataSet = cdsDepositTypes
    Left = 242
    Top = 488
  end
  object qMetamorphicGrades: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM METAMORPHICGRADE'
      'ORDER BY METAMORPHICGRADE.GRADEID')
    SQLConnection = sqlcStrat
    Left = 468
    Top = 548
  end
  object dspMetamorphicGrades: TDataSetProvider
    DataSet = qMetamorphicGrades
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 498
    Top = 548
  end
  object cdsMetamorphicGrades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMetamorphicGrades'
    Left = 526
    Top = 548
    object cdsMetamorphicGradesGRADEID: TStringField
      FieldName = 'GRADEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsMetamorphicGradesGRADE: TStringField
      FieldName = 'GRADE'
      Required = True
      Size = 30
    end
  end
  object dsMetamorphicGrades: TDataSource
    DataSet = cdsMetamorphicGrades
    Left = 554
    Top = 548
  end
  object qOrogenies: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM OROGENIES'
      '')
    SQLConnection = sqlcStrat
    Left = 596
    Top = 548
  end
  object dspOrogenies: TDataSetProvider
    DataSet = qOrogenies
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 622
    Top = 548
  end
  object cdsOrogenies: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrogenies'
    Left = 654
    Top = 548
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
    DataSet = cdsOrogenies
    Left = 682
    Top = 548
  end
  object qDuctilities: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DUCTILITIES'
      '')
    SQLConnection = sqlcStrat
    Left = 140
    Top = 239
  end
  object dspDuctilities: TDataSetProvider
    DataSet = qDuctilities
    Left = 170
    Top = 240
  end
  object cdsDuctilities: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDuctilities'
    Left = 198
    Top = 240
    object cdsDuctilitiesDUCTILITYTYPEID: TStringField
      FieldName = 'DUCTILITYTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDuctilitiesDUCTILITYTYPE: TStringField
      FieldName = 'DUCTILITYTYPE'
      Size = 60
    end
  end
  object dsDuctilities: TDataSource
    DataSet = cdsDuctilities
    Left = 226
    Top = 238
  end
  object qOrogenyTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from DEFORMATIONTYPES'
      'order by DEFORMATIONTYPES.DEFORMATIONTYPEID'
      '')
    SQLConnection = sqlcStrat
    Left = 416
    Top = 451
  end
  object dspOrogenyTypes: TDataSetProvider
    DataSet = qOrogenyTypes
    Left = 446
    Top = 452
  end
  object cdsOrogenyTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrogenyTypes'
    Left = 474
    Top = 452
    object cdsOrogenyTypesDEFORMATIONTYPEID: TIntegerField
      FieldName = 'DEFORMATIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrogenyTypesDEFORMATIONTYPE: TStringField
      FieldName = 'DEFORMATIONTYPE'
      Required = True
      Size = 150
    end
  end
  object dsOrogenyTypes: TDataSource
    DataSet = cdsOrogenyTypes
    Left = 502
    Top = 450
  end
  object qDeposits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITS'
      'order by DEPOSITS.DEPOSITNAME')
    SQLConnection = sqlcStrat
    Left = 428
    Top = 504
  end
  object dspDeposits: TDataSetProvider
    DataSet = qDeposits
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 458
    Top = 504
  end
  object cdsDeposits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeposits'
    Left = 486
    Top = 504
    object cdsDepositsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositsDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object cdsDepositsDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object cdsDepositsDATABASEID: TIntegerField
      FieldName = 'DATABASEID'
      Required = True
    end
    object cdsDepositsDEPOSITIDINT: TIntegerField
      FieldName = 'DEPOSITIDINT'
      Required = True
    end
    object cdsDepositsDEPOSITIDSTR: TStringField
      FieldName = 'DEPOSITIDSTR'
      Required = True
      Size = 30
    end
    object cdsDepositsDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
    object cdsDepositsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepositsDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
  end
  object dsDeposits: TDataSource
    DataSet = cdsDeposits
    Left = 514
    Top = 504
  end
  object qDirections: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT  * FROM DIRECTIONS'
      'WHERE DIRECTIONS.DIRECTIONNAME <> '#39'nd'#39
      'ORDER BY DIRECTIONANGLE')
    SQLConnection = sqlcStrat
    Left = 24
    Top = 576
  end
  object dspDirections: TDataSetProvider
    DataSet = qDirections
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 54
    Top = 576
  end
  object cdsDirections: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDirections'
    Left = 82
    Top = 576
    object cdsDirectionsDIRECTIONANGLE: TIntegerField
      FieldName = 'DIRECTIONANGLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDirectionsDIRECTIONNAME: TStringField
      FieldName = 'DIRECTIONNAME'
      Required = True
    end
    object cdsDirectionsSOURCEFROMNAME: TStringField
      FieldName = 'SOURCEFROMNAME'
      Required = True
    end
  end
  object dsDirections: TDataSource
    DataSet = cdsDirections
    Left = 110
    Top = 576
  end
  object qStratRel: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'RelPosID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM STRATREL'
      'WHERE STRATREL.RELPOSID=:RelPosID')
    SQLConnection = sqlcStrat
    Left = 736
    Top = 548
  end
  object dspStratRel: TDataSetProvider
    DataSet = qStratRel
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 766
    Top = 548
  end
  object cdsStratRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStratRel'
    Left = 794
    Top = 548
    object cdsStratRelRELATIONSHIPID: TStringField
      FieldName = 'RELATIONSHIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsStratRelRELPOSID: TStringField
      FieldName = 'RELPOSID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsStratRelRELATIONSHIP: TStringField
      FieldName = 'RELATIONSHIP'
      Required = True
      Size = 90
    end
    object cdsStratRelRELATIONSHIPREVID: TStringField
      FieldName = 'RELATIONSHIPREVID'
      Required = True
      Size = 5
    end
  end
  object dsStratRel: TDataSource
    DataSet = cdsStratRel
    Left = 822
    Top = 548
  end
  object qUnitCurrent: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT STRATCURRENT.UNITID, STRATCURRENT.CURRENTDIRECTION'
      'FROM STRATCURRENT'
      'WHERE STRATCURRENT.UNITID=:UnitID')
    SQLConnection = sqlcStrat
    Left = 660
    Top = 224
    object qUnitCurrentUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitCurrentCURRENTDIRECTION: TIntegerField
      FieldName = 'CURRENTDIRECTION'
      Required = True
    end
  end
  object cdsUnitCurrent: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqUnitCurrent
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 688
    Top = 224
    object cdsUnitCurrentUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitCurrentCURRENTDIRECTION: TIntegerField
      FieldName = 'CURRENTDIRECTION'
      Required = True
    end
  end
  object dsUnitCurrent: TDataSource
    DataSet = cdsUnitCurrent
    Left = 716
    Top = 224
  end
  object qUnitSedEnv: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT STRATSEDENVIRONMENT.UNITID, STRATSEDENVIRONMENT.DEPOSITIO' +
        'NENVIRONMENTID'
      'FROM STRATSEDENVIRONMENT'
      'WHERE STRATSEDENVIRONMENT.UNITID=:UnitID')
    SQLConnection = sqlcStrat
    Left = 660
    Top = 268
    object qUnitSedEnvUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitSedEnvDEPOSITIONENVIRONMENTID: TStringField
      FieldName = 'DEPOSITIONENVIRONMENTID'
      Required = True
      Size = 1
    end
  end
  object cdsUnitSedEnv: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqUnitSedEnv
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 688
    Top = 268
    object cdsUnitSedEnvUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitSedEnvDEPOSITIONENVIRONMENTID: TStringField
      FieldName = 'DEPOSITIONENVIRONMENTID'
      Required = True
      Size = 1
    end
  end
  object dsUnitSedEnv: TDataSource
    DataSet = cdsUnitSedEnv
    Left = 716
    Top = 268
  end
  object qSedEnvironments: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITIONNVIRONMENT'
      'ORDER BY DEPOSITIONNVIRONMENT.DISPLAYORDER')
    SQLConnection = sqlcStrat
    Left = 884
    Top = 548
  end
  object dspSedEnvironments: TDataSetProvider
    DataSet = qSedEnvironments
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 914
    Top = 548
  end
  object cdsSedEnvironments: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSedEnvironments'
    Left = 942
    Top = 548
    object cdsSedEnvironmentsDEPOSITIONENVIRONMENTID: TStringField
      FieldName = 'DEPOSITIONENVIRONMENTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object cdsSedEnvironmentsDEPOSITIONENVIRONMENT: TStringField
      FieldName = 'DEPOSITIONENVIRONMENT'
    end
  end
  object dsSedEnvironments: TDataSource
    DataSet = cdsSedEnvironments
    Left = 970
    Top = 548
  end
  object sqlcStrat: TSQLConnection
    ConnectionName = 'StratDB_bromo2'
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=c:\exe32\fbclient.dll'
      'DataBase=bromo2.usask.ca:s:\data\firebird\stratdb2021v30.fdb'
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
      'DriverUnit=DbxDevartInterBase'
      'OptimizedNumerics=false'
      'CharLength=0')
    Left = 24
    Top = 8
  end
  object qRefFull: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SourceNum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from SOURCELIST'
      'where SOURCELIST.SourceNum=:SourceNum')
    SQLConnection = sqlcStrat
    Left = 776
    Top = 212
    object IntegerField1: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
    object IntegerField2: TSmallintField
      FieldName = 'SOURCEYEAR'
      Required = True
      EditFormat = '####'
    end
    object MemoField1: TMemoField
      FieldName = 'SOURCEDESCRIPTION'
      BlobType = ftMemo
      Size = -1
    end
    object StringField2: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object StringField3: TStringField
      FieldName = 'DOI'
      Size = 100
    end
    object qRefFullWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
  end
  object qRefNew: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select SOURCELISTB.SOURCEID, SOURCELISTB.CONTINENTID'
      'from SOURCELISTB')
    SQLConnection = sqlcStrat
    Left = 920
    Top = 291
    object qRefNewSOURCEID: TStringField
      FieldName = 'SOURCEID'
      Required = True
      Size = 100
    end
    object qRefNewCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object qUnitFor: TSQLQuery
    DataSource = dsqUnitQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT UNITFOR.UNITID, UNITFOR.WHOFORID, FORLIST.WHOFOR'
      'FROM UNITFOR, FORLIST'
      'WHERE UNITFOR.UNITID=:UnitID'
      'AND UNITFOR.WHOFORID=FORLIST.WHOFORID')
    SQLConnection = sqlcStrat
    Left = 656
    Top = 312
    object qUnitForUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qUnitForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object cdsUnitFor: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUnitQqUnitFor
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 684
    Top = 312
    object cdsUnitForUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsUnitForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsUnitFor: TDataSource
    DataSet = cdsUnitFor
    Left = 712
    Top = 312
  end
  object qUserUnitAccess: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select UNITFOR.UNITID'
      'from UNITFOR,USERSWHOFOR'
      'where UNITFOR.UNITID = :UnitID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      '')
    SQLConnection = sqlcStrat
    Left = 956
    Top = 242
  end
  object dspUserUnitAccess: TDataSetProvider
    DataSet = qUserUnitAccess
    Left = 986
    Top = 242
  end
  object cdsUserUnitAccess: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserUnitAccess'
    Left = 1014
    Top = 242
    object cdsUserUnitAccessUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
  end
  object dsUserUnitAccess: TDataSource
    DataSet = cdsUserUnitAccess
    Left = 1042
    Top = 242
  end
  object qDomainFor: TSQLQuery
    DataSource = dsqDomainQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMAINFOR.DOMAINID, DOMAINFOR.WHOFORID, FORLIST.WHOFOR'
      'FROM DOMAINFOR, FORLIST'
      'WHERE DOMAINFOR.DOMAINID=:DomainID'
      'AND DOMAINFOR.WHOFORID=FORLIST.WHOFORID')
    SQLConnection = sqlcStrat
    Left = 324
    Top = 280
    object qDomainForDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qDomainForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object cdsDomainFor: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainQqDomainFor
    Params = <>
    OnReconcileError = cdsAnyReconcileError
    Left = 352
    Top = 280
    object cdsDomainForDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsDomainForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsDomainFor: TDataSource
    DataSet = cdsDomainFor
    Left = 380
    Top = 280
  end
  object qDomainLIP: TSQLQuery
    DataSource = dsqDomainQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DOMAINID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT LIPDOMAIN.DOMAINID, '
      '  LIPDOMAIN.LIPID,'
      '  LIPS.CONTINENTID, '
      '  LIPS.MINPLOTAGE,LIPS.MAXPLOTAGE,'
      '  LIPS.LIPNAME,'
      '  LIPS.CONTOCEANID,LIPS.LIPSIZEID,LIPS.LIPRATINGID,'
      '  LIPS.CONSTRAINTLEVELID,LIPS.AREALEXTENT,LIPS.VOLUMEESTIMATE,'
      '  LIPS.LIPPARENTID'
      'from LIPDOMAIN, LIPS'
      'where LIPDOMAIN.DOMAINID = :DomainID'
      'and LIPDOMAIN.LIPID=LIPS.LIPID'
      'order by  LIPDOMAIN.DOMAINID, LIPS.LIPNAME')
    SQLConnection = sqlcStrat
    Left = 176
    Top = 430
    object qDomainLIPDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainLIPLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDomainLIPCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object qDomainLIPMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object qDomainLIPMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object qDomainLIPLIPNAME: TStringField
      FieldName = 'LIPNAME'
      Required = True
      Size = 50
    end
    object qDomainLIPCONTOCEANID: TStringField
      FieldName = 'CONTOCEANID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDomainLIPLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object qDomainLIPLIPRATINGID: TStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDomainLIPCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object qDomainLIPAREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
    end
    object qDomainLIPVOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
    end
    object qDomainLIPLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
  end
  object cdsDomainLIP: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDomainQqDomainLIP
    Params = <>
    Left = 204
    Top = 430
    object cdsDomainLIPDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainLIPLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainLIPCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainLIPMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainLIPMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainLIPLIPNAME: TStringField
      FieldName = 'LIPNAME'
      Required = True
      Size = 50
    end
    object cdsDomainLIPCONTOCEANID: TStringField
      FieldName = 'CONTOCEANID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainLIPLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsDomainLIPLIPRATINGID: TStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainLIPCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsDomainLIPAREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
    end
    object cdsDomainLIPVOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
      DisplayFormat = '#####0.0'
    end
    object cdsDomainLIPLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
  end
  object dsDomainLIP: TDataSource
    DataSet = cdsDomainLIP
    Left = 232
    Top = 430
  end
  object qCountPublished: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(UNITFOR.WHOFORID)'
      'FROM UNITFOR'
      'WHERE UNITFOR.UNITID = :ID'
      'AND UNITFOR.WHOFORID='#39'PUBL'#39)
    SQLConnection = sqlcStrat
    Left = 1024
    Top = 548
  end
  object dspCountPublished: TDataSetProvider
    DataSet = qCountPublished
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 1052
    Top = 548
  end
  object cdsCountPublished: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountPublished'
    Left = 1080
    Top = 548
    object cdsCountPublishedCOUNT: TFMTBCDField
      FieldName = 'COUNT'
      Precision = 20
      Size = 0
    end
  end
  object dsCountPublished: TDataSource
    DataSet = cdsCountPublished
    Left = 1108
    Top = 548
  end
  object qInsertOrogeny: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'OrogenyID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Orogeny'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ContinentID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO OROGENIES'
      '(OrogenyID, Orogeny, ContinentID)'
      'Values (:OrogenyID, :Orogeny,  :ContinentID)')
    SQLConnection = sqlcStrat
    Left = 344
    Top = 604
  end
  object Query1Rec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT STRATUNITS.UNITID, STRATUNITS.COUNTRYID,'
      '  STRATUNITS.UNITNAME,  STRATUNITS.PARENTID,'
      '  STRATUNITS.UNITRANK,  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,  STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK, COUNTRIES.COUNTRY'
      'FROM STRATUNITS, COUNTRIES, RANKS,UNITFOR,USERSWHOFOR'
      'WHERE STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND STRATUNITS.RANKID=RANKS.RANKID')
    SQLConnection = sqlcStrat
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
  object qUserUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT USERUNITS.USERID,USERUNITS.UNITID,'
      '  USERUNITS.UNITAGE, USERUNITS.DVUNITID,'
      '  USERUNITS.STRATDBUNITNAME,USERUNITS.STRATDBUNITRANK,'
      '  USERUNITS.COUNTRYID'
      'FROM USERUNITS'
      'WHERE USERUNITS.USERID = :UserID'
      'ORDER BY USERUNITS.COUNTRYID,USERUNITS.STRATDBUNITNAME')
    SQLConnection = sqlcStrat
    Left = 584
    Top = 600
    object qUserUnitsUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUserUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUserUnitsUNITAGE: TFloatField
      FieldName = 'UNITAGE'
      Required = True
    end
    object qUserUnitsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object qUserUnitsDVUNITID: TIntegerField
      FieldName = 'DVUNITID'
      Required = True
    end
    object qUserUnitsSTRATDBUNITNAME: TStringField
      FieldName = 'STRATDBUNITNAME'
      Required = True
      Size = 50
    end
    object qUserUnitsSTRATDBUNITRANK: TStringField
      FieldName = 'STRATDBUNITRANK'
      Required = True
    end
  end
  object qInsertUserUnits: TSQLQuery
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
        DataType = ftFloat
        Name = 'UnitAge'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO USERUNITS'
      '(UserID,UnitID,UnitAge)'
      'Values (:UserID, :UnitID,  :UnitAge)')
    SQLConnection = sqlcStrat
    Left = 432
    Top = 600
  end
  object dspUserUnits: TDataSetProvider
    DataSet = qUserUnits
    Left = 616
    Top = 600
  end
  object cdsUserUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserUnits'
    Left = 648
    Top = 600
    object cdsUserUnitsUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserUnitsUNITAGE: TFloatField
      FieldName = 'UNITAGE'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsUserUnitsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsUserUnitsDVUNITID: TIntegerField
      FieldName = 'DVUNITID'
      Required = True
    end
    object cdsUserUnitsSTRATDBUNITNAME: TStringField
      FieldName = 'STRATDBUNITNAME'
      Required = True
      Size = 50
    end
    object cdsUserUnitsSTRATDBUNITRANK: TStringField
      FieldName = 'STRATDBUNITRANK'
      Required = True
    end
  end
  object dsUserUnits: TDataSource
    DataSet = cdsUserUnits
    Left = 680
    Top = 600
  end
  object qDeleteAny: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from USERUNITS'
      'where USERUNITS.USERID = :UserID')
    SQLConnection = sqlcStrat
    Left = 488
    Top = 600
  end
  object qUnitRanks: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT RANKS.RANKID, RANKS.UNITRANK '
      'FROM RANKS')
    SQLConnection = sqlcStrat
    Left = 22
    Top = 674
  end
  object dspUnitRanks: TDataSetProvider
    DataSet = qUnitRanks
    Left = 52
    Top = 676
  end
  object cdsUnitRanks: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitRanks'
    Left = 80
    Top = 676
    object cdsUnitRanksRANKID: TStringField
      FieldName = 'RANKID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsUnitRanksUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
  end
  object dsUnitRanks: TDataSource
    DataSet = cdsUnitRanks
    Left = 108
    Top = 676
  end
  object qThisUnit: TSQLQuery
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
        Name = 'ParentID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT STRATUNITS.UNITID, STRATUNITS.COUNTRYID,'
      '  STRATUNITS.UNITNAME,  STRATUNITS.PARENTID,'
      '  STRATUNITS.RANKID,  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,  STRATUNITS.MAXAGE,'
      '  STRATUNITS.AGEUNITS,'
      '  RANKS.UNITRANK'
      'from STRATUNITS, RANKS, UNITFOR,USERSWHOFOR'
      'where USERSWHOFOR.USERID = :UserID '
      'AND STRATUNITS.PARENTID = :ParentID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'and STRATUNITS.UNITID=UNITFOR.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID')
    SQLConnection = sqlcStrat
    Left = 192
    Top = 678
  end
  object dspThisUnit: TDataSetProvider
    DataSet = qThisUnit
    Exported = False
    Options = [poFetchDetailsOnDemand, poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 222
    Top = 678
  end
  object cdsThisUnit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspThisUnit'
    Left = 250
    Top = 678
    object cdsThisUnitUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsThisUnitCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsThisUnitUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsThisUnitPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsThisUnitRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsThisUnitAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
    object cdsThisUnitMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsThisUnitMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsThisUnitAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsThisUnitUNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
  end
  object dsThisUnit: TDataSource
    DataSet = cdsThisUnit
    Left = 278
    Top = 678
  end
  object qThisUnitAge: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT STRATUNITS.UNITID, STRATUNITS.COUNTRYID,'
      '  STRATUNITS.MINAGE,  STRATUNITS.MAXAGE,'
      '  STRATUNITS.AGEUNITS'
      'from STRATUNITS'
      'where STRATUNITS.UNITID = :UnitID'
      '')
    SQLConnection = sqlcStrat
    Left = 336
    Top = 670
  end
  object dspThisUnitAge: TDataSetProvider
    DataSet = qThisUnitAge
    Exported = False
    Options = [poFetchDetailsOnDemand, poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 366
    Top = 670
  end
  object cdsThisUnitAge: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspThisUnitAge'
    Left = 394
    Top = 670
    object cdsThisUnitAgeUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsThisUnitAgeCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsThisUnitAgeMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object cdsThisUnitAgeMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object cdsThisUnitAgeAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
  end
  object dsThisUnitAge: TDataSource
    DataSet = cdsThisUnitAge
    Left = 422
    Top = 670
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
      'SELECT *'
      'FROM userprojects'
      'WHERE userprojects.userid = :UserID')
    SQLConnection = sqlcStrat
    Left = 920
    Top = 600
  end
  object dspUserProjects: TDataSetProvider
    DataSet = qUserProjects
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 952
    Top = 600
  end
  object cdsUserProjects: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserProjects'
    OnReconcileError = cdsAnyReconcileError
    Left = 984
    Top = 600
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
    Left = 1016
    Top = 600
  end
  object qInsertUserProject: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'INSERT INTO USERPROJECTS'
      '(UserID,UserProjectName)'
      'Values ('#39'BruceEglington'#39','#39'New'#39')')
    SQLConnection = sqlcStrat
    Left = 920
    Top = 648
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcStrat
    Left = 56
    Top = 8
  end
end
