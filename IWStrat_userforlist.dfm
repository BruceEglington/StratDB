object ISFUserForList: TISFUserForList
  Left = 0
  Top = 0
  Width = 863
  Height = 600
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWDBNavigator1: TIWDBNavigator
    Left = 229
    Top = 70
    Width = 108
    Height = 29
    ZIndex = 1
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmOpt.dsForList
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
  end
  object IWDBEdit1: TIWDBEdit
    Left = 117
    Top = 110
    Width = 60
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
    AutoEditable = True
    DataField = 'WHOFORID'
    DataSource = dmOpt.dsForList
    PasswordPrompt = False
  end
  object iwbReturn: TIWButton
    Left = 5
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 6
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    Left = 32
    Top = 112
    Width = 13
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'ID'
  end
  object IWLabel4: TIWLabel
    Left = 32
    Top = 144
    Width = 50
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Who For'
  end
  object IWDBEdit2: TIWDBEdit
    Left = 117
    Top = 138
    Width = 264
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
    AutoEditable = True
    DataField = 'WHOFOR'
    DataSource = dmOpt.dsForList
    PasswordPrompt = False
  end
  object iwbSaveChanges: TIWButton
    Left = 347
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 3
    OnClick = iwbSaveChangesClick
  end
  object iwbCancelChanges: TIWButton
    Left = 461
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Cancel changes'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancelChanges'
    TabOrder = 4
    OnClick = iwbCancelChangesClick
  end
  object iwbDelete: TIWButton
    Left = 576
    Top = 75
    Width = 98
    Height = 25
    Caption = 'Delete'
    Confirmation = 'Are you sure you want to delete this record?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDelete'
    TabOrder = 5
    OnClick = iwbDeleteClick
  end
  object iwbEdit: TIWButton
    Left = 119
    Top = 74
    Width = 98
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbEdit'
    OnClick = iwbEditClick
  end
  object iwlPrevPage: TIWLink
    Left = 32
    Top = 183
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
    TabOrder = 7
    RawText = False
    Caption = 'Previous page'
  end
  object iwlNextPage: TIWLink
    Left = 158
    Top = 183
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
    TabOrder = 8
    RawText = False
    Caption = 'Next page'
  end
  object iwDBg: TIWDBGrid
    Left = 30
    Top = 206
    Width = 553
    Height = 407
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 3
    BorderStyle = tfDefault
    CellPadding = 3
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
        DataField = 'WHOFORID'
        LinkField = 'WHOFORID'
        OnClick = iwDBgColumns0Click
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
        DataField = 'WHOFOR'
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
        Title.ShowHint = True
        Title.Text = 'Who For'
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
        DataField = 'OWNER'
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
        Title.ShowHint = True
        Title.Text = 'Owner'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmOpt.dsForList
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
  end
  object iwlSortedBy: TIWLabel
    Left = 446
    Top = 186
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
  object iwbNew: TIWButton
    Left = 692
    Top = 75
    Width = 98
    Height = 25
    Caption = 'New'
    Color = clWebLIGHTSKYBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbNew'
    TabOrder = 9
    OnClick = iwbNewClick
  end
  object iwbPublishUnits: TIWButton
    Left = 628
    Top = 200
    Width = 162
    Height = 25
    Caption = 'Publish Units'
    Confirmation = 'Are you sure you want to publish ALL unit records '
    Color = clWebORANGE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbPublishUnits'
    TabOrder = 10
    OnClick = iwbPublishUnitsClick
  end
  object iwbPublishLIPs: TIWButton
    Left = 628
    Top = 231
    Width = 162
    Height = 25
    Caption = 'Publish LIPs'
    Confirmation = 'Are you sure you want to publish ALL LIP records '
    Color = clWebORANGE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbPublishLIPs'
    TabOrder = 12
    OnClick = iwbPublishUnitsClick
  end
  object iwbPublishDeposits: TIWButton
    Left = 628
    Top = 262
    Width = 162
    Height = 25
    Caption = 'Publish Deposits'
    Confirmation = 'Are you sure you want to publish ALL deposit records '
    Color = clWebORANGE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbPublishDeposits'
    TabOrder = 13
    OnClick = iwbPublishUnitsClick
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 863
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
    ExplicitWidth = 863
    inherited IWFrameRegion: TIWRegion
      Width = 863
      TabOrder = 11
      ExplicitWidth = 863
      inherited iwrHeader: TIWRegion
        Width = 863
        ExplicitWidth = 863
        inherited iwrWelcome: TIWRegion
          Width = 863
          ExplicitWidth = 863
          inherited iwrDisplayUserName: TIWRegion
            Width = 663
            ExplicitWidth = 663
            inherited lblWelcome: TIWLabel
              Left = 390
              Top = 0
              Width = 64
              Alignment = taRightJustify
              ExplicitLeft = 422
              ExplicitTop = 0
              ExplicitWidth = 64
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 863
          ExplicitWidth = 863
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
