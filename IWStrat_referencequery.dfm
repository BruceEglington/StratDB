object ISFReferenceQuery: TISFReferenceQuery
  Left = 0
  Top = 0
  Width = 727
  Height = 704
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
  object iweReferenceFrom: TIWEdit
    AlignWithMargins = False
    Left = 142
    Top = 103
    Width = 179
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  object IWLabel1: TIWLabel
    AlignWithMargins = False
    Left = 102
    Top = 80
    Width = 158
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Show references ranging'
  end
  object iwbSubmit: TIWButton
    AlignWithMargins = False
    Left = 102
    Top = 616
    Width = 349
    Height = 25
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'iwbSubmit'
    TabOrder = 5
    OnClick = iwbSubmitClick
  end
  object IWLabel2: TIWLabel
    AlignWithMargins = False
    Left = 102
    Top = 106
    Width = 29
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel2'
    Caption = 'from'
  end
  object IWLabel3: TIWLabel
    AlignWithMargins = False
    Left = 102
    Top = 134
    Width = 12
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'to'
  end
  object iweReferenceTo: TIWEdit
    AlignWithMargins = False
    Left = 142
    Top = 131
    Width = 179
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 2
  end
  object iwcbContinents: TIWCheckBox
    AlignWithMargins = False
    Left = 102
    Top = 174
    Width = 351
    Height = 21
    Caption = 'Include selection from Regions'
    Editable = True
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    Font.PxSize = 12
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 3
    Checked = False
    FriendlyName = 'iwcbContinents'
  end
  object iwlContinents: TIWListbox
    AlignWithMargins = False
    Left = 104
    Top = 196
    Width = 349
    Height = 373
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    RequireSelection = False
    UseSize = False
    TabOrder = 4
    FriendlyName = 'iwlContinents'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
  end
  object lblFromError: TIWLabel
    AlignWithMargins = False
    Left = 353
    Top = 104
    Width = 75
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    Font.Color = clWebRED
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblFromError'
    Caption = 'lblFromError'
  end
  object lblToError: TIWLabel
    AlignWithMargins = False
    Left = 353
    Top = 132
    Width = 59
    Height = 15
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.PxSize = 12
    Font.Color = clWebRED
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblToError'
    Caption = 'lblToError'
  end
  object rectLeft: TIWRectangle
    AlignWithMargins = False
    Left = 0
    Top = 55
    Width = 83
    Height = 649
    Align = alLeft
    ZIndex = 1
    Font.PxSize = 13
    Font.Color = clWebBLACK
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
    ExplicitHeight = 359
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 727
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
    ExplicitWidth = 727
    inherited IWFrameRegion: TIWRegion
      Width = 727
      TabOrder = 6
      ExplicitWidth = 727
      inherited iwrHeader: TIWRegion
        Width = 727
        ExplicitWidth = 727
        inherited iwrWelcome: TIWRegion
          Width = 727
          ExplicitWidth = 727
          inherited iwrDisplayUserName: TIWRegion
            Width = 527
            ExplicitWidth = 527
            inherited lblWelcome: TIWLabel
              Left = 254
              Width = 64
              Alignment = taRightJustify
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 419
              ExplicitWidth = 64
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 727
          ExplicitWidth = 727
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
