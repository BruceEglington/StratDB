object ISFDefineQuery: TISFDefineQuery
  Left = 0
  Top = 0
  Width = 1026
  Height = 850
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
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 1026
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
    ExplicitWidth = 1026
    inherited IWFrameRegion: TIWRegion
      Width = 1026
      TabOrder = 5
      ExplicitWidth = 1026
      inherited iwrHeader: TIWRegion
        Width = 1026
        ExplicitWidth = 1026
        inherited iwrWelcome: TIWRegion
          Width = 1026
          ExplicitWidth = 1026
          inherited iwrDisplayUserName: TIWRegion
            Width = 826
            ExplicitWidth = 826
            inherited lblWelcome: TIWLabel
              Left = 553
              ExplicitLeft = 344
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1026
          ExplicitWidth = 1026
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
  object iwrLeft: TIWRegion
    Left = 0
    Top = 55
    Width = 83
    Height = 795
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    Color = clWebLAVENDER
  end
  object iwrRight: TIWRegion
    Left = 83
    Top = 55
    Width = 943
    Height = 795
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwrButtonTop: TIWRegion
      Left = 0
      Top = 0
      Width = 943
      Height = 57
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbNextStageOfQuery: TIWButton
        Left = 16
        Top = 17
        Width = 293
        Height = 25
        Caption = 'Proceed to next stage of query definition'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbNextStageOfQuery'
        OnClick = iwbNextStageOfQueryClick
      end
      object iwbClearCheckboxes: TIWButton
        Left = 360
        Top = 17
        Width = 150
        Height = 25
        Caption = 'Clear checkboxes'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbClearCheckboxes'
        TabOrder = 1
        OnClick = iwbClearCheckboxesClick
      end
      object iwbCancel: TIWButton
        Left = 560
        Top = 17
        Width = 150
        Height = 25
        Caption = 'Cancel query definition'
        Color = clWebLIGHTSALMON
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbCancel'
        TabOrder = 2
        OnClick = iwbCancelClick
      end
    end
    object iwrRegions: TIWRegion
      Left = 0
      Top = 57
      Width = 943
      Height = 240
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwcbContinents: TIWCheckBox
        Left = 14
        Top = 15
        Width = 315
        Height = 21
        Visible = False
        Caption = 'Include selection from Regions'
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 3
        Checked = True
        FriendlyName = 'iwcbContinents'
      end
      object IWText1: TIWText
        Left = 342
        Top = 13
        Width = 275
        Height = 175
        BGColor = clNone
        ConvertSpaces = True
        Font.Color = clWebDARKSLATEGRAY
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWText1'
        Lines.Strings = (
          'Select the Regions from which you wish '
          'to obtain data. Note that the values '
          'selected here will influence subsequent lists '
          'used to further refine search conditions and '
          'will also influence the final query.'
          ''
          'Multiple Regions may be selected. '
          ''
          'A more restricted range in data will improve '
          'performance and provide faster response times '
          'to your queries.')
        RawText = False
        UseFrame = False
        WantReturns = True
      end
      object iwlContinents: TIWListbox
        Left = 16
        Top = 37
        Width = 313
        Height = 164
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        RequireSelection = False
        TabOrder = 4
        NonEditableAsLabel = True
        FriendlyName = 'iwlContinents'
        Sorted = True
        MultiSelect = True
        NoSelectionText = '-- No Selection --'
      end
      object iwlblError: TIWLabel
        Left = 117
        Top = 219
        Width = 112
        Height = 15
        Font.Color = clWebRED
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblError'
        Caption = 'No items selected'
      end
    end
    object iwrCheckboxes: TIWRegion
      Left = 0
      Top = 343
      Width = 943
      Height = 400
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwrRulers: TIWRegion
        Left = 0
        Top = 161
        Width = 943
        Height = 48
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object iwrRulersLeft: TIWRegion
          Left = 0
          Top = 0
          Width = 300
          Height = 48
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
          object IWHRule2: TIWHRule
            Left = 13
            Top = 23
            Width = 260
            Height = 2
            Visible = False
            FriendlyName = 'IWHRule1'
            BorderColor = clWebBLACK
          end
        end
        object iwrRulersMiddle: TIWRegion
          Left = 300
          Top = 0
          Width = 20
          Height = 48
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
        end
        object iwrRulersRight: TIWRegion
          Left = 320
          Top = 0
          Width = 300
          Height = 48
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
          object IWHRule1: TIWHRule
            Left = 18
            Top = 23
            Width = 260
            Height = 2
            Visible = False
            FriendlyName = 'IWHRule1'
            BorderColor = clWebBLACK
          end
        end
      end
      object iwrReferencesLIPs: TIWRegion
        Left = 0
        Top = 209
        Width = 943
        Height = 184
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object iwrReferences: TIWRegion
          Left = 0
          Top = 0
          Width = 300
          Height = 184
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
          object iwcbReferences: TIWCheckBox
            Left = 15
            Top = 18
            Width = 258
            Height = 21
            Caption = 'References'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 15
            Checked = False
            FriendlyName = 'iwcbReferences'
          end
          object iwcbDomains: TIWCheckBox
            Left = 15
            Top = 45
            Width = 258
            Height = 21
            Caption = 'Domains'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 16
            Checked = False
            FriendlyName = 'iwcbDomains'
          end
          object iwcbWhoFor: TIWCheckBox
            Left = 15
            Top = 126
            Width = 258
            Height = 21
            Caption = 'Who For'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 17
            Checked = False
            FriendlyName = 'iwcbWhoFor'
          end
          object iwcbValidation: TIWCheckBox
            Left = 15
            Top = 153
            Width = 258
            Height = 21
            Caption = 'Validation Status'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 18
            Checked = False
            FriendlyName = 'iwcbValidation'
          end
          object iwcbOrogenies: TIWCheckBox
            Left = 15
            Top = 99
            Width = 258
            Height = 21
            Caption = 'Orogenies'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 23
            Checked = False
            FriendlyName = 'iwcbOrogenies'
          end
          object iwcbDomainTypes: TIWCheckBox
            Left = 15
            Top = 72
            Width = 258
            Height = 21
            Caption = 'Domain Types'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 24
            Checked = False
            FriendlyName = 'iwcbDomainTypes'
          end
        end
        object iwrReferencesLIPsMiddle: TIWRegion
          Left = 300
          Top = 0
          Width = 20
          Height = 184
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
        end
        object iwrLIPs: TIWRegion
          Left = 320
          Top = 0
          Width = 300
          Height = 184
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
          object iwcbLIPs: TIWCheckBox
            Left = 15
            Top = 18
            Width = 258
            Height = 21
            Caption = 'Large Igneous Provinces'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 19
            Checked = False
            FriendlyName = 'iwcbLIPs'
          end
          object iwcbLIPContOceans: TIWCheckBox
            Left = 15
            Top = 45
            Width = 242
            Height = 21
            Caption = 'LIP Continental / Oceanic'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 20
            Checked = False
            FriendlyName = 'iwcbLIPContOceans'
          end
          object iwcbLIPSizes: TIWCheckBox
            Left = 15
            Top = 99
            Width = 242
            Height = 21
            Caption = 'LIP Size'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 21
            Checked = False
            FriendlyName = 'iwcbLIPSizes'
          end
          object iwcbLIPRatings: TIWCheckBox
            Left = 15
            Top = 72
            Width = 242
            Height = 21
            Caption = 'LIP Rating'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 22
            Checked = False
            FriendlyName = 'iwcbLIPRatings'
          end
          object iwcbLIPMorphologies: TIWCheckBox
            Left = 15
            Top = 126
            Width = 242
            Height = 21
            Caption = 'LIP Morphologies'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 25
            Checked = False
            FriendlyName = 'iwcbLIPMorphologies'
          end
        end
      end
      object iwrUnitsDeposits: TIWRegion
        Left = 0
        Top = 0
        Width = 943
        Height = 161
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object iwrUnits: TIWRegion
          Left = 0
          Top = 0
          Width = 300
          Height = 161
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
          object iwcbUnits: TIWCheckBox
            Left = 15
            Top = 12
            Width = 258
            Height = 21
            Caption = 'Stratigraphic Units'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 6
            Checked = False
            FriendlyName = 'iwcbUnits'
          end
          object iwcbInc4Cht: TIWCheckBox
            Left = 15
            Top = 120
            Width = 258
            Height = 21
            Caption = 'Include for Chart'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 7
            Checked = False
            FriendlyName = 'iwcbInc4Cht'
          end
          object iwcbAgeConstraints: TIWCheckBox
            Left = 15
            Top = 93
            Width = 258
            Height = 21
            Caption = 'Age Constraints'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 8
            Checked = False
            FriendlyName = 'iwcbAgeConstraints'
          end
          object iwcbPeriods: TIWCheckBox
            Left = 15
            Top = 66
            Width = 258
            Height = 21
            Caption = 'Chronostratigraphic Periods'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 9
            Checked = False
            FriendlyName = 'iwcbPeriods'
          end
          object iwcbUnitRanks: TIWCheckBox
            Left = 15
            Top = 39
            Width = 258
            Height = 21
            Caption = 'Unit Ranks'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 10
            Checked = False
            FriendlyName = 'iwcbUnitRanks'
          end
        end
        object iwrUnitsDepositsMiddle: TIWRegion
          Left = 300
          Top = 0
          Width = 20
          Height = 161
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
        end
        object iwrDeposits: TIWRegion
          Left = 320
          Top = 0
          Width = 300
          Height = 161
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
          object iwcbDeposits: TIWCheckBox
            Left = 15
            Top = 39
            Width = 242
            Height = 21
            Caption = 'Deposits'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 11
            Checked = False
            FriendlyName = 'iwcbDeposits'
          end
          object iwcbDepositClans: TIWCheckBox
            Left = 15
            Top = 12
            Width = 242
            Height = 21
            Caption = 'Deposit Clans'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 12
            Checked = False
            FriendlyName = 'iwcbDepositClans'
          end
          object iwcbCommodities: TIWCheckBox
            Left = 15
            Top = 93
            Width = 242
            Height = 21
            Caption = 'Commodities'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 13
            Checked = False
            FriendlyName = 'iwcbCommodities'
          end
          object iwcbDepositStatus: TIWCheckBox
            Left = 15
            Top = 66
            Width = 242
            Height = 21
            Caption = 'Deposit Status'
            Editable = True
            Font.Color = clNone
            Font.FontName = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            SubmitOnAsyncEvent = True
            Style = stNormal
            TabOrder = 14
            Checked = False
            FriendlyName = 'iwcbDepositStatus'
          end
        end
      end
    end
    object iwrAllowSelectionsFrom: TIWRegion
      Left = 0
      Top = 297
      Width = 943
      Height = 46
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWText2: TIWText
        Left = 22
        Top = 11
        Width = 601
        Height = 35
        BGColor = clNone
        ConvertSpaces = True
        Font.Color = clWebDARKSLATEGRAY
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWText1'
        Lines.Strings = (
          
            'Select which lists are to be populated with values on subsequent' +
            ' pages. Populate only those lists you wish to use so as to speed' +
            ' up processing.')
        RawText = False
        UseFrame = False
        WantReturns = True
      end
    end
  end
end
