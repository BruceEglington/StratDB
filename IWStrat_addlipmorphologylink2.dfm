object ISFAddLIPMorphologyLink2: TISFAddLIPMorphologyLink2
  Left = 0
  Top = 0
  Width = 720
  Height = 435
  OnRender = IWAppFormRender
  ConnectionMode = cmAny
  SupportedBrowsers = [brIE, brNetscape7, brOpera, brSafari, brNetscape6]
  OnCreate = IWAppFormCreate
  AllowPageAccess = True
  BrowserSecurityCheck = True
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object IWDBEdit1: TIWDBEdit
    Left = 240
    Top = 107
    Width = 73
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = True
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'IWDBEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 2
    AutoEditable = False
    DataField = 'LIPID'
    PasswordPrompt = False
    DataSource = dmLIP.dsLIPForm
  end
  object iwbReturn: TIWButton
    Left = 102
    Top = 72
    Width = 104
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Return'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    ScriptEvents = <>
    TabOrder = 0
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    Left = 104
    Top = 110
    Width = 36
    Height = 15
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'IWLabel1'
    Caption = 'LIP ID'
    RawText = False
  end
  object IWLabel2: TIWLabel
    Left = 104
    Top = 136
    Width = 34
    Height = 15
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'IWLabel2'
    Caption = 'Order'
    RawText = False
  end
  object iwbCancelUpdates: TIWButton
    Left = 440
    Top = 72
    Width = 104
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Cancel Updates'
    DoSubmitValidation = True
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancelUpdates'
    ScriptEvents = <>
    TabOrder = 1
    OnClick = iwbCancelUpdatesClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 380
    Cursor = crAuto
    Align = alLeft
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1
    RenderSize = True
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Color = clNone
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
    ExplicitHeight = 350
  end
  object iwbDeleteLink: TIWButton
    Left = 560
    Top = 72
    Width = 145
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Delete Current Record'
    DoSubmitValidation = True
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDeleteLink'
    ScriptEvents = <>
    TabOrder = 4
    OnClick = iwbDeleteLinkClick
  end
  object iwbEdit: TIWButton
    Left = 216
    Top = 72
    Width = 104
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Edit'
    DoSubmitValidation = True
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbEdit'
    ScriptEvents = <>
    TabOrder = 5
    OnClick = iwbEditClick
  end
  object iwbApplyUpdates: TIWButton
    Left = 326
    Top = 72
    Width = 104
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Apply Updates'
    DoSubmitValidation = True
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbApplyUpdates'
    ScriptEvents = <>
    TabOrder = 6
    OnClick = iwbApplyUpdatesClick
  end
  object iwDBeOrder: TIWDBEdit
    Left = 240
    Top = 133
    Width = 25
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = True
    Editable = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FriendlyName = 'iwDBeOrder'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 7
    AutoEditable = False
    DataField = 'LIPFORMORDER'
    PasswordPrompt = False
    DataSource = dmLIP.dsLIPForm
  end
  object IWLabel3: TIWLabel
    Left = 104
    Top = 164
    Width = 69
    Height = 15
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'IWLabel2'
    Caption = 'Morphology'
    RawText = False
  end
  object iwbClose: TIWButton
    Left = 632
    Top = 160
    Width = 75
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Close'
    DoSubmitValidation = True
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbClose'
    ScriptEvents = <>
    TabOrder = 8
    OnClick = iwbCloseClick
  end
  object IiwbOpen: TIWButton
    Left = 632
    Top = 204
    Width = 75
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Open'
    DoSubmitValidation = True
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IiwbOpen'
    ScriptEvents = <>
    TabOrder = 9
    OnClick = iwbOpenClick
  end
  object iwDBlcbMorphology: TIWDBLookupComboBox
    Left = 240
    Top = 160
    Width = 304
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = True
    ScriptEvents = <>
    UseSize = True
    Style = stNormal
    ButtonColor = clBtnFace
    DoSubmitValidation = True
    Editable = True
    NonEditableAsLabel = True
    TabOrder = 10
    AutoEditable = False
    DataField = 'LIPFORMID'
    DataSource = dmLIP.dsLIPForm
    FriendlyName = 'iwDBlcbMorphology'
    KeyField = 'LIPFORMID'
    ListField = 'LIPFORMTYPE'
    ListSource = dmLIP.dsLIPForms
    DisableWhenEmpty = True
  end
  object iwbEditable: TIWButton
    Left = 630
    Top = 235
    Width = 75
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'iwbEditable'
    DoSubmitValidation = True
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbEditable'
    ScriptEvents = <>
    TabOrder = 11
    OnClick = iwbEditableClick
  end
  object iwDBnLink: TIWDBNavigator
    Left = 104
    Top = 246
    Width = 150
    Height = 28
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmLIP.dsLIPForm
    FriendlyName = 'iwDBnLink'
    ImageHeight = 24
    ImageWidth = 24
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert]
    Orientation = orHorizontal
    OnInsert = iwDBnLinkInsert
  end
  object iwDBgLink: TIWDBGrid
    Left = 104
    Top = 280
    Width = 601
    Height = 150
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    CellPadding = 0
    CellSpacing = 0
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = True
    UseSize = True
    ScrollToCurrentRow = False
    Columns = <
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'LIPFORMORDER'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.Text = 'Order'
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
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'LIPFORMID'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.Text = 'ID'
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
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        Header = False
        Height = '0'
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'LIPFORMTYPE'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.Text = 'Morphology'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmLIP.dsLIPForm
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
    TabOrder = -1
  end
  object IWDBLabel1: TIWDBLabel
    Left = 532
    Top = 140
    Width = 69
    Height = 16
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    DataField = 'LIPFORMID'
    DataSource = dmLIP.dsLIPForm
    FriendlyName = 'IWDBLabel1'
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 720
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
    ExplicitWidth = 720
    inherited IWFrameRegion: TIWRegion
      Width = 720
      TabOrder = 3
      ExplicitWidth = 720
      inherited iwrHeader: TIWRegion
        Width = 720
        ExplicitWidth = 720
        inherited iwrWelcome: TIWRegion
          Width = 720
          ExplicitWidth = 720
          inherited iwrDisplayUserName: TIWRegion
            Width = 520
            ExplicitLeft = 200
            ExplicitWidth = 520
            inherited lblWelcome: TIWLabel
              Left = 391
              Width = 64
              Alignment = taRightJustify
              ExplicitLeft = 419
              ExplicitWidth = 64
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 720
          ExplicitWidth = 720
        end
      end
    end
  end
end