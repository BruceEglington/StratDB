object dmStratRB: TdmStratRB
  OldCreateOrder = False
  Left = 1
  Top = 106
  Height = 359
  Width = 517
  object sqlcRBStrat: TSQLConnection
    Connected = True
    ConnectionName = 'IGCP509_Local'
    DriverName = 'UIBFirebird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpuibfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIBFirebird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=c:\data\firebird\igcp509.fdb'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=1'
      'Firebird15 TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'fbclient.DLL'
    Left = 24
    Top = 20
  end
  object ppReport1: TppReport
    AutoStop = False
    ColumnPositions.Strings = (
      '6350'
      '105000')
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Deposit Summary'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Dev\StratDB\StratDB_summary_test.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalPreview = False
    Left = 260
    Top = 24
    Version = '6.03'
    mmColumnWidth = 98650
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        ReprintOnOverFlow = True
        Caption = 'Heirarchical Summary of Stratigraphic Units'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5842
        mmLeft = 50150
        mmTop = 1588
        mmWidth = 103971
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 14552
        mmWidth = 191030
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 14288
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Unit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic, fsUnderline]
        Transparent = True
        mmHeight = 3175
        mmLeft = 7144
        mmTop = 20902
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic, fsUnderline]
        Transparent = True
        mmHeight = 3175
        mmLeft = 114829
        mmTop = 21167
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Unit code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 149754
        mmTop = 20638
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Sort ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 183611
        mmTop = 20373
        mmWidth = 9271
        BandType = 0
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 265
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 19315
      mmPrintPosition = 0
      object ppRegion1: TppRegion
        UserName = 'Region1'
        KeepTogether = True
        Caption = 'Region1'
        Pen.Style = psClear
        Stretch = True
        mmHeight = 5027
        mmLeft = 1852
        mmTop = 0
        mmWidth = 192088
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'APPROVALSTATUS'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3260
          mmLeft = 100923
          mmTop = 0
          mmWidth = 36449
          BandType = 4
        end
        object ppDBText2: TppDBText
          UserName = 'DBtName1'
          DataField = 'UNITID'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 147902
          mmTop = 0
          mmWidth = 15346
          BandType = 4
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'AGEYEARS'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3175
          mmLeft = 174096
          mmTop = 0
          mmWidth = 19315
          BandType = 4
        end
      end
      object ppDBtName: TppDBText
        UserName = 'DBtName'
        AutoSize = True
        DataField = 'UNITNAME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3260
        mmLeft = 5027
        mmTop = 0
        mmWidth = 12404
        BandType = 4
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        KeepTogether = True
        Caption = 'Region2'
        Pen.Style = psClear
        Stretch = True
        mmHeight = 11642
        mmLeft = 2117
        mmTop = 5027
        mmWidth = 192088
        BandType = 4
        mmBottomOffset = 2000
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Style = psDot
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 2000
        mmTop = 11906
        mmWidth = 191030
        BandType = 4
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Stratigraphy Database (StratDB)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 153437
        mmTop = 2646
        mmWidth = 40767
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Saskatchewan Isotope Laboratory'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 157416
        mmTop = 6085
        mmWidth = 36788
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Canada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 185654
        mmTop = 9260
        mmWidth = 8551
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 3969
        mmWidth = 1588
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Bruce Eglington 2006'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 3969
        mmTop = 2646
        mmWidth = 21675
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 1323
        mmWidth = 191030
        BandType = 8
      end
    end
  end
  object Query1: TSQLQuery
    Active = True
    NoMetadata = True
    ObjectView = True
    SQLConnection = sqlcRBStrat
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
      'AND STRATUNITS.UNITID=APPLICLINK.UNITID'
      'and STRATUNITS.UNITID <> 0'
      'and STRATUNITS.UNITID < 7'
      'and APPLICLINK.APPLICATIONID=1')
    Left = 56
    Top = 82
    object Query1UNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Query1COUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object Query1UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object Query1PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object Query1RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object Query1AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
    object Query1MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object Query1MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object Query1AGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 6
    end
    object Query1UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object Query1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object Query1APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Query1APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
  end
  object dspQuery1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 110
    Top = 82
  end
  object cdsQuery1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1'
    ReadOnly = True
    Left = 138
    Top = 82
    object cdsQuery1UNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    Left = 166
    Top = 82
  end
  object qList1: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcRBStrat
    Params = <
      item
        DataType = ftInteger
        Name = 'PARENTID'
        ParamType = ptInput
        Size = 4
        Value = '57'
      end>
    SQL.Strings = (
      'select DISTINCT STRATUNITS.AGEYEARS, STRATUNITS.UNITID, '
      '  STRATUNITS.UNITNAME, STRATUNITS.RANKID, '
      '  STRATUNITS.PARENTID, '
      '  STRATUNITS.APPROVALID,'
      '  RANKS.RANKID,  RANKS.UNITRANK,'
      '  APPROVALSTATUS.APPROVALID,  '
      '  APPROVALSTATUS.APPROVALSTATUS,'
      '  STRATUNITS.UNITNAME  as UNAME'
      'from STRATUNITS, APPROVALSTATUS, RANKS'
      'where STRATUNITS.AGEYEARS<4600000000'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'and STRATUNITS.RANKID = RANKS.RANKID'
      'and STRATUNITS.PARENTID = :ParentID')
    Left = 60
    Top = 132
    object qList1AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qList1UNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qList1UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qList1RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object qList1PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qList1APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qList1UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object qList1APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object qList1UNAME: TStringField
      FieldName = 'UNAME'
      Required = True
      Size = 50
    end
  end
  object dspList1: TDataSetProvider
    DataSet = qList1
    Constraints = True
    Left = 116
    Top = 136
  end
  object dsqQuery1: TDataSource
    DataSet = Query1
    Left = 84
    Top = 84
  end
  object cdsList1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspList1'
    ReadOnly = True
    Left = 144
    Top = 136
  end
  object dsList1: TDataSource
    DataSet = cdsList1
    Left = 172
    Top = 136
  end
  object PsRBExportPDF1: TPsRBExportPDF
    ShowProgress = False
    ShowSetupDialog = False
    EncryptionLevel = el40Bit
    Left = 336
    Top = 28
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsqQuery1
    UserName = 'DBPipeline1'
    Left = 244
    Top = 84
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNITID'
      FieldName = 'UNITID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'COUNTRYID'
      FieldName = 'COUNTRYID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'UNITNAME'
      FieldName = 'UNITNAME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARENTID'
      FieldName = 'PARENTID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'RANKID'
      FieldName = 'RANKID'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGEYEARS'
      FieldName = 'AGEYEARS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'MINAGE'
      FieldName = 'MINAGE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAXAGE'
      FieldName = 'MAXAGE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'AGEUNITS'
      FieldName = 'AGEUNITS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'UNITRANK'
      FieldName = 'UNITRANK'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'COUNTRY'
      FieldName = 'COUNTRY'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'APPROVALID'
      FieldName = 'APPROVALID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'APPROVALSTATUS'
      FieldName = 'APPROVALSTATUS'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
  end
  object dsqList1: TDataSource
    DataSet = qList1
    Left = 88
    Top = 136
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = dsqList1
    UserName = 'DBPipeline2'
    Left = 248
    Top = 136
    object ppDBPipeline2ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGEYEARS'
      FieldName = 'AGEYEARS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline2ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNITID'
      FieldName = 'UNITID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'UNITNAME'
      FieldName = 'UNITNAME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline2ppField4: TppField
      FieldAlias = 'RANKID'
      FieldName = 'RANKID'
      FieldLength = 5
      DisplayWidth = 5
      Position = 3
    end
    object ppDBPipeline2ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARENTID'
      FieldName = 'PARENTID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline2ppField6: TppField
      FieldAlias = 'APPROVALID'
      FieldName = 'APPROVALID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object ppDBPipeline2ppField7: TppField
      FieldAlias = 'UNITRANK'
      FieldName = 'UNITRANK'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object ppDBPipeline2ppField8: TppField
      FieldAlias = 'APPROVALSTATUS'
      FieldName = 'APPROVALSTATUS'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBPipeline2ppField9: TppField
      FieldAlias = 'UNAME'
      FieldName = 'UNAME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
  end
  object qList2: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcRBStrat
    DataSource = dsqList1
    Params = <
      item
        DataType = ftInteger
        Name = 'PARENTID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select DISTINCT STRATUNITS.AGEYEARS, STRATUNITS.UNITID, '
      '  STRATUNITS.UNITNAME, STRATUNITS.RANKID, '
      '  STRATUNITS.PARENTID, '
      '  STRATUNITS.APPROVALID,'
      '  RANKS.RANKID,  RANKS.UNITRANK,'
      '  APPROVALSTATUS.APPROVALID,  '
      '  APPROVALSTATUS.APPROVALSTATUS,'
      '  STRATUNITS.UNITNAME  as UNAME'
      'from STRATUNITS, APPROVALSTATUS, RANKS'
      'where STRATUNITS.AGEYEARS<4600000000'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'and STRATUNITS.RANKID = RANKS.RANKID'
      'and STRATUNITS.PARENTID = :ParentID')
    Left = 64
    Top = 192
    object qList2AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
    object qList2UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qList2UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qList2RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object qList2PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qList2APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qList2UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object qList2APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object qList2UNAME: TStringField
      FieldName = 'UNAME'
      Required = True
      Size = 50
    end
  end
  object dsqList2: TDataSource
    DataSet = qList2
    Left = 92
    Top = 192
  end
  object qList3: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlcRBStrat
    DataSource = dsqList2
    Params = <
      item
        DataType = ftInteger
        Name = 'PARENTID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select DISTINCT STRATUNITS.AGEYEARS, STRATUNITS.UNITID, '
      '  STRATUNITS.UNITNAME, STRATUNITS.RANKID, '
      '  STRATUNITS.PARENTID, '
      '  STRATUNITS.APPROVALID,'
      '  RANKS.RANKID,  RANKS.UNITRANK,'
      '  APPROVALSTATUS.APPROVALID,  '
      '  APPROVALSTATUS.APPROVALSTATUS,'
      '  STRATUNITS.UNITNAME  as UNAME'
      'from STRATUNITS, APPROVALSTATUS, RANKS'
      'where STRATUNITS.AGEYEARS<4600000000'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'and STRATUNITS.RANKID = RANKS.RANKID'
      'and STRATUNITS.PARENTID = :ParentID')
    Left = 60
    Top = 252
    object qList3AGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
    end
    object qList3UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object qList3UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qList3RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object qList3PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qList3APPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qList3UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object qList3APPROVALSTATUS: TStringField
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object qList3UNAME: TStringField
      FieldName = 'UNAME'
      Required = True
      Size = 50
    end
  end
  object dsqList3: TDataSource
    DataSet = qList3
    Left = 88
    Top = 252
  end
  object ppDBPipeline3: TppDBPipeline
    DataSource = dsqList2
    UserName = 'DBPipeline3'
    Left = 252
    Top = 192
    MasterDataPipelineName = 'ppDBPipeline2'
    object ppDBPipeline3ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGEYEARS'
      FieldName = 'AGEYEARS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline3ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNITID'
      FieldName = 'UNITID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline3ppField3: TppField
      FieldAlias = 'UNITNAME'
      FieldName = 'UNITNAME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline3ppField4: TppField
      FieldAlias = 'RANKID'
      FieldName = 'RANKID'
      FieldLength = 5
      DisplayWidth = 5
      Position = 3
    end
    object ppDBPipeline3ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARENTID'
      FieldName = 'PARENTID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline3ppField6: TppField
      FieldAlias = 'APPROVALID'
      FieldName = 'APPROVALID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object ppDBPipeline3ppField7: TppField
      FieldAlias = 'UNITRANK'
      FieldName = 'UNITRANK'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object ppDBPipeline3ppField8: TppField
      FieldAlias = 'APPROVALSTATUS'
      FieldName = 'APPROVALSTATUS'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBPipeline3ppField9: TppField
      FieldAlias = 'UNAME'
      FieldName = 'UNAME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
  end
  object ppDBPipeline4: TppDBPipeline
    DataSource = dsqList3
    UserName = 'DBPipeline4'
    Left = 252
    Top = 248
    MasterDataPipelineName = 'ppDBPipeline3'
  end
end
