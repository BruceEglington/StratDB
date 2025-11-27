object dmStratD: TdmStratD
  Height = 821
  Width = 1001
  object qDeposits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITS'
      'ORDER by DEPOSITS.DEPOSITNAME')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 58
  end
  object dspDeposits: TDataSetProvider
    DataSet = qDeposits
    UpdateMode = upWhereChanged
    Left = 58
    Top = 58
  end
  object cdsDeposits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeposits'
    Left = 86
    Top = 58
    object cdsDepositsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositsDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsDepositsCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepositsDEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
  end
  object dsDeposits: TDataSource
    AutoEdit = False
    DataSet = cdsDeposits
    Left = 114
    Top = 58
  end
  object dsDeposit: TDataSource
    AutoEdit = False
    DataSet = cdsDeposit
    Left = 362
    Top = 214
  end
  object dsqDeposit: TDataSource
    AutoEdit = False
    DataSet = qDeposit
    Left = 278
    Top = 214
  end
  object qDepositDomains: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMAINDEPOSITS.SBDEPOSITID, DOMAINDEPOSITS.DOMAINID,'
      '  DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID'
      'FROM DOMAINDEPOSITS, DOMAINS'
      'WHERE DOMAINDEPOSITS.SBDEPOSITID=:SDBDepositID'
      'AND DOMAINDEPOSITS.DOMAINID=DOMAINS.DOMAINID'
      'ORDER by DOMAINDEPOSITS.DOMAINID')
    SQLConnection = sqlcStrat
    Left = 278
    Top = 262
    object qDepositDomainsSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositDomainsDOMAINNAME: TWideStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qDepositDomainsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object dsDepositDomains: TDataSource
    AutoEdit = False
    DataSet = cdsDepositDomains
    Left = 334
    Top = 262
  end
  object qDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ContinentID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DOMAINS'
      'WHERE DOMAINS.CONTINENTID=:ContinentID'
      'ORDER by DOMAINS.DOMAINNAME')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 106
  end
  object dspDomains: TDataSetProvider
    DataSet = qDomains
    UpdateMode = upWhereChanged
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
    object cdsDomainsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainsDOMAINNAME: TWideStringField
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
    object cdsDomainsDOMAINTYPEID: TWideStringField
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
  object qNewDeposit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'SDBDepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO DEPOSITS'
      '(SDBDepositID)'
      'Values (:SDBDepositID)')
    SQLConnection = sqlcStrat
    Left = 576
    Top = 56
  end
  object qClans: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITCLANS'
      'ORDER by DEPOSITCLANS.DEPOSITCLAN')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 158
  end
  object dspClans: TDataSetProvider
    DataSet = qClans
    UpdateMode = upWhereChanged
    Left = 58
    Top = 158
  end
  object cdsClans: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClans'
    Left = 86
    Top = 158
    object cdsClansDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClansDEPOSITCLAN: TWideStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 150
    end
  end
  object dsClans: TDataSource
    AutoEdit = False
    DataSet = cdsClans
    Left = 114
    Top = 158
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
      'SELECT DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.COUNTRYID,'
      '  DEPOSITS.DEPOSITNAME,  DEPOSITCLANS.DEPOSITCLAN,'
      '  DEPOSITS.DEPLONGITUDE,DEPOSITS.DEPLATITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  DATINGTYPES.DATINGTYPE, GEODYNAMICSETTINGS.GEODYNAMICSETTING,'
      '  OTHERDATABASES.DATABASENAME,DEPOSITS.DEPOSITPARENTID,'
      '  DEPOSITSTATI.DEPOSITSTATUS'
      
        'FROM DEPOSITS,DEPOSITCLANS,OTHERDATABASES,DATINGTYPES,GEODYNAMIC' +
        'SETTINGS,DEPOSITFOR,USERSWHOFOR,DEPOSITSTATI'
      'WHERE USERSWHOFOR.USERID = :UserID '
      'AND DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      'AND DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID'
      'AND DEPOSITS.DATINGTYPEID = DATINGTYPES.DATINGTYPEID'
      'AND DEPOSITS.GEODYNAMICID = GEODYNAMICSETTINGS.GEODYNAMICID '
      'AND DEPOSITS.SDBDEPOSITID = DEPOSITFOR.SDBDEPOSITID'
      'AND DEPOSITFOR.WHOFORID = USERSWHOFOR.WHOFORID'
      'AND DEPOSITS.DEPOSITSTATUSID=DEPOSITSTATI.DEPOSITSTATUSID'
      'ORDER BY DEPOSITS.COUNTRYID,DEPOSITS.DEPOSITNAME')
    SQLConnection = sqlcStrat
    Left = 402
    Top = 278
  end
  object dsqDRep1: TDataSource
    AutoEdit = False
    DataSet = qDRep1
    Left = 430
    Top = 278
  end
  object dspDRep1: TDataSetProvider
    DataSet = qDRep1
    UpdateMode = upWhereChanged
    Left = 458
    Top = 278
  end
  object cdsDRep1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDRep1'
    Left = 486
    Top = 278
    object cdsDRep1SDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDRep1COUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDRep1DEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object cdsDRep1DEPOSITCLAN: TWideStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 75
    end
    object cdsDRep1DEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDRep1DEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDRep1APPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      DisplayFormat = '###0.00'
    end
    object cdsDRep1APPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0.00'
    end
    object cdsDRep1DATABASENAME: TWideStringField
      FieldName = 'DATABASENAME'
      Required = True
      Size = 50
    end
    object cdsDRep1qDRep2: TDataSetField
      FieldName = 'qDRep2'
    end
    object cdsDRep1DATINGTYPE: TWideStringField
      FieldName = 'DATINGTYPE'
      Size = 50
    end
    object cdsDRep1GEODYNAMICSETTING: TWideStringField
      FieldName = 'GEODYNAMICSETTING'
      Size = 50
    end
    object cdsDRep1DEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDRep1DEPOSITSTATUS: TWideStringField
      FieldName = 'DEPOSITSTATUS'
      Size = 30
    end
  end
  object dsDRep1: TDataSource
    AutoEdit = False
    DataSet = cdsDRep1
    Left = 514
    Top = 278
  end
  object qOtherDatabases: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM OTHERDATABASES'
      'ORDER by OTHERDATABASES.DATABASENAME')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 258
  end
  object dspOtherDatabases: TDataSetProvider
    DataSet = qOtherDatabases
    UpdateMode = upWhereChanged
    Left = 58
    Top = 258
  end
  object cdsOtherDatabases: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOtherDatabases'
    Left = 86
    Top = 258
    object cdsOtherDatabasesDATBASEID: TIntegerField
      FieldName = 'DATBASEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOtherDatabasesDATABASENAME: TWideStringField
      FieldName = 'DATABASENAME'
      Required = True
      Size = 50
    end
    object cdsOtherDatabasesDESCRIPTION: TBlobField
      FieldName = 'DESCRIPTION'
    end
  end
  object dsOtherDatabases: TDataSource
    AutoEdit = False
    DataSet = cdsOtherDatabases
    Left = 114
    Top = 258
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
    object qContinentsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qContinentsCONTINENT: TWideStringField
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
    object cdsContinentsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsContinentsCONTINENT: TWideStringField
      FieldName = 'CONTINENT'
    end
    object cdsContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
    end
  end
  object dspContinents: TDataSetProvider
    DataSet = qContinents
    UpdateMode = upWhereChanged
    Left = 58
    Top = 362
  end
  object qDomainsAll: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DOMAINS'
      'ORDER by DOMAINS.CONTINENTID, DOMAINS.DOMAINNAME')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 410
  end
  object dspDomainsAll: TDataSetProvider
    DataSet = qDomainsAll
    UpdateMode = upWhereChanged
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
    object cdsDomainsAllCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainsAllDOMAINNAME: TWideStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainsAllDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDomainsAllDOMAINTYPEID: TWideStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
  end
  object dsDomainsAll: TDataSource
    AutoEdit = False
    DataSet = cdsDomainsAll
    Left = 114
    Top = 410
  end
  object qDepositCommodities: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID, '
      '  DEPOSITCOMMODITIES.COMMODITYID, COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      'FROM DEPOSITCOMMODITIES, COMMODITIES,GRADEUNITS'
      'WHERE DEPOSITCOMMODITIES.SBDEPOSITID=:SDBDepositID'
      'AND DEPOSITCOMMODITIES.COMMODITYID=COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID=GRADEUNITS.GRADEID'
      'ORDER by DEPOSITCOMMODITIES.COMMODITYID')
    SQLConnection = sqlcStrat
    Left = 278
    Top = 310
    object qDepositCommoditiesSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositCommoditiesCOMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Size = 3
    end
    object qDepositCommoditiesCOMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qDepositCommoditiesCOMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object qDepositCommoditiesGRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDepositCommoditiesGRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dsDepositCommodities: TDataSource
    AutoEdit = False
    DataSet = cdsDepositCommodities
    Left = 334
    Top = 310
  end
  object DepositQuery: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.COUNTRYID,'
      '  DEPOSITS.DEPOSITNAME,  DEPOSITCLANS.DEPOSITCLAN,'
      '  DEPOSITS.DEPLONGITUDE,DEPOSITS.DEPLATITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  DEPOSITS.DEPOSITPARENTID,DEPOSITSTATI.DEPOSITSTATUS,'
      '  DATINGTYPES.DATINGTYPE,GEODYNAMICSETTINGS.GEODYNAMICSETTING,'
      '  OTHERDATABASES.DATABASENAME'
      
        'from DEPOSITS,DEPOSITCLANS,OTHERDATABASES,DATINGTYPES,GEODYNAMIC' +
        'SETTINGS,DEPOSITSTATI'
      'where DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      'and DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID'
      'AND DEPOSITS.DATINGTYPEID=DATINGTYPES.DATINGTYPEID'
      'AND DEPOSITS.GEODYNAMICID=GEODYNAMICSETTINGS.GEODYNAMICID'
      'AND DEPOSITS.DEPOSITSTATUSID=DEPOSITSTATI.DEPOSITSTATUSID')
    SQLConnection = sqlcStrat
    Left = 272
    Top = 34
  end
  object dspDepositQuery: TDataSetProvider
    DataSet = DepositQuery
    UpdateMode = upWhereChanged
    Left = 302
    Top = 34
  end
  object cdsDepositQuery: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepositQuery'
    Left = 330
    Top = 34
    object cdsDepositQuerySDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositQueryCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepositQueryDEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
    object cdsDepositQueryDEPOSITCLAN: TWideStringField
      FieldName = 'DEPOSITCLAN'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsDepositQueryDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDepositQueryDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDepositQueryAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      DisplayFormat = '###0.00'
    end
    object cdsDepositQueryAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0.00'
    end
    object cdsDepositQueryDATABASENAME: TWideStringField
      FieldName = 'DATABASENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsDepositQueryDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDepositQueryDATINGTYPE: TWideStringField
      FieldName = 'DATINGTYPE'
      Size = 50
    end
    object cdsDepositQueryGEODYNAMICSETTING: TWideStringField
      FieldName = 'GEODYNAMICSETTING'
      Size = 50
    end
    object cdsDepositQueryDEPOSITSTATUS: TWideStringField
      FieldName = 'DEPOSITSTATUS'
      Size = 30
    end
  end
  object dsDepositQuery: TDataSource
    DataSet = cdsDepositQuery
    Left = 358
    Top = 34
  end
  object qCountryContinents: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM COUNTRIES'
      'ORDER BY COUNTRIES.COUNTRY')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 318
    object qCountryContinentsCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qCountryContinentsCOUNTRY: TWideStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object qCountryContinentsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object dspCountryContinents: TDataSetProvider
    DataSet = qCountryContinents
    UpdateMode = upWhereChanged
    Left = 58
    Top = 318
  end
  object cdsCountryContinents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountryContinents'
    Left = 86
    Top = 318
    object cdsCountryContinentsCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCountryContinentsCOUNTRY: TWideStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsCountryContinentsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object dsCountryContinents: TDataSource
    AutoEdit = False
    DataSet = cdsCountryContinents
    Left = 114
    Top = 318
  end
  object DepositQueryRec: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select DISTINCT DEPOSITS.SDBDEPOSITID'
      'from DEPOSITS')
    SQLConnection = sqlcStrat
    Left = 272
    Top = 82
  end
  object dspDepositQueryRec: TDataSetProvider
    DataSet = DepositQueryRec
    Options = [poReadOnly]
    Left = 300
    Top = 82
  end
  object cdsDepositQueryRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepositQueryRec'
    Left = 328
    Top = 82
    object cdsDepositQueryRecSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qUnitCountry: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'COUNTRYID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from STRATUNITS'
      'where STRATUNITS.COUNTRYID=:COUNTRYID'
      'or STRATUNITS.COUNTRYID='#39'UND'#39
      'or STRATUNITS.COUNTRYID='#39'nd'#39
      'order by STRATUNITS.UNITNAME, STRATUNITS.COUNTRYID')
    SQLConnection = sqlcStrat
    Left = 28
    Top = 459
    object qUnitCountryUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitCountryUNITNAME: TWideStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qUnitCountryCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
  end
  object dspUnitCountry: TDataSetProvider
    DataSet = qUnitCountry
    UpdateMode = upWhereChanged
    Left = 58
    Top = 460
  end
  object cdsUnitCountry: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitCountry'
    Left = 86
    Top = 460
    object cdsUnitCountryUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitCountryUNITNAME: TWideStringField
      DisplayLabel = 'Stratigraphic Unit'
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsUnitCountryCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
  end
  object dsUnitCountry: TDataSource
    DataSet = cdsUnitCountry
    Left = 114
    Top = 458
  end
  object qHostUnitAge: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'HOSTUNITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT STRATUNITS.MINAGE, STRATUNITS.MAXAGE'
      'FROM STRATUNITS'
      'WHERE STRATUNITS.UNITID=:HostUnitID')
    SQLConnection = sqlcStrat
    Left = 278
    Top = 358
    object qHostUnitAgeMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qHostUnitAgeMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsHostUnitAge: TDataSource
    AutoEdit = False
    DataSet = cdsHostUnitAge
    Left = 334
    Top = 358
  end
  object qDeleteDomainLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SBDepositID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from DOMAINDEPOSITS'
      'where DOMAINDEPOSITS.SBDEPOSITID = :SBDepositID'
      'and DOMAINDEPOSITS.DOMAINID = :DomainID'
      '')
    SQLConnection = sqlcStrat
    Left = 452
    Top = 72
  end
  object qDefaultDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ContinentID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DOMAINS'
      'WHERE DOMAINS.DOMAINID < 0'
      'AND DOMAINS.CONTINENTID=:ContinentID'
      'ORDER by DOMAINS.DOMAINNAME')
    SQLConnection = sqlcStrat
    Left = 26
    Top = 502
  end
  object dspDefaultDomains: TDataSetProvider
    DataSet = qDefaultDomains
    UpdateMode = upWhereChanged
    Left = 54
    Top = 502
  end
  object cdsDefaultDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDefaultDomains'
    Left = 82
    Top = 502
    object cdsDefaultDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDefaultDomainsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDefaultDomainsDOMAINNAME: TWideStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
  end
  object dsDefaultDomains: TDataSource
    AutoEdit = False
    DataSet = cdsDefaultDomains
    Left = 110
    Top = 502
  end
  object sqlcStrat: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=c:\exe32\dbexpida41.dll'
      'VendorLib=c:\exe32\fbclient.dll'
      'DataBase=c:\data\firebird\stratdb2025v50_UTF8.fdb'
      'User_Name=SYSDBA'
      'Password=V0lcano3^'
      'SQLDialect=3'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      'DriverUnit=DbxDevartInterBase'
      'UseUnicode=true'
      'Charset=UTF8')
    Left = 48
    Top = 4
  end
  object qDepositFor: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITFOR.SDBDEPOSITID, '
      '  DEPOSITFOR.WHOFORID,'
      '  DEPOSITFOR.INC4CHTYN, FORLIST.WHOFOR'
      'FROM DEPOSITFOR,FORLIST'
      'WHERE DEPOSITFOR.SDBDEPOSITID=:SDBDepositID'
      'AND DEPOSITFOR.WHOFORID=FORLIST.WHOFORID'
      'ORDER BY DEPOSITFOR.WHOFORID')
    SQLConnection = sqlcStrat
    Left = 278
    Top = 402
    object qDepositForSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositForWHOFORID: TWideStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qDepositForINC4CHTYN: TWideStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDepositForWHOFOR: TWideStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsDepositFor: TDataSource
    AutoEdit = False
    DataSet = cdsDepositFor
    Left = 334
    Top = 402
  end
  object qGradeUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM GRADEUNITS'
      'ORDER BY GRADEUNITS.GRADEUNIT')
    SQLConnection = sqlcStrat
    Left = 30
    Top = 550
  end
  object dspGradeUnits: TDataSetProvider
    DataSet = qGradeUnits
    UpdateMode = upWhereChanged
    Left = 58
    Top = 550
  end
  object cdsGradeUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradeUnits'
    Left = 86
    Top = 550
    object cdsGradeUnitsGRADEID: TWideStringField
      FieldName = 'GRADEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsGradeUnitsGRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 60
    end
  end
  object dsGradeUnits: TDataSource
    AutoEdit = False
    DataSet = cdsGradeUnits
    Left = 114
    Top = 550
  end
  object qDeposit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
        Value = '7000384'
      end>
    SQL.Strings = (
      'SELECT DEPOSITS.SDBDEPOSITID,DEPOSITS.DEPOSITCLANID, '
      '  DEPOSITS.DATABASEID, DEPOSITS.DEPOSITNAME,'
      '  DEPOSITS.DEPLATITUDE,DEPOSITS.DEPLONGITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  DEPOSITS.COUNTRYID,DEPOSITS.IAPPROXAGE,'
      '  COUNTRIES.CONTINENTID,'
      '  DEPOSITS.HOSTUNITID,DEPOSITS.DEPOSITSTATUSID,'
      '  DEPOSITS.DEPOSITIDINT,DEPOSITS.DEPOSITIDSTR,'
      '  DEPOSITS.GEODYNAMICID, DEPOSITS.DEPOSITPARENTID,'
      '  DEPOSITS.DATINGTYPEID'
      'FROM DEPOSITS,COUNTRIES'
      'WHERE DEPOSITS.SDBDEPOSITID=:SDBDEPOSITID'
      'AND DEPOSITS.COUNTRYID=COUNTRIES.COUNTRYID')
    SQLConnection = sqlcStrat
    Left = 248
    Top = 216
    object IntegerField1: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'DATABASEID'
      Required = True
    end
    object StringField1: TWideStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object FloatField1: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object FloatField3: TFloatField
      FieldName = 'APPROXAGE'
    end
    object FloatField4: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
    object StringField2: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object StringField3: TWideStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object IntegerField4: TIntegerField
      FieldName = 'HOSTUNITID'
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'DEPOSITIDINT'
      Required = True
    end
    object StringField4: TWideStringField
      FieldName = 'DEPOSITIDSTR'
      Required = True
      Size = 10
    end
    object qDepositIAPPROXAGE: TFloatField
      FieldName = 'IAPPROXAGE'
    end
    object qDepositGEODYNAMICID: TIntegerField
      FieldName = 'GEODYNAMICID'
      Required = True
    end
    object qDepositDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object qDepositDATINGTYPEID: TIntegerField
      FieldName = 'DATINGTYPEID'
      Required = True
    end
    object qDepositDEPOSITSTATUSID: TIntegerField
      FieldName = 'DEPOSITSTATUSID'
      Required = True
    end
  end
  object dspDeposit: TDataSetProvider
    DataSet = qDeposit
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 304
    Top = 216
  end
  object cdsDeposit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeposit'
    Left = 336
    Top = 216
    object cdsDepositSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsDepositDATABASEID: TIntegerField
      FieldName = 'DATABASEID'
      Required = True
    end
    object cdsDepositDEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object cdsDepositDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDepositDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDepositAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      DisplayFormat = '###0.000'
    end
    object cdsDepositAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0.000'
    end
    object cdsDepositCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepositCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsDepositHOSTUNITID: TIntegerField
      FieldName = 'HOSTUNITID'
      Required = True
    end
    object cdsDepositDEPOSITIDINT: TIntegerField
      FieldName = 'DEPOSITIDINT'
      Required = True
    end
    object cdsDepositDEPOSITIDSTR: TWideStringField
      FieldName = 'DEPOSITIDSTR'
      Required = True
      Size = 10
    end
    object cdsDepositqDepositFor: TDataSetField
      FieldName = 'qDepositFor'
    end
    object cdsDepositqHostUnitAge: TDataSetField
      FieldName = 'qHostUnitAge'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDepositqDepositCommodities: TDataSetField
      FieldName = 'qDepositCommodities'
    end
    object cdsDepositqDepositDomains: TDataSetField
      FieldName = 'qDepositDomains'
    end
    object cdsDepositIAPPROXAGE: TFloatField
      FieldName = 'IAPPROXAGE'
    end
    object cdsDepositGEODYNAMICID: TIntegerField
      FieldName = 'GEODYNAMICID'
      Required = True
    end
    object cdsDepositDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDepositDATINGTYPEID: TIntegerField
      FieldName = 'DATINGTYPEID'
      Required = True
    end
    object cdsDepositqSubDeposits: TDataSetField
      FieldName = 'qSubDeposits'
    end
    object cdsDepositDEPOSITSTATUSID: TIntegerField
      FieldName = 'DEPOSITSTATUSID'
      Required = True
    end
    object cdsDepositqDepositComment: TDataSetField
      FieldName = 'qDepositComment'
    end
    object cdsDepositqValid: TDataSetField
      FieldName = 'qValid'
    end
    object cdsDepositqRefs: TDataSetField
      FieldName = 'qRefs'
    end
    object cdsDepositqCommodityAssociation: TDataSetField
      FieldName = 'qCommodityAssociation'
    end
  end
  object qDeleteDepositCommodityLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SBDepositID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CommodityOrder'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from DEPOSITCOMMODITIES'
      'where DEPOSITCOMMODITIES.SBDEPOSITID = :SBDepositID'
      'and DEPOSITCOMMODITIES.COMMODITYORDER = :CommodityOrder'
      '')
    SQLConnection = sqlcStrat
    Left = 452
    Top = 120
  end
  object qCommodities: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT COMMODITYID, COMMODITY'
      'FROM COMMODITIES'
      'ORDER BY COMMODITIES.COMMODITY')
    SQLConnection = sqlcStrat
    Left = 32
    Top = 208
  end
  object dspCommodities: TDataSetProvider
    DataSet = qCommodities
    Options = [poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 64
    Top = 208
  end
  object cdsCommodities: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCommodities'
    Left = 96
    Top = 208
    object cdsCommoditiesCOMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCommoditiesCOMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
  end
  object dsCommodities: TDataSource
    DataSet = cdsCommodities
    Left = 128
    Top = 208
  end
  object qTest: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT COMMODITYID, COMMODITY '
      'FROM COMMODITIES'
      'ORDER BY COMMODITIES.COMMODITY')
    SQLConnection = sqlcStrat
    Left = 568
    Top = 400
  end
  object dspTest: TDataSetProvider
    DataSet = qTest
    Options = [poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 600
    Top = 400
  end
  object cdsTest: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTest'
    Left = 632
    Top = 400
    object cdsTestCOMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsTestCOMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
  end
  object dsTest: TDataSource
    DataSet = cdsTest
    Left = 664
    Top = 400
  end
  object cdsDepositDomains: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqDepositDomains
    Params = <>
    Left = 312
    Top = 264
    object cdsDepositDomainsSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositDomainsDOMAINNAME: TWideStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsDepositDomainsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object cdsDepositCommodities: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqDepositCommodities
    Params = <>
    Left = 312
    Top = 312
    object cdsDepositCommoditiesSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositCommoditiesCOMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsDepositCommoditiesCOMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsDepositCommoditiesCOMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
      DisplayFormat = '####0.000'
    end
    object cdsDepositCommoditiesGRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepositCommoditiesGRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object cdsHostUnitAge: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqHostUnitAge
    Params = <>
    Left = 312
    Top = 360
    object cdsHostUnitAgeMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.000'
    end
    object cdsHostUnitAgeMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.000'
    end
  end
  object cdsDepositFor: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqDepositFor
    Params = <>
    Left = 304
    Top = 400
    object cdsDepositForSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositForWHOFORID: TWideStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsDepositForINC4CHTYN: TWideStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepositForWHOFOR: TWideStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qDepositCommoditiesOnly: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,DEPOSITS.DEPOSITNAME, '
      '  DEPOSITCOMMODITIES.COMMODITYID, COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      'FROM DEPOSITCOMMODITIES, COMMODITIES,GRADEUNITS,DEPOSITS'
      'WHERE DEPOSITCOMMODITIES.SBDEPOSITID=:SDBDepositID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID=DEPOSITS.SDBDEPOSITID'
      'AND DEPOSITCOMMODITIES.COMMODITYID=COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID=GRADEUNITS.GRADEID'
      'ORDER by DEPOSITCOMMODITIES.COMMODITYID')
    SQLConnection = sqlcStrat
    Left = 416
    Top = 520
    object qDepositCommoditiesOnlySBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositCommoditiesOnlyCOMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qDepositCommoditiesOnlyCOMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qDepositCommoditiesOnlyCOMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object qDepositCommoditiesOnlyGRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDepositCommoditiesOnlyGRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qDepositCommoditiesOnlyDEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dspDepositCommoditiesOnly: TDataSetProvider
    DataSet = qDepositCommoditiesOnly
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 448
    Top = 520
  end
  object cdsDepositCommoditiesOnly: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepositCommoditiesOnly'
    Left = 480
    Top = 520
    object cdsDepositCommoditiesOnlySBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositCommoditiesOnlyCOMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsDepositCommoditiesOnlyCOMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsDepositCommoditiesOnlyCOMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
      DisplayFormat = '####0.000'
    end
    object cdsDepositCommoditiesOnlyGRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepositCommoditiesOnlyGRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsDepositCommoditiesOnlyDEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsDepositCommoditiesOnly: TDataSource
    DataSet = cdsDepositCommoditiesOnly
    Left = 512
    Top = 520
  end
  object qDatingTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DATINGTYPES'
      'ORDER BY DATINGTYPES.DATINGTYPE')
    SQLConnection = sqlcStrat
    Left = 750
    Top = 22
  end
  object qGeodynamicSettings: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM GEODYNAMICSETTINGS'
      'ORDER BY GEODYNAMICSETTINGS.GEODYNAMICSETTING')
    SQLConnection = sqlcStrat
    Left = 750
    Top = 70
  end
  object dspGeodynamicSettings: TDataSetProvider
    DataSet = qGeodynamicSettings
    UpdateMode = upWhereChanged
    Left = 778
    Top = 70
  end
  object cdsGeodynamicSettings: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGeodynamicSettings'
    Left = 806
    Top = 70
    object cdsGeodynamicSettingsGEODYNAMICID: TIntegerField
      FieldName = 'GEODYNAMICID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGeodynamicSettingsGEODYNAMICSETTING: TWideStringField
      FieldName = 'GEODYNAMICSETTING'
      Size = 50
    end
  end
  object dsGeodynamicSettings: TDataSource
    AutoEdit = False
    DataSet = cdsGeodynamicSettings
    Left = 834
    Top = 70
  end
  object dsDatingTypes: TDataSource
    AutoEdit = False
    DataSet = cdsDatingTypes
    Left = 834
    Top = 22
  end
  object cdsDatingTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDatingTypes'
    Left = 806
    Top = 22
    object cdsDatingTypesDATINGTYPEID: TIntegerField
      FieldName = 'DATINGTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDatingTypesDATINGTYPE: TWideStringField
      FieldName = 'DATINGTYPE'
      Size = 50
    end
  end
  object dspDatingTypes: TDataSetProvider
    DataSet = qDatingTypes
    UpdateMode = upWhereChanged
    Left = 778
    Top = 22
  end
  object qSubDeposits: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT DEPOSITS.SDBDEPOSITID,'
      '  DEPOSITS.DEPOSITNAME,'
      '  DEPOSITS.DEPOSITCLANID, DEPOSITS.approxage, '
      '  DEPOSITS.APPROXAGEUNCERTAINTY'
      'FROM DEPOSITS,DEPOSITFOR,FORLIST'
      'WHERE DEPOSITS.DEPOSITPARENTID=:SDBDepositID'
      'AND DEPOSITS.SDBDEPOSITID = DEPOSITFOR.SDBDEPOSITID'
      'AND DEPOSITFOR.WHOFORID=FORLIST.WHOFORID'
      'ORDER BY DEPOSITS.DEPOSITNAME')
    SQLConnection = sqlcStrat
    Left = 278
    Top = 450
    object qSubDepositsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSubDepositsDEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object qSubDepositsDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object qSubDepositsAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
    end
    object qSubDepositsAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
  end
  object cdsSubDeposits: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqSubDeposits
    Params = <>
    Left = 304
    Top = 448
    object cdsSubDepositsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSubDepositsDEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object cdsSubDepositsDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsSubDepositsAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      DisplayFormat = '###0.000'
    end
    object cdsSubDepositsAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0.000'
    end
  end
  object dsSubDeposits: TDataSource
    AutoEdit = False
    DataSet = cdsSubDeposits
    Left = 334
    Top = 450
  end
  object qDRep2: TSQLQuery
    DataSource = dsqDRep1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.COUNTRYID,'
      '  DEPOSITS.DEPOSITNAME,  DEPOSITCLANS.DEPOSITCLAN,'
      '  DEPOSITS.DEPLONGITUDE,DEPOSITS.DEPLATITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  DATINGTYPES.DATINGTYPE, GEODYNAMICSETTINGS.GEODYNAMICSETTING,'
      '  OTHERDATABASES.DATABASENAME,DEPOSITS.DEPOSITPARENTID,'
      '  DEPOSITSTATI.DEPOSITSTATUS'
      
        'FROM DEPOSITS,DEPOSITCLANS,OTHERDATABASES,DATINGTYPES, GEODYNAMI' +
        'CSETTINGS,DEPOSITFOR,USERSWHOFOR,DEPOSITSTATI'
      'WHERE DEPOSITS.DEPOSITPARENTID = :SDBDEPOSITID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      'AND DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID'
      'AND DEPOSITS.DATINGTYPEID = DATINGTYPES.DATINGTYPEID'
      'AND DEPOSITS.GEODYNAMICID = GEODYNAMICSETTINGS.GEODYNAMICID '
      'AND DEPOSITS.SDBDEPOSITID = DEPOSITFOR.SDBDEPOSITID'
      'AND DEPOSITFOR.WHOFORID = USERSWHOFOR.WHOFORID'
      'AND DEPOSITS.DEPOSITSTATUSID=DEPOSITSTATI.DEPOSITSTATUSID'
      'AND DEPOSITS.DEPOSITCLANID < 90000'
      '')
    SQLConnection = sqlcStrat
    Left = 424
    Top = 329
  end
  object dsqDRep2: TDataSource
    DataSet = qDRep2
    Left = 452
    Top = 329
  end
  object cdsDRep2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDRep1qDRep2
    Params = <>
    Left = 480
    Top = 329
    object cdsDRep2SDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      Required = True
    end
    object cdsDRep2COUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDRep2DEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object cdsDRep2DEPOSITCLAN: TWideStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 75
    end
    object cdsDRep2DEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object cdsDRep2DEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object cdsDRep2APPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
    end
    object cdsDRep2APPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
    object cdsDRep2DATABASENAME: TWideStringField
      FieldName = 'DATABASENAME'
      Required = True
      Size = 50
    end
    object cdsDRep2DATINGTYPE: TWideStringField
      FieldName = 'DATINGTYPE'
      Size = 50
    end
    object cdsDRep2GEODYNAMICSETTING: TWideStringField
      FieldName = 'GEODYNAMICSETTING'
      Size = 50
    end
    object cdsDRep2DEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDRep2DEPOSITSTATUS: TWideStringField
      FieldName = 'DEPOSITSTATUS'
      Size = 30
    end
  end
  object dsDRep2: TDataSource
    DataSet = cdsDRep2
    Left = 508
    Top = 329
  end
  object qDepositStatus: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITSTATI'
      'ORDER BY DEPOSITSTATI.DEPOSITSTATUS')
    SQLConnection = sqlcStrat
    Left = 414
    Top = 486
  end
  object dspDepositStatus: TDataSetProvider
    DataSet = qDepositStatus
    UpdateMode = upWhereChanged
    Left = 442
    Top = 486
  end
  object cdsDepositStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepositStatus'
    Left = 470
    Top = 486
    object cdsDepositStatusDEPOSITSTATUSID: TIntegerField
      FieldName = 'DEPOSITSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositStatusDEPOSITSTATUS: TWideStringField
      FieldName = 'DEPOSITSTATUS'
      Size = 30
    end
  end
  object dsDepositStatus: TDataSource
    AutoEdit = False
    DataSet = cdsDepositStatus
    Left = 498
    Top = 486
  end
  object qValidFull: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DEPOSITVALID.SDBDEPOSITID, DEPOSITVALID.VALIDSTATUSID,'
      '  DEPOSITVALID.DATEDONE, DEPOSITVALID.DONEBY,'
      '  DEPOSITVALID.COMMENTS'
      'from DEPOSITVALID'
      'where DEPOSITVALID.SDBDEPOSITID = :DepositID')
    SQLConnection = sqlcStrat
    Left = 416
    Top = 444
  end
  object dspValidFull: TDataSetProvider
    DataSet = qValidFull
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    UpdateMode = upWhereChanged
    Left = 444
    Top = 444
  end
  object cdsValidFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValidFull'
    Left = 472
    Top = 444
    object cdsValidFullSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsValidFullVALIDSTATUSID: TWideStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsValidFullDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
    end
    object cdsValidFullDONEBY: TWideStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object cdsValidFullCOMMENTS: TBlobField
      FieldName = 'COMMENTS'
    end
  end
  object dsValidFull: TDataSource
    DataSet = cdsValidFull
    Left = 500
    Top = 444
  end
  object qDepositComment: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT* FROM DEPOSITCOMMENT'
      'WHERE DEPOSITCOMMENT.SDBDEPOSITID = :SDBDepositID')
    SQLConnection = sqlcStrat
    Left = 278
    Top = 542
    object qDepositCommentSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositCommentDEPOSITCOMMENT: TBlobField
      FieldName = 'DEPOSITCOMMENT'
      Size = -1
    end
  end
  object cdsDepositComment: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqDepositComment
    FetchOnDemand = False
    Params = <>
    Left = 304
    Top = 544
    object cdsDepositCommentSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositCommentDEPOSITCOMMENT: TBlobField
      FieldName = 'DEPOSITCOMMENT'
    end
  end
  object dsDepositComment: TDataSource
    DataSet = cdsDepositComment
    Left = 334
    Top = 542
  end
  object qValid: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITVALID.SDBDEPOSITID, DEPOSITVALID.VALIDSTATUSID,'
      '  DEPOSITVALID.DATEDONE, DEPOSITVALID.DONEBY,'
      '  VALIDATIONSTATUS.VALIDATIONSTATUS'
      'FROM DEPOSITVALID, VALIDATIONSTATUS'
      'WHERE DEPOSITVALID.SDBDEPOSITID = :SDBDepositID'
      'AND DEPOSITVALID.VALIDSTATUSID=VALIDATIONSTATUS.VALIDSTATUSID'
      'ORDER BY DEPOSITVALID.VALIDSTATUSID')
    SQLConnection = sqlcStrat
    Left = 280
    Top = 496
    object qValidSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qValidVALIDSTATUSID: TWideStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qValidDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
    end
    object qValidDONEBY: TWideStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object qValidVALIDATIONSTATUS: TWideStringField
      FieldName = 'VALIDATIONSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsValid: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqValid
    Params = <>
    Left = 312
    Top = 496
    object cdsValidSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsValidVALIDSTATUSID: TWideStringField
      FieldName = 'VALIDSTATUSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsValidDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
    end
    object cdsValidDONEBY: TWideStringField
      FieldName = 'DONEBY'
      Required = True
    end
    object cdsValidVALIDATIONSTATUS: TWideStringField
      FieldName = 'VALIDATIONSTATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsValid: TDataSource
    DataSet = cdsValid
    Left = 344
    Top = 496
  end
  object qRefs: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITREFS.SDBDEPOSITID, DEPOSITREFS.SOURCENUM,'
      '  SOURCELIST.SOURCESHORT, SOURCELIST.SOURCEYEAR,'
      '  SOURCELIST.CONTINENTID'
      'FROM DEPOSITREFS, SOURCELIST'
      'WHERE DEPOSITREFS.SDBDEPOSITID = :SDBDepositID'
      'AND DEPOSITREFS.SOURCENUM=SOURCELIST.SOURCENUM'
      'ORDER BY SOURCELIST.SOURCESHORT')
    SQLConnection = sqlcStrat
    Left = 280
    Top = 592
    object qRefsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRefsSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRefsSOURCESHORT: TWideStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qRefsSOURCEYEAR: TIntegerField
      FieldName = 'SOURCEYEAR'
      ProviderFlags = []
      ReadOnly = True
    end
    object qRefsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object cdsRefs: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqRefs
    Params = <>
    Left = 312
    Top = 592
    object cdsRefsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefsSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefsSOURCESHORT: TWideStringField
      FieldName = 'SOURCESHORT'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsRefsSOURCEYEAR: TIntegerField
      FieldName = 'SOURCEYEAR'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRefsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object dsRefs: TDataSource
    DataSet = cdsRefs
    Left = 344
    Top = 592
  end
  object qDepRef: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDepositID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SourceNum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from DEPOSITREFS'
      'where DEPOSITREFS.SDBDEPOSITID = :SDBDepositID'
      'and DEPOSITREFS.SOURCENUM = :SourceNum')
    SQLConnection = sqlcStrat
    Left = 688
    Top = 136
  end
  object qInsertLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDepositID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SourceNum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO STRATDOMAIN'
      '(SDBDepositID, SourceNum)'
      'Values (:SDBDepositID, :SourceNum)')
    SQLConnection = sqlcStrat
    Left = 688
    Top = 180
  end
  object qDepCommodities: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select distinct deposits.sdbdepositid, deposits.depositname, dep' +
        'osits.depositparentid,'
      
        '  deposits.depositclanid, deposits.deplongitude, deposits.deplat' +
        'itude,'
      
        '  deposits.approxage, deposits.approxageuncertainty, deposits.da' +
        'tingtypeid,'
      
        '  deposits.databaseid, deposits.countryid, deposits.geodynamicid' +
        ','
      
        '  deposits.hostunitid, deposits.approxstratage, deposits.approxs' +
        'tratageuncertainty,'
      
        '  deposits.depositstatusid,depositclans.depositclan,depositstati' +
        '.depositstatus,'
      '  depositclans.commodityassociationid'
      'from deposits,userswhofor,depositfor,depositclans,depositstati'
      'where userswhofor.userid = :UserID'
      'and userswhofor.whoforid = depositfor.whoforid'
      'and depositfor.sdbdepositid = deposits.sdbdepositid'
      'and deposits.depositclanid = depositclans.depositclanid'
      'and deposits.depositstatusid=depositstati.depositstatusid'
      
        'order by deposits.countryid,deposits.depositclanid,deposits.depo' +
        'sitname')
    SQLConnection = sqlcStrat
    Left = 576
    Top = 576
  end
  object dsqDepCommodities: TDataSource
    DataSet = qDepCommodities
    Left = 608
    Top = 576
  end
  object dspDepCommodities: TDataSetProvider
    DataSet = qDepCommodities
    Left = 640
    Top = 576
  end
  object cdsDepCommodities: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepCommodities'
    Left = 672
    Top = 576
    object cdsDepCommoditiesSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepCommoditiesDEPOSITNAME: TWideStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object cdsDepCommoditiesDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDepCommoditiesDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsDepCommoditiesDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object cdsDepCommoditiesDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object cdsDepCommoditiesAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
    end
    object cdsDepCommoditiesAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
    object cdsDepCommoditiesDATINGTYPEID: TIntegerField
      FieldName = 'DATINGTYPEID'
      Required = True
    end
    object cdsDepCommoditiesDATABASEID: TIntegerField
      FieldName = 'DATABASEID'
      Required = True
    end
    object cdsDepCommoditiesCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepCommoditiesGEODYNAMICID: TIntegerField
      FieldName = 'GEODYNAMICID'
      Required = True
    end
    object cdsDepCommoditiesHOSTUNITID: TIntegerField
      FieldName = 'HOSTUNITID'
      Required = True
    end
    object cdsDepCommoditiesAPPROXSTRATAGE: TFloatField
      FieldName = 'APPROXSTRATAGE'
    end
    object cdsDepCommoditiesAPPROXSTRATAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXSTRATAGEUNCERTAINTY'
    end
    object cdsDepCommoditiesDEPOSITSTATUSID: TIntegerField
      FieldName = 'DEPOSITSTATUSID'
      Required = True
    end
    object cdsDepCommoditiesqCom0: TDataSetField
      FieldName = 'qCom0'
    end
    object cdsDepCommoditiesqCom7: TDataSetField
      FieldName = 'qCom7'
    end
    object cdsDepCommoditiesqCom8: TDataSetField
      FieldName = 'qCom8'
    end
    object cdsDepCommoditiesqCom9: TDataSetField
      FieldName = 'qCom9'
    end
    object cdsDepCommoditiesqCom4: TDataSetField
      FieldName = 'qCom4'
    end
    object cdsDepCommoditiesqCom5: TDataSetField
      FieldName = 'qCom5'
    end
    object cdsDepCommoditiesqCom6: TDataSetField
      FieldName = 'qCom6'
    end
    object cdsDepCommoditiesqCom3: TDataSetField
      FieldName = 'qCom3'
    end
    object cdsDepCommoditiesqCom2: TDataSetField
      FieldName = 'qCom2'
    end
    object cdsDepCommoditiesqCom1: TDataSetField
      FieldName = 'qCom1'
    end
    object cdsDepCommoditiesDEPOSITCLAN: TWideStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 75
    end
    object cdsDepCommoditiesDEPOSITSTATUS: TWideStringField
      FieldName = 'DEPOSITSTATUS'
      Size = 30
    end
  end
  object dsDepCommodities: TDataSource
    DataSet = cdsDepCommodities
    Left = 704
    Top = 576
  end
  object qCom0: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 0'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 496
    Top = 624
  end
  object cdsCom0: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom0
    Params = <>
    Left = 528
    Top = 624
    object cdsCom0SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom0COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCom0COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom0GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom0GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
    object cdsCom0COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom0COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom0COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
    object cdsCom0COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
  end
  object dsCom0: TDataSource
    DataSet = cdsCom0
    Left = 560
    Top = 624
  end
  object qCom1: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 1'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 600
    Top = 624
  end
  object cdsCom1: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom1
    Params = <>
    Left = 632
    Top = 624
    object cdsCom1SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom1COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
    object cdsCom1COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsCom1COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom1GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom1GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
    object cdsCom1COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom1COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom1COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
  end
  object dsCom1: TDataSource
    DataSet = cdsCom1
    Left = 664
    Top = 624
  end
  object qCom2: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 2'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 600
    Top = 672
  end
  object cdsCom2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom2
    Params = <>
    Left = 632
    Top = 672
    object cdsCom2SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom2COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
    object cdsCom2COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsCom2COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom2GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom2GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
    object cdsCom2COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom2COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom2COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
  end
  object dsCom2: TDataSource
    DataSet = cdsCom2
    Left = 664
    Top = 672
  end
  object qCom3: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 3'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 600
    Top = 720
  end
  object cdsCom3: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom3
    Params = <>
    Left = 632
    Top = 720
    object cdsCom3SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom3COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
    object cdsCom3COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsCom3COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom3GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom3GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
    object cdsCom3COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom3COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom3COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
  end
  object dsCom3: TDataSource
    DataSet = cdsCom3
    Left = 664
    Top = 720
  end
  object qCom4: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 4'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 720
    Top = 624
  end
  object cdsCom4: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom4
    Params = <>
    Left = 752
    Top = 624
    object cdsCom4SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom4COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
    object cdsCom4COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsCom4COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom4GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom4GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
    object cdsCom4COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom4COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom4COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
  end
  object dsCom4: TDataSource
    DataSet = cdsCom4
    Left = 784
    Top = 624
  end
  object qCom5: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 5'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 720
    Top = 672
  end
  object cdsCom5: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom5
    Params = <>
    Left = 752
    Top = 672
    object cdsCom5SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom5COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom5COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
    object cdsCom5COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
    object cdsCom5COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsCom5COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom5COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom5GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom5GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
  end
  object dsCom5: TDataSource
    DataSet = cdsCom5
    Left = 784
    Top = 672
  end
  object qCom6: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 6'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 720
    Top = 720
  end
  object cdsCom6: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom6
    Params = <>
    Left = 752
    Top = 720
    object cdsCom6SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom6COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
    object cdsCom6COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsCom6COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom6GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom6GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
    object cdsCom6COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom6COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom6COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
  end
  object dsCom6: TDataSource
    DataSet = cdsCom6
    Left = 784
    Top = 720
  end
  object qCom7: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 7'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 840
    Top = 624
  end
  object cdsCom7: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom7
    Params = <>
    Left = 872
    Top = 624
    object cdsCom7SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom7COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
    object cdsCom7COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsCom7COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom7GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom7GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
    object cdsCom7COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom7COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom7COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
  end
  object dsCom7: TDataSource
    DataSet = cdsCom7
    Left = 904
    Top = 624
  end
  object qCom8: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 8'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 840
    Top = 672
  end
  object cdsCom8: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom8
    Params = <>
    Left = 872
    Top = 672
    object cdsCom8SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom8COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom8COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
    object cdsCom8COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
    object cdsCom8COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsCom8COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom8COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom8GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom8GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
  end
  object dsCom8: TDataSource
    DataSet = cdsCom8
    Left = 904
    Top = 672
  end
  object qCom9: TSQLQuery
    DataSource = dsqDepCommodities
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CommodityAssociationID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID,'
      
        '  COMMODITYASSOCIATION.COMMODITYASSOCIATION,COMMODITYASSOCIATION' +
        '.COMMODITYASSOCID,'
      '  COMMODITYVARIABLEORDER.COMMODITYORDER,'
      '  COMMODITIES.COMMODITYID,COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      
        'FROM DEPOSITCOMMODITIES,GRADEUNITS,COMMODITIES,COMMODITYVARIABLE' +
        'ORDER,COMMODITYASSOCIATION'
      
        'WHERE COMMODITYVARIABLEORDER.COMMODITYASSOCIATIONID = :Commodity' +
        'AssociationID'
      'AND DEPOSITCOMMODITIES.SBDEPOSITID = :SDBDEPOSITID'
      'AND COMMODITYVARIABLEORDER.COMMODITYORDER = 9'
      
        'and COMMODITYASSOCIATION.COMMODITYASSOCID = COMMODITYVARIABLEORD' +
        'ER.COMMODITYASSOCIATIONID'
      
        'AND COMMODITYVARIABLEORDER.COMMODITYID = DEPOSITCOMMODITIES.COMM' +
        'ODITYID'
      'AND DEPOSITCOMMODITIES.COMMODITYID = COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID = GRADEUNITS.GRADEID')
    SQLConnection = sqlcStrat
    Left = 840
    Top = 720
  end
  object cdsCom9: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepCommoditiesqCom9
    Params = <>
    Left = 872
    Top = 720
    object cdsCom9SBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      Required = True
    end
    object cdsCom9COMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      Required = True
    end
    object cdsCom9COMMODITYID: TWideStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsCom9COMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object cdsCom9GRADEUNITID: TWideStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCom9GRADEUNIT: TWideStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 15
    end
    object cdsCom9COMMODITY: TWideStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
    object cdsCom9COMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
    object cdsCom9COMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      Required = True
    end
  end
  object dsCom9: TDataSource
    DataSet = cdsCom9
    Left = 904
    Top = 720
  end
  object qCommodityAssociation: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCLANS.COMMODITYASSOCIATIONID'
      'FROM DEPOSITCLANS,DEPOSITS'
      'WHERE DEPOSITS.SDBDEPOSITID = :SDBDepositID'
      'AND DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      '')
    SQLConnection = sqlcStrat
    Left = 280
    Top = 640
    object qCommodityAssociationCOMMODITYASSOCIATIONID: TIntegerField
      FieldName = 'COMMODITYASSOCIATIONID'
      Required = True
    end
  end
  object cdsCommodityAssociation: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqCommodityAssociation
    Params = <>
    Left = 312
    Top = 640
    object cdsCommodityAssociationCOMMODITYASSOCIATIONID: TIntegerField
      FieldName = 'COMMODITYASSOCIATIONID'
      Required = True
    end
  end
  object dsCommodityAssociation: TDataSource
    DataSet = cdsCommodityAssociation
    Left = 344
    Top = 640
  end
  object qCommodityAssociations: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM COMMODITYASSOCIATION'
      'ORDER BY COMMODITYASSOCIATION.COMMODITYASSOCIATION'
      '')
    SQLConnection = sqlcStrat
    Left = 24
    Top = 600
  end
  object dspCommodityAssociations: TDataSetProvider
    DataSet = qCommodityAssociations
    Options = [poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 56
    Top = 600
  end
  object cdsCommodityAssociations: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCommodityAssociations'
    Left = 88
    Top = 600
    object cdsCommodityAssociationsCOMMODITYASSOCID: TIntegerField
      FieldName = 'COMMODITYASSOCID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCommodityAssociationsCOMMODITYASSOCIATION: TWideStringField
      FieldName = 'COMMODITYASSOCIATION'
      Required = True
      Size = 50
    end
  end
  object dsCommodityAssociations: TDataSource
    DataSet = cdsCommodityAssociations
    Left = 120
    Top = 600
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcStrat
    Left = 128
    Top = 16
  end
end
