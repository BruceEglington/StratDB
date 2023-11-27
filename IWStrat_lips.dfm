object ISFLIPS: TISFLIPS
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
    Left = 103
    Top = 188
    Width = 652
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
        DataField = 'LIPID'
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
        DataField = 'CONTINENTID'
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
        Title.Text = 'Reg. ID'
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
        DataField = 'LIPNAME'
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
        Title.Text = 'Event'
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
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'LIPPARENTID'
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
        Title.Text = 'Parent ID'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmLIP.dsLIPs
    FooterRowCount = 0
    FriendlyName = 'iwDBg'
    FromStart = False
    HighlightColor = clNone
    HighlightRows = False
    Options = [dgIndicator, dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 0
    RollOver = True
    RowClick = False
    RollOverColor = clWebPALEGOLDENROD
    RowHeaderColor = clWebLIGHTSTEELBLUE
    RowAlternateColor = clNone
    RowCurrentColor = clWebYELLOW
    TabOrder = -1
  end
  object iwlSortedBy: TIWLabel
    Left = 516
    Top = 174
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
    TabOrder = 0
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
  object iwbApplyUpdates: TIWButton
    Left = 338
    Top = 74
    Width = 129
    Height = 25
    Visible = False
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbApplyUpdates'
    TabOrder = 2
    OnClick = iwbApplyUpdatesClick
  end
  object iwbCancelUpdates: TIWButton
    Left = 480
    Top = 74
    Width = 129
    Height = 25
    Visible = False
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancelUpdates'
    TabOrder = 3
    OnClick = iwbCancelUpdatesClick
  end
  object iwbAddNew: TIWButton
    Left = 622
    Top = 74
    Width = 133
    Height = 25
    Visible = False
    Caption = 'Add New'
    Color = clWebLIGHTSKYBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbAddNew'
    TabOrder = 4
    OnClick = iwbAddNewClick
  end
  object IWDBNavigator1: TIWDBNavigator
    Left = 338
    Top = 154
    Width = 120
    Height = 28
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmLIP.dsLIPs
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 24
    ImageWidth = 24
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
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
      TabOrder = 6
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
              ExplicitLeft = 561
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 800
          ExplicitWidth = 800
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
    Left = 616
    Top = 112
    object FDMemTable1LIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDMemTable1LIPName: TStringField
      FieldName = 'LIPName'
      Size = 50
    end
    object FDMemTable1LIPParentID: TIntegerField
      FieldName = 'LIPParentID'
    end
  end
end
