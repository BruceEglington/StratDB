object ISFChartDetails: TISFChartDetails
  Left = 0
  Top = 0
  Width = 1100
  Height = 1850
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  ActiveControl = iwbReturn
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = False
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object iwrLeftRegion: TIWRegion
    Left = 0
    Top = 55
    Width = 85
    Height = 1795
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object rectLeft: TIWRectangle
      Left = 0
      Top = 0
      Width = 83
      Height = 1795
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
      ExplicitHeight = 625
    end
  end
  object iwrClientAll: TIWRegion
    Left = 85
    Top = 55
    Width = 1015
    Height = 1795
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 1015
      Height = 60
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbDetailsEdit: TIWButton
        Left = 263
        Top = 19
        Width = 129
        Height = 25
        Caption = 'Edit this record'
        Color = clWebLEMONCHIFFON
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDetailsEdit'
        TabOrder = 9
        OnClick = iwbDetailsEditClick
      end
      object iwbReturn: TIWButton
        Left = 96
        Top = 19
        Width = 141
        Height = 25
        Caption = 'Return to Main page'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbReturn'
        TabOrder = 8
        OnClick = iwbReturnClick
      end
      object iwbApplyUpdates: TIWButton
        Left = 422
        Top = 19
        Width = 129
        Height = 25
        Caption = 'Apply updates'
        Color = clWebPEACHPUFF
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDetailsEdit'
        TabOrder = 10
        OnClick = iwbApplyUpdatesClick
      end
      object iwbCancel: TIWButton
        Left = 584
        Top = 19
        Width = 129
        Height = 25
        Caption = 'Cancel updates'
        Color = clWebLIGHTSALMON
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDetailsEdit'
        TabOrder = 11
        OnClick = iwbCancelClick
      end
    end
    object iwrUnitDetails: TIWRegion
      Left = 0
      Top = 60
      Width = 1015
      Height = 313
      RenderInvisibleControls = False
      TabOrder = 2
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      Color = clWebHONEYDEW
      object IWLabel5: TIWLabel
        Left = 16
        Top = 9
        Width = 57
        Height = 19
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Chart :'
      end
      object IWLabel3: TIWLabel
        Left = 12
        Top = 45
        Width = 71
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'Chart name'
      end
      object IWDBEdit3: TIWDBEdit
        Left = 104
        Top = 44
        Width = 357
        Height = 25
        StyleRenderOptions.RenderBorder = False
        BGColor = clWebLEMONCHIFFON
        Editable = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        AutoEditable = True
        DataField = 'CHART'
        DataSource = dmStratC.dsChart
        PasswordPrompt = False
      end
      object IWLabel1: TIWLabel
        Left = 12
        Top = 75
        Width = 49
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Chart ID'
      end
      object IWDBEdit1: TIWDBEdit
        Left = 104
        Top = 75
        Width = 121
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
        TabOrder = 1
        AutoEditable = False
        DataField = 'CHARTID'
        DataSource = dmStratC.dsChart
        PasswordPrompt = False
      end
      object IWLabel12: TIWLabel
        Left = 12
        Top = 141
        Width = 69
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel11'
        Caption = 'Description'
      end
      object iwDBmDescription: TIWDBMemo
        Left = 104
        Top = 141
        Width = 709
        Height = 136
        StyleRenderOptions.RenderBorder = False
        BGColor = clWebHONEYDEW
        Editable = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        InvisibleBorder = False
        HorizScrollBar = False
        VertScrollBar = True
        Required = False
        TabOrder = 5
        SubmitOnAsyncEvent = True
        AutoEditable = True
        DataField = 'DESCRIPTION'
        DataSource = dmStratC.dsChart
        FriendlyName = 'iwDBmDescription'
      end
      object IWLabel2: TIWLabel
        Left = 272
        Top = 75
        Width = 107
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Chart Offset (mm)'
      end
      object IWDBEdit2: TIWDBEdit
        Left = 381
        Top = 75
        Width = 56
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
        TabOrder = 12
        AutoEditable = True
        DataField = 'CHARTOFFSET_MM'
        DataSource = dmStratC.dsChart
        PasswordPrompt = False
      end
      object IWLabel4: TIWLabel
        Left = 480
        Top = 75
        Width = 169
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Default Domain Offset (mm)'
      end
      object IWDBEdit4: TIWDBEdit
        Left = 645
        Top = 75
        Width = 56
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
        TabOrder = 15
        AutoEditable = True
        DataField = 'DEFAULTDOMAINOFFSET'
        DataSource = dmStratC.dsChart
        PasswordPrompt = False
      end
      object IWLabel14: TIWLabel
        Left = 272
        Top = 102
        Width = 99
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Default min. age'
      end
      object IWDBEdit5: TIWDBEdit
        Left = 381
        Top = 102
        Width = 56
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
        TabOrder = 31
        AutoEditable = True
        DataField = 'DEFAULTMINAGE'
        DataSource = dmStratC.dsChart
        PasswordPrompt = False
      end
      object IWLabel15: TIWLabel
        Left = 480
        Top = 102
        Width = 101
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Default max. age'
      end
      object IWDBEdit6: TIWDBEdit
        Left = 645
        Top = 102
        Width = 56
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
        TabOrder = 32
        AutoEditable = True
        DataField = 'DEFAULTMAXAGE'
        DataSource = dmStratC.dsChart
        PasswordPrompt = False
      end
      object IWLabel18: TIWLabel
        Left = 480
        Top = 48
        Width = 56
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Owner ID'
      end
      object IWDBEdit7: TIWDBEdit
        Left = 644
        Top = 48
        Width = 169
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
        TabOrder = 36
        AutoEditable = True
        DataField = 'OWNERID'
        DataSource = dmStratC.dsChart
        PasswordPrompt = False
      end
    end
    object iwrDomains: TIWRegion
      Left = 0
      Top = 373
      Width = 1015
      Height = 320
      RenderInvisibleControls = False
      TabOrder = 4
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      Color = clWebWHITESMOKE
      object IWLabel9: TIWLabel
        Left = 8
        Top = 6
        Width = 162
        Height = 19
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Domains included :'
      end
      object iwDBgDomain: TIWDBGrid
        Left = 109
        Top = 38
        Width = 900
        Height = 239
        BorderColors.Color = clNone
        BorderColors.Light = clNone
        BorderColors.Dark = clNone
        BGColor = clNone
        BorderSize = 1
        BorderStyle = tfDefault
        CellPadding = 2
        CellSpacing = 0
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
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
            Width = '20'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'CHARTID'
            OnTitleClick = iwDBgResultsColumns0TitleClick
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
            Title.Text = 'Chart ID'
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
            Width = '20'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'DOMAINORDER'
            OnTitleClick = iwDBgResultsColumns0TitleClick
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.FontName = 'Arial'
            Title.Font.Size = 8
            Title.Font.Style = []
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
            Width = '20'
            Wrap = True
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'OFFSET_MM'
            OnTitleClick = iwDBgResultsColumns0TitleClick
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
            Title.Text = 'Offset (mm)'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '20'
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
            Width = '30'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'DOMAINXMIN'
            OnTitleClick = iwDBgResultsColumns0TitleClick
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
            Title.Text = 'X min.'
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
            Width = '30'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'DOMAINXMAX'
            OnTitleClick = iwDBgResultsColumns0TitleClick
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
            Title.Text = 'X max.'
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
            Width = '40'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'MINPLOTAGE'
            OnTitleClick = iwDBgResultsColumns0TitleClick
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
            Title.Text = 'Min.Age'
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
            Width = '40'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'MAXPLOTAGE'
            OnTitleClick = iwDBgResultsColumns0TitleClick
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
            Title.Text = 'Max.Age'
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
            Width = '30'
            Wrap = True
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'DOMAINID'
            OnTitleClick = iwDBgResultsColumns0TitleClick
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
            Title.Text = 'Domain ID'
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
            Width = '20'
            Wrap = True
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'CONTINENTID'
            OnTitleClick = iwDBgResultsColumns0TitleClick
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
            Title.Text = 'Cont.'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = True
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
            Width = '250'
            Wrap = True
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'DOMAINNAME'
            LinkField = 'DOMAINID'
            OnClick = iwDBgDomainColumns5Click
            OnTitleClick = iwDBgResultsColumns0TitleClick
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
            Title.Text = 'Domain'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = True
            Title.RawText = True
          end>
        DataSource = dmStratC.dsChartDomain
        FooterRowCount = 0
        FriendlyName = 'iwDBgDomain'
        FromStart = True
        HighlightColor = clNone
        HighlightRows = False
        Options = [dgShowTitles]
        RefreshMode = rmAutomatic
        RowLimit = 0
        RollOver = True
        RowClick = False
        RollOverColor = clWebPALEGOLDENROD
        RowHeaderColor = clWebLIGHTSTEELBLUE
        RowAlternateColor = clNone
        RowCurrentColor = clNone
      end
      object iwlSortedBy: TIWLabel
        Left = 837
        Top = 8
        Width = 94
        Height = 14
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlSortedBy'
        Caption = 'Default sort order'
      end
      object iwDBnDomains: TIWDBNavigator
        Left = 344
        Top = 4
        Width = 120
        Height = 28
        Confirmations.Delete = 'Are you sure you want to delete this record?'
        Confirmations.Post = 'Are you sure you want to update this record?'
        Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
        DataSource = dmStratC.dsChartDomain
        FriendlyName = 'iwDBnDomains'
        ImageHeight = 24
        ImageWidth = 24
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Orientation = orHorizontal
      end
      object iwbAddDomain: TIWButton
        Left = 12
        Top = 40
        Width = 91
        Height = 25
        Caption = 'Add link'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbAddDomain'
        TabOrder = 13
        OnClick = iwbAddDomainClick
      end
      object iwbDeleteDomain: TIWButton
        Left = 12
        Top = 71
        Width = 91
        Height = 25
        Caption = 'Delete link'
        Confirmation = 'Are you sure you wish to delete this?'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbDeleteDomain'
        TabOrder = 14
        OnClick = iwbDeleteDomainClick
      end
      object IWLabel10: TIWLabel
        Left = 426
        Top = 279
        Width = 188
        Height = 14
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel2'
        Caption = 'Click on Domain Name to edit details'
      end
    end
    object iwrBottomButtons: TIWRegion
      Left = 0
      Top = 2038
      Width = 1015
      Height = 84
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbDetailsEdit2: TIWButton
        Left = 426
        Top = 27
        Width = 129
        Height = 25
        Caption = 'Edit this record'
        Color = clWebLEMONCHIFFON
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDetailsEdit2'
        TabOrder = 6
        OnClick = iwbDetailsEditClick
      end
      object iwbReturn2: TIWButton
        Left = 228
        Top = 27
        Width = 141
        Height = 25
        Caption = 'Return to Main page'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbReturn2'
        TabOrder = 7
        OnClick = iwbReturnClick
      end
    end
    object iwrCopyRight: TIWRegion
      Left = 0
      Top = 2122
      Width = 1015
      Height = 60
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      object IWLabel66: TIWLabel
        Left = 4
        Top = 12
        Width = 174
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Stratigraphic Unit Database'
      end
      object IWLabel67: TIWLabel
        Left = 4
        Top = 30
        Width = 159
        Height = 14
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        HasTabOrder = False
        FriendlyName = 'IWLabel2'
        Caption = '(c) Dr Bruce Eglington (2007)'
      end
    end
    object iwrTimeSpace: TIWRegion
      Left = 0
      Top = 841
      Width = 1015
      Height = 872
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      Color = clWebCADETBLUE
      object IWLabel6: TIWLabel
        Left = 381
        Top = 18
        Width = 287
        Height = 16
        Alignment = taCenter
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel6'
        Caption = 'Export Time-Space Data to Create GIS Charts'
      end
      object iwbTimeSpaceUnits: TIWButton
        Left = 152
        Top = 98
        Width = 231
        Height = 25
        Caption = 'Domain Units'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceUnits'
        TabOrder = 16
        OnClick = iwbTimeSpaceUnitsClick
      end
      object iwbTimeSpaceMetamorphism: TIWButton
        Left = 405
        Top = 184
        Width = 231
        Height = 25
        Caption = 'Domain Metamorphism'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceMetamorphism'
        TabOrder = 17
        OnClick = iwbTimeSpaceMetamorphismClick
      end
      object iwbTimeSpaceDeformation: TIWButton
        Left = 405
        Top = 212
        Width = 231
        Height = 25
        Caption = 'Domain Deformation'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceDeformation'
        TabOrder = 18
        OnClick = iwbTimeSpaceDeformationClick
      end
      object iwbTimeSpaceDomainHeadings: TIWButton
        Left = 405
        Top = 98
        Width = 231
        Height = 25
        Caption = 'Domain Headings'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceDomainHeadings'
        TabOrder = 19
        OnClick = iwbTimeSpaceDomainHeadingsClick
      end
      object iweChartMinAge: TIWEdit
        Left = 405
        Top = 40
        Width = 62
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iweChartMinAge'
        SubmitOnAsyncEvent = True
        TabOrder = 20
        Text = '1500'
      end
      object IWLabel7: TIWLabel
        Left = 256
        Top = 44
        Width = 141
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel7'
        Caption = 'Minimum age for chart'
      end
      object iweChartMaxAge: TIWEdit
        Left = 658
        Top = 40
        Width = 62
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iweChartMaxAge'
        SubmitOnAsyncEvent = True
        TabOrder = 21
        Text = '2600'
      end
      object IWLabel8: TIWLabel
        Left = 506
        Top = 44
        Width = 146
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel7'
        Caption = 'Maximum age for chart'
      end
      object iwbTimeSpaceUnitFeatures: TIWButton
        Left = 152
        Top = 126
        Width = 231
        Height = 25
        Caption = 'Domain Unit Features'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceUnitFeatures'
        TabOrder = 22
        OnClick = iwbTimeSpaceUnitFeaturesClick
      end
      object iwbTimeSpaceEconomic: TIWButton
        Left = 152
        Top = 155
        Width = 231
        Height = 25
        Caption = 'Domain Economic'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceEconomic'
        TabOrder = 23
        OnClick = iwbTimeSpaceEconomicClick
      end
      object iwbTimeSpaceDomainColumns: TIWButton
        Left = 406
        Top = 126
        Width = 231
        Height = 25
        Caption = 'Domain Column Lines'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceDomainColumns'
        TabOrder = 24
        OnClick = iwbTimeSpaceDomainColumnsClick
      end
      object iwbGeochronology: TIWButton
        Left = 658
        Top = 98
        Width = 231
        Height = 25
        Caption = 'DateView Geochronology'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbGeochronologyStrat'
        TabOrder = 25
        OnClick = iwbGeochronologyStratClick
      end
      object iwbTimeSpaceLIP: TIWButton
        Left = 152
        Top = 430
        Width = 231
        Height = 25
        Caption = 'Large Igneous Provinces'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceLIP'
        TabOrder = 26
        OnClick = iwbTimeSpaceLIPClick
      end
      object iwbTimeSpaceDomainBoxes: TIWButton
        Left = 406
        Top = 155
        Width = 231
        Height = 25
        Caption = 'Domain Boxes'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceDomainBoxes'
        TabOrder = 29
        OnClick = iwbTimeSpaceDomainBoxesClick
      end
      object iwbTimeSpaceDomainBoxes2: TIWButton
        Left = 406
        Top = 461
        Width = 231
        Height = 25
        Caption = 'Domain Boxes'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceDomainBoxes2'
        TabOrder = 30
        OnClick = iwbTimeSpaceDomainBoxesClick
      end
      object iwbLIPDVCurves: TIWButton
        Left = 658
        Top = 494
        Width = 231
        Height = 25
        Caption = 'Calculate LIP Probability Curves'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbLIPDVCurves'
        TabOrder = 33
        OnClick = iwbDVCurvesClick
      end
      object iwbLIPDVCurvesExportUPb: TIWButton
        Left = 658
        Top = 546
        Width = 231
        Height = 25
        Caption = 'Curves Export (U-Pb)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbLIPDVCurvesExportUPb'
        TabOrder = 37
        OnClick = iwbLIPDVCurvesExportUPbClick
      end
      object iwbLIPDVCurvesExportArAr: TIWButton
        Left = 658
        Top = 577
        Width = 231
        Height = 25
        Caption = 'Curves Export (Ar-Ar)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbLIPDVCurvesExportArAr'
        TabOrder = 38
        OnClick = iwbLIPDVCurvesExportArArClick
      end
      object iwbLIPDVCurvesExportOther: TIWButton
        Left = 658
        Top = 608
        Width = 231
        Height = 25
        Caption = 'Curves Export (Other)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbLIPDVCurvesExportOther'
        TabOrder = 39
        OnClick = iwbLIPDVCurvesExportOtherClick
      end
      object iwbLIPDVCurvesExportnd: TIWButton
        Left = 658
        Top = 639
        Width = 231
        Height = 25
        Caption = 'Curves Export (Not specified)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbLIPDVCurvesExportnd'
        TabOrder = 40
        OnClick = iwbLIPDVCurvesExportndClick
      end
      object iwbTimeSpaceDomainHeadingsLIP: TIWButton
        Left = 406
        Top = 430
        Width = 231
        Height = 25
        Caption = 'Domain Headings'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceDomainHeadingsLIP'
        TabOrder = 41
        OnClick = iwbTimeSpaceDomainHeadingsClick
      end
      object IWLabel19: TIWLabel
        Left = 374
        Top = 76
        Width = 306
        Height = 16
        Alignment = taCenter
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel6'
        Caption = 'Domains, Units, Metamorphism and Deformation'
      end
      object IWLabel20: TIWLabel
        Left = 442
        Top = 408
        Width = 172
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel6'
        Caption = 'Large Igneous Provinces'
      end
      object iwbDomainDVCurves: TIWButton
        Left = 658
        Top = 150
        Width = 231
        Height = 25
        Caption = 'Calculate Domain Probability Curves'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDomainDVCurves'
        TabOrder = 42
        OnClick = iwbDVCurvesClick
      end
      object iwbDomainDVCurvesExportCryst: TIWButton
        Left = 658
        Top = 208
        Width = 231
        Height = 25
        Caption = 'Curves Export (Crystallisation)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDomainDVCurvesExportCryst'
        TabOrder = 43
        OnClick = iwbDomainDVCurvesExportCrystClick
      end
      object iwbDomainDVCurvesExportCool: TIWButton
        Left = 658
        Top = 236
        Width = 231
        Height = 25
        Caption = 'Curves Export (Cooling)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDomainDVCurvesExportCool'
        TabOrder = 44
        OnClick = iwbDomainDVCurvesExportCoolClick
      end
      object iwbDomainDVCurvesExportDetri: TIWButton
        Left = 658
        Top = 265
        Width = 231
        Height = 25
        Caption = 'Curves Export (Detrital summary)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDomainDVCurvesExportDetri'
        TabOrder = 46
        OnClick = iwbDomainDVCurvesExportDetriClick
      end
      object iwbDomainDVCurvesExportMetpR: TIWButton
        Left = 658
        Top = 294
        Width = 231
        Height = 25
        Caption = 'Curves Export (Metamorphic)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDomainDVCurvesExportMetpR'
        TabOrder = 47
        OnClick = iwbDomainDVCurvesExportMetpRClick
      end
      object iwbDomainDVCurvesExportCrsRs: TIWButton
        Left = 658
        Top = 322
        Width = 231
        Height = 25
        Caption = 'Curves Export (Nd T-DM)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDomainDVCurvesExportCrsRs'
        TabOrder = 48
        OnClick = iwbDomainDVCurvesExportCrsRsClick
      end
      object iwrgOrAnd: TIWRadioGroup
        Left = 825
        Top = 40
        Width = 74
        Height = 41
        SubmitOnAsyncEvent = True
        RawText = False
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwrgOrAnd'
        ItemIndex = 1
        Items.Strings = (
          ' '#39'OR'#39
          ' '#39'AND'#39)
        Layout = glVertical
        TabOrder = 45
      end
      object IWLabel21: TIWLabel
        Left = 759
        Top = 44
        Width = 60
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel7'
        Caption = 'PDF type'
      end
      object iwbMapUnits: TIWButton
        Left = 152
        Top = 298
        Width = 231
        Height = 25
        Caption = 'Map - Unit Associations'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbMapUnits'
        TabOrder = 50
        OnClick = iwbMapUnitsClick
      end
      object iwbTimeSpaceUnconformities: TIWButton
        Left = 152
        Top = 184
        Width = 231
        Height = 25
        Caption = 'Domain Unit Unconformities'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbTimeSpaceUnconformities'
        TabOrder = 51
        OnClick = iwbTimeSpaceUnconformitiesClick
      end
      object iwbMapLIPs: TIWButton
        Left = 152
        Top = 578
        Width = 231
        Height = 25
        Caption = 'Map - LIP Associations'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbMapLIPs'
        TabOrder = 52
        OnClick = iwbMapLIPsClick
      end
      object iwbDomainDVCurvesExportCombined: TIWButton
        Left = 658
        Top = 350
        Width = 231
        Height = 25
        Caption = 'Curves Export (Combined)'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDomainDVCurvesExportCombined'
        TabOrder = 53
        OnClick = iwbDomainDVCurvesExportCombinedClick
      end
      object IWLabel23: TIWLabel
        Left = 658
        Top = 186
        Width = 106
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel23'
        Caption = 'Domain order >='
      end
      object IWLabel24: TIWLabel
        Left = 813
        Top = 186
        Width = 36
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel24'
        Caption = 'and <'
      end
      object iweDomOrderGE: TIWEdit
        Left = 759
        Top = 181
        Width = 33
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iweDomOrderGE'
        SubmitOnAsyncEvent = True
        TabOrder = 54
        Text = '1'
      end
      object iweDomOrderLT: TIWEdit
        Left = 856
        Top = 181
        Width = 33
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iweDomOrderLT'
        SubmitOnAsyncEvent = True
        TabOrder = 55
        Text = '80'
      end
      object IWLabel25: TIWLabel
        Left = 654
        Top = 525
        Width = 235
        Height = 15
        Alignment = taCenter
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel23'
        Caption = 'Uses domain order values specified above'
      end
      object IWLabel26: TIWLabel
        Left = 450
        Top = 704
        Width = 135
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel6'
        Caption = 'Legend and Layout'
      end
      object iwbAgeLines: TIWButton
        Left = 152
        Top = 778
        Width = 231
        Height = 25
        Caption = 'Age lines'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbMapLIPs'
        TabOrder = 56
        OnClick = iwbAgeLinesClick
      end
      object IWLabel27: TIWLabel
        Left = 405
        Top = 734
        Width = 150
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel7'
        Caption = 'Increment for Age Lines'
      end
      object iweChartAgeLineIncrement: TIWEdit
        Left = 561
        Top = 730
        Width = 62
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iweChartAgeLineIncrement'
        SubmitOnAsyncEvent = True
        TabOrder = 57
        Text = '100'
      end
      object IWLabel28: TIWLabel
        Left = 658
        Top = 128
        Width = 106
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel23'
        Caption = 'Interp. Rating >='
      end
      object iweChartPrefLevel: TIWEdit
        Left = 759
        Top = 123
        Width = 33
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iweChartPrefLevel'
        SubmitOnAsyncEvent = True
        TabOrder = 58
        Text = '1'
      end
      object iwbGeochronologyLIP: TIWButton
        Left = 658
        Top = 433
        Width = 231
        Height = 25
        Caption = 'DateView Geochronology'
        Color = clWebLIGHTSTEELBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbGeochronologyLIP'
        TabOrder = 60
        OnClick = iwbGeochronologyLIPClick
      end
      object IWLabel29: TIWLabel
        Left = 670
        Top = 464
        Width = 217
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel23'
        Caption = 'Uses interp. rating specified above'
      end
    end
    object iwrDomainContentLists: TIWRegion
      Left = 0
      Top = 693
      Width = 1015
      Height = 148
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      Color = clWebLIGHTSEAGREEN
      object IWLabel11: TIWLabel
        Left = 356
        Top = 20
        Width = 322
        Height = 16
        Alignment = taCenter
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel6'
        Caption = 'Download Time-Space Summary Data for Domains'
      end
      object iwbDownloadUnits: TIWButton
        Left = 152
        Top = 51
        Width = 231
        Height = 25
        Caption = 'Download Domains/Units'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDownloadUnits'
        TabOrder = 27
        OnClick = iwbDownloadUnitsClick
      end
      object iwbDownloadLIPs: TIWButton
        Left = 406
        Top = 51
        Width = 231
        Height = 25
        Caption = 'Download Domains/LIPs'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDownloadLIPs'
        TabOrder = 28
        OnClick = iwbDownloadLIPsClick
      end
      object IWLabel13: TIWLabel
        Left = 401
        Top = 116
        Width = 243
        Height = 14
        Alignment = taCenter
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel2'
        Caption = 'Utilises age limits from Export specifications below'
      end
      object iwbDownloadLIPUnits: TIWButton
        Left = 658
        Top = 51
        Width = 231
        Height = 25
        Caption = 'Download Domains/LIPs/Units'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDownloadLIPUnits'
        TabOrder = 49
        OnClick = iwbDownloadLIPUnitsClick
      end
      object IWLabel22: TIWLabel
        Left = 288
        Top = 82
        Width = 466
        Height = 14
        Alignment = taCenter
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel2'
        Caption = 
          'These spreadsheet summaries facilitate data preparation and are ' +
          'not used for GIS chart creation'
      end
    end
    object iwrUsers: TIWRegion
      Left = 0
      Top = 1713
      Width = 1015
      Height = 325
      RenderInvisibleControls = False
      TabOrder = 3
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      Color = clWebWHITESMOKE
      object IWLabel16: TIWLabel
        Left = 6
        Top = 26
        Width = 198
        Height = 19
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Users linked by owner :'
      end
      object IWDBGrid1: TIWDBGrid
        Left = 107
        Top = 58
        Width = 900
        Height = 239
        BorderColors.Color = clNone
        BorderColors.Light = clNone
        BorderColors.Dark = clNone
        BGColor = clNone
        BorderSize = 1
        BorderStyle = tfDefault
        CellPadding = 2
        CellSpacing = 0
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
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
            Width = '20'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'CHARTID'
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
            Title.Text = 'Chart ID'
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
            Width = '80'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'USERID'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.FontName = 'Arial'
            Title.Font.Size = 8
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'User ID'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end>
        DataSource = dmStratC.dsChartUsers
        FooterRowCount = 0
        FriendlyName = 'iwDBgDomain'
        FromStart = True
        HighlightColor = clNone
        HighlightRows = False
        Options = [dgShowTitles]
        RefreshMode = rmAutomatic
        RowLimit = 0
        RollOver = True
        RowClick = False
        RollOverColor = clWebPALEGOLDENROD
        RowHeaderColor = clWebLIGHTSTEELBLUE
        RowAlternateColor = clNone
        RowCurrentColor = clNone
      end
      object IWLabel17: TIWLabel
        Left = 835
        Top = 28
        Width = 94
        Height = 14
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlSortedBy'
        Caption = 'Default sort order'
      end
      object iwDBnUsers: TIWDBNavigator
        Left = 342
        Top = 24
        Width = 120
        Height = 28
        Confirmations.Delete = 'Are you sure you want to delete this record?'
        Confirmations.Post = 'Are you sure you want to update this record?'
        Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
        DataSource = dmStratC.dsChartUsers
        FriendlyName = 'iwDBnUsers'
        ImageHeight = 24
        ImageWidth = 24
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Orientation = orHorizontal
      end
      object iwbAddUser: TIWButton
        Left = 10
        Top = 60
        Width = 91
        Height = 25
        Caption = 'Add link'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbAddDomain'
        TabOrder = 34
        OnClick = iwbAddUserClick
      end
      object iwbDeleteUser: TIWButton
        Left = 10
        Top = 91
        Width = 91
        Height = 25
        Caption = 'Delete link'
        Confirmation = 'Are you sure you wish to delete this?'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbDeleteDomain'
        TabOrder = 35
        OnClick = iwbDeleteUserClick
      end
    end
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 1100
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
    TabOrder = 2
    TabStop = True
    ExplicitWidth = 1100
    inherited IWFrameRegion: TIWRegion
      Width = 1100
      TabOrder = 59
      ExplicitWidth = 1100
      inherited iwrHeader: TIWRegion
        Width = 1100
        ExplicitWidth = 1100
        inherited iwrWelcome: TIWRegion
          Width = 1100
          ExplicitWidth = 1100
          inherited iwrDisplayUserName: TIWRegion
            Width = 900
            ExplicitWidth = 900
            inherited lblWelcome: TIWLabel
              Left = 627
              ExplicitLeft = 627
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1100
          ExplicitWidth = 1100
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
