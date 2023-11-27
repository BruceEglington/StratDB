object ISFAddGISLink: TISFAddGISLink
  Left = 0
  Top = 0
  Width = 800
  Height = 600
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'StratDB'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWDBEdit1: TIWDBEdit
    Left = 242
    Top = 108
    Width = 73
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'UNITID'
    DataSource = dmStrat.dsStratMaps
    PasswordPrompt = False
  end
  object iwbReturn: TIWButton
    Left = 102
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    Left = 104
    Top = 110
    Width = 40
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Unit ID'
  end
  object IWLabel2: TIWLabel
    Left = 104
    Top = 136
    Width = 25
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Map'
  end
  object iwbCancelUpdates: TIWButton
    Left = 432
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Cancel Updates'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancelUpdates'
    TabOrder = 1
    OnClick = iwbCancelUpdatesClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 545
    Align = alLeft
    ZIndex = 1
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
    ExplicitHeight = 350
  end
  object iwDBlcbLink: TIWDBLookupComboBox
    Left = 242
    Top = 135
    Width = 365
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NonEditableAsLabel = True
    TabOrder = 3
    AutoEditable = True
    DataField = 'MAPID2'
    DataSource = dmStrat.dsStratMaps
    FriendlyName = 'iwDBlcbLink'
    KeyField = 'MAPID2'
    ListField = 'MAPNAME'
    ListSource = dmStrat.dsMaps
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwDBnLink: TIWDBNavigator
    Left = 104
    Top = 314
    Width = 150
    Height = 28
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmStrat.dsStratMaps
    FriendlyName = 'iwDBnLink'
    ImageHeight = 24
    ImageWidth = 24
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert]
    Orientation = orHorizontal
    OnInsert = iwDBnLinkInsert
  end
  object iwDBgLink: TIWDBGrid
    Left = 104
    Top = 348
    Width = 665
    Height = 221
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    CellPadding = 0
    CellSpacing = 0
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = True
    UseSize = True
    ScrollToCurrentRow = False
    Columns = <
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'MAPID2'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Map ID'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'DISPLAYORDER'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Order'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'MAPNAME'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Map Name'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'GISSTR'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'GIS ID (string)'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taRightJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Segoe UI'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'GISINT'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'GIS ID (integer)'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmStrat.dsStratMaps
    FooterRowCount = 0
    FriendlyName = 'iwDBgLink'
    FromStart = True
    HighlightColor = clNone
    HighlightRows = False
    Options = [dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 0
    RollOver = True
    RowClick = False
    RollOverColor = clWebLIGHTGOLDENRODYELLOW
    RowHeaderColor = clWebCADETBLUE
    RowAlternateColor = clNone
    RowCurrentColor = clWebYELLOW
  end
  object iwbDeleteLink: TIWButton
    Left = 542
    Top = 72
    Width = 145
    Height = 25
    Caption = 'Delete Current Record'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDeleteLink'
    TabOrder = 4
    OnClick = iwbDeleteLinkClick
  end
  object iwbEdit: TIWButton
    Left = 212
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbEdit'
    TabOrder = 5
    OnClick = iwbEditClick
  end
  object iwbApplyUpdates: TIWButton
    Left = 322
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Apply Updates'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbApplyUpdates'
    TabOrder = 6
    OnClick = iwbApplyUpdatesClick
  end
  object IWLabel3: TIWLabel
    Left = 102
    Top = 194
    Width = 92
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'GIS ID (integer)'
  end
  object IWDBEdit2: TIWDBEdit
    Left = 242
    Top = 195
    Width = 73
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 7
    AutoEditable = True
    DataField = 'GISINT'
    DataSource = dmStrat.dsStratMaps
    PasswordPrompt = False
  end
  object IWLabel4: TIWLabel
    Left = 102
    Top = 222
    Width = 84
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'GIS ID (string)'
  end
  object IWDBEdit3: TIWDBEdit
    Left = 242
    Top = 223
    Width = 73
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = True
    DataField = 'GISSTR'
    DataSource = dmStrat.dsStratMaps
    PasswordPrompt = False
  end
  object IWMemo1: TIWMemo
    Left = 330
    Top = 195
    Width = 285
    Height = 49
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 8
    Font.Style = []
    InvisibleBorder = True
    HorizScrollBar = False
    VertScrollBar = False
    Required = False
    TabOrder = 9
    SubmitOnAsyncEvent = True
    FriendlyName = 'IWMemo1'
    Lines.Strings = (
      
        'Normally only one or the other applies. Enter a value for whiche' +
        'ver applies.')
  end
  object IWLabel5: TIWLabel
    Left = 102
    Top = 166
    Width = 80
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Display order'
  end
  object IWDBEdit4: TIWDBEdit
    Left = 242
    Top = 167
    Width = 27
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 10
    AutoEditable = True
    DataField = 'DISPLAYORDER'
    DataSource = dmStrat.dsStratMaps
    PasswordPrompt = False
  end
  object IWLabel6: TIWLabel
    Left = 104
    Top = 251
    Width = 77
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Incl. for  map'
  end
  object IWDBLookupComboBox1: TIWDBLookupComboBox
    Left = 242
    Top = 250
    Width = 207
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NonEditableAsLabel = True
    TabOrder = 11
    AutoEditable = True
    DataField = 'INCL4MAP'
    DataSource = dmStrat.dsStratMaps
    FriendlyName = 'iwDBlcbLink'
    KeyField = 'YESNOID'
    ListField = 'YESNO'
    ListSource = dmStrat.dsYesNo
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 800
    Height = 55
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 55
    Constraints.MinHeight = 55
    Constraints.MinWidth = 600
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 800
    inherited IWFrameRegion: TIWRegion
      Width = 800
      TabOrder = 12
      ExplicitWidth = 800
      inherited iwrHeader: TIWRegion
        Width = 800
        ExplicitWidth = 800
        inherited iwrWelcome: TIWRegion
          Width = 800
          ExplicitWidth = 800
          inherited iwrDisplayUserName: TIWRegion
            Width = 600
            ExplicitWidth = 600
            inherited lblWelcome: TIWLabel
              Left = 327
              ExplicitLeft = 327
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 800
          ExplicitWidth = 800
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
