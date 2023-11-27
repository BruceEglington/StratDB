object ISFNewRecord3: TISFNewRecord3
  Left = 0
  Top = 0
  Width = 1103
  Height = 633
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
  object iwbSubmitQuery: TIWButton
    Left = 272
    Top = 386
    Width = 187
    Height = 25
    Caption = 'Submit new data record'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery'
    TabOrder = 2
    OnClick = iwbSubmitQueryClick
  end
  object IWLabel3: TIWLabel
    Left = 100
    Top = 123
    Width = 107
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Stratigraphic unit'
  end
  object IWLabel1: TIWLabel
    Left = 100
    Top = 158
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Reference'
  end
  object iwcbReference: TIWComboBox
    Left = 234
    Top = 155
    Width = 623
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    ItemIndex = -1
    Sorted = True
    FriendlyName = 'iwcbUnit'
    NoSelectionText = '-- No Selection --'
  end
  object iwlWhoFor: TIWListbox
    Left = 234
    Top = 208
    Width = 349
    Height = 121
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    UseSize = False
    TabOrder = 1
    NonEditableAsLabel = True
    FriendlyName = 'iwlWhoFor'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object lblReferenceError: TIWLabel
    Left = 606
    Top = 182
    Width = 106
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblReferenceError'
    Caption = 'lblReferenceError'
  end
  object lblWhoForError: TIWLabel
    Left = 606
    Top = 220
    Width = 91
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblWhoForError'
    Caption = 'lblWhoForError'
  end
  object IWLabel2: TIWLabel
    Left = 100
    Top = 191
    Width = 91
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Accessable by'
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 578
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
  object iwCancel: TIWButton
    Left = 670
    Top = 386
    Width = 187
    Height = 25
    Caption = 'Cancel and return to main page'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwCancel'
    TabOrder = 3
    OnClick = iwCancelClick
  end
  object iweUnit: TIWEdit
    Left = 234
    Top = 120
    Width = 309
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweUnit'
    SubmitOnAsyncEvent = True
    TabOrder = 5
  end
  object lblStratigraphicUnitError: TIWLabel
    Left = 568
    Top = 123
    Width = 144
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'lblStratigraphicUnitError'
    Caption = 'lblStratigraphicUnitError'
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 1103
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
    ExplicitWidth = 1103
    inherited IWFrameRegion: TIWRegion
      Width = 1103
      TabOrder = 4
      ExplicitWidth = 1103
      inherited iwrHeader: TIWRegion
        Width = 1103
        ExplicitWidth = 1103
        inherited iwrWelcome: TIWRegion
          Width = 1103
          ExplicitWidth = 1103
          inherited iwrDisplayUserName: TIWRegion
            Width = 903
            ExplicitWidth = 903
            inherited lblWelcome: TIWLabel
              Left = 630
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
          Width = 1103
          ExplicitWidth = 1103
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
