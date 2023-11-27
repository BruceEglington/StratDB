object ISFRefDetails: TISFRefDetails
  Left = 0
  Top = 0
  Width = 1000
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
  object IWDBEdit1: TIWDBEdit
    Left = 242
    Top = 109
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
    TabOrder = 12
    AutoEditable = False
    DataField = 'SOURCENUM'
    DataSource = dmStrat.dsRefFull
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
    TabOrder = 9
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    Left = 104
    Top = 110
    Width = 79
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Reference ID'
  end
  object IWLabel2: TIWLabel
    Left = 104
    Top = 163
    Width = 106
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Reference (Short)'
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
    TabOrder = 10
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
    Top = 190
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
    AutoEditable = True
    DataField = 'CONTINENTID'
    DataSource = dmStrat.dsRefFull
    FriendlyName = 'iwDBlcbLink'
    KeyField = 'CONTINENTID'
    ListField = 'CONTINENT'
    ListSource = dmStrat.dsContinents
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
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
    TabOrder = 11
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
    TabOrder = 7
    OnClick = iwbApplyUpdatesClick
  end
  object IWDBEdit2: TIWDBEdit
    Left = 242
    Top = 163
    Width = 659
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
    DataField = 'SOURCESHORT'
    DataSource = dmStrat.dsRefFull
    PasswordPrompt = False
  end
  object IWLabel3: TIWLabel
    Left = 102
    Top = 190
    Width = 44
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Region'
  end
  object IWLabel4: TIWLabel
    Left = 102
    Top = 222
    Width = 88
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Full Reference'
  end
  object IWDBMemo1: TIWDBMemo
    Left = 242
    Top = 217
    Width = 659
    Height = 148
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    TabOrder = 5
    SubmitOnAsyncEvent = True
    AutoEditable = True
    DataField = 'SOURCEDESCRIPTION'
    DataSource = dmStrat.dsRefFull
    FriendlyName = 'IWDBMemo1'
  end
  object IWLabel5: TIWLabel
    Left = 104
    Top = 138
    Width = 97
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Publication Year'
  end
  object IWDBEdit3: TIWDBEdit
    Left = 242
    Top = 136
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
    TabOrder = 1
    AutoEditable = True
    DataField = 'SOURCEYEAR'
    DataSource = dmStrat.dsRefFull
    PasswordPrompt = False
  end
  object IWLabel6: TIWLabel
    Left = 104
    Top = 375
    Width = 33
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'D.O.I.'
  end
  object IWDBEdit4: TIWDBEdit
    Left = 242
    Top = 371
    Width = 659
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
    TabOrder = 6
    AutoEditable = True
    DataField = 'DOI'
    DataSource = dmStrat.dsRefFull
    PasswordPrompt = False
  end
  object IWLabel7: TIWLabel
    Left = 102
    Top = 398
    Width = 50
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Who For'
  end
  object iwDBlcbWhoFor: TIWDBLookupComboBox
    Left = 242
    Top = 398
    Width = 365
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Editable = False
    NonEditableAsLabel = True
    TabOrder = 8
    AutoEditable = True
    DataField = 'WHOFORID'
    DataSource = dmStrat.dsRefFull
    FriendlyName = 'iwDBlcbWhoFor'
    KeyField = 'WHOFORID'
    ListField = 'WHOFOR'
    ListSource = dmStrat.dsUsersWhoFor
    DisableWhenEmpty = True
    NoSelectionText = '-- No Selection --'
  end
  object iwbCopyRefShort: TIWButton
    Left = 723
    Top = 190
    Width = 178
    Height = 25
    Caption = 'Copy Ref (short) to Full'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbCopyRefShort'
    TabOrder = 4
    OnClick = iwbCopyRefShortClick
  end
  object IWMemoASCIIwarning: TIWMemo
    Left = 242
    Top = 496
    Width = 659
    Height = 89
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = False
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    InvisibleBorder = True
    HorizScrollBar = False
    VertScrollBar = False
    Required = False
    SubmitOnAsyncEvent = False
    FriendlyName = 'IWMemoASCIIwarning'
    Lines.Strings = (
      
        'NOTE: StratDB and DateView can handle only ASCII/ANSI characters' +
        ' at this stage. Please ensure that all non-ANSI characters are r' +
        'eplaced by ASCII/ANSI ones during data entry.')
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 1000
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
    ExplicitWidth = 1000
    inherited IWFrameRegion: TIWRegion
      Width = 1000
      TabOrder = 13
      ExplicitWidth = 1000
      inherited iwrHeader: TIWRegion
        Width = 1000
        ExplicitWidth = 1000
        inherited iwrWelcome: TIWRegion
          Width = 1000
          ExplicitWidth = 1000
          inherited iwrDisplayUserName: TIWRegion
            Width = 800
            ExplicitWidth = 800
            inherited lblWelcome: TIWLabel
              Left = 527
              ExplicitLeft = 561
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1000
          ExplicitWidth = 1000
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
