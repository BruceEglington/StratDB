object ISFDefineQuery2: TISFDefineQuery2
  Left = 0
  Top = 0
  Width = 822
  Height = 3000
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
    Height = 2945
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object rectLeft: TIWRectangle
      AlignWithMargins = False
      Left = 0
      Top = 0
      Width = 83
      Height = 2945
      Align = alLeft
      ZIndex = 1
      Font.PxSize = 13
      Font.Color = clWebBLACK
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
  object IWRegion3: TIWRegion
    Left = 83
    Top = 55
    Width = 739
    Height = 2945
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 739
      Height = 57
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbCancel: TIWButton
        AlignWithMargins = False
        Left = 560
        Top = 17
        Width = 150
        Height = 25
        Caption = 'Cancel query definition'
        Color = clWebLIGHTSALMON
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbCancel'
        OnClick = iwbCancelClick
      end
      object iwbClearCheckboxes: TIWButton
        AlignWithMargins = False
        Left = 360
        Top = 17
        Width = 150
        Height = 25
        Caption = 'Clear checkboxes'
        Color = clBtnFace
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbClearCheckboxes'
        TabOrder = 1
        OnClick = iwbClearCheckboxesClick
      end
      object iwbSubmitQuery: TIWButton
        AlignWithMargins = False
        Left = 16
        Top = 17
        Width = 293
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery'
        TabOrder = 2
        OnClick = iwbSubmitQueryClick
      end
    end
    object iwrAgeRange: TIWRegion
      Left = 0
      Top = 57
      Width = 739
      Height = 304
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iweToSort: TIWEdit
        AlignWithMargins = False
        Left = 281
        Top = 205
        Width = 81
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 3
      end
      object iwcbToSort: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 205
        Width = 259
        Height = 21
        Caption = 'to Sort Order (maximum)'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 4
        Checked = False
        FriendlyName = 'iwcbToSort'
      end
      object iweFromSort: TIWEdit
        AlignWithMargins = False
        Left = 281
        Top = 178
        Width = 81
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iweFromSort'
        SubmitOnAsyncEvent = True
        TabOrder = 5
      end
      object iwcbFromSort: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 178
        Width = 259
        Height = 21
        Caption = 'Include from Sort Order (minimum)'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 6
        Checked = False
        FriendlyName = 'iwcbFromSort'
      end
      object iweToDate: TIWEdit
        AlignWithMargins = False
        Left = 300
        Top = 101
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 7
      end
      object iwcbToDate: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 101
        Width = 278
        Height = 21
        Caption = 'to Maximum Age'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 8
        Checked = False
        FriendlyName = 'iwcbToDate'
      end
      object iweFromDate: TIWEdit
        AlignWithMargins = False
        Left = 300
        Top = 74
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'IWEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 9
      end
      object iwcbFromDate: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 74
        Width = 278
        Height = 21
        Caption = 'Include from Minimum Age'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 10
        Checked = False
        FriendlyName = 'iwcbFromDate'
      end
      object iwcbRestrictParentID: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 15
        Width = 402
        Height = 21
        Caption = 'Restrict results to top level units (ParentID must be zero)'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 11
        Checked = False
        FriendlyName = 'iwcbRestrictParentID'
      end
      object IWText1: TIWText
        AlignWithMargins = False
        Left = 447
        Top = 15
        Width = 261
        Height = 274
        BGColor = clNone
        ConvertSpaces = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        Font.Color = clWebDARKSLATEGRAY
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
      object iwlblErrorTop: TIWLabel
        AlignWithMargins = False
        Left = 17
        Top = 268
        Width = 250
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        Font.Color = clWebRED
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblErrorTop'
        Caption = 'No items selected or boxes not checked'
      end
    end
    object iwrUnits: TIWRegion
      Left = 0
      Top = 361
      Width = 739
      Height = 313
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlUnits: TIWListbox
        AlignWithMargins = False
        Left = 20
        Top = 41
        Width = 421
        Height = 249
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        TabOrder = 12
        NonEditableAsLabel = True
        FriendlyName = 'iwlUnits'
        Sorted = True
        MultiSelect = True
      end
      object iwcbUnits: TIWCheckBox
        AlignWithMargins = False
        Left = 15
        Top = 14
        Width = 422
        Height = 21
        Caption = 'Include selection from Stratigraphic Units'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 13
        Checked = False
        FriendlyName = 'iwcbUnits'
      end
      object IWButton8: TIWButton
        AlignWithMargins = False
        Left = 517
        Top = 48
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 14
        OnClick = iwbSubmitQueryClick
      end
    end
    object iwrDomains: TIWRegion
      Left = 0
      Top = 674
      Width = 739
      Height = 297
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton3: TIWButton
        AlignWithMargins = False
        Left = 517
        Top = 256
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 15
        OnClick = iwbSubmitQueryClick
      end
      object iwlDomains: TIWListbox
        AlignWithMargins = False
        Left = 20
        Top = 43
        Width = 623
        Height = 190
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 16
        NonEditableAsLabel = True
        FriendlyName = 'iwlDomains'
        Sorted = True
        MultiSelect = True
      end
      object iwcbDomains: TIWCheckBox
        AlignWithMargins = False
        Left = 15
        Top = 16
        Width = 422
        Height = 21
        Caption = 'Include selection from Domains'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 17
        Checked = False
        FriendlyName = 'iwcbDomains'
      end
    end
    object iwrReferences: TIWRegion
      Left = 0
      Top = 971
      Width = 739
      Height = 285
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton4: TIWButton
        AlignWithMargins = False
        Left = 517
        Top = 250
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 18
        OnClick = iwbSubmitQueryClick
      end
      object iwlReferences: TIWListbox
        AlignWithMargins = False
        Left = 20
        Top = 30
        Width = 612
        Height = 203
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 19
        NonEditableAsLabel = True
        FriendlyName = 'iwlReferences'
        Sorted = True
        MultiSelect = True
      end
      object iwcbReferences: TIWCheckBox
        AlignWithMargins = False
        Left = 15
        Top = 3
        Width = 422
        Height = 21
        Caption = 'Include selection from References'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 20
        Checked = False
        FriendlyName = 'iwcbReferences'
      end
    end
    object iwrPeriods: TIWRegion
      Left = 0
      Top = 1256
      Width = 739
      Height = 249
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton2: TIWButton
        AlignWithMargins = False
        Left = 517
        Top = 215
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 21
        OnClick = iwbSubmitQueryClick
      end
      object iwlPeriods: TIWListbox
        AlignWithMargins = False
        Left = 20
        Top = 51
        Width = 623
        Height = 158
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 22
        NonEditableAsLabel = True
        FriendlyName = 'iwlPeriods'
        Sorted = True
        MultiSelect = True
      end
      object iwcbPeriods: TIWCheckBox
        AlignWithMargins = False
        Left = 15
        Top = 24
        Width = 422
        Height = 21
        Caption = 'Include selection from Chronostratigraphic Periods'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 23
        Checked = False
        FriendlyName = 'iwcbPeriods'
      end
    end
    object iwrAgeConstraints: TIWRegion
      Left = 0
      Top = 1505
      Width = 739
      Height = 209
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton5: TIWButton
        AlignWithMargins = False
        Left = 517
        Top = 168
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 24
        OnClick = iwbSubmitQueryClick
      end
      object iwlAgeConstraints: TIWListbox
        AlignWithMargins = False
        Left = 20
        Top = 46
        Width = 623
        Height = 107
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 25
        NonEditableAsLabel = True
        FriendlyName = 'iwlPeriods'
        Sorted = True
        MultiSelect = True
      end
      object iwcbAgeConstraints: TIWCheckBox
        AlignWithMargins = False
        Left = 15
        Top = 19
        Width = 446
        Height = 21
        Caption = 'Include selection from Age Constraints'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 26
        Checked = False
        FriendlyName = 'iwcbAgeConstraints'
      end
    end
    object iwrWhoFor: TIWRegion
      Left = 0
      Top = 1714
      Width = 739
      Height = 214
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton7: TIWButton
        AlignWithMargins = False
        Left = 517
        Top = 136
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 27
        OnClick = iwbSubmitQueryClick
      end
      object iwlWhoFor: TIWListbox
        AlignWithMargins = False
        Left = 20
        Top = 39
        Width = 322
        Height = 158
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 28
        NonEditableAsLabel = True
        FriendlyName = 'iwlWhoFor'
        Sorted = True
        MultiSelect = True
      end
      object iwcbWhoFor: TIWCheckBox
        AlignWithMargins = False
        Left = 15
        Top = 12
        Width = 449
        Height = 21
        Caption = 'Include selection from Who For'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 29
        Checked = False
        FriendlyName = 'iwcbWhoFor'
      end
    end
    object iwrInc4Cht: TIWRegion
      Left = 0
      Top = 1928
      Width = 739
      Height = 161
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton6: TIWButton
        AlignWithMargins = False
        Left = 517
        Top = 40
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 30
        OnClick = iwbSubmitQueryClick
      end
      object iwcbInc4Cht: TIWCheckBox
        AlignWithMargins = False
        Left = 15
        Top = 12
        Width = 476
        Height = 21
        Caption = 'Include selection from Include for Chart'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 31
        Checked = False
        FriendlyName = 'iwcbInc4Cht'
      end
      object iwlInc4Cht: TIWListbox
        AlignWithMargins = False
        Left = 20
        Top = 39
        Width = 444
        Height = 90
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 32
        NonEditableAsLabel = True
        FriendlyName = 'iwlPeriods'
        Sorted = True
        MultiSelect = True
      end
    end
    object iwrValidation: TIWRegion
      Left = 0
      Top = 2089
      Width = 739
      Height = 229
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton1: TIWButton
        AlignWithMargins = False
        Left = 517
        Top = 184
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 33
        OnClick = iwbSubmitQueryClick
      end
      object iwlValidation: TIWListbox
        AlignWithMargins = False
        Left = 20
        Top = 39
        Width = 471
        Height = 170
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 34
        NonEditableAsLabel = True
        FriendlyName = 'iwlValidation'
        Sorted = True
        MultiSelect = True
      end
      object iwcbValidation: TIWCheckBox
        AlignWithMargins = False
        Left = 15
        Top = 12
        Width = 476
        Height = 21
        Caption = 'Include selection from Validation Status'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 35
        Checked = False
        FriendlyName = 'iwcbValidation'
      end
    end
    object iwrOrderBy: TIWRegion
      Left = 0
      Top = 2318
      Width = 739
      Height = 210
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlblErrorBottom: TIWLabel
        AlignWithMargins = False
        Left = 327
        Top = 162
        Width = 250
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        Font.Color = clWebRED
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblErrorBottom'
        Caption = 'No items selected or boxes not checked'
      end
      object iwbSubmitQuery2: TIWButton
        AlignWithMargins = False
        Left = 66
        Top = 152
        Width = 125
        Height = 25
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 36
        OnClick = iwbSubmitQueryClick
      end
      object iwrgOrderBy: TIWRadioGroup
        AlignWithMargins = False
        Left = 20
        Top = 39
        Width = 417
        Height = 85
        SubmitOnAsyncEvent = True
        RawText = False
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwrgOrderBy'
        ItemIndex = 0
        Items.Strings = (
          'Area, UnitName, SortOrder'
          'Unit ID'
          'SortOrder, Area, UnitName'
          'Parent ID')
        Layout = glVertical
        TabOrder = 37
      end
      object IWLabel4: TIWLabel
        AlignWithMargins = False
        Left = 15
        Top = 18
        Width = 101
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Order results by'
      end
    end
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 822
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
    ExplicitWidth = 822
    inherited IWFrameRegion: TIWRegion
      Width = 822
      TabOrder = 38
      ExplicitWidth = 822
      inherited iwrHeader: TIWRegion
        Width = 822
        ExplicitWidth = 822
        inherited iwrWelcome: TIWRegion
          Width = 822
          ExplicitWidth = 822
          inherited iwrDisplayUserName: TIWRegion
            Width = 622
            ExplicitWidth = 622
            inherited lblWelcome: TIWLabel
              Left = 349
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 349
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 822
          ExplicitWidth = 822
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
