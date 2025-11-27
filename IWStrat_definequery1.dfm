object ISFDefineQuery1: TISFDefineQuery1
  Left = 0
  Top = 0
  Width = 900
  Height = 1200
  RenderInvisibleControls = False
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
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 900
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
    ExplicitWidth = 900
    inherited IWFrameRegion: TIWRegion
      Width = 900
      TabOrder = 12
      ExplicitWidth = 900
      inherited iwrHeader: TIWRegion
        Width = 900
        ExplicitWidth = 900
        inherited iwrWelcome: TIWRegion
          Width = 900
          ExplicitWidth = 900
          inherited iwrDisplayUserName: TIWRegion
            Width = 700
            ExplicitWidth = 700
            inherited lblWelcome: TIWLabel
              Left = 427
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 427
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 900
          ExplicitWidth = 900
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
  object iwrLeft: TIWRegion
    Left = 0
    Top = 55
    Width = 83
    Height = 1145
    RenderInvisibleControls = False
    Align = alLeft
    Color = clWebLAVENDER
  end
  object iwrRight: TIWRegion
    Left = 83
    Top = 55
    Width = 817
    Height = 1145
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwrButtonTop: TIWRegion
      Left = 0
      Top = 0
      Width = 817
      Height = 57
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbNextStageOfQuery: TIWButton
        AlignWithMargins = False
        Left = 16
        Top = 17
        Width = 293
        Height = 25
        Caption = 'Proceed to next stage of query definition'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbNextStageOfQuery'
        OnClick = iwbNextStageOfQueryClick
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
        TabOrder = 2
        OnClick = iwbCancelClick
      end
    end
    object iwrAreas: TIWRegion
      Left = 0
      Top = 57
      Width = 817
      Height = 249
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwcbAreas: TIWCheckBox
        AlignWithMargins = False
        Left = 14
        Top = 16
        Width = 315
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from Areas'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 3
        Checked = True
        FriendlyName = 'iwcbAreas'
      end
      object iwlAreas: TIWListbox
        AlignWithMargins = False
        Left = 16
        Top = 38
        Width = 313
        Height = 147
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        TabOrder = 4
        NonEditableAsLabel = True
        FriendlyName = 'iwlAreas'
        Sorted = True
        MultiSelect = True
      end
      object iwlblError: TIWLabel
        AlignWithMargins = False
        Left = 44
        Top = 204
        Width = 250
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        Font.Color = clWebRED
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblError'
        Caption = 'No items selected or boxes not checked'
      end
      object IWText1: TIWText
        AlignWithMargins = False
        Left = 342
        Top = 14
        Width = 275
        Height = 175
        BGColor = clNone
        ConvertSpaces = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        Font.Color = clWebDARKSLATEGRAY
        FriendlyName = 'IWText1'
        Lines.Strings = (
          'Select the Areas from which you wish to '
          'obtain data. Note that the values selected '
          'here will influence subsequent lists used to '
          'further refine search conditions and will also '
          'influence the final query.'
          ''
          'Multiple Areas may be selected. '
          ''
          'A more restricted range in data will improve '
          'performance and provide faster response times '
          'to your queries.')
        RawText = False
        UseFrame = False
        WantReturns = True
      end
    end
    object iwrCheckboxes: TIWRegion
      Left = 0
      Top = 585
      Width = 817
      Height = 312
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWText2: TIWText
        AlignWithMargins = False
        Left = 16
        Top = 14
        Width = 601
        Height = 35
        BGColor = clNone
        ConvertSpaces = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        Font.Color = clWebDARKSLATEGRAY
        FriendlyName = 'IWText1'
        Lines.Strings = (
          
            'Select which lists are to be populated with values on subsequent' +
            ' pages. Populate only those lists you wish to use so as to speed' +
            ' up processing.')
        RawText = False
        UseFrame = False
        WantReturns = True
      end
      object iwcbUnits: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 55
        Width = 425
        Height = 21
        Cursor = crAuto
        Caption = 'Stratigraphic Units'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 5
        Checked = False
        FriendlyName = 'iwcbUnits'
      end
      object iwcbReferences: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 130
        Width = 425
        Height = 21
        Cursor = crAuto
        Caption = 'References'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 6
        Checked = False
        FriendlyName = 'iwcbReferences'
      end
      object iwcbValidation: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 180
        Width = 425
        Height = 21
        Cursor = crAuto
        Caption = 'Validation Status'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 7
        Checked = False
        FriendlyName = 'iwcbValidation'
      end
      object iwcbDomains: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 80
        Width = 425
        Height = 21
        Cursor = crAuto
        Caption = 'Domains'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 8
        Checked = False
        FriendlyName = 'iwcbDomains'
      end
      object iwcbInc4Cht: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 230
        Width = 425
        Height = 21
        Cursor = crAuto
        Caption = 'Include for Chart'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 9
        Checked = False
        FriendlyName = 'iwcbInc4Cht'
      end
      object iwcbAgeConstraints: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 105
        Width = 425
        Height = 21
        Cursor = crAuto
        Caption = 'Age Constraints'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 10
        Checked = False
        FriendlyName = 'iwcbAgeConstraints'
      end
      object iwcbPeriods: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 205
        Width = 425
        Height = 21
        Cursor = crAuto
        Caption = 'Chronostratigraphic Periods'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 11
        Checked = False
        FriendlyName = 'iwcbPeriods'
      end
      object iwcbWhoFor: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 155
        Width = 425
        Height = 21
        Cursor = crAuto
        Caption = 'Who For'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 13
        Checked = False
        FriendlyName = 'iwcbWhoFor'
      end
    end
    object iwrUnitRanks: TIWRegion
      Left = 0
      Top = 306
      Width = 817
      Height = 279
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlUnitRanks: TIWListbox
        AlignWithMargins = False
        Left = 20
        Top = 41
        Width = 421
        Height = 208
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        TabOrder = 14
        NonEditableAsLabel = True
        FriendlyName = 'iwlUnitRanks'
        Sorted = True
        MultiSelect = True
      end
      object iwcbUnitRanks: TIWCheckBox
        AlignWithMargins = False
        Left = 15
        Top = 14
        Width = 426
        Height = 21
        Cursor = crAuto
        Caption = 'Include selection from Unit Ranks'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 15
        Checked = False
        FriendlyName = 'iwcbUnitRanks'
      end
    end
  end
end
