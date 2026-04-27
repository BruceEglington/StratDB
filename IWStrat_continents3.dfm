object ISFContinents: TISFContinents
  Left = 0
  Top = 0
  Width = 800
  Height = 600
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  RenderInvisibleControls = True
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  PixelsPerInch = 120
  DesignLeft = 2
  DesignTop = 2
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 69
    Width = 104
    Height = 531
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    ZIndex = 1
    Font.PxSize = 13
    Font.Color = clWebBLACK
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
    ExplicitTop = 71
  end
  object iwbClose: TIWButton
    AlignWithMargins = False
    Left = 128
    Top = 77
    Width = 93
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Close'
    Color = clWebLIGHTGREEN
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbClose'
    OnClick = iwbCloseClick
  end
  object iwbDownload: TIWButton
    AlignWithMargins = False
    Left = 245
    Top = 77
    Width = 161
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Download to Excel'
    Color = clBtnFace
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbDownload'
    TabOrder = 1
    OnClick = iwbDownloadClick
  end
  object iwbApplyUpdates: TIWButton
    AlignWithMargins = False
    Left = 423
    Top = 77
    Width = 161
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Visible = False
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbApplyUpdates'
    TabOrder = 4
    OnClick = iwbApplyUpdatesClick
  end
  object iwbCancelUpdates: TIWButton
    AlignWithMargins = False
    Left = 500
    Top = 102
    Width = 161
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Visible = False
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbCancelUpdates'
    TabOrder = 6
    OnClick = iwbCancelUpdatesClick
  end
  object iwbAddNew: TIWButton
    AlignWithMargins = False
    Left = 634
    Top = 77
    Width = 166
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Visible = False
    Caption = 'Add New'
    Color = clWebLIGHTSKYBLUE
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbAddNew'
    TabOrder = 7
  end
  object iwlNextPage: TIWLink
    AlignWithMargins = False
    Left = 284
    Top = 112
    Width = 81
    Height = 21
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    Font.PxSize = 12
    Font.Color = clWebBLUE
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlNextPage'
    OnClick = iwlNextPageClick
    TabOrder = 3
    RawText = False
    Caption = 'Next page'
  end
  object iwlSortedBy: TIWLabel
    AlignWithMargins = False
    Left = 644
    Top = 116
    Width = 137
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Alignment = taRightJustify
    Font.FontName = 'Arial'
    Font.Size = 8
    Font.Style = [fsItalic]
    Font.PxSize = 10
    HasTabOrder = False
    FriendlyName = 'iwlSortedBy'
    Caption = 'Sorted as specified in query'
  end
  object iwlPrevPage: TIWLink
    AlignWithMargins = False
    Left = 128
    Top = 116
    Width = 122
    Height = 21
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsUnderline]
    Font.PxSize = 12
    Font.Color = clWebBLUE
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlPrevPage'
    OnClick = iwlPrevPageClick
    TabOrder = 2
    RawText = False
    Caption = 'Previous page'
  end
  object iwDBg: TIWDBGrid
    AlignWithMargins = False
    Left = 126
    Top = 159
    Width = 674
    Height = 353
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    Caption = 'iwDBg'
    CellPadding = 0
    CellSpacing = 0
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = True
    UseSize = True
    ShowEmptyCells = True
    ShowInvisibleRows = True
    ScrollToCurrentRow = False
    Columns = <>
    DataSource = dmStrat.dsContinents
    FooterRowCount = 0
    FriendlyName = 'iwDBg'
    FromStart = True
    HighlightColor = clNone
    HighlightRows = False
    Options = [dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 0
    RollOver = False
    RowClick = False
    RollOverColor = clNone
    RowHeaderColor = clNone
    RowAlternateColor = clNone
    RowCurrentColor = clNone
  end
  object IWDBEdit1: TIWDBEdit
    AlignWithMargins = False
    Left = 190
    Top = 563
    Width = 200
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'IWDBEdit1'
    MaxLength = 3
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'CONTINENTID'
    DataSource = dmStrat.dsContinents
    PasswordPrompt = False
  end
  object IWDBEdit2: TIWDBEdit
    AlignWithMargins = False
    Left = 500
    Top = 563
    Width = 200
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'IWDBEdit1'
    MaxLength = 20
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'CONTINENT'
    DataSource = dmStrat.dsContinents
    PasswordPrompt = False
  end
  object IWDBNavigator1: TIWDBNavigator
    AlignWithMargins = False
    Left = 300
    Top = 520
    Width = 300
    Height = 35
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmStrat.dsContinents
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 24
    ImageWidth = 24
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Orientation = orHorizontal
  end
  object IWButton1: TIWButton
    AlignWithMargins = False
    Left = 360
    Top = 116
    Width = 150
    Height = 38
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'IWButton1'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
    OnClick = IWButton1Click
  end
  object IWButton2: TIWButton
    AlignWithMargins = False
    Left = 661
    Top = 520
    Width = 120
    Height = 30
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'IWButton2'
    Color = clBtnFace
    FriendlyName = 'IWButton2'
    OnClick = IWButton2Click
  end
  object IWButton3: TIWButton
    AlignWithMargins = False
    Left = 128
    Top = 525
    Width = 120
    Height = 30
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'IWButton3'
    Color = clBtnFace
    FriendlyName = 'IWButton2'
    OnClick = IWButton3Click
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 800
    Height = 69
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 69
    Constraints.MinHeight = 69
    Constraints.MinWidth = 750
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 800
    inherited IWFrameRegion: TIWRegion
      Width = 800
      TabOrder = 5
      ExplicitWidth = 800
      inherited iwrHeader: TIWRegion
        Width = 800
        ExplicitWidth = 800
        inherited iwrWelcome: TIWRegion
          Width = 800
          ExplicitWidth = 800
          inherited iwrDisplayUserName: TIWRegion
            Width = 550
            ExplicitWidth = 550
            inherited lblWelcome: TIWLabel
              Left = -182
              Width = 59
              Height = 14
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 559
              ExplicitWidth = 59
              ExplicitHeight = 14
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 800
          ExplicitWidth = 800
          inherited iwlSignOut: TIWLink
            Font.Color = clWebBLUE
          end
          inherited lnkSignIn: TIWLink
            Font.Color = clWebBLUE
          end
          inherited lblProgTitle: TIWLabel
            Width = 338
            Height = 24
            Font.Color = clWebSTEELBLUE
            ExplicitWidth = 338
            ExplicitHeight = 24
          end
        end
      end
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode, evItems, evCache]
    FetchOptions.Mode = fmAll
    FetchOptions.Items = []
    FetchOptions.Cache = []
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 672
    Top = 168
    object FDMemTable1ContinentID: TStringField
      FieldName = 'ContinentID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object FDMemTable1Continent: TStringField
      FieldName = 'Continent'
      Size = 50
    end
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
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      'DriverUnit=DbxDevartInterBase'
      'UseUnicode=true'
      'Charset=UTF8')
    Left = 14
    Top = 138
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcStrat
    Left = 46
    Top = 138
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
    Left = 20
    Top = 188
  end
  object dspContinents: TDataSetProvider
    DataSet = qContinents
    Options = [poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 48
    Top = 188
  end
  object cdsContinents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContinents'
    Left = 76
    Top = 188
    object cdsContinentsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsContinentsCONTINENT: TWideStringField
      FieldName = 'CONTINENT'
      Required = True
      FixedChar = True
    end
    object cdsContinentsLANGUAGEID: TWideStringField
      FieldName = 'LANGUAGEID'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsContinentsHASDATA: TWideStringField
      FieldName = 'HASDATA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
    end
  end
  object dsContinents: TDataSource
    DataSet = cdsContinents
    Left = 104
    Top = 188
  end
end
