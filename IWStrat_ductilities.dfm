object ISFDuctilities: TISFDuctilities
  Left = 0
  Top = 0
  Width = 687
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
    Left = 102
    Top = 128
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
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 9
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = False
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
        DataField = 'DUCTILITYTYPEID'
        OnTitleClick = IWDBGrid1Columns0TitleClick
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
        Title.Text = 'ID'
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
        DataField = 'DUCTILITYTYPE'
        OnTitleClick = IWDBGrid1Columns0TitleClick
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
        Title.Text = 'Ductility Type'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmStrat.dsDuctilities
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
    Left = 515
    Top = 114
    Width = 137
    Height = 14
    Alignment = taRightJustify
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 8
    Font.Style = [fsItalic]
    HasTabOrder = False
    FriendlyName = 'iwlSortedBy'
    Caption = 'Sorted as specified in query'
  end
  object iwlPrevPage: TIWLink
    Left = 101
    Top = 111
    Width = 97
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlPrevPage'
    OnClick = iwlPrevPageClick
    TabOrder = 2
    RawText = False
    Caption = 'Previous page'
  end
  object iwlNextPage: TIWLink
    Left = 227
    Top = 111
    Width = 65
    Height = 17
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'iwlNextPage'
    OnClick = iwlNextPageClick
    TabOrder = 3
    RawText = False
    Caption = 'Next page'
  end
  object iwbClose: TIWButton
    Left = 102
    Top = 74
    Width = 75
    Height = 25
    Caption = 'Close'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbClose'
    OnClick = iwbCloseClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 543
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
  end
  object iwbDownload: TIWButton
    Left = 196
    Top = 74
    Width = 129
    Height = 25
    Caption = 'Download to Excel'
    Color = clBtnFace
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDownload'
    TabOrder = 1
    OnClick = iwbDownloadClick
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 687
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
    ExplicitWidth = 687
    inherited IWFrameRegion: TIWRegion
      Width = 687
      TabOrder = 4
      ExplicitWidth = 687
      inherited iwrHeader: TIWRegion
        Width = 687
        ExplicitWidth = 687
        inherited iwrWelcome: TIWRegion
          Width = 687
          ExplicitWidth = 687
          inherited iwrDisplayUserName: TIWRegion
            Width = 487
            ExplicitWidth = 487
            inherited lblWelcome: TIWLabel
              Left = 214
              ExplicitLeft = 214
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 687
          ExplicitWidth = 687
          inherited iwlSignOut: TIWLink
            TabOrder = -1
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
    Left = 512
    Top = 64
    object FDMemTable1DuctilityTypeID: TStringField
      FieldName = 'DuctilityTypeID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 1
    end
    object FDMemTable1DuctilityType: TStringField
      FieldName = 'DuctilityType'
      Size = 50
    end
  end
end