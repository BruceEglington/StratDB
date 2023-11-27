object ISFAddEconomicFeatureLink: TISFAddEconomicFeatureLink
  Left = 0
  Top = 0
  Width = 900
  Height = 700
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
    Left = 212
    Top = 110
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
    DataField = 'DOMAINID'
    DataSource = dmStrat.dsDomainDeposits
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
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Domain ID'
  end
  object IWLabel2: TIWLabel
    Left = 104
    Top = 136
    Width = 47
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Deposit'
  end
  object iwbCancelUpdates: TIWButton
    Left = 566
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
    Height = 645
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
  object iwDBlcbDeposit: TIWDBLookupComboBox
    Left = 212
    Top = 137
    Width = 365
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'SBDEPOSITID'
    DataSource = dmStrat.dsDomainDeposits
    FriendlyName = 'iwDBlcbDeposit'
    KeyField = 'SDBDEPOSITID'
    ListField = 'DEPOSITNAME'
    ListSource = dmStrat.dsDeposits
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwDBnLink: TIWDBNavigator
    Left = 104
    Top = 178
    Width = 150
    Height = 28
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmStrat.dsDomainDeposits
    FriendlyName = 'iwDBnLink'
    ImageHeight = 24
    ImageWidth = 24
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert]
    Orientation = orHorizontal
    OnInsert = iwDBnLinkInsert
  end
  object iwDBgLink: TIWDBGrid
    Left = 104
    Top = 212
    Width = 723
    Height = 437
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
        Font.FontName = 'Arial'
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
        DataField = 'SBDEPOSITID'
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
        Title.Text = 'Dep. ID'
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
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'DEPOSITCLAN'
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
        Title.Text = 'Deposit Clan'
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
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'DEPOSITNAME'
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
        Title.Text = 'Deposit Name'
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
        Font.FontName = 'Arial'
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
        DataField = 'APPROXAGE'
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
        Title.Text = 'Approx. Age'
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
        Font.FontName = 'Arial'
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
        DataField = 'APPROXAGEUNCERTAINTY'
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
        Title.Text = '+/- 95% conf.'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmStrat.dsDomainDeposits
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
    Left = 682
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
    Left = 334
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
    Left = 450
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
  object iwbOpen: TIWButton
    Left = 218
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Open'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbOpen'
    TabOrder = 7
    OnClick = iwbOpenClick
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 900
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
    ExplicitWidth = 900
    inherited IWFrameRegion: TIWRegion
      Width = 900
      TabOrder = 8
      ExplicitWidth = 900
      inherited iwrHeader: TIWRegion
        Width = 900
        ExplicitWidth = 900
        inherited iwrWelcome: TIWRegion
          Width = 900
          ExplicitWidth = 900
          inherited iwrDisplayUserName: TIWRegion
            Width = 700
            ExplicitWidth = 700
            inherited lblWelcome: TIWLabel
              Left = 427
              ExplicitLeft = 427
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 900
          ExplicitWidth = 900
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end