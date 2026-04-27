object ISFOptions: TISFOptions
  Left = 0
  Top = 0
  Width = 777
  Height = 317
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
  object iwbSavePreferences: TIWButton
    AlignWithMargins = False
    Left = 96
    Top = 78
    Width = 125
    Height = 25
    Caption = 'Save Preferences'
    Color = clWebLIGHTGREEN
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.PxSize = 10
    FriendlyName = 'iwbSavePreferences'
    TabOrder = 1
    OnClick = iwbSavePreferencesClick
  end
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 55
    Width = 83
    Height = 262
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
    Left = 288
    Top = 78
    Width = 125
    Height = 25
    Caption = 'Cancel'
    Color = clWebLIGHTSALMON
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.PxSize = 10
    FriendlyName = 'iwbCancel'
    TabOrder = 2
    OnClick = iwbCancelClick
  end
  object iwrgLinkToDateView: TIWRadioGroup
    AlignWithMargins = False
    Left = 94
    Top = 196
    Width = 396
    Height = 43
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    Font.PxSize = 10
    FriendlyName = 'iwrgLinkToDateView'
    ItemIndex = 1
    Items.Strings = (
      'Link to DateView geochronology database'
      'Do not link to DateView')
    Layout = glVertical
  end
  object lblShowAll: TIWLabel
    AlignWithMargins = False
    Left = 496
    Top = 204
    Width = 191
    Height = 13
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.PxSize = 10
    Font.Color = clWebRED
    HasTabOrder = False
    FriendlyName = 'lblInterpretation1Caption'
    Caption = 'One of these must be selected'
  end
  object iwrgIncludeSeams: TIWRadioGroup
    AlignWithMargins = False
    Left = 94
    Top = 248
    Width = 396
    Height = 43
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    Font.PxSize = 10
    FriendlyName = 'iwrgIncludeSeams'
    ItemIndex = 1
    Items.Strings = (
      'Include Seams and Reefs in list of units to choose from'
      'Do not include Seams and Reefs in unit selection list')
    Layout = glVertical
    TabOrder = 3
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 777
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
    ExplicitWidth = 777
    inherited IWFrameRegion: TIWRegion
      Width = 777
      TabOrder = 4
      ExplicitWidth = 777
      inherited iwrHeader: TIWRegion
        Width = 777
        ExplicitWidth = 777
        inherited iwrWelcome: TIWRegion
          Width = 777
          ExplicitWidth = 777
          inherited iwrDisplayUserName: TIWRegion
            Width = 577
            ExplicitWidth = 577
            inherited lblWelcome: TIWLabel
              Left = 448
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 561
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 777
          ExplicitWidth = 777
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
