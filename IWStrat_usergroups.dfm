object ISFUserGroups: TISFUserGroups
  Left = 0
  Top = 0
  Width = 716
  Height = 600
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
  object IWDBNavigator1: TIWDBNavigator
    Left = 229
    Top = 70
    Width = 108
    Height = 29
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1
    RenderSize = False
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
  end
  object IWDBEdit1: TIWDBEdit
    Left = 117
    Top = 110
    Width = 121
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
    Editable = True
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
    AutoEditable = True
    DataField = 'GROUPING'
    PasswordPrompt = False
  end
  object iwbReturn: TIWButton
    Left = 5
    Top = 74
    Width = 98
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
    TabOrder = 7
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    Left = 32
    Top = 112
    Width = 53
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
    Caption = 'Group ID'
    RawText = False
  end
  object IWLabel4: TIWLabel
    Left = 32
    Top = 142
    Width = 64
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
    Caption = 'Expiry date'
    RawText = False
  end
  object IWDBEdit2: TIWDBEdit
    Left = 117
    Top = 138
    Width = 121
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
    Editable = True
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
    TabOrder = 3
    AutoEditable = True
    DataField = 'EXPIRYDATE'
    PasswordPrompt = False
  end
  object iwbSaveChanges: TIWButton
    Left = 347
    Top = 74
    Width = 98
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Save changes'
    DoSubmitValidation = True
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    ScriptEvents = <>
    TabOrder = 4
    OnClick = iwbSaveChangesClick
  end
  object iwbCancelChanges: TIWButton
    Left = 461
    Top = 74
    Width = 98
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Cancel changes'
    DoSubmitValidation = True
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    ScriptEvents = <>
    TabOrder = 5
    OnClick = iwbCancelChangesClick
  end
  object iwbDelete: TIWButton
    Left = 576
    Top = 75
    Width = 98
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Delete'
    Confirmation = 'Are you sure you want to delete this record?'
    DoSubmitValidation = True
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDelete'
    ScriptEvents = <>
    TabOrder = 6
    OnClick = iwbDeleteClick
  end
  object iwbEdit: TIWButton
    Left = 119
    Top = 74
    Width = 98
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
    TabOrder = 0
    OnClick = iwbEditClick
  end
  object iwlPrevPage: TIWLink
    Left = 32
    Top = 183
    Width = 97
    Height = 17
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = False
    FriendlyName = 'iwlPrevPage'
    OnClick = iwlPrevPageClick
    TabOrder = 8
    RawText = False
    Caption = 'Previous page'
  end
  object iwlNextPage: TIWLink
    Left = 158
    Top = 183
    Width = 65
    Height = 17
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = False
    FriendlyName = 'iwlNextPage'
    OnClick = iwlNextPageClick
    TabOrder = 9
    RawText = False
    Caption = 'Next page'
  end
  object iwDBg: TIWDBGrid
    Left = 32
    Top = 200
    Width = 553
    Height = 407
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
    Font.Size = 9
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = False
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
        DataField = 'GROUPING'
        OnTitleClick = iwDBgColumns0TitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.Text = 'User-defined Group'
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
        DataField = 'USERNAMEID'
        OnTitleClick = iwDBgColumns0TitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.Text = 'User ID'
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
        DataField = 'EXPIRYDATE'
        OnTitleClick = iwDBgColumns0TitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Header = False
        Title.Height = '0'
        Title.Text = 'Expiry Date'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmOpt.dsUserFor
    FooterRowCount = 0
    FriendlyName = 'iwDBg'
    FromStart = False
    HighlightColor = clNone
    HighlightRows = False
    Options = [dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 20
    RollOver = True
    RowClick = False
    RollOverColor = clWebPALEGOLDENROD
    RowHeaderColor = clWebLIGHTSTEELBLUE
    RowAlternateColor = clNone
    RowCurrentColor = clWebYELLOW
    TabOrder = -1
  end
  object iwlSortedBy: TIWLabel
    Left = 446
    Top = 186
    Width = 137
    Height = 14
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taRightJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 8
    Font.Style = [fsItalic]
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'iwlSortedBy'
    Caption = 'Sorted as specified in query'
    RawText = False
  end
  object IWLabel2: TIWLabel
    Left = 252
    Top = 142
    Width = 77
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
    Caption = '(dd/mm/yyyy)'
    RawText = False
  end
  object iwbNew: TIWButton
    Left = 576
    Top = 138
    Width = 98
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'New'
    DoSubmitValidation = True
    Color = clWebLIGHTSEAGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDelete'
    ScriptEvents = <>
    TabOrder = 10
    OnClick = iwbNewClick
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 716
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
    ExplicitWidth = 716
    inherited IWFrameRegion: TIWRegion
      Width = 716
      TabOrder = 11
      ExplicitWidth = 716
      inherited iwrHeader: TIWRegion
        Width = 716
        ExplicitWidth = 716
        inherited iwrWelcome: TIWRegion
          Width = 716
          ExplicitWidth = 716
          inherited iwrDisplayUserName: TIWRegion
            Width = 516
            ExplicitLeft = 200
            ExplicitWidth = 516
            inherited lblWelcome: TIWLabel
              Left = 243
              Top = 0
              Width = 64
              Alignment = taRightJustify
              ExplicitLeft = 374
              ExplicitTop = 0
              ExplicitWidth = 64
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 716
          ExplicitWidth = 716
        end
      end
    end
  end
end