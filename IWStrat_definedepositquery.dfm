object ISFDefineDepositQuery: TISFDefineDepositQuery
  Left = 0
  Top = 0
  Width = 853
  Height = 2061
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Define query'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 2006
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
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitHeight = 1450
  end
  object IWRegion1: TIWRegion
    Left = 83
    Top = 55
    Width = 770
    Height = 2006
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 770
      Height = 353
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwcbFromDate: TIWCheckBox
        Left = 15
        Top = 153
        Width = 224
        Height = 21
        Caption = 'Include from Minimum Age'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        Checked = False
        FriendlyName = 'iwcbFromDate'
      end
      object iweFromDate: TIWEdit
        Left = 245
        Top = 153
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweFromDate'
        SubmitOnAsyncEvent = True
        TabOrder = 1
      end
      object iwcbToDate: TIWCheckBox
        Left = 15
        Top = 180
        Width = 224
        Height = 21
        Caption = 'to Maximum Age'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 2
        Checked = False
        FriendlyName = 'iwcbToDate'
      end
      object iweToDate: TIWEdit
        Left = 245
        Top = 180
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iweToDate'
        SubmitOnAsyncEvent = True
        TabOrder = 3
      end
      object iwlblErrorTop: TIWLabel
        Left = 117
        Top = 58
        Width = 250
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblErrorTop'
        Caption = 'No items selected or boxes not checked'
      end
      object IWText1: TIWText
        Left = 471
        Top = 67
        Width = 261
        Height = 264
        BGColor = clNone
        ConvertSpaces = True
        Font.Color = clWebDARKSLATEGRAY
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWText1'
        Lines.Strings = (
          'Select parameters which define the records '
          'you require. '
          ''
          'Multiple selections may be made in most list '
          'boxes. '
          ''
          'A more restricted range in data will improve '
          'performance and provide faster response '
          'times to your queries.'
          ''
          'Note that you also need to check the '#39'Include'#39
          'box above a list if you want the items specified'
          'to be include in your query.'
          ''
          '"Submit query" buttons are placed in a number'
          'of places on the form so one does not need to '
          'scroll up or down to activate a query.')
        RawText = False
        UseFrame = False
        WantReturns = True
      end
      object iwcbRestrictParentID: TIWCheckBox
        Left = 15
        Top = 103
        Width = 422
        Height = 21
        Caption = 'Restrict results to top level deposits (ParentID must be zero)'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 4
        Checked = False
        FriendlyName = 'iwcbRestrictParentID'
      end
      object iwbCancel: TIWButton
        Left = 560
        Top = 16
        Width = 150
        Height = 25
        Caption = 'Cancel query definition'
        Color = clWebLIGHTSALMON
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbCancel'
        TabOrder = 5
        OnClick = iwbCancelClick
      end
      object iwbClearCheckboxes: TIWButton
        Left = 360
        Top = 16
        Width = 150
        Height = 25
        Caption = 'Clear checkboxes'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbClearCheckboxes'
        TabOrder = 6
        OnClick = iwbClearCheckboxesClick
      end
      object iwbSubmitQuery: TIWButton
        Left = 16
        Top = 16
        Width = 293
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery'
        TabOrder = 7
        OnClick = iwbSubmitQueryClick
      end
    end
    object iwrDeposits: TIWRegion
      Left = 0
      Top = 353
      Width = 770
      Height = 306
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      ExplicitTop = 289
      object IWButton8: TIWButton
        Left = 500
        Top = 224
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 8
        OnClick = iwbSubmitQueryClick
      end
      object iwlDeposits: TIWListbox
        Left = 20
        Top = 30
        Width = 349
        Height = 249
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        TabOrder = 9
        NonEditableAsLabel = True
        FriendlyName = 'iwlDeposits'
        Items.Strings = (
          'four=4'
          'one=1'
          'three=3'
          'two=2')
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbDeposits: TIWCheckBox
        Left = 15
        Top = 3
        Width = 352
        Height = 21
        Caption = 'Include selection from Deposits'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 10
        Checked = False
        FriendlyName = 'iwcbDeposits'
      end
    end
    object iwrDepositClans: TIWRegion
      Left = 0
      Top = 659
      Width = 770
      Height = 215
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlDepositClans: TIWListbox
        Left = 20
        Top = 30
        Width = 461
        Height = 158
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 11
        NonEditableAsLabel = True
        FriendlyName = 'iwlDepositClans'
        Items.Strings = (
          'four=4'
          'one=1'
          'three=3'
          'two=2')
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object IWButton2: TIWButton
        Left = 500
        Top = 152
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 12
        OnClick = iwbSubmitQueryClick
      end
      object iwcbDepositClans: TIWCheckBox
        Left = 15
        Top = 3
        Width = 466
        Height = 21
        Caption = 'Include selection from Deposit Clans'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 13
        Checked = False
        FriendlyName = 'iwcbDepositClans'
      end
    end
    object iwrDepositStatus: TIWRegion
      Left = 0
      Top = 874
      Width = 770
      Height = 215
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton3: TIWButton
        Left = 500
        Top = 152
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 14
        OnClick = iwbSubmitQueryClick
      end
      object iwlDepositStatus: TIWListbox
        Left = 20
        Top = 30
        Width = 461
        Height = 158
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 15
        NonEditableAsLabel = True
        FriendlyName = 'iwlDepositStatus'
        Items.Strings = (
          'four=4'
          'one=1'
          'three=3'
          'two=2')
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbDepositStatus: TIWCheckBox
        Left = 15
        Top = 3
        Width = 466
        Height = 21
        Caption = 'Include selection from Deposit Status'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 16
        Checked = False
        FriendlyName = 'iwcbDepositStatus'
      end
    end
    object iwrCommodities: TIWRegion
      Left = 0
      Top = 1089
      Width = 770
      Height = 215
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton4: TIWButton
        Left = 500
        Top = 168
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 17
        OnClick = iwbSubmitQueryClick
      end
      object iwlCommodities: TIWListbox
        Left = 20
        Top = 39
        Width = 461
        Height = 158
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 18
        NonEditableAsLabel = True
        FriendlyName = 'iwlCommodities'
        Items.Strings = (
          'four=4'
          'one=1'
          'three=3'
          'two=2')
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbCommodities: TIWCheckBox
        Left = 15
        Top = 3
        Width = 466
        Height = 21
        Caption = 'Include selection from Commodities'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 19
        Checked = False
        FriendlyName = 'iwcbCommodities'
      end
    end
    object iwrValidation: TIWRegion
      Left = 0
      Top = 1304
      Width = 770
      Height = 215
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton1: TIWButton
        Left = 500
        Top = 128
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 20
        OnClick = iwbSubmitQueryClick
      end
      object iwlValidation: TIWListbox
        Left = 20
        Top = 39
        Width = 317
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 21
        NonEditableAsLabel = True
        FriendlyName = 'iwlValidation'
        Items.Strings = (
          'four=4'
          'one=1'
          'three=3'
          'two=2')
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbValidation: TIWCheckBox
        Left = 15
        Top = 12
        Width = 466
        Height = 21
        Caption = 'Include selection from Validation Status'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 22
        Checked = False
        FriendlyName = 'iwcbValidation'
      end
    end
    object iwrOrderBy: TIWRegion
      Left = 0
      Top = 1519
      Width = 770
      Height = 215
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlblErrorBottom: TIWLabel
        Left = 154
        Top = 125
        Width = 250
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblErrorBottom'
        Caption = 'No items selected or boxes not checked'
      end
      object iwbSubmitQuery2: TIWButton
        Left = 500
        Top = 115
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 23
        OnClick = iwbSubmitQueryClick
      end
      object iwrgOrderBy: TIWRadioGroup
        Left = 20
        Top = 24
        Width = 417
        Height = 85
        SubmitOnAsyncEvent = True
        RawText = False
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwrgOrderBy'
        ItemIndex = 0
        Items.Strings = (
          'Deposit Name'
          'Country ID, Deposit Name'
          'Deposit Clan ID, Country ID, Deposit Name'
          'Commodity ID')
        Layout = glVertical
        TabOrder = -1
      end
      object IWLabel4: TIWLabel
        Left = 15
        Top = 3
        Width = 101
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Order results by'
      end
    end
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 853
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
    TabOrder = 1
    TabStop = True
    ExplicitWidth = 853
    inherited IWFrameRegion: TIWRegion
      Width = 853
      TabOrder = 24
      ExplicitWidth = 853
      inherited iwrHeader: TIWRegion
        Width = 853
        ExplicitWidth = 853
        inherited iwrWelcome: TIWRegion
          Width = 853
          ExplicitWidth = 853
          inherited iwrDisplayUserName: TIWRegion
            Width = 653
            ExplicitWidth = 653
            inherited lblWelcome: TIWLabel
              Left = 380
              ExplicitLeft = 380
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 853
          ExplicitWidth = 853
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
