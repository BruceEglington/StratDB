object ISFOrogenies: TISFOrogenies
  Left = 0
  Top = 0
  Width = 800
  Height = 598
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
  LockOnSubmit = False
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object iwDBg: TIWDBGrid
    AlignWithMargins = False
    Left = 103
    Top = 188
    Width = 553
    Height = 407
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    CellPadding = 0
    CellSpacing = 0
    Font.FontName = 'Verdana'
    Font.Size = 9
    Font.PxSize = 12
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = False
    UseSize = True
    ShowEmptyCells = True
    ShowInvisibleRows = True
    ScrollToCurrentRow = False
    Columns = <
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.PxSize = 10
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'OROGENYID'
        LinkField = 'OROGENY'
        OnClick = iwDBgColumns0Click
        OnTitleClick = IWDBGrid1Columns0TitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Font.PxSize = 10
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Orogeny ID'
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
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.PxSize = 10
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'OROGENY'
        OnTitleClick = IWDBGrid1Columns0TitleClick
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Font.PxSize = 10
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Orogeny'
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
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.PxSize = 10
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'CONTINENTID'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.FontName = 'Arial'
        Title.Font.Size = 8
        Title.Font.Style = [fsBold]
        Title.Font.PxSize = 10
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'Reg. ID'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmStratC.dsOrogenies
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
    RowCurrentColor = clNone
  end
  object iwlSortedBy: TIWLabel
    AlignWithMargins = False
    Left = 516
    Top = 174
    Width = 137
    Height = 14
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
    Left = 102
    Top = 171
    Width = 97
    Height = 17
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
  object iwlNextPage: TIWLink
    AlignWithMargins = False
    Left = 228
    Top = 171
    Width = 65
    Height = 17
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
  object iwbClose: TIWButton
    AlignWithMargins = False
    Left = 102
    Top = 74
    Width = 75
    Height = 25
    Caption = 'Close'
    Color = clWebLIGHTGREEN
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbClose'
    OnClick = iwbCloseClick
  end
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 55
    Width = 83
    Height = 543
    Align = alLeft
    ZIndex = 1
    Font.PxSize = 13
    Font.Color = clWebBLACK
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object iwbDownload: TIWButton
    AlignWithMargins = False
    Left = 196
    Top = 74
    Width = 129
    Height = 25
    Caption = 'Download to Excel'
    Color = clBtnFace
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbDownload'
    TabOrder = 1
    OnClick = iwbDownloadClick
  end
  object IWLabel1: TIWLabel
    AlignWithMargins = False
    Left = 102
    Top = 120
    Width = 44
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Region'
  end
  object iwDBlcbContinents2: TIWDBLookupComboBox
    AlignWithMargins = False
    Left = 196
    Top = 120
    Width = 301
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    OnChange = iwDBlcbContinents2Change
    NonEditableAsLabel = True
    TabOrder = 4
    AutoEditable = False
    FriendlyName = 'iwDBlcbContinents2'
    KeyField = 'CONTINENTID'
    ListField = 'CONTINENT'
    ListSource = dmStrat.dsContinents
    DisableWhenEmpty = True
  end
  object iwbApplyUpdates: TIWButton
    AlignWithMargins = False
    Left = 338
    Top = 74
    Width = 129
    Height = 25
    Visible = False
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbApplyUpdates'
    TabOrder = 5
    OnClick = iwbApplyUpdatesClick
  end
  object iwbCancelUpdates: TIWButton
    AlignWithMargins = False
    Left = 480
    Top = 74
    Width = 129
    Height = 25
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
    Left = 622
    Top = 74
    Width = 133
    Height = 25
    Visible = False
    Caption = 'Add New'
    Color = clWebLIGHTSKYBLUE
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbAddNew'
    TabOrder = 7
    OnClick = iwbAddNewClick
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
      TabOrder = 8
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
              Left = 471
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 561
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
            Font.Color = clWebSTEELBLUE
          end
        end
      end
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 664
    Top = 120
    object FDMemTable1OrogenyID: TIntegerField
      FieldName = 'OrogenyID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDMemTable1Orogeny: TStringField
      FieldName = 'Orogeny'
      Size = 50
    end
    object FDMemTable1ContinentID: TStringField
      FieldName = 'ContinentID'
      Size = 3
    end
  end
end
