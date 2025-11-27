object ISFAddProject: TISFAddProject
  Left = 0
  Top = 0
  Width = 961
  Height = 685
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
    AlignWithMargins = False
    Left = 242
    Top = 108
    Width = 73
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'IWDBEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'USERPROJECTID'
    DataSource = dmStrat.dsUserProjects
    PasswordPrompt = False
  end
  object iwbReturn: TIWButton
    AlignWithMargins = False
    Left = 102
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Return'
    Color = clWebLIGHTGREEN
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbReturn'
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    AlignWithMargins = False
    Left = 104
    Top = 110
    Width = 58
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Project ID'
  end
  object IWLabel2: TIWLabel
    AlignWithMargins = False
    Left = 104
    Top = 136
    Width = 41
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Project'
  end
  object iwbCancelUpdates: TIWButton
    AlignWithMargins = False
    Left = 440
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Cancel Updates'
    Color = clWebLIGHTSALMON
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbCancelUpdates'
    TabOrder = 1
    OnClick = iwbCancelUpdatesClick
  end
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 55
    Width = 83
    Height = 630
    Align = alLeft
    ZIndex = 1
    Font.PxSize = 13
    Font.Color = clWebBLACK
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
    ExplicitHeight = 350
  end
  object iwDBnUserProjects: TIWDBNavigator
    AlignWithMargins = False
    Left = 104
    Top = 206
    Width = 150
    Height = 28
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmStrat.dsUserProjects
    FriendlyName = 'iwDBnUserProjects'
    ImageHeight = 24
    ImageWidth = 24
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert]
    Orientation = orHorizontal
    OnInsert = iwDBnUserProjectsInsert
  end
  object iwDBgLink: TIWDBGrid
    AlignWithMargins = False
    Left = 104
    Top = 240
    Width = 601
    Height = 401
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    CellPadding = 0
    CellSpacing = 0
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = True
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
        DataField = 'USERPROJECTID'
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
        Title.Text = 'Project ID'
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
        DataField = 'USERPROJECTNAME'
        LinkField = 'USERPROJECTID'
        OnClick = iwDBgLinkColumns1Click
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
        Title.Text = 'Project Name'
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
        DataField = 'USERID'
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
        Title.Text = 'UserID'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dmStrat.dsUserProjects
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
    AlignWithMargins = False
    Left = 715
    Top = 72
    Width = 145
    Height = 25
    Caption = 'Delete Current Record'
    Color = clWebLIGHTCORAL
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbDeleteLink'
    TabOrder = 3
    OnClick = iwbDeleteLinkClick
  end
  object iwbEdit: TIWButton
    AlignWithMargins = False
    Left = 216
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbEdit'
    TabOrder = 4
    OnClick = iwbEditClick
  end
  object iwbApplyUpdates: TIWButton
    AlignWithMargins = False
    Left = 326
    Top = 72
    Width = 104
    Height = 25
    Caption = 'Apply Updates'
    Color = clWebPEACHPUFF
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbApplyUpdates'
    TabOrder = 5
    OnClick = iwbApplyUpdatesClick
  end
  object IWDBEdit2: TIWDBEdit
    AlignWithMargins = False
    Left = 242
    Top = 135
    Width = 263
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'IWDBEdit2'
    SubmitOnAsyncEvent = True
    TabOrder = 6
    AutoEditable = True
    DataField = 'USERPROJECTNAME'
    DataSource = dmStrat.dsUserProjects
    PasswordPrompt = False
  end
  object IWLabel3: TIWLabel
    AlignWithMargins = False
    Left = 104
    Top = 168
    Width = 46
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'User ID'
  end
  object IWDBEdit3: TIWDBEdit
    AlignWithMargins = False
    Left = 242
    Top = 162
    Width = 143
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'IWDBEdit2'
    SubmitOnAsyncEvent = True
    TabOrder = 8
    AutoEditable = False
    DataField = 'USERID'
    DataSource = dmStrat.dsUserProjects
    PasswordPrompt = False
  end
  object iwbAddLink: TIWButton
    AlignWithMargins = False
    Left = 555
    Top = 72
    Width = 145
    Height = 25
    Caption = 'Add New Project'
    Color = clWebLIGHTSKYBLUE
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbDeleteLink'
    TabOrder = 9
    OnClick = iwDBnUserProjectsInsert
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 961
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
    ExplicitWidth = 961
    inherited IWFrameRegion: TIWRegion
      Width = 961
      TabOrder = 7
      ExplicitWidth = 961
      inherited iwrHeader: TIWRegion
        Width = 961
        ExplicitWidth = 961
        inherited iwrWelcome: TIWRegion
          Width = 961
          ExplicitWidth = 961
          inherited iwrDisplayUserName: TIWRegion
            Width = 761
            ExplicitWidth = 761
            inherited lblWelcome: TIWLabel
              Left = 488
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 247
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 961
          ExplicitWidth = 961
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
end
