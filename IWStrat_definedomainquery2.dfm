object ISFDefineDomainQuery2: TISFDefineDomainQuery2
  Left = 0
  Top = 0
  Width = 831
  Height = 1505
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
  object IWRegion2: TIWRegion
    Left = 0
    Top = 55
    Width = 83
    Height = 1450
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object rectLeft: TIWRectangle
      Left = 0
      Top = 0
      Width = 83
      Height = 1450
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
      ExplicitLeft = -35
      ExplicitTop = 1
      ExplicitHeight = 58
    end
  end
  object IWRegion1: TIWRegion
    Left = 83
    Top = 55
    Width = 748
    Height = 1450
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 748
      Height = 337
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlblErrorTop: TIWLabel
        Left = 439
        Top = 298
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
        Left = 430
        Top = 16
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
        Top = 102
        Width = 365
        Height = 25
        Cursor = crAuto
        Caption = 'Restrict results to top level units (ParentID must be zero)'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        Checked = False
        FriendlyName = 'iwcbRestrictParentID'
      end
      object iwbCancel: TIWButton
        Left = 283
        Top = 16
        Width = 141
        Height = 25
        Caption = 'Cancel query definition'
        Color = clWebLIGHTSALMON
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbCancel'
        TabOrder = 1
        OnClick = iwbCancelClick
      end
      object iwbClearCheckboxes: TIWButton
        Left = 145
        Top = 16
        Width = 125
        Height = 25
        Caption = 'Clear checkboxes'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbClearCheckboxes'
        TabOrder = 2
        OnClick = iwbClearCheckboxesClick
      end
      object iwbSubmitQuery: TIWButton
        Left = 7
        Top = 16
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery'
        TabOrder = 3
        OnClick = iwbSubmitQueryClick
      end
    end
    object iwrDomains: TIWRegion
      Left = 0
      Top = 337
      Width = 748
      Height = 297
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton8: TIWButton
        Left = 500
        Top = 266
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 4
        OnClick = iwbSubmitQueryClick
      end
      object iwlDomains: TIWListbox
        Left = 20
        Top = 40
        Width = 349
        Height = 249
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        TabOrder = 5
        NonEditableAsLabel = True
        FriendlyName = 'iwlDomains'
        Items.Strings = (
          '')
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbDomains: TIWCheckBox
        Left = 15
        Top = 13
        Width = 354
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from Domains'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 6
        Checked = False
        FriendlyName = 'iwcbDomains'
      end
    end
    object iwrDomainTypes: TIWRegion
      Left = 0
      Top = 634
      Width = 748
      Height = 215
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton2: TIWButton
        Left = 500
        Top = 173
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 7
        OnClick = iwbSubmitQueryClick
      end
      object iwlDomainTypes: TIWListbox
        Left = 13
        Top = 39
        Width = 356
        Height = 158
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 8
        NonEditableAsLabel = True
        FriendlyName = 'iwlDomainTypes'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbDomainTypes: TIWCheckBox
        Left = 13
        Top = 12
        Width = 356
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from Domain Types'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 9
        Checked = False
        FriendlyName = 'iwcbDomainTypes'
      end
    end
    object iwrOrogenies: TIWRegion
      Left = 0
      Top = 849
      Width = 748
      Height = 217
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
        TabOrder = 10
        OnClick = iwbSubmitQueryClick
      end
      object iwlOrogenies: TIWListbox
        Left = 20
        Top = 38
        Width = 349
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
        FriendlyName = 'iwlOrogenies'
        Items.Strings = (
          '')
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbOrogenies: TIWCheckBox
        Left = 15
        Top = 11
        Width = 365
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from Orogenies'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 12
        Checked = False
        FriendlyName = 'iwcbOrogenies'
      end
    end
    object iwrValidation: TIWRegion
      Left = 0
      Top = 1066
      Width = 748
      Height = 183
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
        TabOrder = 13
        OnClick = iwbSubmitQueryClick
      end
      object iwlValidation: TIWListbox
        Left = 20
        Top = 39
        Width = 349
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 14
        NonEditableAsLabel = True
        FriendlyName = 'iwlValidation'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbValidation: TIWCheckBox
        Left = 15
        Top = 12
        Width = 354
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from Validation Status'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 15
        Checked = False
        FriendlyName = 'iwcbValidation'
      end
    end
    object iwrOrderBy: TIWRegion
      Left = 0
      Top = 1249
      Width = 748
      Height = 161
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlblErrorBottom: TIWLabel
        Left = 211
        Top = 130
        Width = 250
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        HasTabOrder = False
        FriendlyName = 'iwlblErrorBottom'
        Caption = 'No items selected or boxes not checked'
      end
      object iwbSubmitQuery2: TIWButton
        Left = 500
        Top = 120
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 16
        OnClick = iwbSubmitQueryClick
      end
      object iwrgOrderBy: TIWRadioGroup
        Left = 20
        Top = 31
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
          'ContinentID, DomainName'
          'Domain ID'
          'Parent ID')
        Layout = glVertical
        TabOrder = -1
      end
      object IWLabel4: TIWLabel
        Left = 15
        Top = 10
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
    Width = 831
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
    ExplicitWidth = 831
    inherited IWFrameRegion: TIWRegion
      Width = 831
      TabOrder = 17
      ExplicitWidth = 831
      inherited iwrHeader: TIWRegion
        Width = 831
        ExplicitWidth = 831
        inherited iwrWelcome: TIWRegion
          Width = 831
          ExplicitWidth = 831
          inherited iwrDisplayUserName: TIWRegion
            Width = 631
            ExplicitWidth = 631
            inherited lblWelcome: TIWLabel
              Left = 358
              ExplicitLeft = 358
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 831
          ExplicitWidth = 831
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
