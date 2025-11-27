object ISFSelectChart: TISFSelectChart
  Left = 0
  Top = 0
  Width = 713
  Height = 349
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Select Chart'
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
    AlignWithMargins = False
    Left = 112
    Top = 194
    Width = 141
    Height = 25
    Caption = 'Proceed'
    Color = clWebLIGHTGREEN
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbNextStageOfQuery'
    OnClick = iwbNextStageOfQueryClick
  end
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 55
    Width = 83
    Height = 294
    Align = alLeft
    ZIndex = 1
    Font.PxSize = 13
    Font.Color = clWebBLACK
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object iwbCancel: TIWButton
    AlignWithMargins = False
    Left = 356
    Top = 194
    Width = 141
    Height = 25
    Caption = 'Cancel'
    Color = clWebLIGHTSALMON
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbCancel'
    TabOrder = 1
    OnClick = iwbCancelClick
  end
  object iwcbCharts: TIWComboBox
    AlignWithMargins = False
    Left = 112
    Top = 108
    Width = 385
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    TabOrder = 2
    ItemIndex = -1
    FriendlyName = 'iwcbCharts'
  end
  object iwlblError: TIWLabel
    AlignWithMargins = False
    Left = 112
    Top = 87
    Width = 41
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    Font.Color = clWebBLACK
    HasTabOrder = False
    FriendlyName = 'iwlblError'
    Caption = 'Charts'
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 713
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
    ExplicitWidth = 713
    inherited IWFrameRegion: TIWRegion
      Width = 713
      TabOrder = 3
      ExplicitWidth = 713
      inherited iwrHeader: TIWRegion
        Width = 713
        ExplicitWidth = 713
        inherited iwrWelcome: TIWRegion
          Width = 713
          ExplicitWidth = 713
          inherited iwrDisplayUserName: TIWRegion
            Width = 513
            ExplicitWidth = 513
            inherited lblWelcome: TIWLabel
              Left = 384
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 561
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 713
          ExplicitWidth = 713
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
