object ISFDefineLIPQuery: TISFDefineLIPQuery
  Left = 0
  Top = 0
  Width = 856
  Height = 2530
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
  DesignTop = -1664
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 2475
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
    Width = 773
    Height = 2475
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 773
      Height = 321
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwcbFromDate: TIWCheckBox
        Left = 15
        Top = 172
        Width = 231
        Height = 21
        Cursor = crAuto
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
        Left = 252
        Top = 172
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 1
      end
      object iwcbToDate: TIWCheckBox
        Left = 15
        Top = 199
        Width = 231
        Height = 21
        Cursor = crAuto
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
        Left = 252
        Top = 199
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 3
      end
      object iwlblErrorTop: TIWLabel
        Left = 111
        Top = 50
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
        Left = 465
        Top = 41
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
        Top = 111
        Width = 422
        Height = 21
        Cursor = crAuto
        Caption = 'Restrict results to top level units (ParentID must be zero)'
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
        Left = 302
        Top = 11
        Width = 141
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
        Left = 164
        Top = 11
        Width = 125
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
        Left = 15
        Top = 11
        Width = 125
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
    object iwrLIPs: TIWRegion
      Left = 0
      Top = 321
      Width = 773
      Height = 312
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton8: TIWButton
        Left = 500
        Top = 264
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
      object iwlLIPs: TIWListbox
        Left = 20
        Top = 40
        Width = 349
        Height = 249
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        TabOrder = 9
        NonEditableAsLabel = True
        FriendlyName = 'iwlLIPs'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbLIPs: TIWCheckBox
        Left = 15
        Top = 13
        Width = 354
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from LIPs'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 10
        Checked = False
        FriendlyName = 'iwcbLIPs'
      end
    end
    object iwrContOcean: TIWRegion
      Left = 0
      Top = 633
      Width = 773
      Height = 177
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlLIPContOceans: TIWListbox
        Left = 20
        Top = 30
        Width = 525
        Height = 131
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
        FriendlyName = 'iwlLIPContOceans'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbLIPContOceans: TIWCheckBox
        Left = 15
        Top = 3
        Width = 354
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from LIP Continental / Oceanic'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 12
        Checked = False
        FriendlyName = 'iwcbLIPContOceans'
      end
    end
    object iwrSizes: TIWRegion
      Left = 0
      Top = 810
      Width = 773
      Height = 225
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlLIPSizes: TIWListbox
        Left = 20
        Top = 39
        Width = 535
        Height = 158
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 13
        NonEditableAsLabel = True
        FriendlyName = 'iwlLIPSizes'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbLIPSizes: TIWCheckBox
        Left = 15
        Top = 12
        Width = 354
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from LIP Size'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 14
        Checked = False
        FriendlyName = 'iwcbLIPSizes'
      end
    end
    object iwrRatings: TIWRegion
      Left = 0
      Top = 1035
      Width = 773
      Height = 217
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlLIPRatings: TIWListbox
        Left = 20
        Top = 30
        Width = 623
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
        FriendlyName = 'iwlLIPRatings'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object IWButton3: TIWButton
        Left = 500
        Top = 3
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
      object iwcbLIPRatings: TIWCheckBox
        Left = 15
        Top = 3
        Width = 446
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from LIP Rating'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 17
        Checked = False
        FriendlyName = 'iwcbLIPRatings'
      end
    end
    object iwrMorphologies: TIWRegion
      Left = 0
      Top = 1252
      Width = 773
      Height = 225
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlLIPMorphologies: TIWListbox
        Left = 20
        Top = 47
        Width = 441
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
        FriendlyName = 'iwlLIPMorphologies'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object IWButton5: TIWButton
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
        TabOrder = 19
        OnClick = iwbSubmitQueryClick
      end
      object iwcbLIPMorphologies: TIWCheckBox
        Left = 15
        Top = 20
        Width = 446
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from LIP Morphologies'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 20
        Checked = False
        FriendlyName = 'iwcbLIPMorphologies'
      end
    end
    object iwrDomains: TIWRegion
      Left = 0
      Top = 1477
      Width = 773
      Height = 217
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlDomains: TIWListbox
        Left = 20
        Top = 39
        Width = 443
        Height = 158
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
        FriendlyName = 'iwlDomains'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object IWButton7: TIWButton
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
        TabOrder = 22
        OnClick = iwbSubmitQueryClick
      end
      object iwcbDomains: TIWCheckBox
        Left = 15
        Top = 12
        Width = 446
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
        TabOrder = 23
        Checked = False
        FriendlyName = 'iwcbDomains'
      end
    end
    object iwrReferences: TIWRegion
      Left = 0
      Top = 1694
      Width = 773
      Height = 233
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton4: TIWButton
        Left = 497
        Top = 3
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 24
        OnClick = iwbSubmitQueryClick
      end
      object iwlReferences: TIWListbox
        Left = 20
        Top = 30
        Width = 623
        Height = 187
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 25
        NonEditableAsLabel = True
        FriendlyName = 'iwlReferences'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbReferences: TIWCheckBox
        Left = 15
        Top = 3
        Width = 446
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from References'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 26
        Checked = False
        FriendlyName = 'iwcbReferences'
      end
    end
    object iwrWhoFor: TIWRegion
      Left = 0
      Top = 1927
      Width = 773
      Height = 185
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton1: TIWButton
        Left = 500
        Top = 136
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 27
        OnClick = iwbSubmitQueryClick
      end
      object iwlWhoFor: TIWListbox
        Left = 20
        Top = 39
        Width = 389
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 28
        NonEditableAsLabel = True
        FriendlyName = 'iwlWhoFor'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbWhoFor: TIWCheckBox
        Left = 15
        Top = 12
        Width = 446
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from Who For'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 29
        Checked = False
        FriendlyName = 'iwcbWhoFor'
      end
    end
    object iwrValidation: TIWRegion
      Left = 0
      Top = 2112
      Width = 773
      Height = 177
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton6: TIWButton
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
        TabOrder = 30
        OnClick = iwbSubmitQueryClick
      end
      object iwlValidation: TIWListbox
        Left = 20
        Top = 39
        Width = 389
        Height = 121
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        UseSize = False
        TabOrder = 31
        NonEditableAsLabel = True
        FriendlyName = 'iwlValidation'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwcbValidation: TIWCheckBox
        Left = 15
        Top = 12
        Width = 446
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
        TabOrder = 32
        Checked = False
        FriendlyName = 'iwcbValidation'
      end
    end
    object iwrOrderBy: TIWRegion
      Left = 0
      Top = 2289
      Width = 773
      Height = 161
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlblErrorBottom: TIWLabel
        Left = 103
        Top = 114
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
        Top = 104
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 33
        OnClick = iwbSubmitQueryClick
      end
      object iwrgOrderBy: TIWRadioGroup
        Left = 20
        Top = 31
        Width = 417
        Height = 66
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
          'LIP Name'
          'LIP ID'
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
    Width = 856
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
    ExplicitWidth = 856
    inherited IWFrameRegion: TIWRegion
      Width = 856
      TabOrder = 34
      ExplicitWidth = 856
      inherited iwrHeader: TIWRegion
        Width = 856
        ExplicitWidth = 856
        inherited iwrWelcome: TIWRegion
          Width = 856
          ExplicitWidth = 856
          inherited iwrDisplayUserName: TIWRegion
            Width = 656
            ExplicitWidth = 656
            inherited lblWelcome: TIWLabel
              Left = 383
              ExplicitLeft = 383
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 856
          ExplicitWidth = 856
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
