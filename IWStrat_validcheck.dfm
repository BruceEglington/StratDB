object ISFValidCheck: TISFValidCheck
  Left = 0
  Top = 0
  Width = 717
  Height = 545
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
  object iwDBeID: TIWDBEdit
    AlignWithMargins = False
    Left = 242
    Top = 107
    Width = 73
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeID'
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'UNITID'
    DataSource = dmStrat.dsValidFull
    PasswordPrompt = False
  end
  object iwDBeStatus: TIWDBEdit
    AlignWithMargins = False
    Left = 242
    Top = 134
    Width = 211
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeStatus'
    SubmitOnAsyncEvent = True
    TabOrder = 1
    AutoEditable = False
    DataField = 'VALIDSTATUSID'
    DataSource = dmStrat.dsValidFull
    PasswordPrompt = False
  end
  object iwDBeDoneBy: TIWDBEdit
    AlignWithMargins = False
    Left = 242
    Top = 160
    Width = 211
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'iwDBeDoneBy'
    SubmitOnAsyncEvent = True
    TabOrder = 2
    AutoEditable = False
    DataField = 'DONEBY'
    DataSource = dmStrat.dsValidFull
    PasswordPrompt = False
  end
  object iwDBeDateDone: TIWDBEdit
    AlignWithMargins = False
    Left = 242
    Top = 186
    Width = 267
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Editable = False
    NonEditableAsLabel = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    FriendlyName = 'IWDBEdit4'
    SubmitOnAsyncEvent = True
    TabOrder = 3
    AutoEditable = False
    DataField = 'DATEDONE'
    DataSource = dmStrat.dsValidFull
    PasswordPrompt = False
  end
  object iwDBmComments: TIWDBMemo
    AlignWithMargins = False
    Left = 104
    Top = 246
    Width = 565
    Height = 278
    StyleRenderOptions.RenderBorder = False
    BGColor = clWebWHITE
    Editable = False
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    TabOrder = 4
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'COMMENTS'
    DataSource = dmStrat.dsValidFull
    FriendlyName = 'iwDBmComments'
  end
  object iwbSaveReturn: TIWButton
    AlignWithMargins = False
    Left = 102
    Top = 76
    Width = 87
    Height = 25
    Caption = 'Save'
    Color = clWebLIGHTGREEN
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbSaveReturn'
    TabOrder = 5
    OnClick = iwbReturnClick
  end
  object iwlID: TIWLabel
    AlignWithMargins = False
    Left = 104
    Top = 110
    Width = 40
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'iwlID'
    Caption = 'Unit ID'
  end
  object IWLabel2: TIWLabel
    AlignWithMargins = False
    Left = 104
    Top = 136
    Width = 101
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'Validation Status'
  end
  object IWLabel3: TIWLabel
    AlignWithMargins = False
    Left = 104
    Top = 162
    Width = 101
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'First objection by'
  end
  object IWLabel4: TIWLabel
    AlignWithMargins = False
    Left = 104
    Top = 188
    Width = 130
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'Date for this objection'
  end
  object IWLabel5: TIWLabel
    AlignWithMargins = False
    Left = 104
    Top = 224
    Width = 68
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel5'
    Caption = 'Comments'
  end
  object iwbCancelReturn: TIWButton
    AlignWithMargins = False
    Left = 202
    Top = 76
    Width = 87
    Height = 25
    Caption = 'Cancel'
    Color = clWebLIGHTSALMON
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbCancelReturn'
    TabOrder = 6
    OnClick = iwbReturnClick
  end
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 55
    Width = 83
    Height = 490
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
  object iwbClearObjection: TIWButton
    AlignWithMargins = False
    Left = 464
    Top = 76
    Width = 137
    Height = 25
    Caption = 'Clear objection'
    Color = clWebPEACHPUFF
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbClearObjection'
    TabOrder = 7
    OnClick = iwbClearObjectionClick
  end
  object IWLabel6: TIWLabel
    AlignWithMargins = False
    Left = 240
    Top = 224
    Width = 295
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    HasTabOrder = False
    FriendlyName = 'IWLabel6'
    Caption = '(add your comments above any that already exist)'
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 717
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
    ExplicitWidth = 717
    inherited IWFrameRegion: TIWRegion
      Width = 717
      TabOrder = 8
      ExplicitWidth = 717
      inherited iwrHeader: TIWRegion
        Width = 717
        ExplicitWidth = 717
        inherited iwrWelcome: TIWRegion
          Width = 717
          ExplicitWidth = 717
          inherited iwrDisplayUserName: TIWRegion
            Width = 517
            ExplicitWidth = 517
            inherited lblWelcome: TIWLabel
              Left = 388
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 561
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 717
          ExplicitWidth = 717
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
