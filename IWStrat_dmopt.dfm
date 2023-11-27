object dmOpt: TdmOpt
  OldCreateOrder = False
  Height = 621
  Width = 702
  object dsOpt: TDataSource
    DataSet = cdsOpt
    Left = 312
    Top = 126
  end
  object qOpt: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select USEROPTS.USERID, USEROPTS.LINKTODATEVIEW,'
      '  USEROPTS.INCLUDESEAMS'
      'from USEROPTS'
      'where USEROPTS.USERID = :USERID')
    SQLConnection = sqlcStrat
    Left = 206
    Top = 126
    object qOptUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptLINKTODATEVIEW: TStringField
      FieldName = 'LINKTODATEVIEW'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qOptINCLUDESEAMS: TStringField
      FieldName = 'INCLUDESEAMS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsOpt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOpt'
    Left = 286
    Top = 124
    object cdsOptUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptLINKTODATEVIEW: TStringField
      FieldName = 'LINKTODATEVIEW'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptINCLUDESEAMS: TStringField
      FieldName = 'INCLUDESEAMS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsQOpt: TDataSource
    DataSet = qOpt
    Left = 230
    Top = 126
  end
  object dspOpt: TDataSetProvider
    DataSet = qOpt
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 258
    Top = 126
  end
  object qOptAll: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select USEROPTS.USERID, USEROPTS.LINKTODATEVIEW,'
      '  USEROPTS.INCLUDESEAMS'
      'from USEROPTS')
    SQLConnection = sqlcStrat
    Left = 34
    Top = 102
    object qOptAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptAllLINKTODATEVIEW: TStringField
      FieldName = 'LINKTODATEVIEW'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qOptAllINCLUDESEAMS: TStringField
      FieldName = 'INCLUDESEAMS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsqOptAll: TDataSource
    DataSet = qOptAll
    Left = 58
    Top = 102
  end
  object dspOptAll: TDataSetProvider
    DataSet = qOptAll
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 86
    Top = 102
  end
  object cdsOptAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptAll'
    Left = 114
    Top = 100
    object cdsOptAllUSERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptAllLINKTODATEVIEW: TStringField
      DisplayLabel = 'Link to DateView'
      FieldName = 'LINKTODATEVIEW'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptAllINCLUDESEAMS: TStringField
      DisplayLabel = 'Incl. Seams and Reefs'
      FieldName = 'INCLUDESEAMS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsOptAll: TDataSource
    DataSet = cdsOptAll
    Left = 140
    Top = 102
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
      'DriverUnit=DbxDevartInterBase')
    Left = 24
    Top = 20
  end
  object qUserFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT USERSWHOFOR.WHOFORID,'
      '  USERSWHOFOR.USERID,FORLIST.WHOFOR '
      'FROM FORLIST,USERSWHOFOR'
      'WHERE FORLIST.OWNER=:UserID '
      'AND FORLIST.WHOFORID=USERSWHOFOR.WHOFORID'
      'ORDER BY USERSWHOFOR.WHOFORID,USERSWHOFOR.USERID')
    SQLConnection = sqlcStrat
    Left = 8
    Top = 214
    object qUserForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qUserForUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUserForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dspUserFor: TDataSetProvider
    DataSet = qUserFor
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 36
    Top = 214
  end
  object cdsUserFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserFor'
    Left = 64
    Top = 214
    object cdsUserForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsUserForUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsUserFor: TDataSource
    DataSet = cdsUserFor
    Left = 92
    Top = 214
  end
  object qChangeUserFor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'DELETE FROM FORLIST'
      'WHERE FORLIST.WHOFORID='#39'NEW'#39)
    SQLConnection = sqlcStrat
    Left = 32
    Top = 318
  end
  object qForList: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM FORLIST'
      'where FORLIST.OWNER=:UserID'
      'OR FORLIST.OWNER = '#39'Anybody'#39
      'ORDER BY FORLIST.WHOFORID')
    SQLConnection = sqlcStrat
    Left = 8
    Top = 262
  end
  object dspForList: TDataSetProvider
    DataSet = qForList
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 36
    Top = 262
  end
  object cdsForList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForList'
    Left = 64
    Top = 262
    object cdsForListWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsForListWHOFOR: TStringField
      FieldName = 'WHOFOR'
      Required = True
      Size = 50
    end
    object cdsForListOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
    end
  end
  object dsForList: TDataSource
    DataSet = cdsForList
    Left = 92
    Top = 262
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcStrat
    Left = 112
    Top = 24
  end
end
