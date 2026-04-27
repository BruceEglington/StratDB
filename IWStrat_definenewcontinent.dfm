object ISFDefineNewContinent: TISFDefineNewContinent
  Left = 0
  Top = 0
  Width = 716
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
  object iwbContinue: TIWButton
    AlignWithMargins = False
    Left = 317
    Top = 138
    Width = 94
    Height = 25
    Caption = 'Continue'
    Color = clWebLIGHTGREEN
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbContinue'
    OnClick = iwbContinueClick
  end
  object IWLabel1: TIWLabel
    AlignWithMargins = False
    Left = 36
    Top = 78
    Width = 44
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Region'
  end
  object iwlContinent: TIWComboBox
    AlignWithMargins = False
    Left = 132
    Top = 72
    Width = 259
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    TabOrder = 1
    ItemIndex = -1
    FriendlyName = 'iwlContinent'
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 716
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
    ExplicitWidth = 716
    inherited IWFrameRegion: TIWRegion
      Width = 716
      TabOrder = 2
      ExplicitWidth = 716
      inherited iwrHeader: TIWRegion
        Width = 716
        ExplicitWidth = 716
        inherited iwrWelcome: TIWRegion
          Width = 716
          ExplicitWidth = 716
          inherited iwrDisplayUserName: TIWRegion
            Width = 516
            ExplicitWidth = 516
            inherited lblWelcome: TIWLabel
              Left = 243
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 243
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 716
          ExplicitWidth = 716
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
