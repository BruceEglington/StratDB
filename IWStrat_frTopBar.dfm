object ISFTopBarStrat: TISFTopBarStrat
  Left = 0
  Top = 0
  Width = 792
  Height = 55
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
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
  object IWFrameRegion: TIWRegion
    Left = 0
    Top = 0
    Width = 792
    Height = 55
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    Align = alTop
    BorderOptions.Style = cbsNone
    Color = clWebALICEBLUE
    ZIndex = -1
    object iwrHeader: TIWRegion
      Left = 0
      Top = 0
      Width = 792
      Height = 55
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alClient
      BorderOptions.NumericWidth = 0
      BorderOptions.Color = clMoneyGreen
      Color = clMoneyGreen
      object iwrWelcome: TIWRegion
        Left = 0
        Top = 35
        Width = 792
        Height = 20
        HorzScrollBar.Visible = False
        RenderInvisibleControls = False
        TabOrder = 2
        Align = alClient
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object iwrLeftBlock: TIWRegion
          Left = 0
          Top = 0
          Width = 200
          Height = 20
          HorzScrollBar.Visible = False
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          Color = clWebLIGHTSLATEGRAY
        end
        object iwrDisplayUserName: TIWRegion
          Left = 200
          Top = 0
          Width = 592
          Height = 20
          HorzScrollBar.Visible = False
          RenderInvisibleControls = False
          Align = alClient
          BorderOptions.NumericWidth = 0
          Color = clWebLIGHTSTEELBLUE
          DesignSize = (
            592
            20)
          object lblWelcome: TIWLabel
            AlignWithMargins = False
            Left = 6
            Top = 4
            Width = 59
            Height = 14
            Anchors = [akTop, akRight]
            Font.FontName = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Font.PxSize = 10
            Font.Color = clWebDARKSLATEGRAY
            NoWrap = True
            HasTabOrder = False
            FriendlyName = 'lblWelcome'
            Caption = ' Welcome'
          end
        end
      end
      object iwrSignInOut: TIWRegion
        Left = 0
        Top = 0
        Width = 792
        Height = 35
        HorzScrollBar.Visible = False
        RenderInvisibleControls = False
        TabOrder = 3
        Align = alTop
        BorderOptions.NumericWidth = 0
        Color = clWebLIGHTBLUE
        object iwlSignOut: TIWLink
          AlignWithMargins = False
          Left = 607
          Top = 12
          Width = 53
          Height = 17
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          Alignment = taLeftJustify
          Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 9
          Font.Style = [fsUnderline]
          Font.PxSize = 12
          Font.Color = clWebBLUE
          HasTabOrder = True
          DoSubmitValidation = False
          FriendlyName = 'iwlSignOut'
          OnClick = iwlSignOutClick
          TabOrder = -1
          RawText = False
          Caption = 'Log Out'
        end
        object lnkSignIn: TIWLink
          AlignWithMargins = False
          Left = 491
          Top = 12
          Width = 53
          Height = 17
          RenderSize = False
          StyleRenderOptions.RenderSize = False
          Alignment = taLeftJustify
          Color = clNone
          Font.FontName = 'Verdana'
          Font.Size = 9
          Font.Style = [fsUnderline]
          Font.PxSize = 12
          Font.Color = clWebBLUE
          HasTabOrder = True
          DoSubmitValidation = False
          FriendlyName = 'lnkSignIn'
          OnClick = SignIn
          TabOrder = 1
          RawText = False
          Caption = 'Log In'
        end
        object lblProgTitle: TIWLabel
          AlignWithMargins = False
          Left = 16
          Top = 8
          Width = 338
          Height = 24
          Font.FontName = 'Arial'
          Font.Size = 16
          Font.Style = [fsBold]
          Font.PxSize = 21
          Font.Color = clWebSTEELBLUE
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblProgTitle'
          Caption = 'StratDB Stratigraphy Database'
        end
      end
    end
  end
end
