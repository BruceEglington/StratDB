object dmReplicate: TdmReplicate
  OldCreateOrder = False
  Height = 621
  Width = 702
  object qLocalNodes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * '
      'FROM RPL$NODES'
      'WHERE RPL$NODES.NODETYPE = '#39'Local'#39' ')
    SQLConnection = sqlcStrat
    Left = 368
    Top = 22
  end
  object dspLocalNodes: TDataSetProvider
    DataSet = qLocalNodes
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 396
    Top = 22
  end
  object cdsLocalNodes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocalNodes'
    Left = 424
    Top = 22
    object cdsLocalNodesNODENAME: TStringField
      FieldName = 'NODENAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsLocalNodesNODETYPE: TStringField
      FieldName = 'NODETYPE'
      Required = True
      Size = 10
    end
    object cdsLocalNodesNODEDBNAME: TStringField
      FieldName = 'NODEDBNAME'
      Required = True
      Size = 200
    end
    object cdsLocalNodesNODEDBTYPE: TStringField
      FieldName = 'NODEDBTYPE'
      Required = True
      Size = 30
    end
    object cdsLocalNodesNODEDBVERSION: TStringField
      FieldName = 'NODEDBVERSION'
      Required = True
      Size = 10
    end
    object cdsLocalNodesNODEUSERLOGIN: TStringField
      FieldName = 'NODEUSERLOGIN'
      Required = True
    end
    object cdsLocalNodesNODEUSERPASSWORD: TStringField
      FieldName = 'NODEUSERPASSWORD'
      Required = True
    end
    object cdsLocalNodesNODEDBSPECIFIC: TMemoField
      FieldName = 'NODEDBSPECIFIC'
      BlobType = ftMemo
    end
    object cdsLocalNodesNODESERVER: TStringField
      FieldName = 'NODESERVER'
      Required = True
      Size = 100
    end
    object cdsLocalNodesNODEPATH: TStringField
      FieldName = 'NODEPATH'
      Required = True
      Size = 100
    end
  end
  object dsLocalNodes: TDataSource
    DataSet = cdsLocalNodes
    Left = 452
    Top = 22
  end
  object qRemoteNodes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * '
      'FROM RPL$NODES'
      'WHERE RPL$NODES.NODETYPE = '#39'Remote'#39)
    SQLConnection = sqlcStrat
    Left = 368
    Top = 70
  end
  object dspRemoteNodes: TDataSetProvider
    DataSet = qRemoteNodes
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 396
    Top = 70
  end
  object cdsRemoteNodes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRemoteNodes'
    Left = 424
    Top = 70
    object cdsRemoteNodesNODENAME: TStringField
      FieldName = 'NODENAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsRemoteNodesNODETYPE: TStringField
      FieldName = 'NODETYPE'
      Required = True
      Size = 10
    end
    object cdsRemoteNodesNODEDBNAME: TStringField
      FieldName = 'NODEDBNAME'
      Required = True
      Size = 200
    end
    object cdsRemoteNodesNODEDBTYPE: TStringField
      FieldName = 'NODEDBTYPE'
      Required = True
      Size = 30
    end
    object cdsRemoteNodesNODEDBVERSION: TStringField
      FieldName = 'NODEDBVERSION'
      Required = True
      Size = 10
    end
    object cdsRemoteNodesNODEUSERLOGIN: TStringField
      FieldName = 'NODEUSERLOGIN'
      Required = True
    end
    object cdsRemoteNodesNODEUSERPASSWORD: TStringField
      FieldName = 'NODEUSERPASSWORD'
      Required = True
    end
    object cdsRemoteNodesNODEDBSPECIFIC: TMemoField
      FieldName = 'NODEDBSPECIFIC'
      BlobType = ftMemo
    end
    object cdsRemoteNodesNODESERVER: TStringField
      FieldName = 'NODESERVER'
      Required = True
      Size = 100
    end
    object cdsRemoteNodesNODEPATH: TStringField
      FieldName = 'NODEPATH'
      Required = True
      Size = 100
    end
  end
  object dsRemoteNodes: TDataSource
    DataSet = cdsRemoteNodes
    Left = 452
    Top = 70
  end
  object sqlcStrat: TSQLConnection
    ConnectionName = 'bromo2_StratDB'
    DriverName = 'DevartInterBase'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DevartInterBase'
      'DataBase=bromo2.usask.ca:s:/data/firebird/stratdb2015v25.fdb'
      'RoleName='
      'User_Name=SYSDBA'
      'Password=masterkey'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartInterBase TransIsolation=ReadCommitted'
      'WaitOnLocks=True'
      'Charset=ASCII'
      'CharLength=0'
      'EnableBCD=True'
      'OptimizedNumerics=True'
      'LongStrings=True'
      'UseQuoteChar=False'
      'UseUnicode=True'
      'FetchAll=False'
      'DeferredBlobRead=False'
      'DeferredArrayRead=False'
      'TrimFixedChar=True'
      'TrimVarChar=False'
      'ForceUsingDefaultPort=False'
      'ForceUnloadClientLibrary=False'
      'VendorLib=c:\exe32\fbclient.dll')
    Left = 24
    Top = 8
  end
  object qRPLusers: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * '
      'FROM RPL$USERS'
      '')
    SQLConnection = sqlcStrat
    Left = 432
    Top = 134
  end
  object dspRPLusers: TDataSetProvider
    DataSet = qRPLusers
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 460
    Top = 134
  end
  object cdsRPLusers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRPLusers'
    Left = 488
    Top = 134
    object cdsRPLusersLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
    object cdsRPLusersPASSWRD: TStringField
      FieldName = 'PASSWRD'
      Size = 100
    end
    object cdsRPLusersLIBELLE: TStringField
      FieldName = 'LIBELLE'
      Size = 50
    end
    object cdsRPLusersCONDITION_VALUE: TStringField
      FieldName = 'CONDITION_VALUE'
      Size = 200
    end
    object cdsRPLusersCONFIG_NAME: TStringField
      FieldName = 'CONFIG_NAME'
      Size = 100
    end
  end
  object dsRPLusers: TDataSource
    DataSet = cdsRPLusers
    Left = 516
    Top = 134
  end
  object CcConfigLocal: TCcConfig
    TrackFieldChanges = False
    FailIfNoPK = False
    Connection = CcConnectionFireDACLocal
    Tables = <>
    Version = '3.9.4'
    Left = 416
    Top = 216
  end
  object CcConfigRemote: TCcConfig
    TrackFieldChanges = False
    FailIfNoPK = False
    Connection = CcConnectionFireDACRemote
    Tables = <>
    Version = '3.9.4'
    Left = 528
    Top = 216
  end
  object FDConnectionLocal: TFDConnection
    Params.Strings = (
      'MonitorBy=Remote'
      'ConnectionDef=bromo2_DateView')
    TxOptions.AutoStop = False
    LoginPrompt = False
    Transaction = FDTransactionRemote
    Left = 64
    Top = 304
  end
  object FDTransactionLocal: TFDTransaction
    Options.AutoStop = False
    Connection = FDConnectionLocal
    Left = 64
    Top = 352
  end
  object FDTransactionRemote: TFDTransaction
    Options.AutoStop = False
    Connection = FDConnectionRemote
    Left = 264
    Top = 360
  end
  object FDConnectionRemote: TFDConnection
    Params.Strings = (
      'MonitorBy=Remote'
      'ConnectionDef=bromo2_StratDB')
    TxOptions.AutoStop = False
    LoginPrompt = False
    Transaction = FDTransactionRemote
    Left = 264
    Top = 312
  end
  object CcConnectionFireDACLocal: TCcConnectionFireDAC
    FDConnection = FDConnectionLocal
    FDTransaction = FDTransactionRemote
    DBType = 'Interbase'
    DBVersion = 'FB2.5'
    Left = 64
    Top = 248
  end
  object CcConnectionFireDACRemote: TCcConnectionFireDAC
    FDConnection = FDConnectionRemote
    FDTransaction = FDTransactionRemote
    DBType = 'Interbase'
    DBVersion = 'FB2.5'
    Left = 264
    Top = 248
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcStrat
    Left = 112
    Top = 8
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Tracing = True
    Left = 64
    Top = 160
  end
  object CcReplicator1: TCcReplicator
    TrackInconsistentDeletes = False
    MergeChangedFieldsOnConflict = False
    Direction = sdRemoteToLocal
    ReplicateOnlyChangedFields = False
    AutoClearMetadata = True
    FailIfNoPK = True
    UsePKSynchronization = True
    TrimCharFields = True
    AutoPriority = False
    OnReplicationResult = CcReplicator1ReplicationResult
    HarmonizeFields = False
    KeepConnection = False
    Nodes.LocalNode.Connection = CcConnectionFireDACLocal
    Nodes.LocalNode.Password = 'masterkey'
    Nodes.RemoteNode.Connection = CcConnectionFireDACRemote
    Nodes.RemoteNode.Password = 'masterkey'
    AutoReplicate.Frequency = 30
    AutoReplicate.Enabled = False
    AutoCommit.Frequency = 30
    AutoCommit.CommitType = ctCommit
    CommitOnFinished = ctCommit
    AbortOnError = False
    OnRowReplicated = CcReplicator1RowReplicated
    OnReplicationError = CcReplicator2ReplicationError
    OnException = CcReplicator1Exception
    OnGenReplError = CcReplicator1GenReplError
    Version = '3.9.4'
    KeepRowsInLog = False
    Left = 224
    Top = 160
  end
  object CcReplicator2: TCcReplicator
    TrackInconsistentDeletes = False
    MergeChangedFieldsOnConflict = False
    Direction = sdBoth
    ReplicateOnlyChangedFields = False
    AutoClearMetadata = True
    FailIfNoPK = False
    TrimCharFields = False
    AutoPriority = True
    HarmonizeFields = False
    KeepConnection = False
    AutoReplicate.Frequency = 30
    AutoReplicate.Enabled = False
    AutoCommit.Frequency = 30
    AutoCommit.CommitType = ctNone
    CommitOnFinished = ctNone
    AbortOnError = False
    OnReplicationError = CcReplicator2ReplicationError
    Version = '3.9.4'
    KeepRowsInLog = False
    Left = 464
    Top = 352
  end
end
