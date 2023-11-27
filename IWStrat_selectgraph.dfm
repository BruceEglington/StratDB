object ISFSelectGraph: TISFSelectGraph
  Left = 0
  Top = 0
  Width = 1105
  Height = 647
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
  object iwrgPlotType: TIWRadioGroup
    Left = 112
    Top = 100
    Width = 537
    Height = 167
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgPlotType'
    ItemIndex = 0
    Items.Strings = (
      'Probability density plot'
      'Test')
    Layout = glVertical
  end
  object IWLabel1: TIWLabel
    Left = 92
    Top = 76
    Width = 152
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Choose the plot required'
  end
  object iwbSubmitGraphSelection: TIWButton
    Left = 238
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitGraphSelection'
    TabOrder = 6
    OnClick = iwbSubmitGraphSelectionClick
  end
  object iwrgNormalisationType: TIWRadioGroup
    Left = 110
    Top = 182
    Width = 550
    Height = 47
    OnClick = iwrgPDFChangeClick
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgPlotType'
    ItemIndex = 0
    Items.Strings = (
      'Normalise most intense peak to 100%'
      
        'True probability (curves normalised to number of contributing da' +
        'ta)')
    Layout = glVertical
    TabOrder = 1
  end
  object IWLabel3: TIWLabel
    Left = 92
    Top = 158
    Width = 181
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Probability plot normalisation'
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 592
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
  end
  object iwlSpectrumAgeHeading: TIWLabel
    Left = 92
    Top = 236
    Width = 178
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlSpectrumAges'
    Caption = 'Probability density age limits'
  end
  object iwlFromAge: TIWLabel
    Left = 112
    Top = 258
    Width = 88
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlFromAge'
    Caption = 'Older age limit'
  end
  object iweFromAge: TIWEdit
    Left = 202
    Top = 256
    Width = 67
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweFromAge'
    SubmitOnAsyncEvent = True
    TabOrder = 3
    Text = 'iweFromAge'
  end
  object iwlToAge: TIWLabel
    Left = 294
    Top = 258
    Width = 105
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlToAge'
    Caption = 'Younger age limit'
  end
  object iwetoAge: TIWEdit
    Left = 402
    Top = 256
    Width = 67
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwetoAge'
    SubmitOnAsyncEvent = True
    TabOrder = 4
    Text = 'iweFromAge'
  end
  object iwcbSpectrumAges: TIWCheckBox
    Left = 350
    Top = 232
    Width = 121
    Height = 21
    Cursor = crAuto
    Caption = 'Reset to defaults'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 2
    OnClick = iwcbSpectrumAgesClick
    Checked = False
    FriendlyName = 'iwcbSpectrumAges'
  end
  object iwrgPDFType: TIWRadioGroup
    Left = 110
    Top = 314
    Width = 434
    Height = 43
    OnClick = iwrgPDFChangeClick
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgShowAllSampleLocalities'
    ItemIndex = 1
    Items.Strings = (
      'pdf '#39'And'#39'  (default)'
      'pdf '#39'Or'#39' ')
    Layout = glVertical
    TabOrder = 5
  end
  object IWLabel4: TIWLabel
    Left = 92
    Top = 293
    Width = 198
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlSpectrumAges'
    Caption = 'Probability density function type'
  end
  object iwbReturn: TIWButton
    Left = 406
    Top = 384
    Width = 135
    Height = 25
    Caption = 'Return to Main Form'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 7
    OnClick = iwbReturnClick
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 1105
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
    ExplicitWidth = 1105
    inherited IWFrameRegion: TIWRegion
      Width = 1105
      TabOrder = 8
      ExplicitWidth = 1105
      inherited iwrHeader: TIWRegion
        Width = 1105
        ExplicitWidth = 1105
        inherited iwrWelcome: TIWRegion
          Width = 1105
          ExplicitWidth = 1105
          inherited iwrDisplayUserName: TIWRegion
            Width = 905
            ExplicitWidth = 905
            inherited lblWelcome: TIWLabel
              Left = 776
              ExplicitLeft = 561
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1105
          ExplicitWidth = 1105
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
