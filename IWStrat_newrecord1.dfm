object ISFNewRecord1: TISFNewRecord1
  Left = 0
  Top = 0
  Width = 690
  Height = 263
  RenderInvisibleControls = True
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
  object iwbNextStageOfQuery: TIWButton
    Left = 96
    Top = 180
    Width = 169
    Height = 25
    Caption = 'Proceed to next step'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbNextStageOfQuery'
    OnClick = iwbNextStageOfQueryClick
  end
  object IWText1: TIWText
    Left = 422
    Top = 78
    Width = 259
    Height = 161
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWText1'
    Lines.Strings = (
      'Specify the Region within which the new '
      
        'record is located. Note that the value specified here will influ' +
        'ence subsequent lists.')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  object iwcbContinent: TIWComboBox
    Left = 92
    Top = 102
    Width = 310
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 1
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbContinent'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel1: TIWLabel
    Left = 92
    Top = 80
    Width = 42
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Region'
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 208
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
  object iwbCancel: TIWButton
    Left = 288
    Top = 180
    Width = 105
    Height = 25
    Caption = 'Cancel'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancel'
    TabOrder = 2
    OnClick = iwbCancelClick
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 690
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
    ExplicitWidth = 690
    inherited IWFrameRegion: TIWRegion
      Width = 690
      TabOrder = 3
      ExplicitWidth = 690
      inherited iwrHeader: TIWRegion
        Width = 690
        ExplicitWidth = 690
        inherited iwrWelcome: TIWRegion
          Width = 690
          ExplicitWidth = 690
          inherited iwrDisplayUserName: TIWRegion
            Width = 490
            ExplicitWidth = 490
            inherited lblWelcome: TIWLabel
              Left = 217
              Top = 0
              Width = 64
              Alignment = taRightJustify
              ExplicitLeft = 480
              ExplicitTop = 0
              ExplicitWidth = 64
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 690
          ExplicitWidth = 690
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
